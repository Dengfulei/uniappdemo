import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
@_implementationOnly import GTSDK
import Swift
import UIKit
import UserNotifications
@objc(UTSSDKModulesDCloudUniPushGetPushClientIdSuccess)
@objcMembers
public class GetPushClientIdSuccess : NSObject, UTSObject {
    public var cid: String!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "cid":
                    self.cid = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.cid = obj["cid"] as! String
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias GetPushClientIdSuccessCallback = (_ result: GetPushClientIdSuccess) -> Void
public typealias GetPushClientIdFail = UniError
public typealias GetPushClientIdFailCallback = (_ result: GetPushClientIdFail) -> Void
public typealias GetPushClientIdComplete = Any
public typealias GetPushClientIdCompleteCallback = (_ result: GetPushClientIdComplete) -> Void
@objc(UTSSDKModulesDCloudUniPushGetPushClientIdOptions)
@objcMembers
public class GetPushClientIdOptions : NSObject, UTSObject {
    public var success: GetPushClientIdSuccessCallback?
    public var fail: GetPushClientIdFailCallback?
    public var complete: GetPushClientIdCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                case "complete":
                    self.complete = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.success = obj["success"] as! GetPushClientIdSuccessCallback?
        self.fail = obj["fail"] as! GetPushClientIdFailCallback?
        self.complete = obj["complete"] as! GetPushClientIdCompleteCallback?
    }
}
public typealias OnPushMessageType = String
@objc(UTSSDKModulesDCloudUniPushOnPushMessageCallbackResult)
@objcMembers
public class OnPushMessageCallbackResult : NSObject, UTSObject {
    public var type: OnPushMessageType!
    public var data: UTSJSONObject!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "type":
                    self.type = try! utsSubscriptCheckValue(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.type = obj["type"] as! OnPushMessageType
        self.data = obj["data"] as! UTSJSONObject
    }
}
public typealias OnPushMessageCallback = (_ result: OnPushMessageCallbackResult) -> Void
@objc(UTSSDKModulesDCloudUniPushCreatePushMessageSuccess)
@objcMembers
public class CreatePushMessageSuccess : NSObject, UTSObject {
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {}
}
public typealias CreatePushMessageSuccessCallback = (_ result: CreatePushMessageSuccess) -> Void
public typealias CreatePushMessageFail = UniError
public typealias CreatePushMessageFailCallback = (_ result: CreatePushMessageFail) -> Void
public typealias CreatePushMessageComplete = Any
public typealias CreatePushMessageCompleteCallback = (_ result: CreatePushMessageComplete) -> Void
@objc(UTSSDKModulesDCloudUniPushCreatePushMessageOptions)
@objcMembers
public class CreatePushMessageOptions : NSObject, UTSObject {
    public var cover: Bool = false
    public var delay: NSNumber?
    public var icon: String?
    public var sound: String?
    public var title: String?
    public var content: String!
    public var payload: Any?
    public var when: NSNumber?
    public var channelId: String?
    public var category: String?
    public var success: CreatePushMessageSuccessCallback?
    public var fail: CreatePushMessageFailCallback?
    public var complete: CreatePushMessageCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "cover":
                    self.cover = try! utsSubscriptCheckValue(newValue)
                case "delay":
                    self.delay = try! utsSubscriptCheckValueIfPresent(newValue)
                case "icon":
                    self.icon = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sound":
                    self.sound = try! utsSubscriptCheckValueIfPresent(newValue)
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "content":
                    self.content = try! utsSubscriptCheckValue(newValue)
                case "payload":
                    self.payload = try! utsSubscriptCheckValueIfPresent(newValue)
                case "when":
                    self.when = try! utsSubscriptCheckValueIfPresent(newValue)
                case "channelId":
                    self.channelId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "category":
                    self.category = try! utsSubscriptCheckValueIfPresent(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                case "complete":
                    self.complete = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.cover = (obj["cover"] as? Bool) ?? false
        self.delay = obj["delay"] as! NSNumber?
        self.icon = obj["icon"] as! String?
        self.sound = obj["sound"] as! String?
        self.title = obj["title"] as! String?
        self.content = obj["content"] as! String
        self.payload = obj["payload"] as! Any?
        self.when = obj["when"] as! NSNumber?
        self.channelId = obj["channelId"] as! String?
        self.category = obj["category"] as! String?
        self.success = obj["success"] as! CreatePushMessageSuccessCallback?
        self.fail = obj["fail"] as! CreatePushMessageFailCallback?
        self.complete = obj["complete"] as! CreatePushMessageCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniPushBadgeOptions)
@objcMembers
public class BadgeOptions : NSObject, UTSObject {
    public var title: String?
    public var content: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "content":
                    self.content = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.title = obj["title"] as! String?
        self.content = obj["content"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniPushUserPushAction)
@objcMembers
fileprivate class UserPushAction : NSObject, GeTuiSdkDelegate, UIApplicationDelegate {
    public var callbacks: [OnPushMessageCallback] = []
    public var cacheMessage: [OnPushMessageCallbackResult] = []
    public var debugCallback: ((_ log: String) -> Void)?
    public var options: GetPushClientIdOptions?
    private static var instance: UserPushAction? = nil
    public static func getInstance() -> UserPushAction {
        if (self.instance == nil) {
            self.instance = UserPushAction()
        }
        return self.instance!
    }
    public func setDebugLogger(_ callback: @escaping (_ log: String) -> Void) {
        self.debugCallback = callback
    }
    public func offPushMessage() {
        self.callbacks = []
    }
    public func onPushMessage(_ callback: @escaping OnPushMessageCallback) {
        if (callback != nil) {
            self.callbacks.push(callback)
            if (self.cacheMessage.length > 0) {
                self.callbacks.forEach({
                (cb) -> Void in
                self.cacheMessage.forEach({
                (res) -> Void in
                cb(res)
                })
                })
            }
            self.cacheMessage = []
        }
    }
    public func setBadge(_ num: NSNumber) {
        GeTuiSdk.setBadge(num.toUInt())
    }
    public func clientId() -> String {
        var clientId: String = GeTuiSdk.clientId()
        return clientId
    }
    public func setClientIdCallBack(_ options: GetPushClientIdOptions) {
        self.options = options
    }
    public func initPush() {
        var center = UNUserNotificationCenter.current()
        center.delegate = notificationCenterDelegateImpl
        var appid: String = ""
        var appKey: String = ""
        var appSecret: String = ""
        var getui: Map<AnyHashable, Any>? = Bundle.main.infoDictionary?["getui"] as! Map<AnyHashable, Any>?
        if (getui == nil) {
            self.debugCallback?("[ Getui ] getui  appid is null")
            return
        } else {
            var getuiParams = getui as! Map<AnyHashable, Any>
            appid = getuiParams["appid"] as! String
            appKey = getuiParams["appKey"] as! String
            appSecret = getuiParams["appSecret"] as! String
            self.debugCallback?("[ Getui ] getui appid from plist " + appid)
        }
        GeTuiSdk.start(withAppId: appid, appKey: appKey, appSecret: appSecret, delegate: self, launchingOptions: nil)
        GeTuiSdk.registerRemoteNotification([
            UNAuthorizationOptions.sound,
            UNAuthorizationOptions.alert,
            UNAuthorizationOptions.badge
        ])
        GeTuiSdk.setApplicationGroupIdentifier(UTSiOS.getAppName())
        self.debugCallback?("[ Getui ] start init ... ")
    }
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var msg = "[ TestDemo ] \(#function):\(deviceToken)"
        self.debugCallback?(msg)
    }
    public func geTuiSdkNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, completionHandler: @escaping (_ res: UNNotificationPresentationOptions) -> Void) {
        var msg = "[ Getui ] [APNs] \(#function)"
        self.debugCallback?(msg)
        completionHandler([
            UNNotificationPresentationOptions.badge,
            UNNotificationPresentationOptions.sound,
            UNNotificationPresentationOptions.alert
        ])
    }
    public func geTuiSdkDidReceiveSlience(_ userInfo: Map<AnyHashable, Any>, fromGetui: Bool, offLine: Bool, appId: String?, taskId: String?, msgId: String?, fetchCompletionHandler completionHandler: ((_ res: UIBackgroundFetchResult) -> Void)?) {
        var msg = "[ Getui ]  \(#function) " + (fromGetui ? "个推消息" : "APNs消息") + (offLine ? " 离线 " : " 在线 ") + " " + userInfo.description
        self.debugCallback?(msg)
        if (fromGetui && offLine) {
            return
        }
        self.processReceive(userInfo)
    }
    public func geTuiSdkDidReceiveNotification(_ userInfo: Map<AnyHashable, Any>, notificationCenter center: UNUserNotificationCenter?, response: UNNotificationResponse?, fetchCompletionHandler completionHandler: ((_ res: UIBackgroundFetchResult) -> Void)?) {
        var msg = "[ Getui ] \(#function) " + userInfo.description
        self.debugCallback?(msg)
        if (response != nil && response!.notification.request.trigger != nil && UTSiOS.instanceof(response!.notification.request.trigger, UNPushNotificationTrigger.self)) {
            self.processClickWithOptions((userInfo as! Map<String, Any>), false)
        } else {
            var content = response?.notification.request.content
            if (content != nil) {
                var map = Map<String, Any>()
                map["alertTitle"] = content!.title
                map["alertBody"] = content!.body
                map["userInfo"] = content!.userInfo
                self.processClickWithOptions(map, true)
            } else {
                self.processClickWithOptions((userInfo as! Map<String, Any>), false)
            }
        }
        completionHandler?(UIBackgroundFetchResult.noData)
    }
    public func processClickWithOptions(_ options: Map<String, Any>?, _ isLocalNotification: Bool) {
        if (options != nil) {
            if (isLocalNotification) {
                var title = options!["alertTitle"]
                var body = options!["alertBody"]
                var userInfo = options!["userInfo"]
                var payload: Any? = nil
                if (userInfo != nil) {
                    payload = (userInfo as! Map<String, Any>).get("payload")
                }
                var res = OnPushMessageCallbackResult(UTSJSONObject([
                    "type": "click",
                    "data": UTSJSONObject([
                        "title": title ?? "",
                        "content": body ?? "",
                        "payload": payload ?? ""
                    ])
                ]))
                if (self.callbacks.length == 0) {
                    self.cacheMessage.push(res)
                } else {
                    self.callbacks.forEach({
                    (callback) -> Void in
                    callback(res)
                    })
                }
            } else {
                var aps = options!["aps"]
                var payload = options!["payload"]
                var title = ""
                var body = ""
                if (aps != nil) {
                    var alert = (aps as! Map<String, Any>).get("alert")
                    if (alert != nil) {
                        var pTitle = (alert as! Map<String, Any>).get("title")
                        var pBody = (alert as! Map<String, Any>).get("body")
                        if (pTitle != nil) {
                            title = pTitle as! String
                        }
                        if (pBody != nil) {
                            body = pBody as! String
                        }
                    }
                }
                var payloadJson: UTSJSONObject? = nil
                if (payload != nil && UTSiOS.typeof(payload) == "string") {
                    payloadJson = JSON.parseObject(payload as! String)
                }
                var res = OnPushMessageCallbackResult(UTSJSONObject([
                    "type": "click",
                    "data": UTSJSONObject([
                        "title": title ?? "",
                        "content": body ?? "",
                        "payload": payloadJson ?? payload ?? ""
                    ])
                ]))
                if (self.callbacks.length == 0) {
                    self.cacheMessage.push(res)
                } else {
                    self.callbacks.forEach({
                    (callback) -> Void in
                    callback(res)
                    })
                }
            }
        }
    }
    public func processReceive(_ userInfo: Map<AnyHashable, Any>) {
        var payload = userInfo["payload"]
        var payloadJson: UTSJSONObject? = nil
        if (payload != nil && UTSiOS.typeof(payload) == "string") {
            payloadJson = JSON.parseObject(payload! as! String)
        }
        var needCreateNotification = false
        if (payloadJson != nil) {
            var force_notification = payloadJson!["force_notification"]
            if (force_notification != nil && UTSiOS.typeof(force_notification) == "boolean" && (force_notification as! Bool) == true) {
                var option = CreatePushMessageOptions(UTSJSONObject([
                    "title": payloadJson!["title"],
                    "content": payloadJson!["content"],
                    "payload": payloadJson!["payload"],
                    "success": nil,
                    "fail": nil,
                    "complete": nil
                ]))
                createPushMessage(option)
                needCreateNotification = true
            }
        }
        if (!needCreateNotification) {
            var res = OnPushMessageCallbackResult(UTSJSONObject([
                "type": "receive",
                "data": payloadJson ?? UTSJSONObject([
                    "payload": payload
                ])
            ]))
            if (self.callbacks.length == 0) {
                self.cacheMessage.push(res)
            } else {
                self.callbacks.forEach({
                (cb: @escaping OnPushMessageCallback) -> Void in
                cb(res)
                })
            }
        }
    }
    public func geTuiSdkNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {}
    public func geTuiSdkDidOccurError(_ error: Error) {
        var msg = "[ Getui ] \(#function) " + error.localizedDescription
        self.debugCallback?(msg)
    }
    public func geTuiSdkDidRegisterClient(_ clientId: String) {
        var res = GetPushClientIdSuccess(UTSJSONObject([
            "errMsg": "success",
            "cid": clientId
        ]))
        self.options?.success?(res)
        self.options?.complete?(res)
        var msg = "[ Getui ] \(#function) : " + clientId
        self.debugCallback?(msg)
    }
    public func geTuiSDkDidNotifySdkState(_ aStatus: SdkStatus) {}
    public func getuiSdkGrantAuthorization(_ granted: Bool, error: Error?) {
        var msg = "[ Getui ]  \(#function) " + (granted ? "授权" : "未授权")
        self.debugCallback?(msg)
    }
    public func checkNotificationAuthorizationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {
        (settings: UNNotificationSettings) -> Void in
        switch(settings.authorizationStatus){
            case UNAuthorizationStatus.notDetermined:
                console.debug("Notification permission has not been asked yet, go ask for permission.")
            case UNAuthorizationStatus.denied:
                console.debug("Notification permission was previously denied, go to settings & privacy to re-enable.")
            case UNAuthorizationStatus.authorized, UNAuthorizationStatus.provisional:
                console.debug("Notification permission authorized.")
            case UNAuthorizationStatus.ephemeral:
                console.debug("Temporary authorization granted.")
            default:
                console.debug("Unknown authorization status.")
                break
        }
        })
    }
}
public func getPushClientId(_ options: GetPushClientIdOptions) {
    UserPushAction.getInstance().initPush()
    var clientId: String = UserPushAction.getInstance().clientId()
    if (clientId.length > 0) {
        var res = GetPushClientIdSuccess(UTSJSONObject([
            "errMsg": "success",
            "cid": clientId
        ]))
        options.success?(res)
        options.complete?(res)
    } else {
        UserPushAction.getInstance().setClientIdCallBack(options)
        setTimeout({
        () -> Void in
        var clientId: String = UserPushAction.getInstance().clientId()
        if (clientId.length == 0) {
            var res: GetPushClientIdFail = UniError("uni-push", -1, "failed,check appkey or appid")
            options.fail?(res)
            options.complete?(res)
        }
        }, 15000)
    }
}
public func onPushMessage(_ callback: OnPushMessageCallback?) {
    UserPushAction.getInstance().initPush()
    if (callback == nil) {
        return
    }
    UserPushAction.getInstance().onPushMessage(callback!)
}
public func offPushMessage(_ callback: OnPushMessageCallback?) {
    UserPushAction.getInstance().offPushMessage()
}
@objc(UTSSDKModulesDCloudUniPushHookProxy)
@objcMembers
public class HookProxy : NSObject, UTSiOSHookProxy {
    public func applicationDidFinishLaunchingWithOptions(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>? = nil) -> Bool {
        var remoteNotificationOptions = launchOptions?.get(UIApplication.LaunchOptionsKey.remoteNotification)
        if (remoteNotificationOptions != nil) {
            UserPushAction.getInstance().processClickWithOptions((remoteNotificationOptions as! Map<String, Any>), false)
        }
        var localNotificationOptions = launchOptions?.get(UIApplication.LaunchOptionsKey.localNotification)
        if (localNotificationOptions != nil && UTSiOS.instanceof(localNotificationOptions, UILocalNotification.self)) {
            var localNotification = localNotificationOptions as! UILocalNotification
            var map = Map<String, Any>()
            map["alertTitle"] = localNotification.alertTitle
            map["alertBody"] = localNotification.alertBody
            map["userInfo"] = localNotification.userInfo
            UserPushAction.getInstance().processClickWithOptions(map, true)
        }
        return false
    }
}
@objc(UTSSDKModulesDCloudUniPushNotificationCenterDelegateImpl)
@objcMembers
public class NotificationCenterDelegateImpl : NSObject, UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (_ options: UNNotificationPresentationOptions) -> Void) {
        completionHandler([
            UNNotificationPresentationOptions.badge,
            UNNotificationPresentationOptions.sound,
            UNNotificationPresentationOptions.alert
        ])
    }
}
public var notificationCenterDelegateImpl = NotificationCenterDelegateImpl()
public var coverIndex: NSNumber = 0
public func createPushMessage(_ reassignedOptions: CreatePushMessageOptions) -> Void {
    var options = reassignedOptions
    requestAuthorization()
    var notificationContent = UNMutableNotificationContent()
    notificationContent.body = options.content ?? ""
    var payload = options.payload ?? ""
    if (UTSiOS.typeof(payload) == "string" || UTSiOS.instanceof(payload, Map<AnyHashable, Any>.self)) {
        var userInfo = Map<String, Any>()
        userInfo["payload"] = payload
        notificationContent.userInfo = userInfo
    }
    var sound = options.sound ?? "none"
    if (sound.toLowerCase() == "none") {
        notificationContent.sound = UNNotificationSound.default
    }
    if (options.title != nil) {
        notificationContent.title = options.title!
    }
    var icon = options.icon
    if (icon != nil && icon != "") {
        var imagePath = UTSiOS.getResourceAbsolutePath(icon!, nil)
        var fileManager = FileManager.default
        do {
            if (fileManager.fileExists(atPath: imagePath)) {
                var url = URL(fileURLWithPath: imagePath)
                var attachment = try? UNNotificationAttachment(identifier: UUID().uuidString, url: url, options: nil)
                if (attachment != nil) {
                    notificationContent.attachments = [
                        attachment!
                    ]
                }
            }
        }
         catch  {}
    }
    var delay = options.delay ?? 1
    var trigger = UNTimeIntervalNotificationTrigger(timeInterval: delay.toDouble(), repeats: false)
    var cover = options.cover ?? false
    if (!cover) {
        coverIndex++
    }
    var identifier = """
DCPushID232\(coverIndex)
"""
    var request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: trigger)
    var center = UNUserNotificationCenter.current()
    center.delegate = notificationCenterDelegateImpl
    center.add(request, withCompletionHandler: nil)
}
public func setAppBadgeNumber(_ num: NSNumber, _ options: BadgeOptions?) -> Void {
    UserPushAction.getInstance().setBadge(num)
    UIApplication.shared.applicationIconBadgeNumber = num.toInt()
}
public func requestAuthorization() {
    var center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [
        UNAuthorizationOptions.badge,
        UNAuthorizationOptions.sound,
        UNAuthorizationOptions.alert,
        UNAuthorizationOptions.carPlay
    ], completionHandler: {
    (granted: Bool, error: Error?) -> Void in
    })
}
@objc(UTSSDKModulesDCloudUniPushGetPushClientIdOptionsJSONObject)
@objcMembers
public class GetPushClientIdOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPushCreatePushMessageOptionsJSONObject)
@objcMembers
public class CreatePushMessageOptionsJSONObject : NSObject {
    public var cover: Bool = false
    public var delay: NSNumber?
    public var icon: String?
    public var sound: String?
    public var title: String?
    public var content: String!
    public var payload: Any?
    public var when: NSNumber?
    public var channelId: String?
    public var category: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPushBadgeOptionsJSONObject)
@objcMembers
public class BadgeOptionsJSONObject : NSObject {
    public var title: String?
    public var content: String?
}
public func getPushClientIdByJs(_ options: GetPushClientIdOptionsJSONObject) {
    return getPushClientId(GetPushClientIdOptions(UTSJSONObject([
        "success": {
        (result: GetPushClientIdSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GetPushClientIdFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GetPushClientIdComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func onPushMessageByJs(_ callback: UTSCallback?) {
    return onPushMessage({
    (result: OnPushMessageCallbackResult) -> Void in
    callback?(result)
    })
}
public func offPushMessageByJs(_ callback: UTSCallback?) {
    return offPushMessage({
    (result: OnPushMessageCallbackResult) -> Void in
    callback?(result)
    })
}
@objc(UTSSDKModulesDCloudUniPushHookProxyByJs)
@objcMembers
public class HookProxyByJs : HookProxy {
    public func applicationDidFinishLaunchingWithOptionsByJs(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>? = nil) -> Bool {
        return self.applicationDidFinishLaunchingWithOptions(application, launchOptions)
    }
}
public func createPushMessageByJs(_ options: CreatePushMessageOptionsJSONObject) -> Void {
    return createPushMessage(CreatePushMessageOptions(UTSJSONObject([
        "cover": options.cover,
        "delay": options.delay,
        "icon": options.icon,
        "sound": options.sound,
        "title": options.title,
        "content": options.content,
        "payload": options.payload,
        "when": options.when,
        "channelId": options.channelId,
        "category": options.category,
        "success": {
        (result: CreatePushMessageSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: CreatePushMessageFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: CreatePushMessageComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func setAppBadgeNumberByJs(_ num: NSNumber, _ options: BadgeOptionsJSONObject?) -> Void {
    return setAppBadgeNumber(num, options != nil ? BadgeOptions(UTSJSONObject([
        "title": options!.title,
        "content": options!.content
    ])) : nil)
}
@objc(UTSSDKModulesDCloudUniPushIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniPushIndexSwift : NSObject {
    public static func s_getPushClientIdByJs(_ options: GetPushClientIdOptionsJSONObject) {
        return getPushClientIdByJs(options)
    }
    public static func s_onPushMessageByJs(_ callback: UTSCallback?) {
        return onPushMessageByJs(callback)
    }
    public static func s_offPushMessageByJs(_ callback: UTSCallback?) {
        return offPushMessageByJs(callback)
    }
    public static func s_createPushMessageByJs(_ options: CreatePushMessageOptionsJSONObject) -> Void {
        return createPushMessageByJs(options)
    }
    public static func s_setAppBadgeNumberByJs(_ num: NSNumber, _ options: BadgeOptionsJSONObject?) -> Void {
        return setAppBadgeNumberByJs(num, options)
    }
}
