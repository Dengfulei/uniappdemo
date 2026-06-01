import DCloudUTSFoundation
import DCloudUniappRuntime
import DCloudUTSExtAPI
@objc(UTSSDKModulesDCloudUniShowLoadingShowLoadingSuccess)
@objcMembers
public class ShowLoadingSuccess : NSObject, UTSObject {
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
public typealias ShowLoadingFailErrorCode = NSNumber
public protocol ShowLoadingFail : IUniError {
    var errCode: ShowLoadingFailErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniShowLoadingShowLoadingFailImpl)
@objcMembers
public class ShowLoadingFailImpl : UniError, ShowLoadingFail {
    public override var errCode: ShowLoadingFailErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errMsg: String = "showLoading:fail cancel", _ errCode: ShowLoadingFailErrorCode = 4){
        super.init()
        self.errMsg = errMsg
        self.errCode = errCode
    }
    private var __errCode: ShowLoadingFailErrorCode!
}
public typealias ShowLoadingSuccessCallback = (_ res: ShowLoadingSuccess) -> Void
public typealias ShowLoadingFailCallback = (_ res: ShowLoadingFail) -> Void
public typealias ShowLoadingCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniShowLoadingShowLoadingOptions)
@objcMembers
public class ShowLoadingOptions : NSObject, UTSObject {
    public var title: String?
    public var mask: Bool = false
    public var iosSpinner: Bool = true
    public var success: ShowLoadingSuccessCallback?
    public var fail: ShowLoadingFailCallback?
    public var complete: ShowLoadingCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "mask":
                    self.mask = try! utsSubscriptCheckValue(newValue)
                case "iosSpinner":
                    self.iosSpinner = try! utsSubscriptCheckValue(newValue)
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
        self.mask = (obj["mask"] as? Bool) ?? false
        self.iosSpinner = (obj["iosSpinner"] as? Bool) ?? true
        self.success = obj["success"] as! ShowLoadingSuccessCallback?
        self.fail = obj["fail"] as! ShowLoadingFailCallback?
        self.complete = obj["complete"] as! ShowLoadingCompleteCallback?
    }
}
public typealias ShowLoading = (_ options: ShowLoadingOptions?) -> LoadingPage?
@objc(UTSSDKModulesDCloudUniShowLoadingHideLoadingSuccess)
@objcMembers
public class HideLoadingSuccess : NSObject, UTSObject {
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
public typealias HideLoadingFailErrorCode = NSNumber
public protocol HideLoadingFail : IUniError {
    var errCode: HideLoadingFailErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniShowLoadingHideLoadingFailImpl)
@objcMembers
public class HideLoadingFailImpl : UniError, HideLoadingFail {
    public override var errCode: HideLoadingFailErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errMsg: String = "hideLoading:fail cancel", _ errCode: HideLoadingFailErrorCode = 4){
        super.init()
        self.errMsg = errMsg
        self.errCode = errCode
    }
    private var __errCode: HideLoadingFailErrorCode!
}
public typealias HideLoadingSuccessCallback = (_ res: HideLoadingSuccess) -> Void
public typealias HideLoadingFailCallback = (_ res: HideLoadingFail) -> Void
public typealias HideLoadingCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniShowLoadingHideLoadingOptions)
@objcMembers
public class HideLoadingOptions : NSObject, UTSObject {
    public var loadingPage: LoadingPage?
    public var success: HideLoadingSuccessCallback?
    public var fail: HideLoadingFailCallback?
    public var complete: HideLoadingCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "loadingPage":
                    self.loadingPage = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.loadingPage = obj["loadingPage"] as! LoadingPage?
        self.success = obj["success"] as! HideLoadingSuccessCallback?
        self.fail = obj["fail"] as! HideLoadingFailCallback?
        self.complete = obj["complete"] as! HideLoadingCompleteCallback?
    }
}
public typealias HideLoading = (_ options: HideLoadingOptions?) -> Void
public typealias LoadingPage = UniPage
public var showLoading: ShowLoading = {
(_ options: ShowLoadingOptions?) -> LoadingPage? in
var uuid = """
\(Date.now())\(Math.floor(Math.random() * 1e7))
"""
var baseEventName = """
uni_loading_\(uuid)
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
var nextOptions: Any? = UTSJSONObject([:])
if (options != nil) {
    nextOptions = JSON.parse(JSON.stringify(options)!)
}
DCloudUTSExtAPI.__$$on(readyEventName, {
(_ spread_variadic: Any?...) -> Void in
var _variadic = Array(spread_variadic)
DCloudUTSExtAPI.__$$emit(optionsEventName, nextOptions)
})
DCloudUTSExtAPI.__$$on(successEventName, {
(_ spread_variadic: Any?...) -> Void in
var _variadic = Array(spread_variadic)
var inputParamStr = _variadic[0] as! String
var res = ShowLoadingSuccess(UTSJSONObject([:]))
options?.success?(res)
options?.complete?(res)
})
DCloudUTSExtAPI.__$$on(failEventName, {
(_ spread_variadic: Any?...) -> Void in
var _variadic = Array(spread_variadic)
var res = ShowLoadingFailImpl()
options?.fail?(res)
options?.complete?(res)
})
var openRet = DCloudUTSExtAPI.openDialogPage(OpenDialogPageOptions(UTSJSONObject([
    "url": """
uni:showLoading?readyEventName=\(readyEventName)&optionsEventName=\(optionsEventName)&successEventName=\(successEventName)&failEventName=\(failEventName)
""",
    "fail": {
    (_ err: OpenDialogPageFail) -> Void in
    var res = ShowLoadingFailImpl("""
showLoading failed, \(err.errMsg)
""")
    options?.fail?(res)
    options?.complete?(res)
    DCloudUTSExtAPI.__$$off(readyEventName, nil)
    DCloudUTSExtAPI.__$$off(successEventName, nil)
    DCloudUTSExtAPI.__$$off(failEventName, nil)
    }
])))
if (UTSiOS.instanceof(openRet, LoadingPage.self)) {
    return openRet as! LoadingPage
} else {
    var res = ShowLoadingFailImpl()
    options?.fail?(res)
    options?.complete?(res)
    return nil
}
}
public var hideLoading: HideLoading = {
(_ options: HideLoadingOptions?) -> Void in
var pages = getCurrentPages()
if (pages.length < 1) {
    var res = HideLoadingFailImpl()
    options?.fail?(res)
    options?.complete?(res)
    return
}
var currentPage = pages[pages.length - 1]
if (currentPage == nil) {
    var res = HideLoadingFailImpl()
    options?.fail?(res)
    options?.complete?(res)
    return
}
var dialogPages = currentPage.getDialogPages("systemDialog")
var shallClosePages: Array<UniPage> = []
for perPage in resolveUTSValueIterator(dialogPages){
    if (isSystemShowLoadingDialogPage(perPage)) {
        if (options?.loadingPage == nil) {
            shallClosePages.push(perPage)
        } else {
            if (perPage === options!.loadingPage!) {
                shallClosePages.push(perPage)
                break
            }
        }
    }
}
for perPage in resolveUTSValueIterator(shallClosePages){
    DCloudUTSExtAPI.closeDialogPage(CloseDialogPageOptions(UTSJSONObject([
        "dialogPage": perPage
    ])))
}
var res = HideLoadingSuccess(UTSJSONObject([:]))
options?.success?(res)
options?.complete?(res)
}
public func isSystemShowLoadingDialogPage(_ page: UniPage) -> Bool {
    return page.route == "uni:showLoading"
}
@objc(UTSSDKModulesDCloudUniShowLoadingShowLoadingOptionsJSONObject)
@objcMembers
public class ShowLoadingOptionsJSONObject : NSObject {
    public var title: String?
    public var mask: Bool = false
    public var iosSpinner: Bool = true
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniShowLoadingHideLoadingOptionsJSONObject)
@objcMembers
public class HideLoadingOptionsJSONObject : NSObject {
    public var loadingPage: LoadingPage?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func showLoadingByJs(_ options: ShowLoadingOptionsJSONObject?) -> LoadingPage? {
    return showLoading(options != nil ? ShowLoadingOptions(UTSJSONObject([
        "title": options!.title,
        "mask": options!.mask,
        "iosSpinner": options!.iosSpinner,
        "success": {
        (res: ShowLoadingSuccess) -> Void in
        options!.success?(res)
        },
        "fail": {
        (res: ShowLoadingFail) -> Void in
        options!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options!.complete?(res)
        }
    ])) : nil)
}
public func hideLoadingByJs(_ options: HideLoadingOptionsJSONObject?) -> Void {
    return hideLoading(options != nil ? HideLoadingOptions(UTSJSONObject([
        "loadingPage": options!.loadingPage,
        "success": {
        (res: HideLoadingSuccess) -> Void in
        options!.success?(res)
        },
        "fail": {
        (res: HideLoadingFail) -> Void in
        options!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options!.complete?(res)
        }
    ])) : nil)
}
@objc(UTSSDKModulesDCloudUniShowLoadingIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniShowLoadingIndexSwift : NSObject {
    public static func s_showLoadingByJs(_ options: ShowLoadingOptionsJSONObject?) -> LoadingPage? {
        return showLoadingByJs(options)
    }
    public static func s_hideLoadingByJs(_ options: HideLoadingOptionsJSONObject?) -> Void {
        return hideLoadingByJs(options)
    }
}
