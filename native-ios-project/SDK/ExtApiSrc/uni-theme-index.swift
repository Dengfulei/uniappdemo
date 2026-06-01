import DCloudUTSFoundation
import DCloudUniappRuntime
@objc(UTSSDKModulesDCloudUniThemeOsThemeChangeResult)
@objcMembers
public class OsThemeChangeResult : NSObject, UTSObject {
    public var osTheme: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "osTheme":
                    self.osTheme = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.osTheme = obj["osTheme"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniThemeAppThemeChangeResult)
@objcMembers
public class AppThemeChangeResult : NSObject, UTSObject {
    public var appTheme: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "appTheme":
                    self.appTheme = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.appTheme = obj["appTheme"] as! String
    }
}
public typealias OnOsThemeChangeCallback = (_ res: OsThemeChangeResult) -> Void
public typealias OnOsThemeChange = (_ callback: @escaping OnOsThemeChangeCallback) -> NSNumber
public typealias OffOsThemeChange = (_ id: NSNumber) -> Void
public typealias OnHostThemeChange = (_ callback: @escaping OnHostThemeChangeCallback) -> NSNumber
public typealias OffHostThemeChange = (_ id: NSNumber) -> Void
public typealias SetAppTheme = (_ options: SetAppThemeOptions) -> Void
public typealias OnAppThemeChangeCallback = (_ res: AppThemeChangeResult) -> Void
public typealias OnAppThemeChange = (_ callback: @escaping OnAppThemeChangeCallback) -> NSNumber
@objc(UTSSDKModulesDCloudUniThemeSetAppThemeSuccessResult)
@objcMembers
public class SetAppThemeSuccessResult : NSObject, UTSObject {
    public var theme: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "theme":
                    self.theme = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.theme = obj["theme"] as! String
    }
}
public typealias SetAppThemeSuccessCallback = (_ result: SetAppThemeSuccessResult) -> Void
public typealias SetAppThemeFailCallback = (_ result: AppThemeFail) -> Void
public typealias SetAppThemeCompleteCallback = (_ result: Any) -> Void
@objc(UTSSDKModulesDCloudUniThemeSetAppThemeOptions)
@objcMembers
public class SetAppThemeOptions : NSObject, UTSObject {
    public var theme: String!
    public var success: SetAppThemeSuccessCallback?
    public var fail: SetAppThemeFailCallback?
    public var complete: SetAppThemeCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "theme":
                    self.theme = try! utsSubscriptCheckValue(newValue)
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
        self.theme = obj["theme"] as! String
        self.success = obj["success"] as! SetAppThemeSuccessCallback?
        self.fail = obj["fail"] as! SetAppThemeFailCallback?
        self.complete = obj["complete"] as! SetAppThemeCompleteCallback?
    }
}
public typealias AppThemeErrorCode = NSNumber
public typealias AppThemeFail = IAppThemeFail
public protocol IAppThemeFail : IUniError {
    var errCode: AppThemeErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniThemeOnHostThemeChangeCallbackResult)
@objcMembers
public class OnHostThemeChangeCallbackResult : NSObject, UTSObject {
    public var hostTheme: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "hostTheme":
                    self.hostTheme = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.hostTheme = obj["hostTheme"] as! String
    }
}
public typealias OnHostThemeChangeCallback = (_ result: OnHostThemeChangeCallbackResult) -> Void
@objc(UTSSDKModulesDCloudUniThemeOnThemeChangeCallbackResult)
@objcMembers
public class OnThemeChangeCallbackResult : NSObject, UTSObject {
    public var theme: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "theme":
                    self.theme = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.theme = obj["theme"] as! String
    }
}
public var AppThemeUniErrorSubject = "uni-theme"
public var AppThemeUniErrors: Map<AppThemeErrorCode, String> = Map([
    [
        702001,
        "invalid parameter"
    ],
    [
        2002000,
        "unknown error"
    ]
])
@objc(UTSSDKModulesDCloudUniThemeAppThemeFailImpl)
@objcMembers
public class AppThemeFailImpl : UniError, IAppThemeFail {
    public override var errCode: AppThemeErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errCode: AppThemeErrorCode){
        super.init()
        self.errSubject = AppThemeUniErrorSubject
        self.errCode = errCode
        self.errMsg = AppThemeUniErrors.get(errCode) ?? ""
    }
    private var __errCode: AppThemeErrorCode!
}
public var onOsThemeChange: OnOsThemeChange = {
(_ callback: @escaping OnOsThemeChangeCallback) -> NSNumber in
return UTSiOS.onOsThemeChange({
(_ theme: String) -> Void in
var result = OsThemeChangeResult(UTSJSONObject([
    "osTheme": theme
]))
callback(result)
})
}
public var offOsThemeChange: OffOsThemeChange = {
(_ id: NSNumber) -> Void in
UTSiOS.offOsThemeChange(id)
}
public var setAppTheme: SetAppTheme = {
(_ options: SetAppThemeOptions) -> Void in
if (options.theme == "light" || options.theme == "dark" || options.theme == "auto") {
    UTSiOS.setAppTheme(options.theme)
} else {
    var error = AppThemeFailImpl(702001)
    options.fail?(error)
    options.complete?(error)
    return
}
var result = SetAppThemeSuccessResult(UTSJSONObject([
    "theme": options.theme
]))
options.success?(result)
options.complete?(result)
}
public var onAppThemeChange: OnAppThemeChange = {
(_ callback: @escaping OnAppThemeChangeCallback) -> NSNumber in
return UTSiOS.onAppThemeChange({
(_ theme: String) -> Void in
var result = AppThemeChangeResult(UTSJSONObject([
    "appTheme": theme
]))
callback(result)
})
}
public var offAppThemeChange = {
(_ id: NSNumber) -> Void in
UTSiOS.offAppThemeChange(id)
}
public var onHostThemeChange: OnHostThemeChange = {
(_ callback: @escaping OnHostThemeChangeCallback) -> NSNumber in
return UTSiOS.onOsThemeChange({
(_ theme: String) -> Void in
var result = OnHostThemeChangeCallbackResult(UTSJSONObject([
    "hostTheme": theme == "dark" ? "dark" : "light"
]))
callback(result)
})
}
public var offHostThemeChange: OffHostThemeChange = {
(_ id: NSNumber) -> Void in
UTSiOS.offOsThemeChange(id)
}
@objc(UTSSDKModulesDCloudUniThemeSetAppThemeOptionsJSONObject)
@objcMembers
public class SetAppThemeOptionsJSONObject : NSObject {
    public var theme: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func onOsThemeChangeByJs(_ callback: UTSCallback) -> NSNumber {
    return onOsThemeChange({
    (res: OsThemeChangeResult) -> Void in
    callback(res)
    })
}
public func offOsThemeChangeByJs(_ id: NSNumber) -> Void {
    return offOsThemeChange(id)
}
public func setAppThemeByJs(_ options: SetAppThemeOptionsJSONObject) -> Void {
    return setAppTheme(SetAppThemeOptions(UTSJSONObject([
        "theme": options.theme,
        "success": {
        (result: SetAppThemeSuccessResult) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: AppThemeFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: Any) -> Void in
        options.complete?(result)
        }
    ])))
}
public func onAppThemeChangeByJs(_ callback: UTSCallback) -> NSNumber {
    return onAppThemeChange({
    (res: AppThemeChangeResult) -> Void in
    callback(res)
    })
}
public func offAppThemeChangeByJs(_ id: NSNumber) -> Void {
    return offAppThemeChange(id)
}
public func onHostThemeChangeByJs(_ callback: UTSCallback) -> NSNumber {
    return onHostThemeChange({
    (result: OnHostThemeChangeCallbackResult) -> Void in
    callback(result)
    })
}
public func offHostThemeChangeByJs(_ id: NSNumber) -> Void {
    return offHostThemeChange(id)
}
@objc(UTSSDKModulesDCloudUniThemeIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniThemeIndexSwift : NSObject {
    public static func s_onOsThemeChangeByJs(_ callback: UTSCallback) -> NSNumber {
        return onOsThemeChangeByJs(callback)
    }
    public static func s_offOsThemeChangeByJs(_ id: NSNumber) -> Void {
        return offOsThemeChangeByJs(id)
    }
    public static func s_setAppThemeByJs(_ options: SetAppThemeOptionsJSONObject) -> Void {
        return setAppThemeByJs(options)
    }
    public static func s_onAppThemeChangeByJs(_ callback: UTSCallback) -> NSNumber {
        return onAppThemeChangeByJs(callback)
    }
    public static func s_offAppThemeChangeByJs(_ id: NSNumber) -> Void {
        return offAppThemeChangeByJs(id)
    }
    public static func s_onHostThemeChangeByJs(_ callback: UTSCallback) -> NSNumber {
        return onHostThemeChangeByJs(callback)
    }
    public static func s_offHostThemeChangeByJs(_ id: NSNumber) -> Void {
        return offHostThemeChangeByJs(id)
    }
}
