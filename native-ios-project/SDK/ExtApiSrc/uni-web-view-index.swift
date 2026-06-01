import CoreFoundation
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import WebKit
import DCloudUTSExtAPI
@objc(UTSSDKModulesDCloudUniWebViewWebViewProgressStyles)
@objcMembers
public class WebViewProgressStyles : NSObject, UTSObject {
    public var color: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "color":
                    self.color = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.color = obj["color"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniWebViewWebViewStyles)
@objcMembers
public class WebViewStyles : NSObject, UTSObject {
    public var progress: Any!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "progress":
                    self.progress = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.progress = obj["progress"] as! Any
    }
}
@objc(UTSSDKModulesDCloudUniWebViewUniWebviewContextLoadDataOptions)
@objcMembers
public class UniWebviewContextLoadDataOptions : NSObject, UTSObject {
    public var data: String!
    public var baseURL: String?
    public var mimeType: String?
    public var encoding: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "baseURL":
                    self.baseURL = try! utsSubscriptCheckValueIfPresent(newValue)
                case "mimeType":
                    self.mimeType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.baseURL = obj["baseURL"] as! String?
        self.mimeType = obj["mimeType"] as! String?
        self.encoding = obj["encoding"] as! String?
    }
}
public typealias UniWebViewContextLoadDataOptions = UniWebviewContextLoadDataOptions
@objc(UTSSDKModulesDCloudUniWebViewUniWebViewElementLoadDataOptions)
@objcMembers
public class UniWebViewElementLoadDataOptions : NSObject, UTSObject {
    public var data: String!
    public var baseURL: String?
    public var mimeType: String?
    public var encoding: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "baseURL":
                    self.baseURL = try! utsSubscriptCheckValueIfPresent(newValue)
                case "mimeType":
                    self.mimeType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.baseURL = obj["baseURL"] as! String?
        self.mimeType = obj["mimeType"] as! String?
        self.encoding = obj["encoding"] as! String?
    }
}
public protocol WebviewContext {
    func forward()
    func back()
    func reload()
    func stop()
    func evalJS(_ js: String)
    func getContentHeight() -> NSNumber
    func loadData(_ options: Any)
}
public protocol WebViewContext : WebviewContext {
}
public typealias CreateWebviewContext = (_ webviewId: String, _ component: ComponentPublicInstance?) -> WebviewContext?
public typealias CreateWebViewContext = (_ webviewId: String, _ component: ComponentPublicInstance?) -> WebViewContext?
@objc
public protocol UniWebViewElement : JSExport, UniElement {
    func back()
    func forward()
    func reload()
    func stop()
    func evalJS(_ js: String)
    func getContentHeight() -> NSNumber
    func loadData(_ options: Any)
}
@objc(UTSSDKModulesDCloudUniWebViewUniWebViewElementImpl)
@objcMembers
public class UniWebViewElementImpl : UniElementImpl, UniWebViewElement {
    public override var tagName: String {
        get {
            return self.__tagName
        }
        set(value) {
            self.__tagName = value
        }
    }
    public override var nodeName: String {
        get {
            return self.__nodeName
        }
        set(value) {
            self.__nodeName = value
        }
    }
    private var nativeWebview: InnerWebView? = nil
    fileprivate func setWebView(_ nativeWebview: InnerWebView?) {
        self.nativeWebview = nativeWebview
        if (self.nativeWebview != nil) {
            self.nativeWebview!.domNode = self
        }
    }
    public override func getIOSView() -> UIView? {
        var nativeElement = self.firstChild as! UniNativeViewElement
        if (nativeElement == nil) {
            return nil
        } else {
            return nativeElement.getIOSView()
        }
    }
    public func back() {
        self.nativeWebview?.back()
    }
    public func forward() {
        self.nativeWebview?.forward()
    }
    public func reload() {
        self.nativeWebview?.reloadWebView()
    }
    public func stop() {
        self.nativeWebview?.stop()
    }
    public func evalJS(_ js: String) {
        self.nativeWebview?.evalJS(js)
    }
    public func getContentHeight() -> NSNumber {
        return self.nativeWebview?.getContentHeight() ?? 0
    }
    public func loadData(_ options: Any) {
        var data: String = ""
        var baseURL: String? = ""
        var encoding: String? = ""
        if (UTSiOS.instanceof(options, Map<String, Any>.self)) {
            var option = options as! Map<String, Any>
            if (UTSiOS.typeof(option["data"]) == "string") {
                data = option["data"] as! String
            }
            if (UTSiOS.typeof(option["baseURL"]) == "string") {
                baseURL = option["baseURL"] as! String
            }
            if (UTSiOS.typeof(option["encoding"]) == "string") {
                encoding = option["encoding"] as! String
            }
        } else if (UTSiOS.instanceof(options, UniWebViewElementLoadDataOptions.self)) {
            var option = options as! UniWebViewElementLoadDataOptions
            data = option.data
            baseURL = option.baseURL
            encoding = option.encoding
        }
        var option = UniWebViewContextLoadDataOptions(UTSJSONObject([
            "data": data,
            "baseURL": baseURL,
            "encoding": encoding
        ]))
        self.nativeWebview?.loadData(option)
    }
    public override func takeSnapshot(_ options: TakeSnapshotOptions) {
        if (UTSiOS.instanceof(self.getIOSView(), WKWebView.self)) {
            var webview = self.getIOSView() as! WKWebView
            webview.inner__takeSnapShotPath(backgroundColor: self.component?.view.backgroundColor, completion: {
            (path: String?) -> Void in
            if (path != nil) {
                UniJsSwiftApiWrapper.runOnJsQueue({
                () -> Void in
                var takeSnapshotSuccess = TakeSnapshotSuccess(UTSJSONObject([
                    "tempFilePath": path!
                ]))
                options.success?(takeSnapshotSuccess)
                options.complete?(takeSnapshotSuccess)
                })
            } else {
                UniJsSwiftApiWrapper.runOnJsQueue({
                () -> Void in
                var takeSnapshotFail = TakeSnapshotFail(UTSJSONObject([
                    "errMsg": "Snapshot failed"
                ]))
                options.fail?(takeSnapshotFail)
                options.complete?(takeSnapshotFail)
                })
            }
            })
        }
    }
    private var __tagName: String = "WEB-VIEW"
    private var __nodeName: String = "WEB-VIEW"
}
@objc(UTSSDKModulesDCloudUniWebViewNativeWebView)
@objcMembers
public class NativeWebView : NSObject {
    public var element: UniNativeViewElement
    public var webView: InnerWebView? = nil
    public init(_ element: UniNativeViewElement){
        self.element = element
        super.init()
        self.bindView()
        (self.element.parentElement as! UniWebViewElementImpl).setWebView(self.webView)
    }
    public func bindView() {
        self.webView = InnerWebView()
        if (self.webView != nil) {
            self.element.bindIOSView(self.webView!)
        }
        self.addCallback()
    }
    public func addCallback() {
        self.setOnLoadingCallback()
        self.setOnLoadedCallback()
        self.setOnLoadCallback()
        self.setOnErrorCallback()
        self.setOnMessageCallback()
        self.setOnDownloadCallback()
        self.setOnContentHeightChangeCallback()
        self.setOnDidTerminateCallback()
        self.setOnServiceMessageCallback()
    }
    public func setOnLoadingCallback() {
        self.webView?.setOnLoadingCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("loading", event)
        })
    }
    public func setOnLoadedCallback() {
        self.webView?.setOnLoadedCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("loaded", event)
        })
    }
    public func setOnLoadCallback() {
        self.webView?.setOnLoadCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("load", event)
        })
    }
    public func setOnErrorCallback() {
        self.webView?.setOnErrorCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("error", event)
        })
    }
    public func setOnMessageCallback() {
        self.webView?.setOnMessageCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("message", event)
        })
    }
    public func setOnDownloadCallback() {
        self.webView?.setOnDownloadCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("download", event)
        })
    }
    public func setOnContentHeightChangeCallback() {
        self.webView?.setOnContentHeightChangeCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("contentheightchange", event)
        })
    }
    public func setOnDidTerminateCallback() {
        self.webView?.setOnDidTerminateCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("didterminate", event)
        })
    }
    public func setOnServiceMessageCallback() {
        self.webView?.setOnServiceMessageCallback({
        (event: UniNativeViewEvent) -> Void in
        self.element.dispatchEvent("onWebViewServiceMessage", event)
        })
    }
    public func setSrc(_ src: String?) {
        self.webView?.setSrc(src)
    }
    public func setWebViewStyles(_ wvStyles: WebViewStyles?) {
        var showProgress: Bool = true
        var progressColor: String = "#00FF00"
        if (wvStyles?.progress != nil && UTSiOS.typeof(wvStyles?.progress!) == "boolean") {
            showProgress = wvStyles as! Bool
        } else if (UTSiOS.instanceof(wvStyles?.progress, Map<String, Any>.self)) {
            var progress = wvStyles?.progress! as! Map<String, Any>
            if (UTSiOS.typeof(progress["color"]) == "string") {
                var colorHex = progress["color"] as! String
                progressColor = colorHex ?? "#00FF00"
            }
        }
        self.webView?.setWebViewStyles(isShow: showProgress, color: UTSiOS.colorWithString(progressColor))
    }
    public func setHorizontalScrollBarAccess(_ horizontalScrollBarAccess: Bool) {
        self.webView?.setHorizontalScrollBarAccess(horizontalScrollBarAccess)
    }
    public func setVerticalScrollBarAccess(_ verticalScrollBarAccess: Bool) {
        self.webView?.setVerticalScrollBarAccess(verticalScrollBarAccess)
    }
    public func setBounces(_ bounces: Bool) {
        self.webView?.setBounces(bounces)
    }
    public func setDisableUserSelectMenu(_ disableUserSelectMenu: Bool) {
        self.webView?.setDisableUserSelectMenu(disableUserSelectMenu)
    }
    public func destroy() {
        UTSiOS.destroyInstance(self)
    }
}
public var createWebViewContext: CreateWebViewContext = {
(_ webviewId: String, _ component: ComponentPublicInstance?) -> WebViewContext? in
var webviewElement: UniWebViewElement? = nil
if (component == nil) {
    webviewElement = DCloudUTSExtAPI.getElementById(webviewId) as! UniWebViewElement?
} else {
    webviewElement = component?.__$$el(webviewId) as! UniWebViewElement?
}
if (webviewElement == nil) {
    return nil
}
return WebViewContextImpl(webviewElement!)
}
public var createWebviewContext: CreateWebviewContext = {
(_ webviewId: String, _ component: ComponentPublicInstance?) -> WebviewContext? in
var webviewElement: UniWebViewElement? = nil
if (component == nil) {
    webviewElement = DCloudUTSExtAPI.getElementById(webviewId) as! UniWebViewElement?
} else {
    webviewElement = component?.__$$el(webviewId) as! UniWebViewElement?
}
if (webviewElement == nil) {
    return nil
}
return WebViewContextImpl(webviewElement!)
}
@objc(UTSSDKModulesDCloudUniWebViewWebViewContextImpl)
@objcMembers
public class WebViewContextImpl : NSObject, WebViewContext {
    private weak var webviewElement: UniWebViewElement? = nil
    public init(_ webviewElement: UniWebViewElement){
        self.webviewElement = webviewElement
    }
    public func back() {
        self.webviewElement?.back()
    }
    public func forward() {
        self.webviewElement?.forward()
    }
    public func reload() {
        self.webviewElement?.reload()
    }
    public func stop() {
        self.webviewElement?.stop()
    }
    public func evalJS(_ js: String) {
        self.webviewElement?.evalJS(js)
    }
    public func getContentHeight() -> NSNumber {
        return self.webviewElement?.getContentHeight() ?? 0
    }
    public func loadData(_ options: Any) {
        self.webviewElement?.loadData(options)
    }
}
@objc(UTSSDKModulesDCloudUniWebViewWebViewStylesJSONObject)
@objcMembers
public class WebViewStylesJSONObject : NSObject {
    public var progress: Any!
}
@objc(UTSSDKModulesDCloudUniWebViewNativeWebViewByJs)
@objcMembers
public class NativeWebViewByJs : NativeWebView {
    public func bindViewByJs() {
        return self.bindView()
    }
    public func addCallbackByJs() {
        return self.addCallback()
    }
    public func setOnLoadingCallbackByJs() {
        return self.setOnLoadingCallback()
    }
    public func setOnLoadedCallbackByJs() {
        return self.setOnLoadedCallback()
    }
    public func setOnLoadCallbackByJs() {
        return self.setOnLoadCallback()
    }
    public func setOnErrorCallbackByJs() {
        return self.setOnErrorCallback()
    }
    public func setOnMessageCallbackByJs() {
        return self.setOnMessageCallback()
    }
    public func setOnDownloadCallbackByJs() {
        return self.setOnDownloadCallback()
    }
    public func setOnContentHeightChangeCallbackByJs() {
        return self.setOnContentHeightChangeCallback()
    }
    public func setOnDidTerminateCallbackByJs() {
        return self.setOnDidTerminateCallback()
    }
    public func setOnServiceMessageCallbackByJs() {
        return self.setOnServiceMessageCallback()
    }
    public func setSrcByJs(_ src: String?) {
        return self.setSrc(src)
    }
    public func setWebViewStylesByJs(_ wvStyles: WebViewStylesJSONObject?) {
        return self.setWebViewStyles(wvStyles != nil ? WebViewStyles(UTSJSONObject([
            "progress": wvStyles!.progress
        ])) : nil)
    }
    public func setHorizontalScrollBarAccessByJs(_ horizontalScrollBarAccess: Bool) {
        return self.setHorizontalScrollBarAccess(horizontalScrollBarAccess)
    }
    public func setVerticalScrollBarAccessByJs(_ verticalScrollBarAccess: Bool) {
        return self.setVerticalScrollBarAccess(verticalScrollBarAccess)
    }
    public func setBouncesByJs(_ bounces: Bool) {
        return self.setBounces(bounces)
    }
    public func setDisableUserSelectMenuByJs(_ disableUserSelectMenu: Bool) {
        return self.setDisableUserSelectMenu(disableUserSelectMenu)
    }
    public func destroyByJs() {
        return self.destroy()
    }
}
public func createWebViewContextByJs(_ webviewId: String, _ component: ComponentPublicInstance?) -> Int {
    var ins = createWebViewContext(webviewId, component)
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(WebViewContextByJsProxy(ins!)) : 0
}
public func createWebviewContextByJs(_ webviewId: String, _ component: ComponentPublicInstance?) -> Int {
    var ins = createWebviewContext(webviewId, component)
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(WebviewContextByJsProxy(ins!)) : 0
}
@objc(UTSSDKModulesDCloudUniWebViewWebviewContextByJsProxy)
@objcMembers
public class WebviewContextByJsProxy : NSObject {
    public var __instance: WebviewContext
    public init(_ ins: WebviewContext){
        __instance = ins
    }
    public func forwardByJs() -> Void {
        return __instance.forward()
    }
    public func backByJs() -> Void {
        return __instance.back()
    }
    public func reloadByJs() -> Void {
        return __instance.reload()
    }
    public func stopByJs() -> Void {
        return __instance.stop()
    }
    public func evalJSByJs(_ js: String) -> Void {
        return __instance.evalJS(js)
    }
    public func getContentHeightByJs() -> NSNumber {
        return __instance.getContentHeight()
    }
    public func loadDataByJs(_ options: Any) -> Void {
        return __instance.loadData(options)
    }
}
@objc(UTSSDKModulesDCloudUniWebViewWebViewContextByJsProxy)
@objcMembers
public class WebViewContextByJsProxy : NSObject {
    public var __instance: WebViewContext
    public init(_ ins: WebViewContext){
        __instance = ins
    }
    public func forwardByJs() -> Void {
        return __instance.forward()
    }
    public func backByJs() -> Void {
        return __instance.back()
    }
    public func reloadByJs() -> Void {
        return __instance.reload()
    }
    public func stopByJs() -> Void {
        return __instance.stop()
    }
    public func evalJSByJs(_ js: String) -> Void {
        return __instance.evalJS(js)
    }
    public func getContentHeightByJs() -> NSNumber {
        return __instance.getContentHeight()
    }
    public func loadDataByJs(_ options: Any) -> Void {
        return __instance.loadData(options)
    }
}
@objc(UTSSDKModulesDCloudUniWebViewIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniWebViewIndexSwift : NSObject {
    public static func s_createWebViewContextByJs(_ webviewId: String, _ component: ComponentPublicInstance?) -> Int {
        return createWebViewContextByJs(webviewId, component)
    }
    public static func s_createWebviewContextByJs(_ webviewId: String, _ component: ComponentPublicInstance?) -> Int {
        return createWebviewContextByJs(webviewId, component)
    }
}
