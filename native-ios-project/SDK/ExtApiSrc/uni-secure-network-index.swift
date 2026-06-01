import DCloudUTSFoundation
import DCloudUniappRuntime
import Swift
public protocol SecureNetworkManager {
    func hasClientKey(_ options: HasClientKeyOptions)
    func encryptGetClientKeyPayload(_ options: EncryptGetClientKeyPayloadOptions)
    func setClientKey(_ options: SetClientKeyOptions)
    func encrypt(_ options: EncryptOptions)
    func decrypt(_ options: DecryptOptions)
}
public typealias SecureNetworkErrorCode = NSNumber
public protocol SecureNetworkFail : IUniError {
    var errCode: SecureNetworkErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniSecureNetworkHasClientKeyOptions)
@objcMembers
public class HasClientKeyOptions : NSObject, UTSObject {
    public var spaceId: String!
    public var provider: String!
    public var success: ((_ result: Bool) -> Void)?
    public var fail: ((_ result: SecureNetworkFail) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "spaceId":
                    self.spaceId = try! utsSubscriptCheckValue(newValue)
                case "provider":
                    self.provider = try! utsSubscriptCheckValue(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.spaceId = obj["spaceId"] as! String
        self.provider = obj["provider"] as! String
        self.success = obj["success"] as! ((_ result: Bool) -> Void)?
        self.fail = obj["fail"] as! ((_ result: SecureNetworkFail) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniSecureNetworkEncryptGetClientKeyPayloadOptions)
@objcMembers
public class EncryptGetClientKeyPayloadOptions : NSObject, UTSObject {
    public var data: UTSJSONObject!
    public var success: ((_ result: UTSJSONObject) -> Void)?
    public var fail: ((_ result: SecureNetworkFail) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! UTSJSONObject
        self.success = obj["success"] as! ((_ result: UTSJSONObject) -> Void)?
        self.fail = obj["fail"] as! ((_ result: SecureNetworkFail) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniSecureNetworkSetClientKeyOptions)
@objcMembers
public class SetClientKeyOptions : NSObject, UTSObject {
    public var spaceId: String!
    public var provider: String!
    public var clientKey: String!
    public var key: String!
    public var success: ((_ result: Bool) -> Void)?
    public var fail: ((_ result: SecureNetworkFail) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "spaceId":
                    self.spaceId = try! utsSubscriptCheckValue(newValue)
                case "provider":
                    self.provider = try! utsSubscriptCheckValue(newValue)
                case "clientKey":
                    self.clientKey = try! utsSubscriptCheckValue(newValue)
                case "key":
                    self.key = try! utsSubscriptCheckValue(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.spaceId = obj["spaceId"] as! String
        self.provider = obj["provider"] as! String
        self.clientKey = obj["clientKey"] as! String
        self.key = obj["key"] as! String
        self.success = obj["success"] as! ((_ result: Bool) -> Void)?
        self.fail = obj["fail"] as! ((_ result: SecureNetworkFail) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniSecureNetworkEncryptOptions)
@objcMembers
public class EncryptOptions : NSObject, UTSObject {
    public var data: String!
    public var spaceId: String!
    public var provider: String!
    public var success: ((_ result: UTSJSONObject) -> Void)?
    public var fail: ((_ result: SecureNetworkFail) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "spaceId":
                    self.spaceId = try! utsSubscriptCheckValue(newValue)
                case "provider":
                    self.provider = try! utsSubscriptCheckValue(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! String
        self.spaceId = obj["spaceId"] as! String
        self.provider = obj["provider"] as! String
        self.success = obj["success"] as! ((_ result: UTSJSONObject) -> Void)?
        self.fail = obj["fail"] as! ((_ result: SecureNetworkFail) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniSecureNetworkDecryptOptions)
@objcMembers
public class DecryptOptions : NSObject, UTSObject {
    public var data: String!
    public var key: String!
    public var spaceId: String!
    public var provider: String!
    public var success: ((_ result: UTSJSONObject) -> Void)?
    public var fail: ((_ result: SecureNetworkFail) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "key":
                    self.key = try! utsSubscriptCheckValue(newValue)
                case "spaceId":
                    self.spaceId = try! utsSubscriptCheckValue(newValue)
                case "provider":
                    self.provider = try! utsSubscriptCheckValue(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! String
        self.key = obj["key"] as! String
        self.spaceId = obj["spaceId"] as! String
        self.provider = obj["provider"] as! String
        self.success = obj["success"] as! ((_ result: UTSJSONObject) -> Void)?
        self.fail = obj["fail"] as! ((_ result: SecureNetworkFail) -> Void)?
    }
}
public var SecureNetworkErrors: Map<SecureNetworkErrorCode, String> = Map([
    [
        10001,
        "unimpsdk or playground is not support"
    ],
    [
        10002,
        "params is null"
    ],
    [
        10003,
        "app key is null"
    ],
    [
        10004,
        "encrypt client key payload fail"
    ],
    [
        10005,
        "native json format error"
    ],
    [
        10006,
        "json format error"
    ],
    [
        10007,
        "client key data is illegal"
    ],
    [
        10008,
        "client key is null"
    ],
    [
        10009,
        "encrypt fail"
    ],
    [
        100010,
        "decrypt fail"
    ],
    [
        100011,
        "secure network fail"
    ]
])
fileprivate func getErrcode(_ errCode: NSNumber) -> SecureNetworkErrorCode {
    var res = SecureNetworkErrors[errCode]
    return res == nil ? 100011 : errCode
}
@objc(UTSSDKModulesDCloudUniSecureNetworkSecureNetworkFailImpl)
@objcMembers
public class SecureNetworkFailImpl : UniError, SecureNetworkFail {
    public init(_ errCode: SecureNetworkErrorCode){
        super.init()
        self.errSubject = "uni-secure-network"
        self.errCode = errCode
        self.errMsg = SecureNetworkErrors.get(errCode) ?? ""
    }
}
@objc(UTSSDKModulesDCloudUniSecureNetworkSecureNetworkManagerImpl)
@objcMembers
public class SecureNetworkManagerImpl : NSObject, SecureNetworkManager {
    private static var instance: SecureNetworkManagerImpl? = nil
    public static func getInstance() -> SecureNetworkManagerImpl {
        if (self.instance == nil) {
            self.instance = SecureNetworkManagerImpl()
        }
        return self.instance!
    }
    private func isTypeNumber(_ arg: Any) -> Bool {
        return "number | Int | Float | Double | Int64 | Int32 | Int16 | Int8 | UInt | UInt64 | UInt32 | UInt16 | UInt8 | Byte | Short | Long".includes(UTSiOS.typeof(arg))
    }
    public func decrypt(_ options: DecryptOptions) -> Void {
        SNS.decrypt(options.data, options.key, options.spaceId, options.provider, {
        (ptype: Int, arg: Any?) -> Void in
        if (ptype == 1) {
            if (UTSiOS.typeof(arg) == "string") {
                var content = arg as! String
                if (content != nil) {
                    var result = JSON.parseObject(content)
                    if (result == nil) {
                        var failResult = SecureNetworkFailImpl(getErrcode(10006))
                        options.fail?(failResult)
                        return
                    } else {
                        options.success?(result!)
                    }
                } else {
                    var failResult = SecureNetworkFailImpl(getErrcode(100010))
                    options.fail?(failResult)
                }
            }
        } else {
            if (self.isTypeNumber(arg)) {
                var failResult = SecureNetworkFailImpl(getErrcode(NSNumber.from(arg as! Int)))
                options.fail?(failResult)
            }
        }
        })
    }
    public func encrypt(_ options: EncryptOptions) -> Void {
        SNS.encrypt(options.data, options.spaceId, options.provider, {
        (type: Int, arg: Any?) -> Void in
        if (type == 1) {
            if (UTSiOS.typeof(arg) == "string") {
                var content = arg as! String
                if (content != nil) {
                    var result = JSON.parseObject(content)
                    if (result == nil) {
                        var failResult = SecureNetworkFailImpl(getErrcode(10006))
                        options.fail?(failResult)
                        return
                    } else {
                        options.success?(result!)
                    }
                } else {
                    var failResult = SecureNetworkFailImpl(getErrcode(10009))
                    options.fail?(failResult)
                }
            }
        } else {
            if (self.isTypeNumber(arg)) {
                var failResult = SecureNetworkFailImpl(getErrcode(NSNumber.from(arg as! Int)))
                options.fail?(failResult)
            }
        }
        })
    }
    public func setClientKey(_ options: SetClientKeyOptions) -> Void {
        SNS.setClientKey(options.spaceId, options.provider, options.clientKey, options.key, {
        (type: Int, arg: Any?) -> Void in
        if (type == 1) {
            if (UTSiOS.typeof(arg) == "boolean") {
                options.success?(arg as! Bool)
            }
        } else {
            if (self.isTypeNumber(arg)) {
                var failResult = SecureNetworkFailImpl(getErrcode(NSNumber.from(arg as! Int)))
                options.fail?(failResult)
            }
        }
        })
    }
    public func encryptGetClientKeyPayload(_ options: EncryptGetClientKeyPayloadOptions) -> Void {
        SNS.encryptGetClientKeyPayload(options.data, {
        (type: Int, arg: Any?) -> Void in
        if (type == 1) {
            if (UTSiOS.typeof(arg) == "string") {
                var content = arg as! String
                var result = JSON.parseObject(content)
                if (result != nil) {
                    options.success?(result!)
                } else {
                    var failResult = SecureNetworkFailImpl(getErrcode(10006))
                    options.fail?(failResult)
                }
            }
        } else {
            if (self.isTypeNumber(arg)) {
                var failResult = SecureNetworkFailImpl(getErrcode(NSNumber.from(arg as! Int)))
                options.fail?(failResult)
            }
        }
        })
    }
    public func hasClientKey(_ options: HasClientKeyOptions) -> Void {
        SNS.hasClientKey(options.spaceId, options.provider, {
        (type: Int, arg: Any?) -> Void in
        if (type == 1) {
            if (UTSiOS.typeof(arg) == "boolean") {
                options.success?(arg as! Bool)
            }
        } else {
            if (self.isTypeNumber(arg)) {
                var failResult = SecureNetworkFailImpl(getErrcode(NSNumber.from(arg as! Int)))
                options.fail?(failResult)
            }
        }
        })
    }
}
public func __getSecureNetworkManager() -> SecureNetworkManager {
    return SecureNetworkManagerImpl.getInstance()
}
@objc(UTSSDKModulesDCloudUniSecureNetworkHasClientKeyOptionsJSONObject)
@objcMembers
public class HasClientKeyOptionsJSONObject : NSObject {
    public var spaceId: String!
    public var provider: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniSecureNetworkEncryptGetClientKeyPayloadOptionsJSONObject)
@objcMembers
public class EncryptGetClientKeyPayloadOptionsJSONObject : NSObject {
    public var data: UTSJSONObject!
    public var success: UTSCallback?
    public var fail: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniSecureNetworkSetClientKeyOptionsJSONObject)
@objcMembers
public class SetClientKeyOptionsJSONObject : NSObject {
    public var spaceId: String!
    public var provider: String!
    public var clientKey: String!
    public var key: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniSecureNetworkEncryptOptionsJSONObject)
@objcMembers
public class EncryptOptionsJSONObject : NSObject {
    public var data: String!
    public var spaceId: String!
    public var provider: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniSecureNetworkDecryptOptionsJSONObject)
@objcMembers
public class DecryptOptionsJSONObject : NSObject {
    public var data: String!
    public var key: String!
    public var spaceId: String!
    public var provider: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
}
public func __getSecureNetworkManagerByJs() -> Int {
    var ins = __getSecureNetworkManager()
    return UTSBridge.registerJavaScriptClassInstance(SecureNetworkManagerByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniSecureNetworkSecureNetworkManagerByJsProxy)
@objcMembers
public class SecureNetworkManagerByJsProxy : NSObject {
    public var __instance: SecureNetworkManager
    public init(_ ins: SecureNetworkManager){
        __instance = ins
    }
    public func hasClientKeyByJs(_ options: HasClientKeyOptionsJSONObject) -> Void {
        return __instance.hasClientKey(HasClientKeyOptions(UTSJSONObject([
            "spaceId": options.spaceId,
            "provider": options.provider,
            "success": {
            (result: Bool) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: SecureNetworkFail) -> Void in
            options.fail?(result)
            }
        ])))
    }
    public func encryptGetClientKeyPayloadByJs(_ options: EncryptGetClientKeyPayloadOptionsJSONObject) -> Void {
        return __instance.encryptGetClientKeyPayload(EncryptGetClientKeyPayloadOptions(UTSJSONObject([
            "data": options.data,
            "success": {
            (result: UTSJSONObject) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: SecureNetworkFail) -> Void in
            options.fail?(result)
            }
        ])))
    }
    public func setClientKeyByJs(_ options: SetClientKeyOptionsJSONObject) -> Void {
        return __instance.setClientKey(SetClientKeyOptions(UTSJSONObject([
            "spaceId": options.spaceId,
            "provider": options.provider,
            "clientKey": options.clientKey,
            "key": options.key,
            "success": {
            (result: Bool) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: SecureNetworkFail) -> Void in
            options.fail?(result)
            }
        ])))
    }
    public func encryptByJs(_ options: EncryptOptionsJSONObject) -> Void {
        return __instance.encrypt(EncryptOptions(UTSJSONObject([
            "data": options.data,
            "spaceId": options.spaceId,
            "provider": options.provider,
            "success": {
            (result: UTSJSONObject) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: SecureNetworkFail) -> Void in
            options.fail?(result)
            }
        ])))
    }
    public func decryptByJs(_ options: DecryptOptionsJSONObject) -> Void {
        return __instance.decrypt(DecryptOptions(UTSJSONObject([
            "data": options.data,
            "key": options.key,
            "spaceId": options.spaceId,
            "provider": options.provider,
            "success": {
            (result: UTSJSONObject) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: SecureNetworkFail) -> Void in
            options.fail?(result)
            }
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniSecureNetworkIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniSecureNetworkIndexSwift : NSObject {
    public static func s___getSecureNetworkManagerByJs() -> Int {
        return __getSecureNetworkManagerByJs()
    }
}
