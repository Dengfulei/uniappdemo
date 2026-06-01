import DCloudUTSFoundation
import DCloudUniappRuntime
import DCloudUTSExtAPI
@objc(UTSSDKModulesDCloudUniModalUniShowModalResult)
@objcMembers
public class UniShowModalResult : NSObject, UTSObject {
    public var content: String?
    public var cancel: Bool = false
    public var confirm: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "content":
                    self.content = try! utsSubscriptCheckValueIfPresent(newValue)
                case "cancel":
                    self.cancel = try! utsSubscriptCheckValue(newValue)
                case "confirm":
                    self.confirm = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.content = obj["content"] as! String?
        self.cancel = obj["cancel"] as! Bool
        self.confirm = obj["confirm"] as! Bool
    }
}
public typealias ShowModalResult = UniShowModalResult
public typealias ShowModalErrorCode = NSNumber
public protocol UniShowModalFail : IUniError {
    var errCode: ShowModalErrorCode { get set }
}
public typealias ShowModalFail = UniShowModalFail
@objc(UTSSDKModulesDCloudUniModalShowModalFailImpl)
@objcMembers
public class ShowModalFailImpl : UniError, ShowModalFail {
    public override var errCode: ShowModalErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errMsg: String = "showModal:fail cancel", _ errCode: ShowModalErrorCode = 4){
        super.init()
        self.errMsg = errMsg
        self.errCode = errCode
    }
    private var __errCode: ShowModalErrorCode!
}
public typealias UniShowModalFailCallback = (_ result: ShowModalFail) -> Void
public typealias UniShowModalSuccessCallback = (_ result: ShowModalResult) -> Void
public typealias UniShowModalCompleteCallback = (_ result: Any) -> Void
@objc(UTSSDKModulesDCloudUniModalShowModalOptions)
@objcMembers
public class ShowModalOptions : NSObject, UTSObject {
    public var title: String?
    public var content: String?
    public var showCancel: Bool = true
    public var cancelText: String?
    public var cancelColor: String?
    public var confirmText: String?
    public var confirmColor: String?
    public var editable: Bool = false
    public var placeholderText: String?
    public var success: UniShowModalSuccessCallback?
    public var fail: UniShowModalFailCallback?
    public var complete: UniShowModalCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "content":
                    self.content = try! utsSubscriptCheckValueIfPresent(newValue)
                case "showCancel":
                    self.showCancel = try! utsSubscriptCheckValue(newValue)
                case "cancelText":
                    self.cancelText = try! utsSubscriptCheckValueIfPresent(newValue)
                case "cancelColor":
                    self.cancelColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "confirmText":
                    self.confirmText = try! utsSubscriptCheckValueIfPresent(newValue)
                case "confirmColor":
                    self.confirmColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "editable":
                    self.editable = try! utsSubscriptCheckValue(newValue)
                case "placeholderText":
                    self.placeholderText = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.content = obj["content"] as! String?
        self.showCancel = (obj["showCancel"] as? Bool) ?? true
        self.cancelText = obj["cancelText"] as! String?
        self.cancelColor = obj["cancelColor"] as! String?
        self.confirmText = obj["confirmText"] as! String?
        self.confirmColor = obj["confirmColor"] as! String?
        self.editable = (obj["editable"] as? Bool) ?? false
        self.placeholderText = obj["placeholderText"] as! String?
        self.success = obj["success"] as! UniShowModalSuccessCallback?
        self.fail = obj["fail"] as! UniShowModalFailCallback?
        self.complete = obj["complete"] as! UniShowModalCompleteCallback?
    }
}
public typealias ShowModal = (_ options: ShowModalOptions) -> ModalPage?
public typealias ModalPage = UniPage
@objc(UTSSDKModulesDCloudUniModalUniHideModalResult)
@objcMembers
public class UniHideModalResult : NSObject, UTSObject {
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
public typealias HideModalResult = UniHideModalResult
public typealias HideModalErrorCode = NSNumber
public protocol UniHideModalFail : IUniError {
    var errCode: HideModalErrorCode { get set }
}
public typealias HideModalFail = UniHideModalFail
@objc(UTSSDKModulesDCloudUniModalHideModalFailImpl)
@objcMembers
public class HideModalFailImpl : UniError, HideModalFail {
    public override var errCode: HideModalErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errMsg: String = "hideModal:fail cancel", _ errCode: HideModalErrorCode = 4){
        super.init()
        self.errMsg = errMsg
        self.errCode = errCode
    }
    private var __errCode: HideModalErrorCode!
}
public typealias UniHideModalFailCallback = (_ result: HideModalFail) -> Void
public typealias UniHideModalSuccessCallback = (_ result: HideModalResult) -> Void
public typealias UniHideModalCompleteCallback = (_ result: Any) -> Void
@objc(UTSSDKModulesDCloudUniModalHideModalOptions)
@objcMembers
public class HideModalOptions : NSObject, UTSObject {
    public var modalPage: ModalPage?
    public var success: UniHideModalSuccessCallback?
    public var fail: UniHideModalFailCallback?
    public var complete: UniHideModalCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "modalPage":
                    self.modalPage = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.modalPage = obj["modalPage"] as! ModalPage?
        self.success = obj["success"] as! UniHideModalSuccessCallback?
        self.fail = obj["fail"] as! UniHideModalFailCallback?
        self.complete = obj["complete"] as! UniHideModalCompleteCallback?
    }
}
public typealias HideModal = (_ options: HideModalOptions?) -> Void
public var showModal: ShowModal = {
(_ options: ShowModalOptions) -> ModalPage? in
var uuid = """
\(Date.now())\(Math.floor(Math.random() * 1e7))
"""
var baseEventName = """
uni_modal_\(uuid)
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
var inputParamStr = _variadic[0] as! String
var inputParam = JSON.parseObject(inputParamStr)
var res = ShowModalResult(UTSJSONObject([
    "cancel": inputParam!.getBoolean("cancel")!,
    "confirm": inputParam!.getBoolean("confirm")!,
    "content": inputParam!.getString("content")
]))
options.success?(res)
options.complete?(res)
})
DCloudUTSExtAPI.__$$on(failEventName, {
(_ spread_variadic: Any?...) -> Void in
var _variadic = Array(spread_variadic)
var res = ShowModalFailImpl()
options.fail?(res)
options.complete?(res)
})
var openRet = DCloudUTSExtAPI.openDialogPage(OpenDialogPageOptions(UTSJSONObject([
    "url": """
uni:uniModal?readyEventName=\(readyEventName)&optionsEventName=\(optionsEventName)&successEventName=\(successEventName)&failEventName=\(failEventName)
""",
    "fail": {
    (_ err: OpenDialogPageFail) -> Void in
    var res = ShowModalFailImpl("""
showModal failed, \(err.errMsg)
""")
    options.fail?(res)
    options.complete?(res)
    DCloudUTSExtAPI.__$$off(readyEventName, nil)
    DCloudUTSExtAPI.__$$off(successEventName, nil)
    DCloudUTSExtAPI.__$$off(failEventName, nil)
    }
])))
if (UTSiOS.instanceof(openRet, ModalPage.self)) {
    return openRet as! ModalPage
} else {
    var res = ShowModalFailImpl()
    options.fail?(res)
    options.complete?(res)
    return nil
}
}
public var hideModal: HideModal = {
(_ options: HideModalOptions?) -> Void in
var pages = getCurrentPages()
if (pages.length < 1) {
    var res = HideModalFailImpl()
    options?.fail?(res)
    options?.complete?(res)
    return
}
var currentPage = pages[pages.length - 1]
if (currentPage == nil) {
    var res = HideModalFailImpl()
    options?.fail?(res)
    options?.complete?(res)
    return
}
var dialogPages = currentPage.getDialogPages("systemDialog")
var shallClosePages: Array<UniPage> = []
for perPage in resolveUTSValueIterator(dialogPages){
    if (isSystemModalDialogPage(perPage)) {
        if (options?.modalPage == nil) {
            shallClosePages.push(perPage)
        } else {
            if (perPage === options!.modalPage!) {
                shallClosePages.push(perPage)
                break
            }
        }
    }
}
for perPage in resolveUTSValueIterator(shallClosePages){
    if (perPage.options["successEventName"] != nil) {
        var ret: UTSJSONObject = UTSJSONObject([
            "cancel": false,
            "confirm": false
        ])
        DCloudUTSExtAPI.__$$emit(perPage.options["successEventName"]! as! String, JSON.stringify(ret))
        DCloudUTSExtAPI.closeDialogPage(CloseDialogPageOptions(UTSJSONObject([
            "dialogPage": perPage
        ])))
    }
}
var res = HideModalResult(UTSJSONObject([:]))
options?.success?(res)
options?.complete?(res)
}
public func isSystemModalDialogPage(_ page: UniPage) -> Bool {
    return page.route == "uni:uniModal"
}
@objc(UTSSDKModulesDCloudUniModalShowModalOptionsJSONObject)
@objcMembers
public class ShowModalOptionsJSONObject : NSObject {
    public var title: String?
    public var content: String?
    public var showCancel: Bool = true
    public var cancelText: String?
    public var cancelColor: String?
    public var confirmText: String?
    public var confirmColor: String?
    public var editable: Bool = false
    public var placeholderText: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniModalHideModalOptionsJSONObject)
@objcMembers
public class HideModalOptionsJSONObject : NSObject {
    public var modalPage: ModalPage?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func showModalByJs(_ options: ShowModalOptionsJSONObject) -> ModalPage? {
    return showModal(ShowModalOptions(UTSJSONObject([
        "title": options.title,
        "content": options.content,
        "showCancel": options.showCancel,
        "cancelText": options.cancelText,
        "cancelColor": options.cancelColor,
        "confirmText": options.confirmText,
        "confirmColor": options.confirmColor,
        "editable": options.editable,
        "placeholderText": options.placeholderText,
        "success": {
        (result: ShowModalResult) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: ShowModalFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: Any) -> Void in
        options.complete?(result)
        }
    ])))
}
public func hideModalByJs(_ options: HideModalOptionsJSONObject?) -> Void {
    return hideModal(options != nil ? HideModalOptions(UTSJSONObject([
        "modalPage": options!.modalPage,
        "success": {
        (result: HideModalResult) -> Void in
        options!.success?(result)
        },
        "fail": {
        (result: HideModalFail) -> Void in
        options!.fail?(result)
        },
        "complete": {
        (result: Any) -> Void in
        options!.complete?(result)
        }
    ])) : nil)
}
@objc(UTSSDKModulesDCloudUniModalIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniModalIndexSwift : NSObject {
    public static func s_showModalByJs(_ options: ShowModalOptionsJSONObject) -> ModalPage? {
        return showModalByJs(options)
    }
    public static func s_hideModalByJs(_ options: HideModalOptionsJSONObject?) -> Void {
        return hideModalByJs(options)
    }
}
