import DCloudUTSFoundation
import DCloudUniappRuntime
public typealias GetProviderFailImpl = GetProviderFailImpl__1
public var ProviderUniErrorSubject = "uni-Provider"
@objc(UTSSDKModulesDCloudUniGetProviderGetProviderSuccess)
@objcMembers
public class GetProviderSuccess : NSObject, UTSObject {
    public var service: String!
    public var provider: [String]!
    public var providers: [UniProvider]!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "service":
                    self.service = try! utsSubscriptCheckValue(newValue)
                case "provider":
                    self.provider = try! utsSubscriptCheckValue(newValue)
                case "providers":
                    self.providers = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.service = obj["service"] as! String
        self.provider = obj["provider"] as! [String]
        self.providers = obj["providers"] as! [UniProvider]
    }
}
@objc(UTSSDKModulesDCloudUniGetProviderGetProviderSyncSuccess)
@objcMembers
public class GetProviderSyncSuccess : NSObject, UTSObject {
    public var service: String!
    public var providerIds: [String]!
    public var providerObjects: [UniProvider]!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "service":
                    self.service = try! utsSubscriptCheckValue(newValue)
                case "providerIds":
                    self.providerIds = try! utsSubscriptCheckValue(newValue)
                case "providerObjects":
                    self.providerObjects = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.service = obj["service"] as! String
        self.providerIds = obj["providerIds"] as! [String]
        self.providerObjects = obj["providerObjects"] as! [UniProvider]
    }
}
public typealias GetProviderSync = (_ options: GetProviderSyncOptions) -> GetProviderSyncSuccess
@objc(UTSSDKModulesDCloudUniGetProviderGetProviderSyncOptions)
@objcMembers
public class GetProviderSyncOptions : NSObject, UTSObject {
    public var service: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "service":
                    self.service = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.service = obj["service"] as! String
    }
}
public typealias GetProviderSuccessCallback = (_ result: GetProviderSuccess) -> Void
public typealias GetProviderFail = IGetProviderFail
public typealias GetProviderFailCallback = (_ result: GetProviderFail) -> Void
public typealias GetProviderComplete = Any
public typealias GetProviderCompleteCallback = (_ result: GetProviderComplete) -> Void
@objc(UTSSDKModulesDCloudUniGetProviderGetProviderOptions)
@objcMembers
public class GetProviderOptions : NSObject, UTSObject {
    public var service: String!
    public var success: GetProviderSuccessCallback?
    public var fail: GetProviderFailCallback?
    public var complete: GetProviderCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "service":
                    self.service = try! utsSubscriptCheckValue(newValue)
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
        self.service = obj["service"] as! String
        self.success = obj["success"] as! GetProviderSuccessCallback?
        self.fail = obj["fail"] as! GetProviderFailCallback?
        self.complete = obj["complete"] as! GetProviderCompleteCallback?
    }
}
public typealias GetProvider = (_ options: GetProviderOptions) -> Void
public typealias ProviderErrorCode = NSNumber
public protocol IGetProviderFail : IUniError {
    var errCode: ProviderErrorCode { get set }
}
public var ProviderUniErrors: Map<ProviderErrorCode, String> = Map([
    [
        110600,
        "Parameter service invalid."
    ]
])
@objc(UTSSDKModulesDCloudUniGetProviderGetProviderFailImpl__1)
@objcMembers
public class GetProviderFailImpl__1 : UniError, IGetProviderFail {
    public init(_ errCode: ProviderErrorCode){
        super.init()
        self.errSubject = ProviderUniErrorSubject
        self.errCode = errCode
        self.errMsg = ProviderUniErrors[errCode] ?? ""
    }
}
public var SupportedProviderServiceList = [
    "oauth",
    "share",
    "payment",
    "push",
    "location"
]
public var getProvider: GetProvider = {
(_ options: GetProviderOptions) -> Void in
if (!SupportedProviderServiceList.includes(options.service)) {
    if (options.fail != nil) {
        var err = GetProviderFailImpl(110600)
        options.fail?(err)
        options.complete?(err)
    }
} else {
    var providers = UTSiOS.getProviders(options.service)
    if (options.success != nil) {
        var result = GetProviderSuccess(UTSJSONObject([
            "service": options.service,
            "provider": providers.map({
            (_ provider) -> String in
            return provider.id
            }),
            "providers": providers
        ]))
        options.success?(result)
    }
}
options.complete?(UTSJSONObject([:]))
}
public var getProviderSync: GetProviderSync = {
(_ options: GetProviderSyncOptions) -> GetProviderSyncSuccess in
if (!SupportedProviderServiceList.includes(options.service)) {
    var result = GetProviderSyncSuccess(UTSJSONObject([
        "service": options.service,
        "providerIds": [],
        "providerObjects": []
    ]))
    return result
} else {
    var providers = UTSiOS.getProviders(options.service)
    var result = GetProviderSyncSuccess(UTSJSONObject([
        "service": options.service,
        "providerIds": providers.map({
        (_ provider) -> String in
        return provider.id
        }),
        "providerObjects": providers
    ]))
    return result
}
}
@objc(UTSSDKModulesDCloudUniGetProviderGetProviderSyncOptionsJSONObject)
@objcMembers
public class GetProviderSyncOptionsJSONObject : NSObject {
    public var service: String!
}
@objc(UTSSDKModulesDCloudUniGetProviderGetProviderOptionsJSONObject)
@objcMembers
public class GetProviderOptionsJSONObject : NSObject {
    public var service: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getProviderByJs(_ options: GetProviderOptionsJSONObject) -> Void {
    return getProvider(GetProviderOptions(UTSJSONObject([
        "service": options.service,
        "success": {
        (result: GetProviderSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GetProviderFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GetProviderComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func getProviderSyncByJs(_ options: GetProviderSyncOptionsJSONObject) -> GetProviderSyncSuccess {
    return getProviderSync(GetProviderSyncOptions(UTSJSONObject([
        "service": options.service
    ])))
}
@objc(UTSSDKModulesDCloudUniGetProviderIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetProviderIndexSwift : NSObject {
    public static func s_getProviderByJs(_ options: GetProviderOptionsJSONObject) -> Void {
        return getProviderByJs(options)
    }
    public static func s_getProviderSyncByJs(_ options: GetProviderSyncOptionsJSONObject) -> GetProviderSyncSuccess {
        return getProviderSyncByJs(options)
    }
}
