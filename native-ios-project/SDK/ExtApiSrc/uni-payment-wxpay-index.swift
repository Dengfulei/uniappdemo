import DCloudUTSExtAPI
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
@objc
public protocol UniPaymentWxpayProvider : UniPaymentProvider, JSExport {
    func toJSON() -> Map<String, Any>
    var isWeChatInstalled: Bool { get set }
}
public var wxDefaultErrorCode: NSNumber = 700000
public var wxErrorCodeMap: Map<NSNumber, NSNumber> = Map([
    [
        -1,
        701100
    ],
    [
        -2,
        700601
    ]
])
@objc(UTSSDKModulesDCloudUniPaymentWxpayUniPaymentWxpayProviderImpl)
@objcMembers
public class UniPaymentWxpayProviderImpl : NSObject, UniPaymentWxpayProvider {
    public var id: String = "wxpay"
    public override var description: String {
        get {
            return self.__description
        }
        set(value) {
            self.__description = value
        }
    }
    public var isAppExist: Bool {
        get {
            return Wxpay.share.isWXAppInstalled()
        }
        set(newValue) {}}
    public func requestPayment(_ options: RequestPaymentOptions) {
        Wxpay.requestPayment(options)
    }
    public func checkAppExist() {
        self.isAppExist = Wxpay.share.isWXAppInstalled()
        self.isWeChatInstalled = Wxpay.share.isWXAppInstalled()
    }
    public var isWeChatInstalled: Bool {
        get {
            return Wxpay.share.isWXAppInstalled()
        }
        set(newValue) {}}
    public func toJSON() -> Map<String, Any> {
        var dict = Map<String, Any>()
        dict.set("id", self.id)
        dict.set("description", self.description)
        dict.set("isAppExist", self.isAppExist)
        dict.set("isWeChatInstalled", self.isWeChatInstalled)
        return dict
    }
    public override init(){}
    private var __description: String = "微信支付"
}
@objc(UTSSDKModulesDCloudUniPaymentWxpayWxpayHookProxy)
@objcMembers
public class WxpayHookProxy : NSObject, UTSiOSHookProxy {
    public func applicationDidFinishLaunchingWithOptions(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>? = nil) -> Bool {
        Wxpay.share.registerApp()
        return false
    }
    public func applicationOpenURLOptions(_ app: UIApplication?, _ url: URL, _ options: Map<UIApplication.OpenURLOptionsKey, Any>? = nil) -> Bool {
        Wxpay.share.handleOpen(url)
        return true
    }
    public func applicationContinueUserActivityRestorationHandler(_ application: UIApplication?, _ userActivity: NSUserActivity?, _ restorationHandler: ((_ res: [Any]?) -> Void)? = nil) -> Bool {
        Wxpay.share.handleOpenUniversalLink(userActivity)
        return true
    }
}
@objc(UTSSDKModulesDCloudUniPaymentWxpayWxpay)
@objcMembers
public class Wxpay : NSObject, WXApiDelegate {
    public static var share = Wxpay()
    private var options: RequestPaymentOptions?
    fileprivate func registerApp() {
        var scheme = Wxpay.share.getApplicationScheme()
        var universalLink = Wxpay.share.getApplicationUniversalLink()
        if (scheme != nil && universalLink != nil && scheme != "" && universalLink != "") {
            WXApi.registerApp(scheme!, universalLink: universalLink!)
        }
    }
    fileprivate func handleOpen(_ url: URL) {
        WXApi.handleOpen(url, delegate: self)
    }
    fileprivate func handleOpenUniversalLink(_ userActivity: NSUserActivity?) {
        if (userActivity != nil) {
            WXApi.handleOpenUniversalLink(userActivity!, delegate: self)
        }
    }
    private func getApplicationScheme() -> String? {
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
    private func getApplicationUniversalLink() -> String? {
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
    fileprivate func isWXAppInstalled() -> Bool {
        return WXApi.isWXAppInstalled()
    }
    public func onResp(_ resp: BaseResp) {
        if (UTSiOS.instanceof(resp, PayResp.self)) {
            if (resp.errCode == 0) {
                var res = RequestPaymentSuccess(UTSJSONObject([
                    "data": resp
                ]))
                self.options?.success?(res)
                self.options?.complete?(res)
            } else {
                var errCode = resp.errCode as! NSNumber
                var code = wxErrorCodeMap[errCode]
                if (code == nil) {
                    code = wxDefaultErrorCode
                }
                var err = RequestPaymentFailImpl(code!)
                self.options?.fail?(err)
                self.options?.complete?(err)
            }
        }
    }
    public static func requestPayment(_ options: RequestPaymentOptions) {
        Wxpay.share.options = options
        if (Wxpay.share.isWXAppInstalled() == false) {
            var err = RequestPaymentFailImpl(700604)
            Wxpay.share.options?.fail?(err)
            Wxpay.share.options?.complete?(err)
            return
        }
        if (Wxpay.share.getApplicationScheme() == nil || Wxpay.share.getApplicationScheme() == "") {
            var err = RequestPaymentFailImpl(700800)
            Wxpay.share.options?.fail?(err)
            Wxpay.share.options?.complete?(err)
            return
        }
        if (Wxpay.share.getApplicationUniversalLink() == nil || Wxpay.share.getApplicationUniversalLink() == "") {
            var err = RequestPaymentFailImpl(700801)
            Wxpay.share.options?.fail?(err)
            Wxpay.share.options?.complete?(err)
            return
        }
        if (Wxpay.share.options != nil) {
            var params = JSON.parse(Wxpay.share.options!.orderInfo) as! UTSJSONObject
            var partnerId = params.getString("partnerid")
            var prepayId = params.getString("prepayid")
            var packageV = params.getString("package")
            var nonceStr = params.getString("noncestr")
            var timeStamp = params.getNumber("timestamp")
            var sign = params.getString("sign")
            var request = PayReq()
            if (partnerId != nil) {
                request.partnerId = partnerId!
            }
            if (prepayId != nil) {
                request.prepayId = prepayId!
            }
            if (packageV != nil) {
                request.package = packageV!
            }
            if (nonceStr != nil) {
                request.nonceStr = nonceStr!
            }
            if (timeStamp != nil) {
                request.timeStamp = timeStamp!.toUInt32()
            }
            if (sign != nil) {
                request.sign = sign!
            }
            WXApi.send(request)
        }
    }
}
@objc(UTSSDKModulesDCloudUniPaymentWxpayUniPaymentWxpayProviderImplByJs)
@objcMembers
public class UniPaymentWxpayProviderImplByJs : UniPaymentWxpayProviderImpl {
    public func requestPaymentByJs(_ options: RequestPaymentOptions) {
        return self.requestPayment(options)
    }
    public func checkAppExistByJs() {
        return self.checkAppExist()
    }
    public func toJSONByJs() -> Map<String, Any> {
        return self.toJSON()
    }
}
@objc(UTSSDKModulesDCloudUniPaymentWxpayWxpayHookProxyByJs)
@objcMembers
public class WxpayHookProxyByJs : WxpayHookProxy {
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
@objc(UTSSDKModulesDCloudUniPaymentWxpayWxpayByJs)
@objcMembers
public class WxpayByJs : Wxpay {
    public func registerAppByJs() {
        return self.registerApp()
    }
    public func handleOpenByJs(_ url: URL) {
        return self.handleOpen(url)
    }
    public func handleOpenUniversalLinkByJs(_ userActivity: NSUserActivity?) {
        return self.handleOpenUniversalLink(userActivity)
    }
    public func isWXAppInstalledByJs() -> Bool {
        return self.isWXAppInstalled()
    }
    public func onRespByJs(_ resp: BaseResp) {
        return self.onResp(resp)
    }
    public static func requestPaymentByJs(_ options: RequestPaymentOptions) {
        return Wxpay.requestPayment(options)
    }
}
