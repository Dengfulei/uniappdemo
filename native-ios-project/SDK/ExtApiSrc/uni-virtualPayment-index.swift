import DCloudUTSFoundation
import DCloudUniappRuntime
public var RequestVirtualPaymentUniErrorSubject = "uni-RequestVirtualPayment"
public typealias GetVirtualPaymentManager = () -> VirtualPaymentManager
public protocol VirtualPaymentManager {
    func restoreTransactions(_ options: AppleIAPRestoreOptions)
    func getUnfinishedTransactions(_ options: AppleIAPUnfinishedTransactionOptions)
    func finishTransaction(_ options: AppleIAPFinishTransactionOptions)
}
public typealias RequestVirtualPaymentErrorCode = NSNumber
public typealias RequestVirtualPayment = (_ options: RequestVirtualPaymentOptions) -> Void
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPPromotionalOffer)
@objcMembers
public class AppleIAPPromotionalOffer : NSObject, UTSObject {
    public var offerIdentifier: String!
    public var keyIdentifier: String!
    public var nonce: String!
    public var signature: String!
    public var timestamp: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "offerIdentifier":
                    self.offerIdentifier = try! utsSubscriptCheckValue(newValue)
                case "keyIdentifier":
                    self.keyIdentifier = try! utsSubscriptCheckValue(newValue)
                case "nonce":
                    self.nonce = try! utsSubscriptCheckValue(newValue)
                case "signature":
                    self.signature = try! utsSubscriptCheckValue(newValue)
                case "timestamp":
                    self.timestamp = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.offerIdentifier = obj["offerIdentifier"] as! String
        self.keyIdentifier = obj["keyIdentifier"] as! String
        self.nonce = obj["nonce"] as! String
        self.signature = obj["signature"] as! String
        self.timestamp = obj["timestamp"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPTransactionOptions)
@objcMembers
public class AppleIAPTransactionOptions : NSObject, UTSObject {
    public var productId: String!
    public var appAccountToken: String?
    public var quantity: NSNumber!
    public var transactionDate: Date!
    public var transactionIdentifier: String!
    public var originalTransactionDate: Date!
    public var originalTransactionIdentifier: String!
    public var jsonRepresentation: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "productId":
                    self.productId = try! utsSubscriptCheckValue(newValue)
                case "appAccountToken":
                    self.appAccountToken = try! utsSubscriptCheckValueIfPresent(newValue)
                case "quantity":
                    self.quantity = try! utsSubscriptCheckValue(newValue)
                case "transactionDate":
                    self.transactionDate = try! utsSubscriptCheckValue(newValue)
                case "transactionIdentifier":
                    self.transactionIdentifier = try! utsSubscriptCheckValue(newValue)
                case "originalTransactionDate":
                    self.originalTransactionDate = try! utsSubscriptCheckValue(newValue)
                case "originalTransactionIdentifier":
                    self.originalTransactionIdentifier = try! utsSubscriptCheckValue(newValue)
                case "jsonRepresentation":
                    self.jsonRepresentation = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.productId = obj["productId"] as! String
        self.appAccountToken = obj["appAccountToken"] as! String?
        self.quantity = obj["quantity"] as! NSNumber
        self.transactionDate = obj["transactionDate"] as! Date
        self.transactionIdentifier = obj["transactionIdentifier"] as! String
        self.originalTransactionDate = obj["originalTransactionDate"] as! Date
        self.originalTransactionIdentifier = obj["originalTransactionIdentifier"] as! String
        self.jsonRepresentation = obj["jsonRepresentation"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentRequestVirtualPaymentSuccess)
@objcMembers
public class RequestVirtualPaymentSuccess : NSObject, UTSObject {
    public var apple: AppleIAPTransactionOptions?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "apple":
                    self.apple = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.apple = obj["apple"] as! AppleIAPTransactionOptions?
    }
}
public typealias RequestVirtualPaymentSuccessCallback = (_ result: RequestVirtualPaymentSuccess) -> Void
public typealias RequestVirtualPaymentFail = IRequestVirtualPaymentFail
public typealias RequestVirtualPaymentFailCallback = (_ result: RequestVirtualPaymentFail) -> Void
public protocol IRequestVirtualPaymentFail : IUniError {
    var errCode: RequestVirtualPaymentErrorCode { get set }
}
public typealias RequestVirtualPaymentComplete = Any
public typealias RequestVirtualPaymentCompleteCallback = (_ result: RequestVirtualPaymentComplete) -> Void
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPOptions)
@objcMembers
public class AppleIAPOptions : NSObject, UTSObject {
    public var productId: String!
    public var appAccountToken: String?
    public var quantity: NSNumber!
    public var promotionalOffer: AppleIAPPromotionalOffer?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "productId":
                    self.productId = try! utsSubscriptCheckValue(newValue)
                case "appAccountToken":
                    self.appAccountToken = try! utsSubscriptCheckValueIfPresent(newValue)
                case "quantity":
                    self.quantity = try! utsSubscriptCheckValue(newValue)
                case "promotionalOffer":
                    self.promotionalOffer = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.productId = obj["productId"] as! String
        self.appAccountToken = obj["appAccountToken"] as! String?
        self.quantity = obj["quantity"] as! NSNumber
        self.promotionalOffer = obj["promotionalOffer"] as! AppleIAPPromotionalOffer?
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentRequestVirtualPaymentOptions)
@objcMembers
public class RequestVirtualPaymentOptions : NSObject, UTSObject {
    public var apple: AppleIAPOptions?
    public var success: RequestVirtualPaymentSuccessCallback?
    public var fail: RequestVirtualPaymentFailCallback?
    public var complete: RequestVirtualPaymentCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "apple":
                    self.apple = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.apple = obj["apple"] as! AppleIAPOptions?
        self.success = obj["success"] as! RequestVirtualPaymentSuccessCallback?
        self.fail = obj["fail"] as! RequestVirtualPaymentFailCallback?
        self.complete = obj["complete"] as! RequestVirtualPaymentCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPRestoreSuccess)
@objcMembers
public class AppleIAPRestoreSuccess : NSObject, UTSObject {
    public var transactions: [AppleIAPTransactionOptions]?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "transactions":
                    self.transactions = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.transactions = obj["transactions"] as! [AppleIAPTransactionOptions]?
    }
}
public typealias AppleIAPRestoreSuccessCallback = (_ result: AppleIAPRestoreSuccess) -> Void
public typealias AppleIAPRestoreFail = IAppleIAPRestoreFail
public typealias AppleIAPRestoreFailCallback = (_ result: AppleIAPRestoreFail) -> Void
public protocol IAppleIAPRestoreFail : IUniError {
    var errCode: AppleIAPRestoreErrorCode { get set }
}
public typealias AppleIAPRestoreComplete = Any
public typealias AppleIAPRestoreCompleteCallback = (_ result: AppleIAPRestoreComplete) -> Void
public typealias AppleIAPRestoreErrorCode = NSNumber
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPRestoreOptions)
@objcMembers
public class AppleIAPRestoreOptions : NSObject, UTSObject {
    public var success: AppleIAPRestoreSuccessCallback?
    public var fail: AppleIAPRestoreFailCallback?
    public var complete: AppleIAPRestoreCompleteCallback?
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
        self.success = obj["success"] as! AppleIAPRestoreSuccessCallback?
        self.fail = obj["fail"] as! AppleIAPRestoreFailCallback?
        self.complete = obj["complete"] as! AppleIAPRestoreCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPUnfinishedTransactionSuccess)
@objcMembers
public class AppleIAPUnfinishedTransactionSuccess : NSObject, UTSObject {
    public var transactions: [AppleIAPTransactionOptions]?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "transactions":
                    self.transactions = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.transactions = obj["transactions"] as! [AppleIAPTransactionOptions]?
    }
}
public typealias AppleIAPUnfinishedTransactionSuccessCallback = (_ result: AppleIAPUnfinishedTransactionSuccess) -> Void
public typealias AppleIAPUnfinishedTransactionFail = IAppleIAPUnfinishedTransactionFail
public typealias AppleIAPUnfinishedTransactionFailCallback = (_ result: AppleIAPUnfinishedTransactionFail) -> Void
public protocol IAppleIAPUnfinishedTransactionFail : IUniError {
    var errCode: AppleIAPUnfinishedTransactionErrorCode { get set }
}
public typealias AppleIAPUnfinishedTransactionComplete = Any
public typealias AppleIAPUnfinishedTransactionCompleteCallback = (_ result: AppleIAPUnfinishedTransactionComplete) -> Void
public typealias AppleIAPUnfinishedTransactionErrorCode = NSNumber
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPUnfinishedTransactionOptions)
@objcMembers
public class AppleIAPUnfinishedTransactionOptions : NSObject, UTSObject {
    public var success: AppleIAPUnfinishedTransactionSuccessCallback?
    public var fail: AppleIAPUnfinishedTransactionFailCallback?
    public var complete: AppleIAPUnfinishedTransactionCompleteCallback?
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
        self.success = obj["success"] as! AppleIAPUnfinishedTransactionSuccessCallback?
        self.fail = obj["fail"] as! AppleIAPUnfinishedTransactionFailCallback?
        self.complete = obj["complete"] as! AppleIAPUnfinishedTransactionCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPFinishTransactionSuccess)
@objcMembers
public class AppleIAPFinishTransactionSuccess : NSObject, UTSObject {
    public var state: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "state":
                    self.state = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.state = (obj["state"] as? Bool) ?? false
    }
}
public typealias AppleIAPFinishTransactionSuccessCallback = (_ result: AppleIAPFinishTransactionSuccess) -> Void
public typealias AppleIAPFinishTransactionFail = IAppleIAPFinishTransactionFail
public typealias AppleIAPFinishTransactionFailCallback = (_ result: AppleIAPFinishTransactionFail) -> Void
public protocol IAppleIAPFinishTransactionFail : IUniError {
    var errCode: AppleIAPFinishTransactionFailErrorCode { get set }
}
public typealias AppleIAPFinishTransactionComplete = Any
public typealias AppleIAPFinishTransactionCompleteCallback = (_ result: AppleIAPFinishTransactionComplete) -> Void
public typealias AppleIAPFinishTransactionFailErrorCode = NSNumber
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPFinishTransactionOptions)
@objcMembers
public class AppleIAPFinishTransactionOptions : NSObject, UTSObject {
    public var transaction: AppleIAPTransactionOptions!
    public var success: AppleIAPFinishTransactionSuccessCallback?
    public var fail: AppleIAPFinishTransactionFailCallback?
    public var complete: AppleIAPFinishTransactionCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "transaction":
                    self.transaction = try! utsSubscriptCheckValue(newValue)
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
        self.transaction = obj["transaction"] as! AppleIAPTransactionOptions
        self.success = obj["success"] as! AppleIAPFinishTransactionSuccessCallback?
        self.fail = obj["fail"] as! AppleIAPFinishTransactionFailCallback?
        self.complete = obj["complete"] as! AppleIAPFinishTransactionCompleteCallback?
    }
}
public var RequestVirtualPaymentUniErrors: Map<RequestVirtualPaymentErrorCode, String> = Map([
    [
        700600,
        "The payment result is unknown (it may have been successfully paid). Please check the payment status of the order in the merchant order list."
    ],
    [
        701100,
        "Order payment failure."
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
        700604,
        "Client is not allowed to make the payment."
    ],
    [
        700605,
        "The purchase identifier was invalid."
    ],
    [
        700606,
        "The purchase identifier was invalid."
    ],
    [
        700607,
        "The purchase params was invalid."
    ],
    [
        700800,
        "The in-app purchase only supports iOS15 or later."
    ],
    [
        700000,
        "Other payment errors."
    ]
])
public func getRequestVirtualPaymentErrcode(_ errCode: NSNumber) -> RequestVirtualPaymentErrorCode {
    var res = RequestVirtualPaymentUniErrors[errCode]
    return res == nil ? 700000 : errCode
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentRequestVirtualPaymentFailImpl)
@objcMembers
public class RequestVirtualPaymentFailImpl : UniError, IRequestVirtualPaymentFail {
    public init(_ errCode: RequestVirtualPaymentErrorCode){
        super.init()
        self.errSubject = RequestVirtualPaymentUniErrorSubject
        self.errCode = errCode
        self.errMsg = RequestVirtualPaymentUniErrors[errCode] ?? ""
    }
}
public var AppleIAPRestoreUniErrorSubject = "uni-AppleIAPRestore"
public var AppleIAPRestoreUniErrors: Map<AppleIAPRestoreErrorCode, String> = Map([
    [
        700600,
        "failed to request apple server."
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
        700800,
        "This IAP api only supports iOS15 or later."
    ]
])
public func getAppleIAPRestoreErrcode(_ errCode: NSNumber) -> AppleIAPRestoreErrorCode {
    var res = AppleIAPRestoreUniErrors[errCode]
    return res == nil ? 700600 : errCode
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPRestoreFailImpl)
@objcMembers
public class AppleIAPRestoreFailImpl : UniError, IAppleIAPRestoreFail {
    public init(_ errCode: AppleIAPRestoreErrorCode){
        super.init()
        self.errSubject = AppleIAPRestoreUniErrorSubject
        self.errCode = errCode
        self.errMsg = AppleIAPRestoreUniErrors[errCode] ?? ""
    }
}
public var AppleIAPUnfinishedTransactionUniErrorSubject = "uni-AppleIAPUnfinishedTransaction"
public var AppleIAPUnfinishedTransactionUniErrors: Map<AppleIAPUnfinishedTransactionErrorCode, String> = Map([
    [
        700800,
        "This IAP api only supports iOS15 or later."
    ]
])
public func getAppleIAPUnfinishedTransactionErrcode(_ errCode: NSNumber) -> AppleIAPUnfinishedTransactionErrorCode {
    var res = AppleIAPUnfinishedTransactionUniErrors[errCode]
    return res == nil ? 700600 : errCode
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPUnfinishedTransactionFailImpl)
@objcMembers
public class AppleIAPUnfinishedTransactionFailImpl : UniError, IAppleIAPUnfinishedTransactionFail {
    public init(_ errCode: AppleIAPUnfinishedTransactionErrorCode){
        super.init()
        self.errSubject = AppleIAPUnfinishedTransactionUniErrorSubject
        self.errCode = errCode
        self.errMsg = AppleIAPUnfinishedTransactionUniErrors[errCode] ?? ""
    }
}
public var AppleIAPFinishTransactionUniErrorSubject = "uni-AppleIAPFinishTransaction"
public var AppleIAPFinishTransactionUniErrors: Map<AppleIAPFinishTransactionFailErrorCode, String> = Map([
    [
        700600,
        "failed to no transaction."
    ],
    [
        700800,
        "This IAP api only supports iOS15 or later."
    ]
])
public func getAppleIAPFinishTransactionErrcode(_ errCode: NSNumber) -> AppleIAPFinishTransactionFailErrorCode {
    var res = AppleIAPFinishTransactionUniErrors[errCode]
    return res == nil ? 700600 : errCode
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPFinishTransactionFailImpl)
@objcMembers
public class AppleIAPFinishTransactionFailImpl : UniError, IAppleIAPFinishTransactionFail {
    public init(_ errCode: AppleIAPFinishTransactionFailErrorCode){
        super.init()
        self.errSubject = AppleIAPFinishTransactionUniErrorSubject
        self.errCode = errCode
        self.errMsg = AppleIAPFinishTransactionUniErrors[errCode] ?? ""
    }
}
public var requestVirtualPayment: RequestVirtualPayment = {
(_ options: RequestVirtualPaymentOptions) -> Void in
IapManager.share.requestVirtualPayment(options)
}
public var getVirtualPaymentManager: GetVirtualPaymentManager = {
() -> VirtualPaymentManager in
if (IapManager.share.virtualPaymentManager != nil) {
    return IapManager.share.virtualPaymentManager!
}
IapManager.share.virtualPaymentManager = VirtualPaymentManagerImpl()
return VirtualPaymentManagerImpl()
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentVirtualPaymentManagerImpl)
@objcMembers
public class VirtualPaymentManagerImpl : NSObject, VirtualPaymentManager {
    public func restoreTransactions(_ options: AppleIAPRestoreOptions) {
        IapManager.share.restoreTransactions(options)
    }
    public func getUnfinishedTransactions(_ options: AppleIAPUnfinishedTransactionOptions) {
        IapManager.share.getUnfinishedTransactions(options)
    }
    public func finishTransaction(_ options: AppleIAPFinishTransactionOptions) {
        IapManager.share.finishTransaction(options)
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentIapManager)
@objcMembers
public class IapManager : NSObject {
    public static var share = IapManager()
    fileprivate var virtualPaymentManager: VirtualPaymentManagerImpl?
    fileprivate func restoreTransactions(_ options: AppleIAPRestoreOptions) {
        if #available(iOS 15.0, *) {
            UniStoreKit.shared.restorePurchase(success: {
            (res: [UniPurchase]) -> Void in
            var tempArray: Array<Any> = []
            res.forEach({
            (e: UniPurchase) -> Void in
            var transaction = AppleIAPTransactionOptions(UTSJSONObject([
                "productId": e.productId,
                "appAccountToken": e.appAccountToken,
                "quantity": e.transaction.purchasedQuantity,
                "transactionDate": e.purchaseDate,
                "originalTransactionDate": e.originalPurchaseDate,
                "transactionIdentifier": e.id,
                "originalTransactionIdentifier": e.originalID,
                "jsonRepresentation": e.jsonRepresentationBase64String
            ]))
            tempArray.push(transaction)
            })
            self.restoreTransactionsSuccessAction(tempArray, options)
            }, failure: {
            (error: UniStoreKitError) -> Void in
            switch(error){
                case UniStoreKitError.user_cancelled:
                    self.restoreTransactionsFailedAction(700601, options)
                case UniStoreKitError.network_error:
                    self.restoreTransactionsFailedAction(700602, options)
                case UniStoreKitError.verification_failed:
                    self.restoreTransactionsFailedAction(700000, options)
                case UniStoreKitError.system_error:
                    self.restoreTransactionsFailedAction(700600, options)
                case UniStoreKitError.unknown_error:
                    self.restoreTransactionsFailedAction(700600, options)
                case UniStoreKitError.purchase_not_allowed:
                    break
                case UniStoreKitError.promotion_info_invalid:
                    break
                case UniStoreKitError.product_not_available:
                    break
                default:
                    break
            }
            })
        } else {
            self.restoreTransactionsFailedAction(700800, options)
        }
    }
    private func restoreTransactionsFailedAction(_ errCode: NSNumber, _ options: AppleIAPRestoreOptions) {
        var err = AppleIAPRestoreFailImpl(getAppleIAPRestoreErrcode(errCode))
        options.fail?(err)
        options.complete?(err)
    }
    private func restoreTransactionsSuccessAction(_ transactions: Array<Any>, _ options: AppleIAPRestoreOptions) {
        var response = AppleIAPRestoreSuccess(UTSJSONObject([
            "transactions": transactions
        ]))
        options.success?(response)
        options.complete?(response)
    }
    fileprivate func getUnfinishedTransactions(_ options: AppleIAPUnfinishedTransactionOptions) {
        if #available(iOS 15.0, *) {
            UniStoreKit.shared.getUnfinishedTransactions(completion: {
            (res: [UniPurchase]) -> Void in
            var tempArray: Array<Any> = []
            res.forEach({
            (e: UniPurchase) -> Void in
            var transaction = AppleIAPTransactionOptions(UTSJSONObject([
                "productId": e.productId,
                "appAccountToken": e.appAccountToken,
                "quantity": e.transaction.purchasedQuantity,
                "transactionDate": e.purchaseDate,
                "originalTransactionDate": e.originalPurchaseDate,
                "transactionIdentifier": e.id,
                "originalTransactionIdentifier": e.originalID,
                "jsonRepresentation": e.jsonRepresentationBase64String
            ]))
            tempArray.push(transaction)
            })
            self.getUnfinishedTransactionsSuccessAction(tempArray, options)
            })
        } else {
            self.getUnfinishedTransactionsFailedAction(700800, options)
        }
    }
    private func getUnfinishedTransactionsFailedAction(_ errCode: NSNumber, _ options: AppleIAPUnfinishedTransactionOptions) {
        var err = AppleIAPUnfinishedTransactionFailImpl(getAppleIAPUnfinishedTransactionErrcode(errCode))
        options.fail?(err)
        options.complete?(err)
    }
    private func getUnfinishedTransactionsSuccessAction(_ transactions: Array<Any>, _ options: AppleIAPUnfinishedTransactionOptions) {
        var response = AppleIAPUnfinishedTransactionSuccess(UTSJSONObject([
            "transactions": transactions
        ]))
        options.success?(response)
        options.complete?(response)
    }
    fileprivate func finishTransaction(_ options: AppleIAPFinishTransactionOptions) {
        if #available(iOS 15.0, *) {
            var productId = options.transaction.productId
            var transactionId = options.transaction.transactionIdentifier
            var originalTransactionId = options.transaction.originalTransactionIdentifier
            var jsonRepresentation = options.transaction.jsonRepresentation
            var purchaseKey = productId! + transactionId! + originalTransactionId! + jsonRepresentation!
            if (UniStoreKit.shared.cacheTransactionsMap.has(purchaseKey)) {
                var temp = UniStoreKit.shared.cacheTransactionsMap.get(purchaseKey)
                temp?.finish(completion: {
                () -> Void in
                self.finishTransactionSuccessAction(options)
                })
            } else {
                self.finishTransactionFailedAction(700600, options)
            }
        } else {
            self.finishTransactionFailedAction(700800, options)
        }
    }
    private func finishTransactionFailedAction(_ errCode: NSNumber, _ options: AppleIAPFinishTransactionOptions) {
        var err = AppleIAPFinishTransactionFailImpl(getAppleIAPFinishTransactionErrcode(errCode))
        options.fail?(err)
        options.complete?(err)
    }
    private func finishTransactionSuccessAction(_ options: AppleIAPFinishTransactionOptions) {
        var response = AppleIAPFinishTransactionSuccess(UTSJSONObject([
            "state": true
        ]))
        options.success?(response)
        options.complete?(response)
    }
    fileprivate func requestVirtualPayment(_ options: RequestVirtualPaymentOptions) {
        if #available(iOS 15.0, *) {
            if (options.apple == nil) {
                self.requestVirtualPaymentFailedAction(700607, options)
                return
            }
            var iapOptions = options.apple!
            var purchaseOption = UniPurchaseOption()
            if (iapOptions.appAccountToken != nil) {
                purchaseOption.appAccountToken = iapOptions.appAccountToken!
            }
            purchaseOption.quantity = iapOptions.quantity.toInt()
            if (iapOptions.promotionalOffer != nil) {
                var promotionalOffer = UniPromotionalOffer()
                promotionalOffer.offerID = iapOptions.promotionalOffer!.offerIdentifier
                promotionalOffer.keyID = iapOptions.promotionalOffer!.keyIdentifier
                promotionalOffer.nonce = iapOptions.promotionalOffer!.nonce
                promotionalOffer.signature = iapOptions.promotionalOffer!.signature
                promotionalOffer.timestamp = iapOptions.promotionalOffer!.timestamp.toInt()
                purchaseOption.promotionalOffer = promotionalOffer
            }
            UniStoreKit.shared.buyProduct(identifier: iapOptions.productId, purchaseOption: purchaseOption, success: {
            (res: UniPurchase) -> Void in
            var transaction = AppleIAPTransactionOptions(UTSJSONObject([
                "productId": res.productId,
                "appAccountToken": res.appAccountToken,
                "quantity": res.transaction.purchasedQuantity,
                "transactionDate": res.purchaseDate,
                "originalTransactionDate": res.originalPurchaseDate,
                "transactionIdentifier": res.id,
                "originalTransactionIdentifier": res.originalID,
                "jsonRepresentation": res.jsonRepresentationBase64String
            ]))
            self.requestVirtualPaymentSuccessAction(transaction, options)
            }, failure: {
            (error: UniStoreKitError) -> Void in
            switch(error){
                case UniStoreKitError.purchase_not_allowed:
                    self.requestVirtualPaymentFailedAction(700604, options)
                case UniStoreKitError.promotion_info_invalid:
                    self.requestVirtualPaymentFailedAction(700606, options)
                case UniStoreKitError.product_not_available:
                    self.requestVirtualPaymentFailedAction(700605, options)
                case UniStoreKitError.user_cancelled:
                    self.requestVirtualPaymentFailedAction(700601, options)
                case UniStoreKitError.verification_failed:
                    self.requestVirtualPaymentFailedAction(700000, options)
                case UniStoreKitError.unknown_error:
                    self.requestVirtualPaymentFailedAction(700000, options)
                case UniStoreKitError.network_error:
                    self.requestVirtualPaymentFailedAction(700602, options)
                case UniStoreKitError.system_error:
                    self.requestVirtualPaymentFailedAction(700000, options)
                default:
                    break
            }
            })
        } else {
            self.requestVirtualPaymentFailedAction(700800, options)
        }
    }
    private func requestVirtualPaymentFailedAction(_ errCode: NSNumber, _ options: RequestVirtualPaymentOptions) {
        var err = RequestVirtualPaymentFailImpl(getRequestVirtualPaymentErrcode(errCode))
        options.fail?(err)
        options.complete?(err)
    }
    private func requestVirtualPaymentSuccessAction(_ transaction: AppleIAPTransactionOptions, _ options: RequestVirtualPaymentOptions) {
        var response = RequestVirtualPaymentSuccess(UTSJSONObject([
            "apple": transaction
        ]))
        options.success?(response)
        options.complete?(response)
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentRequestVirtualPaymentOptionsJSONObject)
@objcMembers
public class RequestVirtualPaymentOptionsJSONObject : NSObject {
    public var apple: AppleIAPOptions?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPRestoreOptionsJSONObject)
@objcMembers
public class AppleIAPRestoreOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPUnfinishedTransactionOptionsJSONObject)
@objcMembers
public class AppleIAPUnfinishedTransactionOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentAppleIAPFinishTransactionOptionsJSONObject)
@objcMembers
public class AppleIAPFinishTransactionOptionsJSONObject : NSObject {
    public var transaction: AppleIAPTransactionOptions!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func requestVirtualPaymentByJs(_ options: RequestVirtualPaymentOptionsJSONObject) -> Void {
    return requestVirtualPayment(RequestVirtualPaymentOptions(UTSJSONObject([
        "apple": options.apple,
        "success": {
        (result: RequestVirtualPaymentSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: RequestVirtualPaymentFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: RequestVirtualPaymentComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func getVirtualPaymentManagerByJs() -> Int {
    var ins = getVirtualPaymentManager()
    return UTSBridge.registerJavaScriptClassInstance(VirtualPaymentManagerByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentVirtualPaymentManagerByJsProxy)
@objcMembers
public class VirtualPaymentManagerByJsProxy : NSObject {
    public var __instance: VirtualPaymentManager
    public init(_ ins: VirtualPaymentManager){
        __instance = ins
    }
    public func restoreTransactionsByJs(_ options: AppleIAPRestoreOptionsJSONObject) -> Void {
        return __instance.restoreTransactions(AppleIAPRestoreOptions(UTSJSONObject([
            "success": {
            (result: AppleIAPRestoreSuccess) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: AppleIAPRestoreFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: AppleIAPRestoreComplete) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func getUnfinishedTransactionsByJs(_ options: AppleIAPUnfinishedTransactionOptionsJSONObject) -> Void {
        return __instance.getUnfinishedTransactions(AppleIAPUnfinishedTransactionOptions(UTSJSONObject([
            "success": {
            (result: AppleIAPUnfinishedTransactionSuccess) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: AppleIAPUnfinishedTransactionFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: AppleIAPUnfinishedTransactionComplete) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func finishTransactionByJs(_ options: AppleIAPFinishTransactionOptionsJSONObject) -> Void {
        return __instance.finishTransaction(AppleIAPFinishTransactionOptions(UTSJSONObject([
            "transaction": options.transaction,
            "success": {
            (result: AppleIAPFinishTransactionSuccess) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: AppleIAPFinishTransactionFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: AppleIAPFinishTransactionComplete) -> Void in
            options.complete?(result)
            }
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniVirtualPaymentIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniVirtualPaymentIndexSwift : NSObject {
    public static func s_requestVirtualPaymentByJs(_ options: RequestVirtualPaymentOptionsJSONObject) -> Void {
        return requestVirtualPaymentByJs(options)
    }
    public static func s_getVirtualPaymentManagerByJs() -> Int {
        return getVirtualPaymentManagerByJs()
    }
}
