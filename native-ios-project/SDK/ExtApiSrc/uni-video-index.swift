@_implementationOnly import DCUniVideo
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import Swift
import UIKit
public typealias CreateVideoContext = (_ videoId: String, _ component: ComponentPublicInstance?) -> VideoContext?
@objc(UTSSDKModulesDCloudUniVideoDanmu)
@objcMembers
public class Danmu : NSObject, UTSObject {
    public var text: String?
    public var color: String?
    public var time: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "text":
                    self.text = try! utsSubscriptCheckValueIfPresent(newValue)
                case "color":
                    self.color = try! utsSubscriptCheckValueIfPresent(newValue)
                case "time":
                    self.time = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.text = obj["text"] as! String?
        self.color = obj["color"] as! String?
        self.time = obj["time"] as! NSNumber?
    }
}
@objc(UTSSDKModulesDCloudUniVideoRequestFullScreenOptions)
@objcMembers
public class RequestFullScreenOptions : NSObject, UTSObject {
    public var direction: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "direction":
                    self.direction = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.direction = obj["direction"] as! NSNumber?
    }
}
public protocol VideoContext {
    func play()
    func pause()
    func seek(_ position: NSNumber)
    func stop()
    func sendDanmu(_ danmu: Danmu)
    func playbackRate(_ rate: NSNumber)
    func requestFullScreen(_ direction: RequestFullScreenOptions?)
    func exitFullScreen()
}
@objc(VideoComponent)
@objcMembers
public class VideoComponent : UTSContainer<UIView> {
    public var src: String = ""
    public var autoplay: Bool = false
    public var loop: Bool = false
    public var muted: Bool = false
    public var initialTime: NSNumber = 0
    public var duration: NSNumber = 0
    public var controls: Bool = true
    public var danmuList: [NSDictionary] = []
    public var danmuBtn: Bool = false
    public var enableDanmu: Bool = false
    public var pageGesture: Bool = false
    public var direction: NSNumber = -90
    public var showProgress: Bool = true
    public var showFullscreenBtn: Bool = true
    public var showPlayBtn: Bool = true
    public var showCenterPlayBtn: Bool = true
    public var showLoading: Bool = true
    public var enableProgressGesture: Bool = true
    public var objectFit: String = "contain"
    public var poster: String = ""
    public var showMuteBtn: Bool = false
    public var title: String = ""
    public var enablePlayGesture: Bool = false
    public var vslideGesture: Bool = false
    public var vslideGestureInFullscreen: Bool = true
    public var codec: String = "hardware"
    public var httpCache: Bool = false
    public var playStrategy: NSNumber = 0
    public var header: Map<String, String> = Map<String, String>()
    private var present: UniVideoPlayerViewPresent? = nil
    private var delegate: DCloudUniVideoComponentDelegate? = nil
    public override func created() {
        var config = UniVideoPlayerConfig.init(options: self.attributes)
        self.delegate = DCloudUniVideoComponentDelegate(self)
        self.present = UniVideoPlayerViewPresent.init(config, self.delegate)
        if (self.delegate != nil) {
            self.present!.delegate = self.delegate
        }
    }
    public override func NVLoad() -> UIView {
        if (self.present != nil) {
            return self.present!.contentView
        } else {
            return UIView()
        }
    }
    public override func NVLayouted() {
        if (!UTSiOS.isScreenLocked()) {
            self.present?.updateViewFrame(self.calculatedFrame)
        }
    }
    public override func unmounted() {
        self.present?.destroy()
    }
    public func play() {
        self.present?.play()
    }
    public func pause() {
        self.present?.pause()
    }
    public func seek(_ pos: NSNumber) {
        self.present?.seek(pos.floatValue)
    }
    public func requestFullScreen(_ direction: NSNumber) {
        var dir = UniVideoPlayerConfig.direction(direction)
        self.present?.requestFullScreen(dir)
    }
    public func exitFullScreen() {
        self.present?.exitFullScreenForJS()
    }
    public func stop() {
        self.present?.stop()
    }
    public func showStatusBar() {
        self.present?.showStatusBar()
    }
    public func hideStatusBar() {
        self.present?.hideStatusBar()
    }
    public func sendDanmu(_ data: Map<String, Any>) {
        self.present?.sendDanmu(data)
    }
    public func playbackRate(_ rate: String) {
        self.present?.palybackRate(rate)
    }
    public func updateProp(_ key: String, _ value: Any?) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.present?.setControlValue(value, key)
        })
    }
    public override func __$$init() {
        self.__$$watch("src", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertString(__newValue)
        var oldValue = UTSiOS.convertString(__oldValue)
        self?.updateProp("src", newValue)
        })
        self.__$$watch("autoplay", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("autoplay", newValue)
        })
        self.__$$watch("loop", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("loop", newValue)
        })
        self.__$$watch("muted", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("muted", newValue)
        })
        self.__$$watch("initialTime", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertNumber(__newValue)
        var oldValue = UTSiOS.convertNumber(__oldValue)
        self?.updateProp("initialTime", newValue)
        })
        self.__$$watch("duration", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertNumber(__newValue)
        var oldValue = UTSiOS.convertNumber(__oldValue)
        self?.updateProp("duration", newValue)
        })
        self.__$$watch("controls", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("controls", newValue)
        })
        self.__$$watch("danmuList", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertArray(__newValue)
        var oldValue = UTSiOS.convertArray(__oldValue)
        self?.updateProp("danmuList", newValue)
        })
        self.__$$watch("danmuBtn", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("danmuBtn", newValue)
        })
        self.__$$watch("enableDanmu", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("enableDanmu", newValue)
        })
        self.__$$watch("pageGesture", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("pageGesture", newValue)
        })
        self.__$$watch("direction", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertNumber(__newValue)
        var oldValue = UTSiOS.convertNumber(__oldValue)
        self?.updateProp("direction", newValue)
        })
        self.__$$watch("showProgress", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("showProgress", newValue)
        })
        self.__$$watch("showFullscreenBtn", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("showFullscreenBtn", newValue)
        })
        self.__$$watch("showPlayBtn", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("showPlayBtn", newValue)
        })
        self.__$$watch("showCenterPlayBtn", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("showCenterPlayBtn", newValue)
        })
        self.__$$watch("showLoading", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("showLoading", newValue)
        })
        self.__$$watch("enableProgressGesture", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("enableProgressGesture", newValue)
        })
        self.__$$watch("objectFit", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertString(__newValue)
        var oldValue = UTSiOS.convertString(__oldValue)
        self?.updateProp("objectFit", newValue)
        })
        self.__$$watch("poster", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertString(__newValue)
        var oldValue = UTSiOS.convertString(__oldValue)
        self?.updateProp("poster", newValue)
        })
        self.__$$watch("showMuteBtn", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("showMuteBtn", newValue)
        })
        self.__$$watch("title", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertString(__newValue)
        var oldValue = UTSiOS.convertString(__oldValue)
        self?.updateProp("title", newValue)
        })
        self.__$$watch("enablePlayGesture", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("enablePlayGesture", newValue)
        })
        self.__$$watch("vslideGesture", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("vslideGesture", newValue)
        })
        self.__$$watch("vslideGestureInFullscreen", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("vslideGestureInFullscreen", newValue)
        })
        self.__$$watch("httpCache", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Bool
        var oldValue = __oldValue as! Bool
        self?.updateProp("httpCache", newValue)
        })
        self.__$$watch("codec", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertString(__newValue)
        var oldValue = UTSiOS.convertString(__oldValue)
        self?.updateProp("codec", newValue)
        })
        self.__$$watch("playStrategy", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertNumber(__newValue)
        var oldValue = UTSiOS.convertNumber(__oldValue)
        self?.updateProp("playStrategy", newValue)
        })
        self.__$$watch("header", { [weak self]
        (__newValue, __oldValue) -> Void in
        var newValue = __newValue as! Map<String, Any>
        var oldValue = __oldValue as! Map<String, Any>
        var newStr = JSON.stringify(newValue)
        var oldStr = JSON.stringify(oldValue)
        if (newStr != oldStr) {
            self?.updateProp("header", newValue)
        }
        })
    }
}
@objc
public protocol VideoElement : JSExport {
    func play()
    func pause()
    func seek(_ pos: NSNumber)
    func requestFullScreen(_ direction: NSNumber)
    func exitFullScreen()
    func stop()
    func showStatusBar()
    func hideStatusBar()
    func sendDanmu(_ data: Map<String, Any>)
    func playbackRate(_ rate: String)
}
@objc(VideoElementImpl)
@objcMembers
public class VideoElementImpl : UniElementImpl, VideoElement {
    public var targetComponent: VideoComponent {
        get {
            return self.component as! VideoComponent
        }
    }
    public func play() {
        return self.targetComponent.play()
    }
    public func pause() {
        return self.targetComponent.pause()
    }
    public func seek(_ pos: NSNumber) {
        return self.targetComponent.seek(pos)
    }
    public func requestFullScreen(_ direction: NSNumber) {
        return self.targetComponent.requestFullScreen(direction)
    }
    public func exitFullScreen() {
        return self.targetComponent.exitFullScreen()
    }
    public func stop() {
        return self.targetComponent.stop()
    }
    public func showStatusBar() {
        return self.targetComponent.showStatusBar()
    }
    public func hideStatusBar() {
        return self.targetComponent.hideStatusBar()
    }
    public func sendDanmu(_ data: Map<String, Any>) {
        return self.targetComponent.sendDanmu(data)
    }
    public func playbackRate(_ rate: String) {
        return self.targetComponent.playbackRate(rate)
    }
    public override func getDefaultStyle() -> Map<String, Any?> {
        return Map([
            [
                "width",
                "300px"
            ],
            [
                "height",
                "225px"
            ]
        ])
    }
}
@objc(VideoComponentRegister)
@objcMembers
public class VideoComponentRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "video", nodeClazz: VideoElementImpl.constructor, componentCls: VideoComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "video")
    }
}
@objc(UTSSDKModulesDCloudUniVideoDCloudUniVideoComponentDelegate)
@objcMembers
private class DCloudUniVideoComponentDelegate : NSObject, UniVideoPlayerProtocol {
    private weak var component: VideoComponent? = nil
    private var originalFrame: CGRect? = nil
    public init(_ component: VideoComponent){
        self.component = component
        super.init()
    }
    public func getCookieString(_ url: URL) -> String? {
        return UTSiOS.getCookieString(url)
    }
    public func getCurrentUA() -> String {
        return UTSiOS.getUserAgent()
    }
    public func sendEvent(_ name: String, _ params: Dictionary<String, Any>?) {
        switch(name){
            case "play":
                fallthrough
            case "pause":
                fallthrough
            case "waiting":
                fallthrough
            case "ended":
                fallthrough
            case "error":
                fallthrough
            case "click":
                self.component?.__$$emit(name)
            case "timeupdate":
                fallthrough
            case "fullscreenclick":
                fallthrough
            case "fullscreenchange":
                fallthrough
            case "controlstoggle":
                self.component?.__$$emit(name, params)
            default:
                break
        }
    }
    public func loadImage(_ url: String, _ complete: @escaping (_ image: UIImage) -> Void) {
        UTSiOS.loadImage(url, {
        (image, data) -> Void in
        if (image != nil) {
            complete(image!)
        }
        })
    }
    public func lockScreen() {
        UTSiOS.lockScreen()
    }
    public func unlockScreen() {
        UTSiOS.unlockScreen()
    }
    public func setFullScreen(_ yesOrNo: Bool) {
        UTSiOS.setFullScreen(yesOrNo)
    }
    public func setHomeIndicatorAutoHidden(_ yesOrNo: Bool) {
        UTSiOS.setHomeIndicatorAutoHidden(yesOrNo)
    }
    public func setTempOrientation(_ temp: UIInterfaceOrientationMask) {
        UTSiOS.setTempOrientation(temp)
    }
    public func configSupportOrientation(_ orientation: UIInterfaceOrientation) -> Bool {
        return UTSiOS.configSupportOrientation(orientation)
    }
    public func setDeviceInterfaceOrientation(_ orientation: UIInterfaceOrientation) {
        UTSiOS.setDeviceInterfaceOrientation(orientation)
    }
    public func h5Path2SysPath(_ path: String, _ basePath: String?) -> String {
        return UTSiOS.getResourceAbsolutePath(path, basePath)
    }
    public func workRootPath() -> String {
        return UTSiOS.getWorkRootPath()
    }
    public func videoPlayerWillEnterFullScreen(_ orientation: UIInterfaceOrientation) {
        self.originalFrame = self.component?.view.frame
        var deviceSize = UIScreen.main.bounds.size
        var min = min(deviceSize.width, deviceSize.height)
        var max = max(deviceSize.width, deviceSize.height)
        if (orientation == UIInterfaceOrientation.portrait) {
            self.component?.setStyleWidth(width: Float(min))
            self.component?.setStyleHeight(height: Float(max))
        } else {
            self.component?.setStyleWidth(width: Float(max))
            self.component?.setStyleHeight(height: Float(min))
        }
        self.component?.domNode?.setPositionEdge(UniCssFlexEdge.top, value: -Float(self.originalFrame?.minY ?? 0))
        self.component?.domNode?.setPositionEdge(UniCssFlexEdge.left, value: -Float(self.originalFrame?.minX ?? 0))
        self.component?.setNeedsLayout()
    }
    public func videoPlayerWillExitFullScreen(_ orientation: UIInterfaceOrientation) {
        if (self.originalFrame != nil) {
            var width = self.originalFrame!.size.width
            var height = self.originalFrame!.size.height
            self.component?.setStyleWidth(width: Float(width))
            self.component?.setStyleHeight(height: Float(height))
            self.component?.domNode?.setPositionEdge(UniCssFlexEdge.top, value: 0)
            self.component?.domNode?.setPositionEdge(UniCssFlexEdge.left, value: 0)
            self.component?.setNeedsLayout()
        }
    }
    public func videoPlayerExitFullScreen(_ orientation: UIInterfaceOrientation) {}
    public func videoPlayerEnterFullScreen(_ orientation: UIInterfaceOrientation) {}
    public func videoCacheDir() -> String {
        return UTSiOS.getVideoCacheDir()
    }
}
public var createVideoContext: CreateVideoContext = {
(_ videoId: String, _ component: ComponentPublicInstance?) -> VideoContext? in
var videoElement: VideoElement? = nil
var element: Any? = nil
if (component == nil) {
    element = UniSDKEngine.getJSElementById(videoId)
} else {
    element = component?.__$$el(videoId)
}
if (element != nil && (UTSiOS.instanceof(element, VideoElement.self))) {
    videoElement = (element as! VideoElement)
}
if (videoElement == nil) {
    return nil
}
return VideoContextImpl(videoElement!)
}
@objc(UTSSDKModulesDCloudUniVideoVideoContextImpl)
@objcMembers
public class VideoContextImpl : NSObject, VideoContext {
    private weak var videoElement: VideoElement? = nil
    public init(_ videoElement: VideoElement){
        self.videoElement = videoElement
    }
    public func play() {
        self.videoElement?.play()
    }
    public func pause() {
        self.videoElement?.pause()
    }
    public func seek(_ position: NSNumber) {
        self.videoElement?.seek(position)
    }
    public func stop() {
        self.videoElement?.stop()
    }
    public func sendDanmu(_ danmu: Danmu) {
        var str = JSON.stringify(danmu)
        if (str != nil) {
            var map = JSON.parseObject(str!)?.toMap()
            if (map != nil) {
                self.videoElement?.sendDanmu(map!)
            }
        }
    }
    public func playbackRate(_ rate: NSNumber) {
        self.videoElement?.playbackRate(rate.toString())
    }
    public func requestFullScreen(_ direction: RequestFullScreenOptions?) {
        self.videoElement?.requestFullScreen(direction?.direction ?? 0)
    }
    public func exitFullScreen() {
        self.videoElement?.exitFullScreen()
    }
    public func showStatusBar() {}
    public func hideStatusBar() {}
}
@objc(UTSSDKModulesDCloudUniVideoDanmuJSONObject)
@objcMembers
public class DanmuJSONObject : NSObject {
    public var text: String?
    public var color: String?
    public var time: NSNumber?
}
@objc(UTSSDKModulesDCloudUniVideoRequestFullScreenOptionsJSONObject)
@objcMembers
public class RequestFullScreenOptionsJSONObject : NSObject {
    public var direction: NSNumber?
}
public func createVideoContextByJs(_ videoId: String, _ component: ComponentPublicInstance?) -> Int {
    var ins = createVideoContext(videoId, component)
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(VideoContextByJsProxy(ins!)) : 0
}
@objc(UTSSDKModulesDCloudUniVideoVideoContextByJsProxy)
@objcMembers
public class VideoContextByJsProxy : NSObject {
    public var __instance: VideoContext
    public init(_ ins: VideoContext){
        __instance = ins
    }
    public func playByJs() -> Void {
        return __instance.play()
    }
    public func pauseByJs() -> Void {
        return __instance.pause()
    }
    public func seekByJs(_ position: NSNumber) -> Void {
        return __instance.seek(position)
    }
    public func stopByJs() -> Void {
        return __instance.stop()
    }
    public func sendDanmuByJs(_ danmu: DanmuJSONObject) -> Void {
        return __instance.sendDanmu(Danmu(UTSJSONObject([
            "text": danmu.text,
            "color": danmu.color,
            "time": danmu.time
        ])))
    }
    public func playbackRateByJs(_ rate: NSNumber) -> Void {
        return __instance.playbackRate(rate)
    }
    public func requestFullScreenByJs(_ direction: RequestFullScreenOptionsJSONObject?) -> Void {
        return __instance.requestFullScreen(direction != nil ? RequestFullScreenOptions(UTSJSONObject([
            "direction": direction!.direction
        ])) : nil)
    }
    public func exitFullScreenByJs() -> Void {
        return __instance.exitFullScreen()
    }
}
@objc(UTSSDKModulesDCloudUniVideoIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniVideoIndexSwift : NSObject {
    public static func s_createVideoContextByJs(_ videoId: String, _ component: ComponentPublicInstance?) -> Int {
        return createVideoContextByJs(videoId, component)
    }
}
