import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
public typealias MakePhoneCall = (_ options: MakePhoneCallOptions) -> Void
@objc(UTSSDKModulesDCloudUniMakePhoneCallMakePhoneCallSuccess)
@objcMembers
public class MakePhoneCallSuccess : NSObject, UTSObject {
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
public typealias MakePhoneCallSuccessCallback = (_ result: MakePhoneCallSuccess) -> Void
public typealias MakePhoneCallErrorCode = NSNumber
public protocol IMakePhoneCallError : IUniError {
    var errCode: MakePhoneCallErrorCode { get set }
}
public typealias MakePhoneCallFail = IMakePhoneCallError
public typealias MakePhoneCallFailCallback = (_ result: MakePhoneCallFail) -> Void
public typealias MakePhoneCallComplete = Any
public typealias MakePhoneCallCompleteCallback = (_ result: MakePhoneCallComplete) -> Void
@objc(UTSSDKModulesDCloudUniMakePhoneCallMakePhoneCallOptions)
@objcMembers
public class MakePhoneCallOptions : NSObject, UTSObject {
    public var phoneNumber: String!
    public var success: MakePhoneCallSuccessCallback?
    public var fail: MakePhoneCallFailCallback?
    public var complete: MakePhoneCallCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "phoneNumber":
                    self.phoneNumber = try! utsSubscriptCheckValue(newValue)
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
        self.phoneNumber = obj["phoneNumber"] as! String
        self.success = obj["success"] as! MakePhoneCallSuccessCallback?
        self.fail = obj["fail"] as! MakePhoneCallFailCallback?
        self.complete = obj["complete"] as! MakePhoneCallCompleteCallback?
    }
}
public func isValidPhoneRules(_ input: String) -> Bool {
    var cleaned = input.trim()
    var validDialPattern = UTSRegExp("^[0-9+\\*#;,]+$", "")
    return validDialPattern.test(cleaned)
}
public var MakePhoneCallUniErrors: Map<NSNumber, String> = Map([
    [
        1500601,
        "not support"
    ],
    [
        1500602,
        "invalid number"
    ],
    [
        1500603,
        "internal error"
    ]
])
@objc(UTSSDKModulesDCloudUniMakePhoneCallMakePhoneCallErrorImpl)
@objcMembers
public class MakePhoneCallErrorImpl : UniError, IMakePhoneCallError {
    public init(_ code: MakePhoneCallErrorCode){
        super.init()
        self.errSubject = "uni-makePhoneCall"
        self.errCode = code
        self.errMsg = MakePhoneCallUniErrors.get(code) ?? ""
    }
}
public var makePhoneCall: MakePhoneCall = {
(_ options: MakePhoneCallOptions) -> Void in
if (options.phoneNumber.length <= 0 || isValidPhoneRules(options.phoneNumber) == false) {
    var err = MakePhoneCallErrorImpl(1500602)
    options.fail?(err)
    options.complete?(err)
    return
}
var phoneString = """
tel://
""" + options.phoneNumber
var phoneUrl = URL(string: phoneString)
if (phoneUrl == nil) {
    var err = MakePhoneCallErrorImpl(1500602)
    options.fail?(err)
    options.complete?(err)
    return
}
if (UIApplication.shared.canOpenURL(phoneUrl!)) {
    var map = Map<UIApplication.OpenExternalURLOptionsKey, Any>()
    UIApplication.shared.open(phoneUrl!, options: map, completionHandler: {
    (_ isSuccessOpen: Bool) -> Void in
    if (isSuccessOpen) {
        var success = MakePhoneCallSuccess()
        options.success?(success)
        options.complete?(success)
    } else {
        var err = MakePhoneCallErrorImpl(1500603)
        options.fail?(err)
        options.complete?(err)
    }
    })
} else {
    var err = MakePhoneCallErrorImpl(1500601)
    options.fail?(err)
    options.complete?(err)
}
}
@objc(UTSSDKModulesDCloudUniMakePhoneCallMakePhoneCallOptionsJSONObject)
@objcMembers
public class MakePhoneCallOptionsJSONObject : NSObject {
    public var phoneNumber: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func makePhoneCallByJs(_ options: MakePhoneCallOptionsJSONObject) -> Void {
    return makePhoneCall(MakePhoneCallOptions(UTSJSONObject([
        "phoneNumber": options.phoneNumber,
        "success": {
        (result: MakePhoneCallSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: MakePhoneCallFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: MakePhoneCallComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniMakePhoneCallIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniMakePhoneCallIndexSwift : NSObject {
    public static func s_makePhoneCallByJs(_ options: MakePhoneCallOptionsJSONObject) -> Void {
        return makePhoneCallByJs(options)
    }
}
