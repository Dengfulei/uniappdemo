import DCloudUTSFoundation
import DCloudUniappRuntime
import DCloudUTSExtAPI
@objc(UTSSDKModulesDCloudUniActionSheetPopover)
@objcMembers
public class Popover : NSObject, UTSObject {
    public var top: NSNumber!
    public var left: NSNumber!
    public var width: NSNumber!
    public var height: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "top":
                    self.top = try! utsSubscriptCheckValue(newValue)
                case "left":
                    self.left = try! utsSubscriptCheckValue(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValue(newValue)
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
        self.top = obj["top"] as! NSNumber
        self.left = obj["left"] as! NSNumber
        self.width = obj["width"] as! NSNumber
        self.height = obj["height"] as! NSNumber
    }
}
public typealias ShowActionSheetErrorCode = NSNumber
public protocol ShowActionSheetSuccess {
    var errMsg: String { get set }
    var tapIndex: NSNumber { get set }
}
public typealias ShowActionSheetSuccessCallback = (_ result: ShowActionSheetSuccess) -> Void
public protocol ShowActionSheetFail : IUniError {
    var errCode: ShowActionSheetErrorCode { get set }
}
public typealias ShowActionSheetFailCallback = (_ result: ShowActionSheetFail) -> Void
public typealias ShowActionSheetComplete = Any
public typealias ShowActionSheetCompleteCallback = (_ result: ShowActionSheetComplete) -> Void
@objc(UTSSDKModulesDCloudUniActionSheetShowActionSheetOptions)
@objcMembers
public class ShowActionSheetOptions : NSObject, UTSObject {
    public var title: String?
    public var alertText: String?
    public var itemList: [String]!
    public var itemColor: String?
    public var popover: Popover?
    public var titleColor: String?
    public var cancelText: String?
    public var cancelColor: String?
    public var backgroundColor: String?
    public var success: ShowActionSheetSuccessCallback?
    public var fail: ShowActionSheetFailCallback?
    public var complete: ShowActionSheetCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "alertText":
                    self.alertText = try! utsSubscriptCheckValueIfPresent(newValue)
                case "itemList":
                    self.itemList = try! utsSubscriptCheckValue(newValue)
                case "itemColor":
                    self.itemColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "popover":
                    self.popover = try! utsSubscriptCheckValueIfPresent(newValue)
                case "titleColor":
                    self.titleColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "cancelText":
                    self.cancelText = try! utsSubscriptCheckValueIfPresent(newValue)
                case "cancelColor":
                    self.cancelColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "backgroundColor":
                    self.backgroundColor = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.title = obj["title"] as! String?
        self.alertText = obj["alertText"] as! String?
        self.itemList = obj["itemList"] as! [String]
        self.itemColor = obj["itemColor"] as! String?
        self.popover = obj["popover"] as! Popover?
        self.titleColor = obj["titleColor"] as! String?
        self.cancelText = obj["cancelText"] as! String?
        self.cancelColor = obj["cancelColor"] as! String?
        self.backgroundColor = obj["backgroundColor"] as! String?
        self.success = obj["success"] as! ShowActionSheetSuccessCallback?
        self.fail = obj["fail"] as! ShowActionSheetFailCallback?
        self.complete = obj["complete"] as! ShowActionSheetCompleteCallback?
    }
}
public typealias ShowActionSheet = (_ options: ShowActionSheetOptions) -> Void
public protocol Uni {
    func showActionSheet(_ options: ShowActionSheetOptions)
    func hideActionSheet()
}
@objc(UTSSDKModulesDCloudUniActionSheetShowActionSheetSuccessImpl)
@objcMembers
public class ShowActionSheetSuccessImpl : NSObject, ShowActionSheetSuccess {
    public var tapIndex: NSNumber
    public var errMsg: String
    public init(_ tapIndex: NSNumber, _ errMsg: String = "showActionSheet:ok"){
        self.errMsg = errMsg
        self.tapIndex = tapIndex
    }
}
@objc(UTSSDKModulesDCloudUniActionSheetShowActionSheetFailImpl)
@objcMembers
public class ShowActionSheetFailImpl : UniError, ShowActionSheetFail {
    public override var errCode: ShowActionSheetErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errMsg: String = "showActionSheet:fail cancel", _ errCode: ShowActionSheetErrorCode = 4){
        super.init()
        self.errMsg = errMsg
        self.errCode = errCode
    }
    private var __errCode: ShowActionSheetErrorCode!
}
public typealias HideActionSheet = () -> Void
public var showActionSheet: ShowActionSheet = {
(_ options: ShowActionSheetOptions) -> Void in
var uuid = """
\(Date.now())\(Math.floor(Math.random() * 1e7))
"""
var baseEventName = """
uni_action_sheet_\(uuid)
"""
var readyEventName = """
\(baseEventName)_ready
"""
var optionsEventName = """
\(baseEventName)_options
"""
var successEventName = """
\(baseEventName)_success
"""
var failEventName = """
\(baseEventName)_fail
"""
DCloudUTSExtAPI.__$$on(readyEventName, {
(_ spread_variadic: Any?...) -> Void in
var _variadic = Array(spread_variadic)
DCloudUTSExtAPI.__$$emit(optionsEventName, JSON.parse(JSON.stringify(options)!))
})
DCloudUTSExtAPI.__$$on(successEventName, {
(_ spread_variadic: Any?...) -> Void in
var _variadic = Array(spread_variadic)
var index = _variadic[0] as! NSNumber
var res = ShowActionSheetSuccessImpl(index)
options.success?(res)
options.complete?(res)
})
DCloudUTSExtAPI.__$$on(failEventName, {
(_ spread_variadic: Any?...) -> Void in
var _variadic = Array(spread_variadic)
var res = ShowActionSheetFailImpl()
options.fail?(res)
options.complete?(res)
})
DCloudUTSExtAPI.openDialogPage(OpenDialogPageOptions(UTSJSONObject([
    "url": """
uni:actionSheet?readyEventName=\(readyEventName)&optionsEventName=\(optionsEventName)&successEventName=\(successEventName)&failEventName=\(failEventName)
""",
    "fail": {
    (_ err: OpenDialogPageFail) -> Void in
    var res = ShowActionSheetFailImpl("""
showActionSheet failed, \(err.errMsg)
""")
    options.fail?(res)
    options.complete?(res)
    DCloudUTSExtAPI.__$$off(readyEventName, nil)
    DCloudUTSExtAPI.__$$off(successEventName, nil)
    DCloudUTSExtAPI.__$$off(failEventName, nil)
    }
])))
}
public var SYSTEM_DIALOG_ACTION_SHEET_PAGE_PATH = "uni:actionSheet"
public var hideActionSheet = {
() -> Void in
var pages = getCurrentPages()
var currentPage = pages[pages.length - 1]
if (currentPage == nil) {
    return
}
var systemDialogPages = currentPage.__$$getSystemDialogPages()
systemDialogPages.forEach({
(_ page) -> Void in
if (page.route.startsWith(SYSTEM_DIALOG_ACTION_SHEET_PAGE_PATH)) {
    DCloudUTSExtAPI.closeDialogPage(CloseDialogPageOptions(UTSJSONObject([
        "dialogPage": page
    ])))
}
})
}
@objc(UTSSDKModulesDCloudUniActionSheetShowActionSheetOptionsJSONObject)
@objcMembers
public class ShowActionSheetOptionsJSONObject : NSObject {
    public var title: String?
    public var alertText: String?
    public var itemList: [String]!
    public var itemColor: String?
    public var popover: Popover?
    public var titleColor: String?
    public var cancelText: String?
    public var cancelColor: String?
    public var backgroundColor: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniActionSheetShowActionSheetSuccessImplByJs)
@objcMembers
public class ShowActionSheetSuccessImplByJs : ShowActionSheetSuccessImpl {
}
@objc(UTSSDKModulesDCloudUniActionSheetShowActionSheetFailImplByJs)
@objcMembers
public class ShowActionSheetFailImplByJs : ShowActionSheetFailImpl {
}
public func showActionSheetByJs(_ options: ShowActionSheetOptionsJSONObject) -> Void {
    return showActionSheet(ShowActionSheetOptions(UTSJSONObject([
        "title": options.title,
        "alertText": options.alertText,
        "itemList": options.itemList,
        "itemColor": options.itemColor,
        "popover": options.popover,
        "titleColor": options.titleColor,
        "cancelText": options.cancelText,
        "cancelColor": options.cancelColor,
        "backgroundColor": options.backgroundColor,
        "success": {
        (result: ShowActionSheetSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: ShowActionSheetFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: ShowActionSheetComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func hideActionSheetByJs() -> Void {
    return hideActionSheet()
}
@objc(UTSSDKModulesDCloudUniActionSheetIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniActionSheetIndexSwift : NSObject {
    public static func s_showActionSheetByJs(_ options: ShowActionSheetOptionsJSONObject) -> Void {
        return showActionSheetByJs(options)
    }
    public static func s_hideActionSheetByJs() -> Void {
        return hideActionSheetByJs()
    }
}
