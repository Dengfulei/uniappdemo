@_implementationOnly import AlipaySDK
import DCloudUTSExtAPI
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
@objc
public protocol UniPaymentAlipayProvider : UniPaymentProvider, JSExport {
    func toJSON() -> Map<String, Any>
}
public var defaultErrorCode: NSNumber = 700000
public var errorCodeMap: Map<String, NSNumber> = Map([
    [
        "8000",
        700600
    ],
    [
        "4000",
        701100
    ],
    [
        "5000",
        701110
    ],
    [
        "6001",
        700601
    ],
    [
        "6002",
        700602
    ],
    [
        "6004",
        700603
    ],
    [
        "6007",
        700607
    ],
    [
        "4001",
        700608
    ]
])
@objc(UTSSDKModulesDCloudUniPaymentAlipayUniPaymentAlipayProviderImpl)
@objcMembers
public class UniPaymentAlipayProviderImpl : NSObject, UniPaymentAlipayProvider {
    public var id: String
    public override var description: String {
        get {
            return self.__description
        }
        set(value) {
            self.__description = value
        }
    }
    public var isAppExist: Bool = false
    public func requestPayment(_ options: RequestPaymentOptions) {
        Alipay.requestPayment(options)
    }
    public func toJSON() -> Map<String, Any> {
        var dict = Map<String, Any>()
        dict.set("id", self.id)
        dict.set("description", self.description)
        dict.set("isAppExist", self.isAppExist)
        return dict
    }
    public override init(){
        self.id = "alipay"
        self.isAppExist = true
    }
    private var __description: String = "支付宝"
}
@objc(UTSSDKModulesDCloudUniPaymentAlipayAlipayHookProxy)
@objcMembers
public class AlipayHookProxy : NSObject, UTSiOSHookProxy {
    public func applicationOpenURLOptions(_ app: UIApplication?, _ url: URL, _ options: Map<UIApplication.OpenURLOptionsKey, Any>? = nil) -> Bool {
        Alipay.share.processOrder(url)
        return true
    }
    public func applicationContinueUserActivityRestorationHandler(_ application: UIApplication?, _ userActivity: NSUserActivity?, _ restorationHandler: ((_ res: [Any]?) -> Void)? = nil) -> Bool {
        Alipay.share.handleOpenUniversalLink(userActivity)
        return true
    }
}
@objc(UTSSDKModulesDCloudUniPaymentAlipayAlipay)
@objcMembers
public class Alipay : NSObject {
    public static var share = Alipay()
    private var options: RequestPaymentOptions?
    public static func requestPayment(_ options: RequestPaymentOptions) {
        Alipay.share.options = options
        if (Alipay.share.getApplicationScheme() == nil) {
            var err = RequestPaymentFailImpl(700800)
            Alipay.share.options?.fail?(err)
            Alipay.share.options?.complete?(err)
            return
        }
        Alipay.share.payOrder()
    }
    fileprivate func processOrder(_ url: URL) {
        if (url.host == "safepay") {
            AlipaySDK.defaultService().processOrder(withPaymentResult: url, standbyCallback: {
            (resultDic: Map<AnyHashable, Any>?) -> Void in
            self.handlePaymentResult(resultDic)
            })
        }
    }
    fileprivate func handleOpenUniversalLink(_ userActivity: NSUserActivity?) {
        if (userActivity?.activityType == NSUserActivityTypeBrowsingWeb) {
            AlipaySDK.defaultService().handleOpenUniversalLink(userActivity, standbyCallback: {
            (resultDic: Map<AnyHashable, Any>?) -> Void in
            self.handlePaymentResult(resultDic)
            })
        }
    }
    private func payOrder() {
        AlipaySDK.defaultService().payOrder(self.options?.orderInfo, fromScheme: self.getApplicationScheme(), fromUniversalLink: self.getApplicationUniversalLink(), callback: {
        (resultDic: Map<AnyHashable, Any>?) -> Void in
        self.handlePaymentResult(resultDic)
        })
    }
    private func getApplicationScheme() -> String? {
        var scheme: String? = nil
        var infoDictionary = Bundle.main.infoDictionary
        if (infoDictionary != nil) {
            var bundleURLTypes = infoDictionary!["CFBundleURLTypes"] as! [Map<String, Any>]?
            if (bundleURLTypes != nil) {
                bundleURLTypes!.forEach({
                (value, key) -> Void in
                var urlIdentifier = value["CFBundleURLName"] as! String?
                if (urlIdentifier != nil && urlIdentifier!.toLowerCase() == "alipay") {
                    var urlSchemes = value["CFBundleURLSchemes"] as! [String]
                    scheme = urlSchemes[0]
                }
                })
            }
        }
        return scheme
    }
    private func getApplicationUniversalLink() -> String? {
        var universalLink: String? = nil
        var infoDictionary = Bundle.main.infoDictionary
        if (infoDictionary != nil) {
            var alipay = infoDictionary!["Alipay"] as! Map<String, Any>?
            if (alipay != nil) {
                universalLink = alipay!["universalLink"] as! String?
            }
        }
        return universalLink
    }
    private func handlePaymentResult(_ resultDic: Map<AnyHashable, Any>?) {
        var resultStatus: String = ""
        if (resultDic == nil) {
            resultStatus = defaultErrorCode.toString()
        } else {
            resultStatus = resultDic!.get("resultStatus") as! String
            if (resultStatus == nil) {
                resultStatus = defaultErrorCode.toString()
            }
        }
        if (resultStatus == "9000") {
            var res = RequestPaymentSuccess(UTSJSONObject([
                "data": resultDic
            ]))
            Alipay.share.options?.success?(res)
            Alipay.share.options?.complete?(res)
        } else {
            var code = errorCodeMap[resultStatus]
            if (code == nil) {
                code = defaultErrorCode
            }
            var err = RequestPaymentFailImpl(code!)
            Alipay.share.options?.fail?(err)
            Alipay.share.options?.complete?(err)
        }
    }
}
@objc(UTSSDKModulesDCloudUniPaymentAlipayUniPaymentAlipayProviderImplByJs)
@objcMembers
public class UniPaymentAlipayProviderImplByJs : UniPaymentAlipayProviderImpl {
    public func requestPaymentByJs(_ options: RequestPaymentOptions) {
        return self.requestPayment(options)
    }
    public func toJSONByJs() -> Map<String, Any> {
        return self.toJSON()
    }
}
@objc(UTSSDKModulesDCloudUniPaymentAlipayAlipayHookProxyByJs)
@objcMembers
public class AlipayHookProxyByJs : AlipayHookProxy {
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
@objc(UTSSDKModulesDCloudUniPaymentAlipayAlipayByJs)
@objcMembers
public class AlipayByJs : Alipay {
    public static func requestPaymentByJs(_ options: RequestPaymentOptions) {
        return Alipay.requestPayment(options)
    }
    public func processOrderByJs(_ url: URL) {
        return self.processOrder(url)
    }
    public func handleOpenUniversalLinkByJs(_ userActivity: NSUserActivity?) {
        return self.handleOpenUniversalLink(userActivity)
    }
}
