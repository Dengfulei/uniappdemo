//
//  UniAppBridge.swift
//  UniAppXDemo
//
//  Created by wangzhitong on 2024/6/27.
//

import Foundation
import UIKit
import DCloudUniappRuntime
import NativeTestPlugin
@objc
@objcMembers
public class UniAppBridge : NSObject {

    private enum NativeBridgeMethod {
        static let productDetail = "productDetail"
    }

    private static weak var rootViewController: UIViewController?
    private static var hasInstalledNativeBridgeListener = false

    // 1. AppDelegate 启动后先初始化 uni-app-x SDK，并转发生命周期启动事件。
    public static func applicationDidFinishLaunchingWithOptions(_ application: UIApplication?, _ launchOptions: [UIApplication.LaunchOptionsKey : Any]? ) {
        UniAppXSDK.initSDK()
        print("NativeTestPlugin check: \(NativeTestPluginBridge.ping())")
        UniAppXSDK.applicationDidFinishLaunchingWithOptions(application, launchOptions)
    }

    // 2. 原生壳工程只负责把 iOS 生命周期/URL/通知事件转发给 uni-app-x SDK。
    
    public static func applicationOpenURLOptions(_ application: UIApplication?, _ url: URL, _ options: [UIApplication.OpenURLOptionsKey : Any]? ) {
        UniAppXSDK.applicationOpenURLOptions(application, url, options)
    }
    
    public static func applicationWillResignActive(_ application: UIApplication?) {
        UniAppXSDK.applicationWillResignActive(application)
    }
    
    public static func applicationDidBecomeActive(_ application: UIApplication?) {
        UniAppXSDK.applicationDidBecomeActive(application)
    }
    
    public static func applicationDidEnterBackground(_ application: UIApplication?) {
        UniAppXSDK.applicationDidEnterBackground(application)
    }
    
    public static func applicationWillEnterForeground(_ application: UIApplication?) {
        UniAppXSDK.applicationWillEnterForeground(application)
    }
    
    public static func applicationContinueUserActivityRestorationHandler(_ application: UIApplication?, _ userActivity: NSUserActivity?, _ restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) {
        UniAppXSDK.applicationContinueUserActivityRestorationHandler(application, userActivity, restorationHandler)
    }
    
    public static func didFailToRegisterForRemoteNotifications(_ error: Error?) {
        UniAppXSDK.didFailToRegisterForRemoteNotifications(error)
    }

    public static func didRegisterForRemoteNotifications(_ deviceToken: Data?) {
        UniAppXSDK.didRegisterForRemoteNotifications(deviceToken)
    }

    public static func applicationDidReceiveRemoteNotificationCompletionHandler(_ application: UIApplication?, _ userInfo: [AnyHashable : Any], _ completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        UniAppXSDK.applicationDidReceiveRemoteNotificationCompletionHandler(application, userInfo, completionHandler)
    }

    // 3. SDK 初始化完成后，使用根控制器承载并启动 uni-app-x 页面。
    public static func startUniAppX(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        installNativeBridgeListenerIfNeeded()

        let options = UniAppXSDKStartOptions()
        options.openType = .push
        options.animationType = .none
        options.viewController = rootViewController

        DispatchQueue.main.async {
            UniAppXSDK.start(options: options)
        }
    }

    // 4. uni-app-x 通过 UTS native-bridge 发送通用事件，原生工程按 methodName 分发页面或能力。
    private static func installNativeBridgeListenerIfNeeded() {
        guard !hasInstalledNativeBridgeListener else {
            return
        }

        hasInstalledNativeBridgeListener = true
        NativeBridgeMessageManager.addListener { message in
            handleNativeBridgeMessage(methodName: message.methodName, data: message.data)
        }
    }

    private static func handleNativeBridgeMessage(methodName: String?, data: Any?) {
        guard let methodName = methodName else {
            return
        }

        switch methodName {
        case NativeBridgeMethod.productDetail:
            let product = productPayload(from: data)
            showProductDetail(product)
        default:
            print("UniAppX native bridge ignored methodName: \(methodName)")
        }
    }

    private static func productPayload(from data: Any?) -> [String: Any] {
        if let dictionary = data as? [String: Any] {
            return dictionary
        }

        if let jsonText = data as? String,
           let jsonData = jsonText.data(using: .utf8),
           let dictionary = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
            return dictionary
        }

        return [:]
    }

    private static func showProductDetail(_ product: [String: Any]) {
        DispatchQueue.main.async {
            let detailViewController = ProductDetailViewController(product: product)
            guard let navigationController = topViewController()?.navigationController ?? rootViewController?.navigationController else {
                topViewController()?.present(detailViewController, animated: true)
                return
            }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    private static func topViewController() -> UIViewController? {
        let windowRoot: UIViewController?

        if #available(iOS 13.0, *) {
            windowRoot = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }?
                .rootViewController
        } else {
            windowRoot = UIApplication.shared.keyWindow?.rootViewController
        }

        return topViewController(from: windowRoot ?? rootViewController)
    }

    private static func topViewController(from viewController: UIViewController?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return topViewController(from: navigationController.visibleViewController)
        }

        if let tabBarController = viewController as? UITabBarController {
            return topViewController(from: tabBarController.selectedViewController)
        }

        if let presentedViewController = viewController?.presentedViewController {
            return topViewController(from: presentedViewController)
        }

        return viewController
    }
}
