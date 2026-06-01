import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
public typealias RequestMerchantTransfer = (_ options: RequestMerchantTransferOptions) -> Void
@objc(UTSSDKModulesDCloudUniRequestMerchantTransferRequestMerchantTransferOptions)
@objcMembers
public class RequestMerchantTransferOptions : NSObject, UTSObject {
    public var mchId: String!
    public var package: String!
    public var appId: String?
    public var openId: String?
    public var subAppId: String?
    public var subMchId: String?
    public var success: RequestMerchantTransferSuccessCallback?
    public var fail: RequestMerchantTransferFailCallback?
    public var complete: RequestMerchantTransferCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "mchId":
                    self.mchId = try! utsSubscriptCheckValue(newValue)
                case "package":
                    self.package = try! utsSubscriptCheckValue(newValue)
                case "appId":
                    self.appId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "openId":
                    self.openId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "subAppId":
                    self.subAppId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "subMchId":
                    self.subMchId = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.mchId = obj["mchId"] as! String
        self.package = obj["package"] as! String
        self.appId = obj["appId"] as! String?
        self.openId = obj["openId"] as! String?
        self.subAppId = obj["subAppId"] as! String?
        self.subMchId = obj["subMchId"] as! String?
        self.success = obj["success"] as! RequestMerchantTransferSuccessCallback?
        self.fail = obj["fail"] as! RequestMerchantTransferFailCallback?
        self.complete = obj["complete"] as! RequestMerchantTransferCompleteCallback?
    }
}
public typealias RequestMerchantTransferCompleteCallback = (_ res: RequestMerchantTransferGeneralCallbackResult) -> Void
public typealias RequestMerchantTransferFailCallback = (_ res: RequestMerchantTransferGeneralCallbackResult) -> Void
public typealias RequestMerchantTransferSuccessCallback = (_ res: RequestMerchantTransferGeneralCallbackResult) -> Void
@objc(UTSSDKModulesDCloudUniRequestMerchantTransferRequestMerchantTransferGeneralCallbackResult)
@objcMembers
public class RequestMerchantTransferGeneralCallbackResult : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
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
        self.errMsg = obj["errMsg"] as! String
    }
}
public var requestMerchantTransfer: RequestMerchantTransfer = {
(_ options: RequestMerchantTransferOptions) -> Void in
WxpayManager.requestMerchantTransfer(options)
}
@objc(UTSSDKModulesDCloudUniRequestMerchantTransferWxpayManagerHookProxy)
@objcMembers
public class WxpayManagerHookProxy : NSObject, UTSiOSHookProxy {
    public func applicationDidFinishLaunchingWithOptions(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>? = nil) -> Bool {
        WxpayManager.registerApp()
        return false
    }
    public func applicationOpenURLOptions(_ app: UIApplication?, _ url: URL, _ options: Map<UIApplication.OpenURLOptionsKey, Any>? = nil) -> Bool {
        WxpayManager.handleOpen(url)
        return true
    }
    public func applicationContinueUserActivityRestorationHandler(_ application: UIApplication?, _ userActivity: NSUserActivity?, _ restorationHandler: ((_ res: [Any]?) -> Void)? = nil) -> Bool {
        WxpayManager.handleOpenUniversalLink(userActivity)
        return true
    }
}
@objc(UTSSDKModulesDCloudUniRequestMerchantTransferWxpayManager)
@objcMembers
public class WxpayManager : NSObject, WXApiDelegate {
    private static var shared = WxpayManager()
    private static var options: RequestMerchantTransferOptions?
    fileprivate static func registerApp() {
        var scheme = WxpayManager.getApplicationScheme()
        var universalLink = WxpayManager.getApplicationUniversalLink()
        if (scheme != nil && scheme != "" && universalLink != nil && universalLink != "") {
            WXApi.registerApp(scheme!, universalLink: universalLink!)
        }
    }
    fileprivate static func handleOpen(_ url: URL) {
        WXApi.handleOpen(url, delegate: shared)
    }
    fileprivate static func handleOpenUniversalLink(_ userActivity: NSUserActivity?) {
        if (userActivity != nil) {
            WXApi.handleOpenUniversalLink(userActivity!, delegate: shared)
        }
    }
    private static func getApplicationScheme() -> String? {
        var scheme: String? = nil
        var infoDictionary = Bundle.main.infoDictionary
        if (infoDictionary != nil) {
            var wechat = infoDictionary!["WeChat"] as! Map<String, Any>?
            if (wechat != nil) {
                scheme = wechat!["appid"] as! String?
            }
        }
        return scheme
    }
    private static func getApplicationUniversalLink() -> String? {
        var universalLink: String? = nil
        var infoDictionary = Bundle.main.infoDictionary
        if (infoDictionary != nil) {
            var wechat = infoDictionary!["WeChat"] as! Map<String, Any>?
            if (wechat != nil) {
                universalLink = wechat!["universalLink"] as! String?
            }
        }
        return universalLink
    }
    fileprivate static func isWXAppInstalled() -> Bool {
        var url = URL(string: "weixin://")!
        if (UIApplication.shared.canOpenURL(url)) {
            return true
        }
        return false
    }
    public static func buildQueryString(_ parameters: Map<String, String>) -> String? {
        var components = URLComponents()
        var queryItems: [URLQueryItem] = []
        parameters.forEach({
        (value, key) -> Void in
        queryItems.append(URLQueryItem(name: key, value: value))
        })
        components.queryItems = queryItems
        return components.percentEncodedQuery
    }
    public static func requestMerchantTransfer(_ options: RequestMerchantTransferOptions) {
        WxpayManager.options = options
        if (WxpayManager.isWXAppInstalled() == false) {
            var res = RequestMerchantTransferGeneralCallbackResult(UTSJSONObject([
                "errMsg": "微信没有安装"
            ]))
            options.fail?(res)
            options.complete?(res)
        }
        if (WxpayManager.getApplicationScheme() == nil || WxpayManager.getApplicationScheme() == "") {
            var res = RequestMerchantTransferGeneralCallbackResult(UTSJSONObject([
                "errMsg": "没有配置对应的URL Scheme"
            ]))
            options.fail?(res)
            options.complete?(res)
            return
        }
        if (WxpayManager.getApplicationUniversalLink() == nil || WxpayManager.getApplicationUniversalLink() == "") {
            var res = RequestMerchantTransferGeneralCallbackResult(UTSJSONObject([
                "errMsg": "没有配置对应的Universal Link"
            ]))
            options.fail?(res)
            options.complete?(res)
            return
        }
        if (WxpayManager.options != nil) {
            var parameters = Map<String, String>()
            parameters.set("mchId", options.mchId)
            parameters.set("package", options.package)
            if (options.appId != nil) {
                parameters.set("appId", options.appId!)
            }
            if (options.openId != nil) {
                parameters.set("openId", options.openId!)
            }
            if (options.subAppId != nil) {
                parameters.set("subAppId", options.subAppId!)
            }
            if (options.subMchId != nil) {
                parameters.set("subMchId", options.subMchId!)
            }
            var reg = WXOpenBusinessViewReq()
            reg.businessType = "requestMerchantTransfer"
            var query = WxpayManager.buildQueryString(parameters) ?? ""
            reg.query = query
            WXApi.send(reg)
        }
    }
    public func onResp(_ resp: BaseResp) {
        if (UTSiOS.instanceof(resp, WXOpenBusinessViewResp.self)) {
            var resp = resp as! WXOpenBusinessViewResp
            if (resp.extMsg?.includes("cancel") == true) {
                var res = RequestMerchantTransferGeneralCallbackResult(UTSJSONObject([
                    "errMsg": "用户取消"
                ]))
                WxpayManager.options?.fail?(res)
                WxpayManager.options?.complete?(res)
            }
            if (resp.extMsg?.includes("fail") == true) {
                var res = RequestMerchantTransferGeneralCallbackResult(UTSJSONObject([
                    "errMsg": "展示页面失败"
                ]))
                WxpayManager.options?.fail?(res)
                WxpayManager.options?.complete?(res)
            }
            if (resp.extMsg?.includes("success") == true) {
                var res = RequestMerchantTransferGeneralCallbackResult(UTSJSONObject([
                    "errMsg": "确认收款"
                ]))
                WxpayManager.options?.success?(res)
                WxpayManager.options?.complete?(res)
            }
        }
    }
}
@objc(UTSSDKModulesDCloudUniRequestMerchantTransferRequestMerchantTransferOptionsJSONObject)
@objcMembers
public class RequestMerchantTransferOptionsJSONObject : NSObject {
    public var mchId: String!
    public var package: String!
    public var appId: String?
    public var openId: String?
    public var subAppId: String?
    public var subMchId: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func requestMerchantTransferByJs(_ options: RequestMerchantTransferOptionsJSONObject) -> Void {
    return requestMerchantTransfer(RequestMerchantTransferOptions(UTSJSONObject([
        "mchId": options.mchId,
        "package": options.package,
        "appId": options.appId,
        "openId": options.openId,
        "subAppId": options.subAppId,
        "subMchId": options.subMchId,
        "success": {
        (res: RequestMerchantTransferGeneralCallbackResult) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: RequestMerchantTransferGeneralCallbackResult) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: RequestMerchantTransferGeneralCallbackResult) -> Void in
        options.complete?(res)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniRequestMerchantTransferWxpayManagerHookProxyByJs)
@objcMembers
public class WxpayManagerHookProxyByJs : WxpayManagerHookProxy {
    public func applicationDidFinishLaunchingWithOptionsByJs(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>? = nil) -> Bool {
        return self.applicationDidFinishLaunchingWithOptions(application, launchOptions)
    }
    public func applicationOpenURLOptionsByJs(_ app: UIApplication?, _ url: URL, _ options: Map<UIApplication.OpenURLOptionsKey, Any>? = nil) -> Bool {
        return self.applicationOpenURLOptions(app, url, options)
    }
    public func applicationContinueUserActivityRestorationHandlerByJs(_ application: UIApplication?, _ userActivity: NSUserActivity?, _ restorationHandler: UTSCallback? = nil) -> Bool {
        return self.applicationContinueUserActivityRestorationHandler(application, userActivity, {
        (res: [Any]?) -> Void in
        restorationHandler?(res)
        })
    }
}
@objc(UTSSDKModulesDCloudUniRequestMerchantTransferIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniRequestMerchantTransferIndexSwift : NSObject {
    public static func s_requestMerchantTransferByJs(_ options: RequestMerchantTransferOptionsJSONObject) -> Void {
        return requestMerchantTransferByJs(options)
    }
}
