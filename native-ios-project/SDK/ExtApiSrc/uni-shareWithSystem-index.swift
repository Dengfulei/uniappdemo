import DCloudUTSFoundation
import DCloudUniappRuntime
import Dispatch
import Foundation
import UIKit
import UniformTypeIdentifiers
@objc(UTSSDKModulesDCloudUniShareWithSystemShareWithSystemSuccess)
@objcMembers
public class ShareWithSystemSuccess : NSObject, UTSObject {
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
public typealias ShareWithSystemFail = IShareWithSystemFail
public protocol IShareWithSystemFail : IUniError {
    var errCode: ShareWithSystemErrorCode { get set }
}
public typealias ShareWithSystemErrorCode = NSNumber
public typealias ShareWithSystemSuccessCallback = (_ res: ShareWithSystemSuccess) -> Void
public typealias ShareWithSystemFailCallback = (_ res: ShareWithSystemFail) -> Void
public typealias ShareWithSystemCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniShareWithSystemShareWithSystemOptions)
@objcMembers
public class ShareWithSystemOptions : NSObject, UTSObject {
    public var type: String?
    public var summary: String?
    public var href: String?
    public var imageUrl: String?
    public var imagePaths: Array<String>?
    public var videoPaths: Array<String>?
    public var audioPaths: Array<String>?
    public var filePaths: Array<String>?
    public var success: ShareWithSystemSuccessCallback?
    public var fail: ShareWithSystemFailCallback?
    public var complete: ShareWithSystemCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
                case "summary":
                    self.summary = try! utsSubscriptCheckValueIfPresent(newValue)
                case "href":
                    self.href = try! utsSubscriptCheckValueIfPresent(newValue)
                case "imageUrl":
                    self.imageUrl = try! utsSubscriptCheckValueIfPresent(newValue)
                case "imagePaths":
                    self.imagePaths = try! utsSubscriptCheckValueIfPresent(newValue)
                case "videoPaths":
                    self.videoPaths = try! utsSubscriptCheckValueIfPresent(newValue)
                case "audioPaths":
                    self.audioPaths = try! utsSubscriptCheckValueIfPresent(newValue)
                case "filePaths":
                    self.filePaths = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.type = obj["type"] as! String?
        self.summary = obj["summary"] as! String?
        self.href = obj["href"] as! String?
        self.imageUrl = obj["imageUrl"] as! String?
        self.imagePaths = obj["imagePaths"] as! Array<String>?
        self.videoPaths = obj["videoPaths"] as! Array<String>?
        self.audioPaths = obj["audioPaths"] as! Array<String>?
        self.filePaths = obj["filePaths"] as! Array<String>?
        self.success = obj["success"] as! ShareWithSystemSuccessCallback?
        self.fail = obj["fail"] as! ShareWithSystemFailCallback?
        self.complete = obj["complete"] as! ShareWithSystemCallback?
    }
}
public typealias ShareWithSystem = (_ options: ShareWithSystemOptions) -> Void
public var ShareWithSystemUniErrorSubject = "uni-shareWithSystem"
public var ShareWithSystemUniErrors: Map<ShareWithSystemErrorCode, String> = Map([
    [
        1310600,
        "Cancel share"
    ],
    [
        1310601,
        "Shared content can not be empty"
    ],
    [
        1310602,
        "Failed to share"
    ],
    [
        1310603,
        "Failed to load image paths"
    ],
    [
        1310604,
        "Invalid herf"
    ],
    [
        1310605,
        "Invalid video paths"
    ],
    [
        1310606,
        "Invalid file paths"
    ],
    [
        1310607,
        "Invalid audio paths"
    ]
])
@objc(UTSSDKModulesDCloudUniShareWithSystemShareWithSystemFailImpl)
@objcMembers
public class ShareWithSystemFailImpl : UniError, IShareWithSystemFail {
    public init(_ errCode: ShareWithSystemErrorCode, _ errMsg: String?){
        super.init()
        self.errSubject = ShareWithSystemUniErrorSubject
        self.errCode = errCode
        var error = ShareWithSystemUniErrors.get(errCode) ?? ""
        if (errMsg != nil) {
            self.errMsg = error + ", the reason: " + errMsg!
        } else {
            self.errMsg = error
        }
    }
}
public var shareWithSystem: ShareWithSystem = {
(_ options: ShareWithSystemOptions) -> Void in
ShareManager.options = options
if (options.href == nil && options.imageUrl == nil && options.imagePaths == nil && options.summary == nil && options.videoPaths == nil && options.audioPaths == nil && options.filePaths == nil) {
    ShareManager.failedAction(1310601, nil)
    return
}
var items: Array<Any> = []
if (options.summary != nil) {
    items.push(options.summary!)
}
var dispatchGroup = DispatchGroup()
if (options.imageUrl != nil) {
    dispatchGroup.enter()
    UTSiOS.loadImage(options.imageUrl!, {
    (_ image: UIImage?, _ data: Data?) -> Void in
    if (image != nil && ShareManager.getValidPath(options.imageUrl!) != nil) {
        items.push(ShareManager.getValidPath(options.imageUrl!)!)
        dispatchGroup.leave()
    } else {
        var errMsg = "Invalid imageUrl: " + options.imageUrl!
        ShareManager.failedAction(1310603, errMsg)
    }
    })
}
if (options.imagePaths != nil && options.imagePaths!.count > 0) {
    var temp = "Invalid imagePaths: "
    var list: [String] = Array()
    var index: NSNumber = 0
    options.imagePaths!.forEach({
    (_ value, _ key) -> Void in
    dispatchGroup.enter()
    UTSiOS.loadImage(value, {
    (_ image: UIImage?, _ data: Data?) -> Void in
    index += 1
    if (image != nil && ShareManager.getValidPath(value) != nil) {
        items.push(ShareManager.getValidPath(value)!)
    } else {
        list.add(value)
        ShareManager.tempBreak = true
    }
    if (index == options.imagePaths!.count && ShareManager.tempBreak) {
        temp = temp + list.toString()
        ShareManager.failedAction(1310603, temp)
    }
    dispatchGroup.leave()
    })
    })
}
if (options.href != nil) {
    if (ShareManager.isValidHref(options.href!)) {
        var url = URL(string: options.href!)
        items.push(url!)
    } else {
        var errMsg = "Invalid href: " + options.href!
        ShareManager.failedAction(1310604, errMsg)
        return
    }
}
if (options.videoPaths != nil && options.videoPaths!.count > 0) {
    var temp = "Invalid videoPaths: "
    var list: [String] = Array()
    var tempBreak = false
    options.videoPaths!.forEach({
    (_ value, _ key) -> Void in
    if (ShareManager.isValidVideoFile(value) && ShareManager.getValidPath(value) != nil) {
        items.push(ShareManager.getValidPath(value)!)
    } else {
        list.add(value)
        tempBreak = true
    }
    })
    if (tempBreak) {
        temp = temp + list.toString()
        ShareManager.failedAction(1310605, temp)
        return
    }
}
if (options.audioPaths != nil && options.audioPaths!.count > 0) {
    var temp = "Invalid audioPaths: "
    var list: [String] = Array()
    var tempBreak = false
    options.audioPaths!.forEach({
    (_ value, _ key) -> Void in
    if (ShareManager.isValidAudioFile(value) && ShareManager.getValidPath(value) != nil) {
        items.push(ShareManager.getValidPath(value)!)
    } else {
        list.add(value)
        tempBreak = true
    }
    })
    if (tempBreak) {
        temp = temp + list.toString()
        ShareManager.failedAction(1310607, temp)
        return
    }
}
if (options.filePaths != nil && options.filePaths!.count > 0) {
    var temp = "Invalid filePaths: "
    var list: [String] = Array()
    var tempBreak = false
    options.filePaths!.forEach({
    (_ value, _ key) -> Void in
    if (ShareManager.isValidPath(value) && ShareManager.getValidPath(value) != nil) {
        items.push(ShareManager.getValidPath(value)!)
    } else {
        list.add(value)
        tempBreak = true
    }
    })
    if (tempBreak) {
        temp = temp + list.toString()
        ShareManager.failedAction(1310606, temp)
        return
    }
}
dispatchGroup.notify(queue: DispatchQueue.main, execute: {
() -> Void in
if (ShareManager.tempBreak) {
    ShareManager.tempBreak = false
    return
}
var activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
var completionWithItemsHandler: UIActivityViewController.CompletionWithItemsHandler = {
(_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ activityError: Error?) -> Void in
if (activityError != nil) {
    ShareManager.failedAction(1310602, activityError!.localizedDescription)
} else if (completed == true) {
    ShareManager.successAction()
} else {
    ShareManager.failedAction(1310600, nil)
}
}
activityVC.completionWithItemsHandler = completionWithItemsHandler
var isPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
if (isPad) {
    var popoverController = activityVC.popoverPresentationController
    if (popoverController != nil) {
        var sourceView = UTSiOS.getCurrentViewController().view
        if (sourceView != nil) {
            var sourceRect = CGRect(x: sourceView!.bounds.midX, y: sourceView!.bounds.midY, width: 0.0, height: 0.0)
            popoverController!.sourceView = sourceView
            popoverController!.sourceRect = sourceRect
            popoverController!.permittedArrowDirections = UIPopoverArrowDirection.any
        }
    }
}
if (UIApplication.shared.keyWindow?.rootViewController != nil) {
    UIApplication.shared.keyWindow?.rootViewController?.present(activityVC, animated: true)
} else {
    UTSiOS.getCurrentViewController().present(activityVC, animated: true)
}
})
}
@objc(UTSSDKModulesDCloudUniShareWithSystemShareManager)
@objcMembers
public class ShareManager : NSObject {
    public static var options: ShareWithSystemOptions?
    public static var tempBreak = false
    public static func failedAction(_ errCode: NSNumber, _ errMsg: String?) {
        var err = ShareWithSystemFailImpl(errCode, errMsg)
        self.options?.fail?(err)
        self.options?.complete?(err)
    }
    public static func successAction() {
        var success = ShareWithSystemSuccess()
        self.options?.success?(success)
        self.options?.complete?(success)
    }
    public static func isValidHref(_ href: String?) -> Bool {
        if (href == nil) {
            return false
        }
        var url = URL(string: href!)
        if (url == nil || url?.scheme == nil || url?.host == nil) {
            return false
        }
        if ([
            "http",
            "https"
        ].contains(url?.scheme?.lowercased())) {
            return true
        }
        return false
    }
    public static func isValidPath(_ path: String) -> Bool {
        var temp = path
        if (path.startsWith("file://")) {
            temp = path.substring(7)
        } else if (path.startsWith("/var/") == false) {
            temp = UTSiOS.getResourcePath(path)
        }
        var url = URL(fileURLWithPath: temp)
        if (FileManager.default.fileExists(atPath: url.path)) {
            return true
        }
        return false
    }
    public static func getValidPath(_ path: String) -> URL? {
        var temp = path
        if (path.startsWith("file://")) {
            temp = path.substring(7)
        } else if (path.startsWith("/var/") == false) {
            temp = UTSiOS.getResourcePath(path)
        }
        var url = URL(fileURLWithPath: temp)
        if (FileManager.default.fileExists(atPath: url.path)) {
            return url
        }
        return nil
    }
    public static func isValidVideoFile(_ path: String) -> Bool {
        if (ShareManager.isValidPath(path)) {
            var url = ShareManager.getValidPath(path)
            if (url == nil) {
                return false
            }
            if #available(iOS 14.0, *) {
                do {
                    var fileType = try url?.resourceValues(forKeys: [
                        URLResourceKey.contentTypeKey
                    ]).contentType
                    if (fileType != nil) {
                        if (fileType!.conforms(to: UTType.movie) || fileType!.conforms(to: UTType.video)) {
                            return true
                        }
                    }
                } catch let e {
                    var e = UTSError(e)
                    console.error(e)
                }
            } else {
                var fileExtension = url?.pathExtension.lowercased()
                var mediaExtensions = [
                    "mp4",
                    "mov",
                    "avi",
                    "mkv",
                    "flv",
                    "webm",
                    "3gp",
                    "3g2",
                    "wmv",
                    "mpg",
                    "mpeg",
                    "m4v",
                    "f4v",
                    "f4p",
                    "f4a",
                    "f4b",
                    "ts",
                    "mts",
                    "m2ts",
                    "vob",
                    "rm",
                    "rmvb",
                    "asf",
                    "swf",
                    "divx",
                    "xvid",
                    "dv",
                    "ogv",
                    "ogm",
                    "mxf",
                    "roq",
                    "nsv"
                ] as! Array<String>
                return mediaExtensions.contains(fileExtension ?? "")
            }
        }
        return false
    }
    public static func isValidAudioFile(_ path: String) -> Bool {
        if (ShareManager.isValidPath(path)) {
            var url = ShareManager.getValidPath(path)
            if (url == nil) {
                return false
            }
            if #available(iOS 14.0, *) {
                do {
                    var fileType = try url?.resourceValues(forKeys: [
                        URLResourceKey.contentTypeKey
                    ]).contentType
                    if (fileType != nil) {
                        if (fileType!.conforms(to: UTType.movie) || fileType!.conforms(to: UTType.audio)) {
                            return true
                        }
                    }
                } catch let e {
                    var e = UTSError(e)
                    console.error(e)
                }
            } else {
                var fileExtension = url?.pathExtension.lowercased()
                var mediaExtensions = [
                    "mp3",
                    "aac",
                    "wav",
                    "flac",
                    "alac",
                    "wma",
                    "m4a",
                    "ogg",
                    "opus",
                    "amr",
                    "aiff",
                    "aif",
                    "aifc",
                    "pcm",
                    "au",
                    "ac3",
                    "eac3",
                    "caf",
                    "dts",
                    "mka"
                ] as! Array<String>
                return mediaExtensions.contains(fileExtension ?? "")
            }
        }
        return false
    }
}
@objc(UTSSDKModulesDCloudUniShareWithSystemShareWithSystemOptionsJSONObject)
@objcMembers
public class ShareWithSystemOptionsJSONObject : NSObject {
    public var type: String?
    public var summary: String?
    public var href: String?
    public var imageUrl: String?
    public var imagePaths: Array<String>?
    public var videoPaths: Array<String>?
    public var audioPaths: Array<String>?
    public var filePaths: Array<String>?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func shareWithSystemByJs(_ options: ShareWithSystemOptionsJSONObject) -> Void {
    return shareWithSystem(ShareWithSystemOptions(UTSJSONObject([
        "type": options.type,
        "summary": options.summary,
        "href": options.href,
        "imageUrl": options.imageUrl,
        "imagePaths": options.imagePaths,
        "videoPaths": options.videoPaths,
        "audioPaths": options.audioPaths,
        "filePaths": options.filePaths,
        "success": {
        (res: ShareWithSystemSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: ShareWithSystemFail) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniShareWithSystemIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniShareWithSystemIndexSwift : NSObject {
    public static func s_shareWithSystemByJs(_ options: ShareWithSystemOptionsJSONObject) -> Void {
        return shareWithSystemByJs(options)
    }
}
