import DCloudUTSFoundation
import DCloudUniappRuntime
@objc(UTSSDKModulesDCloudUniKeyboardHideKeyboardSuccess)
@objcMembers
public class HideKeyboardSuccess : NSObject, UTSObject {
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
@objc(UTSSDKModulesDCloudUniKeyboardHideKeyboardFail)
@objcMembers
public class HideKeyboardFail : NSObject, UTSObject {
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
public typealias HideKeyboardSuccessCallback = (_ res: HideKeyboardSuccess) -> Void
public typealias HideKeyboardFailCallback = (_ res: HideKeyboardFail) -> Void
public typealias HideKeyboardCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniKeyboardHideKeyboardOptions)
@objcMembers
public class HideKeyboardOptions : NSObject, UTSObject {
    public var success: HideKeyboardSuccessCallback?
    public var fail: HideKeyboardFailCallback?
    public var complete: HideKeyboardCompleteCallback?
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
        self.success = obj["success"] as! HideKeyboardSuccessCallback?
        self.fail = obj["fail"] as! HideKeyboardFailCallback?
        self.complete = obj["complete"] as! HideKeyboardCompleteCallback?
    }
}
public typealias OnKeyboardHeightChangeCallback = (_ res: OnKeyboardHeightChangeCallbackResult) -> Void
@objc(UTSSDKModulesDCloudUniKeyboardOnKeyboardHeightChangeCallbackResult)
@objcMembers
public class OnKeyboardHeightChangeCallbackResult : NSObject, UTSObject {
    public var height: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "height":
                    self.height = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.height = obj["height"] as! NSNumber
    }
}
public typealias HideKeyboard = (_ options: HideKeyboardOptions?) -> Void
public typealias OnKeyboardHeightChange = (_ callback: @escaping OnKeyboardHeightChangeCallback) -> NSNumber
public typealias OffKeyboardHeightChange = (_ id: NSNumber?) -> Void
public var hideKeyboard: HideKeyboard = {
(_ options: HideKeyboardOptions?) -> Void in
UTSiOS.hideKeyboard()
var success = HideKeyboardSuccess(UTSJSONObject([:]))
options?.success?(success)
options?.complete?(success)
}
public var onKeyboardHeightChange: OnKeyboardHeightChange = {
(_ callback: @escaping OnKeyboardHeightChangeCallback) -> NSNumber in
return UTSiOS.onKeyboardHeightChange({
(_ height: NSNumber) -> Void in
var result = OnKeyboardHeightChangeCallbackResult(UTSJSONObject([
    "height": height
]))
callback(result)
})
}
public var offKeyboardHeightChange: OffKeyboardHeightChange = {
(_ id: NSNumber?) -> Void in
UTSiOS.offKeyboardHeightChange(id)
}
@objc(UTSSDKModulesDCloudUniKeyboardHideKeyboardOptionsJSONObject)
@objcMembers
public class HideKeyboardOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func hideKeyboardByJs(_ options: HideKeyboardOptionsJSONObject?) -> Void {
    return hideKeyboard(options != nil ? HideKeyboardOptions(UTSJSONObject([
        "success": {
        (res: HideKeyboardSuccess) -> Void in
        options!.success?(res)
        },
        "fail": {
        (res: HideKeyboardFail) -> Void in
        options!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options!.complete?(res)
        }
    ])) : nil)
}
public func onKeyboardHeightChangeByJs(_ callback: UTSCallback) -> NSNumber {
    return onKeyboardHeightChange({
    (res: OnKeyboardHeightChangeCallbackResult) -> Void in
    callback(res)
    })
}
public func offKeyboardHeightChangeByJs(_ id: NSNumber?) -> Void {
    return offKeyboardHeightChange(id)
}
@objc(UTSSDKModulesDCloudUniKeyboardIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniKeyboardIndexSwift : NSObject {
    public static func s_hideKeyboardByJs(_ options: HideKeyboardOptionsJSONObject?) -> Void {
        return hideKeyboardByJs(options)
    }
    public static func s_onKeyboardHeightChangeByJs(_ callback: UTSCallback) -> NSNumber {
        return onKeyboardHeightChangeByJs(callback)
    }
    public static func s_offKeyboardHeightChangeByJs(_ id: NSNumber?) -> Void {
        return offKeyboardHeightChangeByJs(id)
    }
}
