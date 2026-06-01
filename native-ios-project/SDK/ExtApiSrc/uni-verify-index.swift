import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
@_implementationOnly import GeYanSdk
import UIKit
import DCloudUTSExtAPI
public typealias GetUniverifyManager = () -> UniverifyManager
public typealias GetUniVerifyManager = () -> UniVerifyManager
public protocol UniVerifyManager : UniverifyManager {
}
public protocol UniverifyManager {
    func preLogin(_ options: UniVerifyManagerPreLoginOptions)
    func login(_ options: UniVerifyManagerLoginOptions)
    func customLogin(_ options: UniVerifyManagerCustomLoginOptions)
    func close()
    func isPreLoginValid() -> Bool
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerPreLoginOptions)
@objcMembers
public class UniVerifyManagerPreLoginOptions : NSObject, UTSObject {
    public var success: UniVerifyManagerPreLoginSuccessCallback?
    public var fail: UniVerifyManagerPreLoginFailCallback?
    public var complete: UniVerifyManagerPreLoginCompleteCallback?
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
        self.success = obj["success"] as! UniVerifyManagerPreLoginSuccessCallback?
        self.fail = obj["fail"] as! UniVerifyManagerPreLoginFailCallback?
        self.complete = obj["complete"] as! UniVerifyManagerPreLoginCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerLoginOptions)
@objcMembers
public class UniVerifyManagerLoginOptions : NSObject, UTSObject {
    public var uniVerifyStyle: UniVerifyManagerLoginStyle?
    public var univerifyStyle: UniVerifyManagerLoginStyle?
    public var success: UniVerifyManagerLoginSuccessCallback?
    public var fail: UniVerifyManagerLoginFailCallback?
    public var complete: UniVerifyManagerLoginCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "uniVerifyStyle":
                    self.uniVerifyStyle = try! utsSubscriptCheckValueIfPresent(newValue)
                case "univerifyStyle":
                    self.univerifyStyle = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.uniVerifyStyle = obj["uniVerifyStyle"] as! UniVerifyManagerLoginStyle?
        self.univerifyStyle = obj["univerifyStyle"] as! UniVerifyManagerLoginStyle?
        self.success = obj["success"] as! UniVerifyManagerLoginSuccessCallback?
        self.fail = obj["fail"] as! UniVerifyManagerLoginFailCallback?
        self.complete = obj["complete"] as! UniVerifyManagerLoginCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerCustomLoginOptions)
@objcMembers
public class UniVerifyManagerCustomLoginOptions : NSObject, UTSObject {
    public var numberTextElement: UniElement!
    public var sloganTextElement: UniElement!
    public var loginButtonElement: UniElement!
    public var privacyCheckBoxElement: UniElement!
    public var privacyTextElement: UniElement!
    public var success: UniVerifyManagerLoginSuccessCallback?
    public var fail: UniVerifyManagerLoginFailCallback?
    public var complete: UniVerifyManagerLoginCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "numberTextElement":
                    self.numberTextElement = try! utsSubscriptCheckValue(newValue)
                case "sloganTextElement":
                    self.sloganTextElement = try! utsSubscriptCheckValue(newValue)
                case "loginButtonElement":
                    self.loginButtonElement = try! utsSubscriptCheckValue(newValue)
                case "privacyCheckBoxElement":
                    self.privacyCheckBoxElement = try! utsSubscriptCheckValue(newValue)
                case "privacyTextElement":
                    self.privacyTextElement = try! utsSubscriptCheckValue(newValue)
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
        self.numberTextElement = obj["numberTextElement"] as! UniElement
        self.sloganTextElement = obj["sloganTextElement"] as! UniElement
        self.loginButtonElement = obj["loginButtonElement"] as! UniElement
        self.privacyCheckBoxElement = obj["privacyCheckBoxElement"] as! UniElement
        self.privacyTextElement = obj["privacyTextElement"] as! UniElement
        self.success = obj["success"] as! UniVerifyManagerLoginSuccessCallback?
        self.fail = obj["fail"] as! UniVerifyManagerLoginFailCallback?
        self.complete = obj["complete"] as! UniVerifyManagerLoginCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerLoginStyle)
@objcMembers
public class UniVerifyManagerLoginStyle : NSObject, UTSObject {
    public var fullScreen: Bool = false
    public var logoPath: String?
    public var backgroundColor: String?
    public var loginBtnText: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fullScreen":
                    self.fullScreen = try! utsSubscriptCheckValue(newValue)
                case "logoPath":
                    self.logoPath = try! utsSubscriptCheckValueIfPresent(newValue)
                case "backgroundColor":
                    self.backgroundColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "loginBtnText":
                    self.loginBtnText = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.fullScreen = (obj["fullScreen"] as? Bool) ?? false
        self.logoPath = obj["logoPath"] as! String?
        self.backgroundColor = obj["backgroundColor"] as! String?
        self.loginBtnText = obj["loginBtnText"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerPreLoginSuccess)
@objcMembers
public class UniVerifyManagerPreLoginSuccess : NSObject, UTSObject {
    public var number: String!
    public var slogan: String!
    public var privacyName: String!
    public var privacyUrl: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "number":
                    self.number = try! utsSubscriptCheckValue(newValue)
                case "slogan":
                    self.slogan = try! utsSubscriptCheckValue(newValue)
                case "privacyName":
                    self.privacyName = try! utsSubscriptCheckValue(newValue)
                case "privacyUrl":
                    self.privacyUrl = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.number = obj["number"] as! String
        self.slogan = obj["slogan"] as! String
        self.privacyName = obj["privacyName"] as! String
        self.privacyUrl = obj["privacyUrl"] as! String
    }
}
public typealias UniVerifyManagerPreLoginSuccessCallback = (_ res: UniVerifyManagerPreLoginSuccess) -> Void
public protocol UniVerifyManagerPreLoginFail : IUniError {
    var errCode: UniVerifyManagerErrorCode { get set }
}
public typealias UniVerifyManagerPreLoginFailCallback = (_ err: UniVerifyManagerPreLoginFail) -> Void
public typealias UniVerifyManagerPreLoginComplete = Any
public typealias UniVerifyManagerPreLoginCompleteCallback = (_ res: UniVerifyManagerPreLoginComplete) -> Void
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerLoginSuccess)
@objcMembers
public class UniVerifyManagerLoginSuccess : NSObject, UTSObject {
    public var openId: String!
    public var accessToken: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "openId":
                    self.openId = try! utsSubscriptCheckValue(newValue)
                case "accessToken":
                    self.accessToken = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.openId = obj["openId"] as! String
        self.accessToken = obj["accessToken"] as! String
    }
}
public typealias UniVerifyManagerLoginSuccessCallback = (_ res: UniVerifyManagerLoginSuccess) -> Void
public protocol UniVerifyManagerLoginFail : IUniError {
    var errCode: UniVerifyManagerErrorCode { get set }
}
public typealias UniVerifyManagerLoginFailCallback = (_ err: UniVerifyManagerLoginFail) -> Void
public typealias UniVerifyManagerLoginComplete = Any
public typealias UniVerifyManagerLoginCompleteCallback = (_ res: UniVerifyManagerLoginComplete) -> Void
public typealias UniVerifyManagerErrorCode = NSNumber
public var UniErrorSubject = "uni-verify"
public var UniErrors: Map<UniVerifyManagerErrorCode, String> = Map([
    [
        30001,
        "user cancel"
    ],
    [
        30004,
        "other error"
    ],
    [
        30005,
        "prelogin error"
    ],
    [
        30006,
        "login error"
    ],
    [
        30007,
        "prelogin is not valid"
    ],
    [
        30008,
        "The last request is in progress, please try again later"
    ],
    [
        40001,
        "not agree terms"
    ],
    [
        40002,
        "illegal ui"
    ]
])
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerPreLoginFailImpl)
@objcMembers
public class UniVerifyManagerPreLoginFailImpl : UniError, UniVerifyManagerPreLoginFail {
    public override var errCode: UniVerifyManagerErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errCode: UniVerifyManagerErrorCode, _ errMsg: String? = nil, _ cause: SourceError? = nil){
        super.init()
        self.errSubject = UniErrorSubject
        self.errCode = errCode
        self.errMsg = UniErrors[errCode] ?? errMsg ?? ""
        if (cause != nil) {
            self.cause = cause as! UTSError
        }
    }
    private var __errCode: UniVerifyManagerErrorCode!
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerLoginFailImpl)
@objcMembers
public class UniVerifyManagerLoginFailImpl : UniError, UniVerifyManagerLoginFail {
    public override var errCode: UniVerifyManagerErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errCode: UniVerifyManagerErrorCode, _ errMsg: String? = nil, _ cause: SourceError? = nil){
        super.init()
        self.errSubject = UniErrorSubject
        self.errCode = errCode
        self.errMsg = UniErrors[errCode] ?? errMsg ?? ""
        if (cause != nil) {
            self.cause = cause as! UTSError
        }
    }
    private var __errCode: UniVerifyManagerErrorCode!
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerSourceError)
@objcMembers
public class UniVerifyManagerSourceError : SourceError {
    public var gyuid: String
    public var processID: String
    public var operatorType: NSNumber
    public init(_ code: NSNumber, _ message: String, _ gyuid: String, _ processID: String, _ operatorType: NSNumber, _ cause: SourceError? = nil){
        self.gyuid = gyuid
        self.processID = processID
        self.operatorType = operatorType
        super.init()
        self.message = message
        self.code = code
        self.subject = "gysdk"
        if (cause != nil) {
            self.cause = cause as! UTSError
        }
    }
}
public func checkPermission(_ appid: String, _ gyid: String) -> UTSPromise<Void> {
    return UTSPromise<Void>({
    (_ resolve, _ reject) -> Void in
    DCloudUTSExtAPI.request(RequestOptions<Any>(UTSJSONObject([
        "header": nil,
        "timeout": nil,
        "dataType": nil,
        "responseType": nil,
        "sslVerify": nil,
        "withCredentials": nil,
        "firstIpv4": nil,
        "complete": nil,
        "enableChunked": nil,
        "url": "https://s1.dcloud.net.cn/unilogin/check-permission",
        "method": "POST",
        "data": UTSJSONObject([
            "appid": appid,
            "gyid": gyid
        ]),
        "success": {
        (res: RequestSuccess<Any>) -> Void in
        resolve(())
        var response = (res.data as! UTSJSONObject).getJSON("data")
        if (response != nil && response!["ret"] != 0) {
            result.valid = false
            result.code = response!["ret"] as! NSNumber
            result.desc = response!["desc"] as! String
            return
        }
        result.valid = true
        result.code = 0
        result.desc = ""
        },
        "fail": {
        (err: RequestFail) -> Void in
        resolve(())
        result.valid = true
        result.code = 0
        result.desc = ""
        }
    ])), Any.self)
    })
}
public func getPermissionCheckResult() -> PermissionCheckResult {
    return result
}
public var result = PermissionCheckResult(UTSJSONObject([
    "valid": true,
    "code": 0 as NSNumber,
    "desc": ""
]))
@objc(UTSSDKModulesDCloudUniVerifyPermissionCheckResult)
@objcMembers
public class PermissionCheckResult : NSObject, UTSObject {
    public var valid: Bool = false
    public var code: NSNumber!
    public var desc: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "valid":
                    self.valid = try! utsSubscriptCheckValue(newValue)
                case "code":
                    self.code = try! utsSubscriptCheckValue(newValue)
                case "desc":
                    self.desc = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.valid = obj["valid"] as! Bool
        self.code = obj["code"] as! NSNumber
        self.desc = obj["desc"] as! String
    }
}
public func verifyOptions(_ options: UniVerifyManagerCustomLoginOptions, _ verifyInfo: UTSJSONObject) -> NSNumber {
    var pages: Array<UniPage> = getCurrentPages()
    if (pages.length == 0) {
        return 40002
    }
    var topPage: UniPage = pages[pages.length - 1]
    var rootView = topPage.getIOSView()
    var dialogs = topPage.getDialogPages()
    if (dialogs.length > 0) {
        var topDialog: UniPage = dialogs[dialogs.length - 1]
        rootView = topDialog.getIOSView()
    }
    if (rootView == nil) {
        return 40002
    }
    var numberTextElement: UniElement? = options.numberTextElement
    if ((UTSiOS.instanceof(numberTextElement, UniTextElement.self)) == false) {
        return 40002
    }
    var pn: String = verifyInfo["pn"] as! String
    if ((numberTextElement as! UniTextElement).value != pn) {
        return 40002
    }
    var numberTextView = numberTextElement!.getIOSView()
    if (numberTextView == nil) {
        return 40002
    }
    if (verifyVisibility(numberTextView!, rootView!) == false) {
        return 40002
    }
    var sloganTextElement: UniElement? = options.sloganTextElement
    if ((UTSiOS.instanceof(sloganTextElement, UniTextElement.self)) == false) {
        return 40002
    }
    var slogan: String = verifyInfo["slogan"] as! String
    if ((sloganTextElement as! UniTextElement).value != slogan) {
        return 40002
    }
    var sloganTextView = sloganTextElement!.getIOSView()
    if (sloganTextView == nil) {
        return 40002
    }
    if (verifyVisibility(sloganTextView!, rootView!) == false) {
        return 40002
    }
    var loginButtonElement: UniElement? = options.loginButtonElement
    if ((UTSiOS.instanceof(loginButtonElement, UniButtonElement.self)) == false) {
        return 40002
    }
    var loginButtonTitle = (loginButtonElement as! UniButtonElement).value
    if (loginButtonTitle.includes("登录") == false && loginButtonTitle.includes("注册") == false) {
        return 40002
    }
    var loginButtonView = loginButtonElement!.getIOSView()
    if (loginButtonView == nil) {
        return 40002
    }
    if (verifyVisibility(loginButtonView!, rootView!) == false) {
        return 40002
    }
    var checkBoxElement: UniElement? = options.privacyCheckBoxElement
    if ((UTSiOS.instanceof(checkBoxElement, UniCheckboxElement.self)) == false) {
        return 40002
    }
    var isCheck = (checkBoxElement as! UniCheckboxElement).checked
    if (isCheck == false) {
        return 40001
    }
    var checkboxView = (checkBoxElement as! UniElement).getIOSView()
    if (checkboxView == nil) {
        return 40002
    }
    if (verifyVisibility(checkboxView!, rootView!) == false) {
        return 40002
    }
    var privacyTextElement: UniElement? = options.privacyTextElement
    if ((UTSiOS.instanceof(privacyTextElement, UniTextElement.self)) == false) {
        return 40002
    }
    var term: String = verifyInfo["term"] as! String
    if ((privacyTextElement as! UniTextElement).value.includes(term) == false) {
        return 40002
    }
    var privacyTextView = privacyTextElement!.getIOSView()
    if (privacyTextView == nil) {
        return 40002
    }
    if (verifyVisibility(privacyTextView!, rootView!) == false) {
        return 40002
    }
    return 0
}
public func verifyVisibility(_ targetview: UIView, _ rootview: UIView) -> Bool {
    if (targetview.isHidden) {
        return false
    }
    if (targetview.alpha == 0) {
        return false
    }
    if (targetview.superview == nil) {
        return false
    }
    if (targetview.window == nil) {
        return false
    }
    if (CGSizeEqualToSize(targetview.frame.size, CGSizeZero)) {
        return false
    }
    var width = targetview.frame.size.width
    var height = targetview.frame.size.height
    if (width < 10 || height < 10) {
        return false
    }
    if (targetview.isDescendant(of: rootview) == false) {
        return false
    }
    return checkConverage(rootview, targetview, rootview)
}
public func checkConverage(_ view: UIView, _ target: UIView, _ root: UIView) -> Bool {
    var targetFrameInRoot = target.convert(target.bounds, to: root)
    do {
        var i: NSNumber = 0
        while(i < view.subviews.length){
            var subview = view.subviews[i]
            if (subview != target && subview.isHidden == false && subview.alpha > 0 && target.isDescendant(of: subview) == false) {
                var subviewFrameInRoot = subview.convert(subview.bounds, to: root)
                if (subviewFrameInRoot.intersects(targetFrameInRoot)) {
                    var superview: UIView? = commonSuperviewOfView(target, subview)
                    if (superview != nil) {
                        var targetSuperview: UIView? = findInContainerView(target, superview!)
                        var otherSuperview: UIView? = findInContainerView(subview, superview!)
                        if (targetSuperview != nil && otherSuperview != nil) {
                            var target_index = superview!.subviews.indexOf(targetSuperview!)
                            var other_index = superview!.subviews.indexOf(otherSuperview!)
                            if (target_index < other_index) {
                                return false
                            }
                        }
                    }
                }
            }
            if (checkConverage(subview, target, root) == false) {
                return false
            }
            i++
        }
    }
    return true
}
public func commonSuperviewOfView(_ target: UIView, _ view: UIView) -> UIView? {
    var currentView: UIView? = view
    while(currentView != nil){
        if (target.isDescendant(of: currentView!)) {
            return currentView
        }
        currentView = currentView!.superview
    }
    return nil
}
public func findInContainerView(_ view: UIView, _ superview: UIView) -> UIView? {
    do {
        var i: NSNumber = 0
        while(i < superview.subviews.length){
            var subview = superview.subviews[i]
            if (view.isDescendant(of: subview)) {
                return subview
            }
            i++
        }
    }
    return nil
}
public var uni_verify_islogining: Bool = false
public var uni_verify_closeevent: String? = nil
public func uniVerifyClose(_ isPreLogin: Bool) -> Void {
    if (uni_verify_closeevent != nil) {
        var params: UTSJSONObject = UTSJSONObject([
            "isPreLogin": isPreLogin
        ])
        DCloudUTSExtAPI.__$$emit(uni_verify_closeevent!, params)
    }
}
public func uniVerifyLogin(_ options: UniVerifyManagerLoginOptions, _ info: UTSJSONObject) -> Void {
    var appId = info["appId"] as! String
    var GYAppId = info["gyAppId"] as! String
    checkPermission(appId, GYAppId)
    var result = getPermissionCheckResult()
    if (!result.valid) {
        var fail: UniVerifyManagerLoginFail = UniVerifyManagerLoginFailImpl(result.code as! UniVerifyManagerErrorCode, result.desc)
        options.fail?(fail)
        options.complete?(fail)
        return
    }
    var isPreLogin = info["isPreLogin"] as! Bool
    if (isPreLogin == false) {
        var fail: UniVerifyManagerLoginFail = UniVerifyManagerLoginFailImpl(30007)
        options.fail?(fail)
        options.complete?(fail)
        return
    }
    if (uni_verify_islogining == true) {
        var fail: UniVerifyManagerLoginFail = UniVerifyManagerLoginFailImpl(30008)
        options.fail?(fail)
        options.complete?(fail)
        return
    }
    uni_verify_islogining = true
    var style = options.uniVerifyStyle ?? options.univerifyStyle
    var loginBtnText = "一键登录"
    var fullScreen = "false"
    var logoPath = ""
    var backgroundColor = ""
    if (style != nil) {
        if (style!.loginBtnText != nil) {
            loginBtnText = style!.loginBtnText!
        }
        var isFullScreen = style!.fullScreen
        if (isFullScreen != nil) {
            fullScreen = isFullScreen == true ? "true" : "false"
        }
        if (style!.logoPath != nil) {
            logoPath = style!.logoPath!
        }
        if (style!.backgroundColor != nil) {
            backgroundColor = style!.backgroundColor!
        }
    }
    var privacyUrl = info["privacyUrl"] as! String
    var privacyName = info["privacyName"] as! String
    var phoneNumber = info["number"] as! String
    var slogan = info["slogan"] as! String
    var eventId = """
\(Date.now())\(Math.floor(Math.random() * 1e7))
"""
    var baseEventName = """
uni_verify_\(eventId)
"""
    var successEventName = """
\(baseEventName)_success
"""
    var failEventName = """
\(baseEventName)_fail
"""
    var closeEventName = """
\(baseEventName)_close
"""
    var unloadEventName = """
\(baseEventName)_unload
"""
    uni_verify_closeevent = closeEventName
    DCloudUTSExtAPI.__$$on(successEventName, {
    (spread_variadic: Any?...) -> Void in
    var _variadic = Array(spread_variadic)
    var res = _variadic[0] as! UTSJSONObject
    var success = UniVerifyManagerLoginSuccess(UTSJSONObject([
        "openId": res["openId"] as! String,
        "accessToken": res["accessToken"] as! String
    ]))
    options.success?(success)
    options.complete?(success)
    })
    DCloudUTSExtAPI.__$$on(failEventName, {
    (spread_variadic: Any?...) -> Void in
    var _variadic = Array(spread_variadic)
    var res = _variadic[0] as! UTSJSONObject
    uni_verify_islogining = false
    uni_verify_closeevent = ""
    var code = res["code"] as! NSNumber
    var cause: SourceError? = res["cause"] as! SourceError?
    var fail: UniVerifyManagerLoginFail = UniVerifyManagerLoginFailImpl(code as! UniVerifyManagerErrorCode, nil, cause)
    options.fail?(fail)
    options.complete?(fail)
    })
    DCloudUTSExtAPI.__$$on(unloadEventName, {
    (spread_variadic: Any?...) -> Void in
    var _variadic = Array(spread_variadic)
    var res = _variadic[0] as! UTSJSONObject
    uni_verify_islogining = false
    uni_verify_closeevent = ""
    })
    var animationType = fullScreen == "true" ? "slide-in-bottom" : "none"
    DCloudUTSExtAPI.openDialogPage(OpenDialogPageOptions(UTSJSONObject([
        "url": """
uni:verifyTemplatePage?successEventName=\(successEventName)&failEventName=\(failEventName)&closeEventName=\(closeEventName)&unloadEventName=\(unloadEventName)&fullScreen=\(fullScreen)&loginBtnText=\(loginBtnText)&logoPath=\(logoPath)&backgroundColor=\(backgroundColor)&phoneNumber=\(phoneNumber)&privacyName=\(privacyName)&slogan=\(slogan)&privacyUrl=\(privacyUrl)
""",
        "animationType": animationType,
        "fail": {
        (_ err: OpenDialogPageFail) -> Void in
        uni_verify_islogining = false
        uni_verify_closeevent = ""
        console.log(err)
        }
    ])))
}
public var getUniverifyManager: GetUniverifyManager = {
() -> UniverifyManager in
return UniVerifyManagerImpl.share
}
public var getUniVerifyManager: GetUniVerifyManager = {
() -> UniVerifyManager in
return UniVerifyManagerImpl.share
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerImpl)
@objcMembers
public class UniVerifyManagerImpl : NSObject, UniVerifyManager {
    public static var share = UniVerifyManagerImpl()
    public var preLoginResult: UniVerifyManagerPreLoginSuccess? = nil
    public var baseFlag: NSNumber = 0
    public var GYAppId: String = ""
    public var appId: String = ""
    public override init() {
        super.init()
        var bundleId: String = Bundle.main.bundleIdentifier!
        if (bundleId == "io.dcloud.HBuilder") {
            self.baseFlag = 1
        } else if (bundleId == "io.dcloud.uniappx") {
            self.baseFlag = 2
        }
        self.appId = UTSiOS.getAppId()
        var geyan: [AnyHashable: Any]? = Bundle.main.infoDictionary?["geyan"] as! [AnyHashable: Any]?
        if (geyan != nil) {
            var geyanParams = geyan as! [AnyHashable: Any]
            self.GYAppId = geyanParams["appid"] as! String
        }
        self.initGeYan()
        checkPermission(self.appId, self.GYAppId)
    }
    private func initGeYan() {
        GeYanSdk.setPreLoginTimeout(30)
        GeYanSdk.start(withAppId: self.GYAppId, withCallback: {
        (isSuccess, error, gyUid) -> Void in
        if (isSuccess) {
            console.debug("初始化成功，用户ID " + (gyUid as! String))
        } else {
            console.debug(("初始化失败，错误信息: " + (error?.localizedDescription as! String)) ?? "未知错误")
        }
        })
    }
    public func preLogin(_ options: UniVerifyManagerPreLoginOptions) -> Void {
        checkPermission(self.appId, self.GYAppId)
        var result = getPermissionCheckResult()
        if (!result.valid) {
            var fail: UniVerifyManagerPreLoginFail = UniVerifyManagerPreLoginFailImpl(result.code, result.desc)
            options.fail?(fail)
            options.complete?(fail)
            return
        }
        self.getToken(options)
    }
    public func customLogin(_ options: UniVerifyManagerCustomLoginOptions) -> Void {
        checkPermission(self.appId, self.GYAppId)
        var result = getPermissionCheckResult()
        if (!result.valid) {
            var fail: UniVerifyManagerLoginFail = UniVerifyManagerLoginFailImpl(result.code, result.desc)
            options.fail?(fail)
            options.complete?(fail)
            return
        }
        self.customLoginIn(options)
    }
    private func customLoginIn(_ options: UniVerifyManagerCustomLoginOptions) {
        var contentModel: GyContentModel = GyContentModel.current()
        var phoneNumber: String = contentModel.pn
        var slogan: String = contentModel.slogan
        var term: String = contentModel.term
        if (self.preLoginResult != nil) {
            if (phoneNumber.length == 0) {
                phoneNumber = self.preLoginResult!.number
            }
            if (slogan.length == 0) {
                slogan = self.preLoginResult!.slogan
            }
            if (term.length == 0) {
                term = self.preLoginResult!.privacyName
            }
        }
        var contentInfo: UTSJSONObject = UTSJSONObject([
            "pn": phoneNumber,
            "slogan": slogan,
            "term": term
        ])
        var errorCode = verifyOptions(options, contentInfo)
        if (errorCode != 0) {
            var fail: UniVerifyManagerLoginFail = UniVerifyManagerLoginFailImpl(errorCode)
            options.fail?(fail)
            options.complete?(fail)
            return
        }
        GyOneLoginPro.requestToken(completion: {
        (dic) -> Void in
        var result: NSDictionary = dic as! NSDictionary
        var gyuid: String = result["gyuid"] as! String
        if (result["code"] == 30000) {
            var openId = self.baseFlag.toString() + "00" + gyuid
            var accessToken = result["token"] ?? ""
            var success = UniVerifyManagerLoginSuccess(UTSJSONObject([
                "openId": openId,
                "accessToken": accessToken
            ]))
            options.success?(success)
            options.complete?(success)
        } else {
            var cause = self.getSourceError(result)
            var code: NSNumber = result["code"] as! NSNumber
            var fail: UniVerifyManagerLoginFail = UniVerifyManagerLoginFailImpl(code, nil, cause)
            options.fail?(fail)
            options.complete?(fail)
        }
        })
    }
    private func getSourceError(_ result: NSDictionary) -> UniVerifyManagerSourceError {
        var code: NSNumber = result["code"] as! NSNumber
        var operatorType: NSNumber = result["operatorType"] as! NSNumber
        var operatorCause: SourceError? = nil
        var metaData: NSDictionary? = nil
        var message: String? = nil
        if (result["metadata"] != nil) {
            metaData = result["metadata"] as! NSDictionary
            var subCode: NSNumber = code
            if (metaData!["resultCode"] != nil) {
                subCode = metaData!["resultCode"] as! NSNumber
            }
            var subSubject: String = self.getOperatorWithType(operatorType)
            var subMessage = JSON.stringify(metaData)
            operatorCause = SourceError(subMessage!)
            operatorCause!.code = subCode
            operatorCause!.subject = subSubject
            var mutableResult = result.mutableCopy()
            (mutableResult as! NSMutableDictionary).removeObject(forKey: "metadata")
            message = JSON.stringify(mutableResult)
        } else {
            message = JSON.stringify(result)
        }
        var gyuid: String = result["gyuid"] as! String
        var processID: String = result["processID"] as! String
        var errorCode: NSNumber = result["errorCode"] as! NSNumber
        var cause: UniVerifyManagerSourceError = UniVerifyManagerSourceError(errorCode, message!, gyuid, processID, operatorType, operatorCause)
        return cause
    }
    private func getOperatorWithType(_ type: NSNumber) -> String {
        var typeStr = "其他"
        if (type == 1) {
            typeStr = "移动"
        } else if (type == 2) {
            typeStr = "联通"
        } else if (type == 3) {
            typeStr = "电信"
        }
        return typeStr
    }
    private func getToken(_ options: UniVerifyManagerPreLoginOptions) {
        GeYanSdk.preGetToken({
        (preDic) -> Void in
        var res: NSDictionary = preDic as! NSDictionary
        if (res["code"] == 30000) {
            var contentModel: GyContentModel = GyContentModel.current()
            var success = UniVerifyManagerPreLoginSuccess(UTSJSONObject([
                "number": contentModel.pn,
                "slogan": contentModel.slogan,
                "privacyName": contentModel.term,
                "privacyUrl": contentModel.link
            ]))
            self.preLoginResult = success
            options.success?(success)
            options.complete?(success)
        } else {
            var cause = self.getSourceError(res)
            var code: NSNumber = res["code"] as! NSNumber
            var fail: UniVerifyManagerPreLoginFail = UniVerifyManagerPreLoginFailImpl(code, nil, cause)
            options.fail?(fail)
            options.complete?(fail)
        }
        })
    }
    public func isPreLoginValid() -> Bool {
        return self.isPreLogin()
    }
    private func isPreLogin() -> Bool {
        return GeYanSdk.isPreGettedTokenValidate()
    }
    public func login(_ options: UniVerifyManagerLoginOptions) -> Void {
        var privacyUrl = self.preLoginResult?.privacyUrl ?? ""
        var privacyName = self.preLoginResult?.privacyName ?? ""
        var phoneNumber = self.preLoginResult?.number ?? ""
        var slogan = self.preLoginResult?.slogan ?? ""
        var info: UTSJSONObject = UTSJSONObject([
            "privacyUrl": privacyUrl,
            "privacyName": privacyName,
            "number": phoneNumber,
            "slogan": slogan,
            "appId": self.appId,
            "gyAppId": self.GYAppId,
            "isPreLogin": self.isPreLogin()
        ])
        uniVerifyLogin(options, info)
    }
    public func close() -> Void {
        uniVerifyClose(self.isPreLogin())
    }
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerPreLoginOptionsJSONObject)
@objcMembers
public class UniVerifyManagerPreLoginOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerLoginOptionsJSONObject)
@objcMembers
public class UniVerifyManagerLoginOptionsJSONObject : NSObject {
    public var uniVerifyStyle: UniVerifyManagerLoginStyle?
    public var univerifyStyle: UniVerifyManagerLoginStyle?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerCustomLoginOptionsJSONObject)
@objcMembers
public class UniVerifyManagerCustomLoginOptionsJSONObject : NSObject {
    public var numberTextElement: UniElement!
    public var sloganTextElement: UniElement!
    public var loginButtonElement: UniElement!
    public var privacyCheckBoxElement: UniElement!
    public var privacyTextElement: UniElement!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getUniverifyManagerByJs() -> Int {
    var ins = getUniverifyManager()
    return UTSBridge.registerJavaScriptClassInstance(UniverifyManagerByJsProxy(ins))
}
public func getUniVerifyManagerByJs() -> Int {
    var ins = getUniVerifyManager()
    return UTSBridge.registerJavaScriptClassInstance(UniVerifyManagerByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniVerifyUniverifyManagerByJsProxy)
@objcMembers
public class UniverifyManagerByJsProxy : NSObject {
    public var __instance: UniverifyManager
    public init(_ ins: UniverifyManager){
        __instance = ins
    }
    public func preLoginByJs(_ options: UniVerifyManagerPreLoginOptionsJSONObject) -> Void {
        return __instance.preLogin(UniVerifyManagerPreLoginOptions(UTSJSONObject([
            "success": {
            (res: UniVerifyManagerPreLoginSuccess) -> Void in
            options.success?(res)
            },
            "fail": {
            (err: UniVerifyManagerPreLoginFail) -> Void in
            options.fail?(err)
            },
            "complete": {
            (res: UniVerifyManagerPreLoginComplete) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func loginByJs(_ options: UniVerifyManagerLoginOptionsJSONObject) -> Void {
        return __instance.login(UniVerifyManagerLoginOptions(UTSJSONObject([
            "uniVerifyStyle": options.uniVerifyStyle,
            "univerifyStyle": options.univerifyStyle,
            "success": {
            (res: UniVerifyManagerLoginSuccess) -> Void in
            options.success?(res)
            },
            "fail": {
            (err: UniVerifyManagerLoginFail) -> Void in
            options.fail?(err)
            },
            "complete": {
            (res: UniVerifyManagerLoginComplete) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func customLoginByJs(_ options: UniVerifyManagerCustomLoginOptionsJSONObject) -> Void {
        return __instance.customLogin(UniVerifyManagerCustomLoginOptions(UTSJSONObject([
            "numberTextElement": options.numberTextElement,
            "sloganTextElement": options.sloganTextElement,
            "loginButtonElement": options.loginButtonElement,
            "privacyCheckBoxElement": options.privacyCheckBoxElement,
            "privacyTextElement": options.privacyTextElement,
            "success": {
            (res: UniVerifyManagerLoginSuccess) -> Void in
            options.success?(res)
            },
            "fail": {
            (err: UniVerifyManagerLoginFail) -> Void in
            options.fail?(err)
            },
            "complete": {
            (res: UniVerifyManagerLoginComplete) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func closeByJs() -> Void {
        return __instance.close()
    }
    public func isPreLoginValidByJs() -> Bool {
        return __instance.isPreLoginValid()
    }
}
@objc(UTSSDKModulesDCloudUniVerifyUniVerifyManagerByJsProxy)
@objcMembers
public class UniVerifyManagerByJsProxy : NSObject {
    public var __instance: UniVerifyManager
    public init(_ ins: UniVerifyManager){
        __instance = ins
    }
    public func preLoginByJs(_ options: UniVerifyManagerPreLoginOptionsJSONObject) -> Void {
        return __instance.preLogin(UniVerifyManagerPreLoginOptions(UTSJSONObject([
            "success": {
            (res: UniVerifyManagerPreLoginSuccess) -> Void in
            options.success?(res)
            },
            "fail": {
            (err: UniVerifyManagerPreLoginFail) -> Void in
            options.fail?(err)
            },
            "complete": {
            (res: UniVerifyManagerPreLoginComplete) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func loginByJs(_ options: UniVerifyManagerLoginOptionsJSONObject) -> Void {
        return __instance.login(UniVerifyManagerLoginOptions(UTSJSONObject([
            "uniVerifyStyle": options.uniVerifyStyle,
            "univerifyStyle": options.univerifyStyle,
            "success": {
            (res: UniVerifyManagerLoginSuccess) -> Void in
            options.success?(res)
            },
            "fail": {
            (err: UniVerifyManagerLoginFail) -> Void in
            options.fail?(err)
            },
            "complete": {
            (res: UniVerifyManagerLoginComplete) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func customLoginByJs(_ options: UniVerifyManagerCustomLoginOptionsJSONObject) -> Void {
        return __instance.customLogin(UniVerifyManagerCustomLoginOptions(UTSJSONObject([
            "numberTextElement": options.numberTextElement,
            "sloganTextElement": options.sloganTextElement,
            "loginButtonElement": options.loginButtonElement,
            "privacyCheckBoxElement": options.privacyCheckBoxElement,
            "privacyTextElement": options.privacyTextElement,
            "success": {
            (res: UniVerifyManagerLoginSuccess) -> Void in
            options.success?(res)
            },
            "fail": {
            (err: UniVerifyManagerLoginFail) -> Void in
            options.fail?(err)
            },
            "complete": {
            (res: UniVerifyManagerLoginComplete) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func closeByJs() -> Void {
        return __instance.close()
    }
    public func isPreLoginValidByJs() -> Bool {
        return __instance.isPreLoginValid()
    }
}
@objc(UTSSDKModulesDCloudUniVerifyIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniVerifyIndexSwift : NSObject {
    public static func s_getUniverifyManagerByJs() -> Int {
        return getUniverifyManagerByJs()
    }
    public static func s_getUniVerifyManagerByJs() -> Int {
        return getUniVerifyManagerByJs()
    }
}
