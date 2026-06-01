import DCloudUTSFoundation
import DCloudUniappRuntime
public typealias ClipBoardErrorCode = NSNumber
public protocol IClipBoardError : IUniError {
    var errCode: ClipBoardErrorCode { get set }
}
public typealias SetClipboardData = (_ options: SetClipboardDataOptions) -> Void
@objc(UTSSDKModulesDCloudUniClipboardSetClipboardDataSuccess)
@objcMembers
public class SetClipboardDataSuccess : NSObject, UTSObject {
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
public typealias SetClipboardDataSuccessCallback = (_ result: SetClipboardDataSuccess) -> Void
public typealias SetClipboardDataFail = IClipBoardError
public typealias SetClipboardDataFailCallback = (_ result: SetClipboardDataFail) -> Void
public typealias SetClipboardDataComplete = Any
public typealias SetClipboardDataCompleteCallback = (_ result: SetClipboardDataComplete) -> Void
@objc(UTSSDKModulesDCloudUniClipboardSetClipboardDataOptions)
@objcMembers
public class SetClipboardDataOptions : NSObject, UTSObject {
    public var data: String!
    public var showToast: Bool = false
    public var success: SetClipboardDataSuccessCallback?
    public var fail: SetClipboardDataFailCallback?
    public var complete: SetClipboardDataCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "showToast":
                    self.showToast = try! utsSubscriptCheckValue(newValue)
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
        self.data = obj["data"] as! String
        self.showToast = (obj["showToast"] as? Bool) ?? false
        self.success = obj["success"] as! SetClipboardDataSuccessCallback?
        self.fail = obj["fail"] as! SetClipboardDataFailCallback?
        self.complete = obj["complete"] as! SetClipboardDataCompleteCallback?
    }
}
public typealias GetClipboardData = (_ options: GetClipboardDataOptions) -> Void
@objc(UTSSDKModulesDCloudUniClipboardGetClipboardDataSuccess)
@objcMembers
public class GetClipboardDataSuccess : NSObject, UTSObject {
    public var data: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
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
        self.data = obj["data"] as! String
    }
}
public typealias GetClipboardDataSuccessCallback = (_ result: GetClipboardDataSuccess) -> Void
public typealias GetClipboardDataFail = IClipBoardError
public typealias GetClipboardDataFailCallback = (_ result: GetClipboardDataFail) -> Void
public typealias GetClipboardDataComplete = Any
public typealias GetClipboardDataCompleteCallback = (_ result: GetClipboardDataComplete) -> Void
@objc(UTSSDKModulesDCloudUniClipboardGetClipboardDataOptions)
@objcMembers
public class GetClipboardDataOptions : NSObject, UTSObject {
    public var success: GetClipboardDataSuccessCallback?
    public var fail: GetClipboardDataFailCallback?
    public var complete: GetClipboardDataCompleteCallback?
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
        self.success = obj["success"] as! GetClipboardDataSuccessCallback?
        self.fail = obj["fail"] as! GetClipboardDataFailCallback?
        self.complete = obj["complete"] as! GetClipboardDataCompleteCallback?
    }
}
public var getClipboardData: GetClipboardData = {
(_ options: GetClipboardDataOptions) -> Void in
var pasteboard = UIPasteboard.general
var result = GetClipboardDataSuccess(UTSJSONObject([
    "data": pasteboard.string ?? ""
]))
options.success?(result)
options.complete?(result)
}
public var setClipboardData: SetClipboardData = {
(_ options: SetClipboardDataOptions) -> Void in
UIPasteboard.general.string = options.data
var result = SetClipboardDataSuccess(UTSJSONObject([:]))
options.success?(result)
options.complete?(result)
}
@objc(UTSSDKModulesDCloudUniClipboardSetClipboardDataOptionsJSONObject)
@objcMembers
public class SetClipboardDataOptionsJSONObject : NSObject {
    public var data: String!
    public var showToast: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniClipboardGetClipboardDataOptionsJSONObject)
@objcMembers
public class GetClipboardDataOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getClipboardDataByJs(_ options: GetClipboardDataOptionsJSONObject) -> Void {
    return getClipboardData(GetClipboardDataOptions(UTSJSONObject([
        "success": {
        (result: GetClipboardDataSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GetClipboardDataFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GetClipboardDataComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func setClipboardDataByJs(_ options: SetClipboardDataOptionsJSONObject) -> Void {
    return setClipboardData(SetClipboardDataOptions(UTSJSONObject([
        "data": options.data,
        "showToast": options.showToast,
        "success": {
        (result: SetClipboardDataSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: SetClipboardDataFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: SetClipboardDataComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniClipboardIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniClipboardIndexSwift : NSObject {
    public static func s_getClipboardDataByJs(_ options: GetClipboardDataOptionsJSONObject) -> Void {
        return getClipboardDataByJs(options)
    }
    public static func s_setClipboardDataByJs(_ options: SetClipboardDataOptionsJSONObject) -> Void {
        return setClipboardDataByJs(options)
    }
}
