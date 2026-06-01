import DCloudUTSFoundation
import DCloudUniappRuntime
public var RequestPaymentUniErrorSubject = "uni-requestPayment"
@objc
public protocol UniPaymentProvider : JSExport, UniProvider {
    func requestPayment(_ options: RequestPaymentOptions)
}
public typealias RequestPaymentErrorCode = NSNumber
public typealias RequestPayment = (_ options: RequestPaymentOptions) -> Void
@objc(UTSSDKModulesDCloudUniPaymentRequestPaymentSuccess)
@objcMembers
public class RequestPaymentSuccess : NSObject, UTSObject {
    public var data: Any?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! Any?
    }
}
public typealias RequestPaymentSuccessCallback = (_ result: RequestPaymentSuccess) -> Void
public typealias RequestPaymentFail = IRequestPaymentFail
public typealias RequestPaymentFailCallback = (_ result: RequestPaymentFail) -> Void
public typealias RequestPaymentComplete = Any
public protocol IRequestPaymentFail : IUniError {
    var errCode: RequestPaymentErrorCode { get set }
}
public typealias RequestPaymentCompleteCallback = (_ result: RequestPaymentComplete) -> Void
@objc(UTSSDKModulesDCloudUniPaymentRequestPaymentOptions)
@objcMembers
public class RequestPaymentOptions : NSObject, UTSObject {
    public var provider: String!
    public var orderInfo: String!
    public var success: RequestPaymentSuccessCallback?
    public var fail: RequestPaymentFailCallback?
    public var complete: RequestPaymentCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "provider":
                    self.provider = try! utsSubscriptCheckValue(newValue)
                case "orderInfo":
                    self.orderInfo = try! utsSubscriptCheckValue(newValue)
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
        self.provider = obj["provider"] as! String
        self.orderInfo = obj["orderInfo"] as! String
        self.success = obj["success"] as! RequestPaymentSuccessCallback?
        self.fail = obj["fail"] as! RequestPaymentFailCallback?
        self.complete = obj["complete"] as! RequestPaymentCompleteCallback?
    }
}
public var RequestPaymentUniErrors: Map<RequestPaymentErrorCode, String> = Map([
    [
        700600,
        "The payment result is unknown (it may have been successfully paid). Please check the payment status of the order in the merchant order list."
    ],
    [
        701100,
        "Order payment failure."
    ],
    [
        701110,
        "Repeat the request."
    ],
    [
        700601,
        "The user canceled midway."
    ],
    [
        700602,
        "Network connection error."
    ],
    [
        700603,
        "Payment result unknown (may have been successfully paid), please check the payment status of the order in the merchant order list."
    ],
    [
        700607,
        "Payment not completed."
    ],
    [
        700608,
        "Parameter error."
    ],
    [
        700000,
        "Other payment errors."
    ],
    [
        700604,
        "Wechat is not installed."
    ],
    [
        700605,
        "Failed to get provider."
    ],
    [
        700800,
        "URL Scheme is not configured."
    ],
    [
        700801,
        "Universal Link is not configured."
    ]
])
@objc(UTSSDKModulesDCloudUniPaymentRequestPaymentFailImpl)
@objcMembers
public class RequestPaymentFailImpl : UniError, IRequestPaymentFail {
    public init(_ errCode: RequestPaymentErrorCode){
        super.init()
        self.errSubject = RequestPaymentUniErrorSubject
        self.errCode = errCode
        self.errMsg = RequestPaymentUniErrors.get(errCode) ?? ""
    }
}
public var requestPayment: RequestPayment = {
(_ options: RequestPaymentOptions) -> Void in
var provider = UTSiOS.getProvider("payment", options.provider, UniPaymentProvider.self)
if (provider != nil) {
    provider!.requestPayment(options)
} else {
    var err = RequestPaymentFailImpl(700605)
    options.fail?(err)
    options.complete?(err)
}
}
@objc(UTSSDKModulesDCloudUniPaymentRequestPaymentOptionsJSONObject)
@objcMembers
public class RequestPaymentOptionsJSONObject : NSObject {
    public var provider: String!
    public var orderInfo: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func requestPaymentByJs(_ options: RequestPaymentOptionsJSONObject) -> Void {
    return requestPayment(RequestPaymentOptions(UTSJSONObject([
        "provider": options.provider,
        "orderInfo": options.orderInfo,
        "success": {
        (result: RequestPaymentSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: RequestPaymentFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: RequestPaymentComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniPaymentIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniPaymentIndexSwift : NSObject {
    public static func s_requestPaymentByJs(_ options: RequestPaymentOptionsJSONObject) -> Void {
        return requestPaymentByJs(options)
    }
}
