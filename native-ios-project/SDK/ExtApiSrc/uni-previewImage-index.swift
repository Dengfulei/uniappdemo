import DCloudUTSFoundation
import DCloudUniappRuntime
import DCloudUTSExtAPI
public typealias PreviewImageErrorCode = NSNumber
public protocol IPreviewImageError : IUniError {
    var errCode: PreviewImageErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniPreviewImagePreviewImageSuccess)
@objcMembers
public class PreviewImageSuccess : NSObject, UTSObject {
    public var errSubject: String!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errSubject":
                    self.errSubject = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errSubject = obj["errSubject"] as! String
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias PreviewImageFail = IPreviewImageError
public typealias PreviewImageSuccessCallback = (_ callback: PreviewImageSuccess) -> Void
public typealias PreviewImageFailCallback = (_ callback: PreviewImageFail) -> Void
public typealias PreviewImageCompleteCallback = (_ callback: Any) -> Void
@objc(UTSSDKModulesDCloudUniPreviewImageLongPressActionsSuccessResult)
@objcMembers
public class LongPressActionsSuccessResult : NSObject, UTSObject {
    public var tapIndex: NSNumber!
    public var index: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tapIndex":
                    self.tapIndex = try! utsSubscriptCheckValue(newValue)
                case "index":
                    self.index = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tapIndex = obj["tapIndex"] as! NSNumber
        self.index = obj["index"] as! NSNumber
    }
}
public typealias LongPressActionsFailResult = IPreviewImageError
@objc(UTSSDKModulesDCloudUniPreviewImageLongPressActionsOptions)
@objcMembers
public class LongPressActionsOptions : NSObject, UTSObject {
    public var itemList: [String]!
    public var itemColor: String?
    public var success: ((_ result: LongPressActionsSuccessResult) -> Void)?
    public var fail: ((_ result: LongPressActionsFailResult) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "itemList":
                    self.itemList = try! utsSubscriptCheckValue(newValue)
                case "itemColor":
                    self.itemColor = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.itemList = obj["itemList"] as! [String]
        self.itemColor = obj["itemColor"] as! String?
        self.success = obj["success"] as! ((_ result: LongPressActionsSuccessResult) -> Void)?
        self.fail = obj["fail"] as! ((_ result: LongPressActionsFailResult) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniPreviewImagePreviewImageOptions)
@objcMembers
public class PreviewImageOptions : NSObject, UTSObject {
    public var current: Any?
    public var urls: Array<String>!
    public var showmenu: Bool = false
    public var indicator: String?
    public var loop: Bool = false
    public var longPressActions: LongPressActionsOptions?
    public var success: PreviewImageSuccessCallback?
    public var fail: PreviewImageFailCallback?
    public var complete: PreviewImageCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "current":
                    self.current = try! utsSubscriptCheckValueIfPresent(newValue)
                case "urls":
                    self.urls = try! utsSubscriptCheckValue(newValue)
                case "showmenu":
                    self.showmenu = try! utsSubscriptCheckValue(newValue)
                case "indicator":
                    self.indicator = try! utsSubscriptCheckValueIfPresent(newValue)
                case "loop":
                    self.loop = try! utsSubscriptCheckValue(newValue)
                case "longPressActions":
                    self.longPressActions = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.current = obj["current"] as! Any?
        self.urls = obj["urls"] as! Array<String>
        self.showmenu = (obj["showmenu"] as? Bool) ?? false
        self.indicator = obj["indicator"] as! String?
        self.loop = (obj["loop"] as? Bool) ?? false
        self.longPressActions = obj["longPressActions"] as! LongPressActionsOptions?
        self.success = obj["success"] as! PreviewImageSuccessCallback?
        self.fail = obj["fail"] as! PreviewImageFailCallback?
        self.complete = obj["complete"] as! PreviewImageCompleteCallback?
    }
}
public typealias ClosePreviewImage = (_ options: ClosePreviewImageOptions) -> Void
@objc(UTSSDKModulesDCloudUniPreviewImageClosePreviewImageSuccess)
@objcMembers
public class ClosePreviewImageSuccess : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias ClosePreviewImageFail = IPreviewImageError
public typealias ClosePreviewImageSuccessCallback = (_ callback: ClosePreviewImageSuccess) -> Void
public typealias ClosePreviewImageFailCallback = (_ callback: ClosePreviewImageFail) -> Void
public typealias ClosePreviewImageCompleteCallback = PreviewImageCompleteCallback
@objc(UTSSDKModulesDCloudUniPreviewImageClosePreviewImageOptions)
@objcMembers
public class ClosePreviewImageOptions : NSObject, UTSObject {
    public var success: ClosePreviewImageSuccessCallback?
    public var fail: ClosePreviewImageFailCallback?
    public var complete: ClosePreviewImageCompleteCallback?
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
        self.success = obj["success"] as! ClosePreviewImageSuccessCallback?
        self.fail = obj["fail"] as! ClosePreviewImageFailCallback?
        self.complete = obj["complete"] as! ClosePreviewImageCompleteCallback?
    }
}
public var UniErrorPreviewImage = "uni-previewImage"
public var PreviewImageUniErrors: Map<NSNumber, String> = Map([
    [
        1101001,
        "user cancel"
    ],
    [
        1001,
        "fail parameter error: parameter.urls should have at least 1 item"
    ],
    [
        1101003,
        "file not find"
    ],
    [
        1101004,
        "Failed to load resource"
    ],
    [
        1101005,
        "No Permission"
    ],
    [
        1101010,
        "unexpect error:please check previewImage.uvue is in page.json"
    ]
])
@objc(UTSSDKModulesDCloudUniPreviewImagePreviewImageErrorImpl)
@objcMembers
public class PreviewImageErrorImpl : UniError, IPreviewImageError {
    public init(_ errCode: PreviewImageErrorCode, _ uniErrorSubject: String){
        super.init()
        self.errSubject = uniErrorSubject
        self.errCode = errCode
        self.errMsg = PreviewImageUniErrors.get(errCode) ?? ""
    }
}
public func __previewImage(_ option: PreviewImageOptions) {
    if (option.urls.length == 0) {
        var error = PreviewImageErrorImpl(1001, UniErrorPreviewImage)
        option.fail?(error)
        option.complete?(error)
        return
    }
    DCloudUTSExtAPI.__$$once("__onPreviewLoad", {
    (spread_variadic: Any?...) -> Void in
    var _variadic = Array(spread_variadic)
    var object: UTSJSONObject = UTSJSONObject([
        "current": option.current,
        "urls": option.urls,
        "indicator": option.indicator,
        "loop": option.loop
    ])
    if (option.longPressActions != nil) {
        object["longPressActions"] = UTSJSONObject([
            "itemList": option.longPressActions!.itemList,
            "itemColor": option.longPressActions!.itemColor
        ])
    }
    DCloudUTSExtAPI.__$$emit("__onPreviewLoadCallback", object)
    })
    DCloudUTSExtAPI.__$$on("__UNIPREVIEWLONGPRESS", {
    (spread_variadic: Any?...) -> Void in
    var _variadic = Array(spread_variadic)
    var value = _variadic[0] as! UTSJSONObject
    if (option.longPressActions != nil) {
        var type = value["type"] as! String
        var tapIndex = value["tapIndex"] as! NSNumber
        var index = value["index"] as! NSNumber
        if (type == "success") {
            var success = LongPressActionsSuccessResult(UTSJSONObject([
                "tapIndex": tapIndex,
                "index": index
            ]))
            option.longPressActions?.success?(success)
            option.longPressActions?.complete?(success)
        } else {
            var fail: LongPressActionsFailResult = PreviewImageErrorImpl(1101001, UniErrorPreviewImage)
            option.longPressActions?.fail?(fail)
            option.longPressActions?.complete?(fail)
        }
    }
    })
    DCloudUTSExtAPI.openDialogPage(OpenDialogPageOptions(UTSJSONObject([
        "url": "uni:previewImage",
        "animationType": "fade-in",
        "success": {
        (_ _: OpenDialogPageSuccess) -> Void in
        var success = PreviewImageSuccess(UTSJSONObject([
            "errMsg": "ok",
            "errSubject": UniErrorPreviewImage
        ]))
        option.success?(success)
        option.complete?(success)
        },
        "fail": {
        (_ _: OpenDialogPageFail) -> Void in
        var error = PreviewImageErrorImpl(1101010, UniErrorPreviewImage)
        option.fail?(error)
        option.complete?(error)
        }
    ])))
}
public func __closePreviewImage(_ option: ClosePreviewImageOptions) {
    DCloudUTSExtAPI.__$$emit("__CLOSEPREVIEWIMAGE", nil)
    var callback = ClosePreviewImageSuccess(UTSJSONObject([
        "errMsg": "ok"
    ]))
    option.success?(callback)
    option.complete?(callback)
}
public func previewImage(_ option: PreviewImageOptions) {
    __previewImage(option)
}
public var closePreviewImage: ClosePreviewImage = {
(_ option: ClosePreviewImageOptions) -> Void in
__closePreviewImage(option)
}
@objc(UTSSDKModulesDCloudUniPreviewImageLongPressActionsOptionsJSONObject)
@objcMembers
public class LongPressActionsOptionsJSONObject : NSObject {
    public var itemList: [String]!
    public var itemColor: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPreviewImagePreviewImageOptionsJSONObject)
@objcMembers
public class PreviewImageOptionsJSONObject : NSObject {
    public var current: Any?
    public var urls: Array<String>!
    public var showmenu: Bool = false
    public var indicator: String?
    public var loop: Bool = false
    public var longPressActions: LongPressActionsOptionsJSONObject?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPreviewImageClosePreviewImageOptionsJSONObject)
@objcMembers
public class ClosePreviewImageOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: ClosePreviewImageCompleteCallback?
}
public func previewImageByJs(_ option: PreviewImageOptionsJSONObject) {
    var longPressActions = option.longPressActions
    return previewImage(PreviewImageOptions(UTSJSONObject([
        "current": option.current,
        "urls": option.urls,
        "showmenu": option.showmenu,
        "indicator": option.indicator,
        "loop": option.loop,
        "longPressActions": longPressActions != nil ? LongPressActionsOptions(UTSJSONObject([
            "itemList": longPressActions!.itemList,
            "itemColor": longPressActions!.itemColor,
            "success": {
            (result: LongPressActionsSuccessResult) -> Void in
            longPressActions!.success?(result)
            },
            "fail": {
            (result: LongPressActionsFailResult) -> Void in
            longPressActions!.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            longPressActions!.complete?(result)
            }
        ])) : nil,
        "success": {
        (callback: PreviewImageSuccess) -> Void in
        option.success?(callback)
        },
        "fail": {
        (callback: PreviewImageFail) -> Void in
        option.fail?(callback)
        },
        "complete": {
        (callback: Any) -> Void in
        option.complete?(callback)
        }
    ])))
}
public func closePreviewImageByJs(_ options: ClosePreviewImageOptionsJSONObject) -> Void {
    return closePreviewImage(ClosePreviewImageOptions(UTSJSONObject([
        "success": {
        (callback: ClosePreviewImageSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: ClosePreviewImageFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
@objc(UTSSDKModulesDCloudUniPreviewImageIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniPreviewImageIndexSwift : NSObject {
    public static func s_previewImageByJs(_ option: PreviewImageOptionsJSONObject) {
        return previewImageByJs(option)
    }
    public static func s_closePreviewImageByJs(_ options: ClosePreviewImageOptionsJSONObject) -> Void {
        return closePreviewImageByJs(options)
    }
}
