import DCloudUTSFoundation
import DCloudUniappRuntime
import UIKit
public typealias PromptErrorCode = NSNumber
public protocol IPromptError : IUniError {
    var errCode: PromptErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniPromptShowToastSuccess)
@objcMembers
public class ShowToastSuccess : NSObject, UTSObject {
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
public typealias ShowToastFail = IPromptError
public typealias ShowToastSuccessCallback = (_ res: ShowToastSuccess) -> Void
public typealias ShowToastFailCallback = (_ res: ShowToastFail) -> Void
public typealias ShowToastCompleteCallback = (_ res: Any) -> Void
public typealias Icon = String
public typealias ShowToastPosition = String
@objc(UTSSDKModulesDCloudUniPromptShowToastOptions)
@objcMembers
public class ShowToastOptions : NSObject, UTSObject {
    public var title: String!
    public var icon: Icon?
    public var image: String?
    public var mask: Bool = false
    public var duration: NSNumber?
    public var position: ShowToastPosition?
    public var success: ShowToastSuccessCallback?
    public var fail: ShowToastFailCallback?
    public var complete: ShowToastCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValue(newValue)
                case "icon":
                    self.icon = try! utsSubscriptCheckValueIfPresent(newValue)
                case "image":
                    self.image = try! utsSubscriptCheckValueIfPresent(newValue)
                case "mask":
                    self.mask = try! utsSubscriptCheckValue(newValue)
                case "duration":
                    self.duration = try! utsSubscriptCheckValueIfPresent(newValue)
                case "position":
                    self.position = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.title = obj["title"] as! String
        self.icon = obj["icon"] as! Icon?
        self.image = obj["image"] as! String?
        self.mask = (obj["mask"] as? Bool) ?? false
        self.duration = obj["duration"] as! NSNumber?
        self.position = obj["position"] as! ShowToastPosition?
        self.success = obj["success"] as! ShowToastSuccessCallback?
        self.fail = obj["fail"] as! ShowToastFailCallback?
        self.complete = obj["complete"] as! ShowToastCompleteCallback?
    }
}
public typealias ShowToast = (_ options: ShowToastOptions) -> Void
public typealias HideToast = () -> Void
@objc(UTSSDKModulesDCloudUniPromptPromptErrorImpl)
@objcMembers
public class PromptErrorImpl : UniError, IPromptError {
    public init(_ errCode: PromptErrorCode, _ errMsg: String){
        super.init()
        self.errSubject = "uni-prompt"
        self.errCode = errCode
        self.errMsg = errMsg
    }
}
public func toShowToast(_ options: ShowToastOptions) {
    if (options.title == nil || options.title.length == 0) {
        var res = PromptErrorImpl(1001, "showLoading:title is null")
        options.fail?(res)
        options.complete?(res)
    } else {
        var duration: NSNumber = 2.5
        if (options.duration != nil) {
            duration = options.duration! / 1000
        }
        var mask = MCToast.MCToastRespond.default
        if (options.mask == true) {
            mask = MCToast.MCToastRespond.noRespond
        }
        MCToastConfig.shared.background.size = CGSize.init(width: 135, height: 120)
        if (options.position != nil) {
            var interval = Float(UIScreen.main.bounds.height * 0.25)
            var centerPoint: NSNumber = 0.0
            if (options.position == "top") {
                centerPoint = 0 - interval
            } else if (options.position == "center") {
                centerPoint = 0.0
            } else {
                centerPoint = NSNumber(interval)
            }
            MCToast.mc_text(options.title, offset: CGFloat(centerPoint.toFloat()), duration: CGFloat(duration.toFloat()), respond: mask)
        } else {
            var successImage = UIImage(named: "uni_uts_toast_success.png")
            var failureImage = UIImage(named: "uni_uts_toast_error.png")
            var bundleUrl = Bundle.main.url(forResource: "uni-prompt", withExtension: "bundle")
            if (bundleUrl != nil) {
                var bundle = Bundle(url: bundleUrl!)
                if (bundle != nil) {
                    var success_img = UIImage(named: "uni_uts_toast_success.png", in: bundle!, compatibleWith: nil)
                    if (success_img != nil) {
                        successImage = success_img
                    }
                    var failure_img = UIImage(named: "uni_uts_toast_error.png", in: bundle!, compatibleWith: nil)
                    if (failure_img != nil) {
                        failureImage = failure_img
                    }
                }
            }
            MCToastConfig.shared.icon.successImage = successImage
            MCToastConfig.shared.icon.failureImage = failureImage
            if (options.image != nil) {
                var imagePath = UTSiOS.getResourcePath(options.image!)
                var image = UIImage(contentsOfFile: imagePath)
                MCToast.showStatus(MCToast.MCToastType.success, text: options.title, iconImage: image, duration: CGFloat(duration.toFloat()), respond: mask)
            } else if (options.icon != nil) {
                if (options.icon == "success") {
                    MCToast.mc_success(options.title, duration: CGFloat(duration.toFloat()), respond: mask)
                } else if (options.icon == "error") {
                    MCToast.mc_failure(options.title, duration: CGFloat(duration.toFloat()), respond: mask)
                } else if (options.icon == "loading") {
                    MCToast.mc_loading(text: options.title, duration: CGFloat(duration.toFloat()), respond: mask)
                } else {
                    MCToast.mc_text(options.title, offset: 0, duration: CGFloat(duration.toFloat()), respond: mask)
                }
            } else {
                MCToast.mc_success(options.title, duration: CGFloat(duration.toFloat()), respond: mask)
            }
        }
        var res = ShowToastSuccess(UTSJSONObject([:]))
        options.success?(res)
        options.complete?(res)
    }
}
public func toHideToast() {
    MCToast.mc_remove()
}
public var showToast: ShowToast = {
(_ options: ShowToastOptions) -> Void in
toShowToast(options)
}
public var hideToast: HideToast = {
() -> Void in
toHideToast()
}
@objc(UTSSDKModulesDCloudUniPromptShowToastOptionsJSONObject)
@objcMembers
public class ShowToastOptionsJSONObject : NSObject {
    public var title: String!
    public var icon: Icon?
    public var image: String?
    public var mask: Bool = false
    public var duration: NSNumber?
    public var position: ShowToastPosition?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func showToastByJs(_ options: ShowToastOptionsJSONObject) -> Void {
    return showToast(ShowToastOptions(UTSJSONObject([
        "title": options.title,
        "icon": options.icon,
        "image": options.image,
        "mask": options.mask,
        "duration": options.duration,
        "position": options.position,
        "success": {
        (res: ShowToastSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: ShowToastFail) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func hideToastByJs() -> Void {
    return hideToast()
}
@objc(UTSSDKModulesDCloudUniPromptIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniPromptIndexSwift : NSObject {
    public static func s_showToastByJs(_ options: ShowToastOptionsJSONObject) -> Void {
        return showToastByJs(options)
    }
    public static func s_hideToastByJs() -> Void {
        return hideToastByJs()
    }
}
