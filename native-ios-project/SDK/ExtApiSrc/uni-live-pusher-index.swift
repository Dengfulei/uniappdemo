import AVFoundation
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
@_implementationOnly import PLMediaStreamingKit
import UIKit
import DCloudUTSExtAPI
public protocol LivePusherEvent {
    var bubbles: Bool { get set }
    var cancelable: Bool { get set }
    var type: String { get set }
    var target: UniElement? { get set }
    var currentTarget: UniElement? { get set }
    var timeStamp: NSNumber { get set }
    func stopPropagation()
    func preventDefault()
}
public protocol UniLivePusherStatechangeEvent : LivePusherEvent {
    var detail: UniLivePusherStatechangeEventDetail { get }
}
@objc(UTSSDKModulesDCloudUniLivePusherUniLivePusherStatechangeEventDetail)
@objcMembers
public class UniLivePusherStatechangeEventDetail : NSObject, UTSObject {
    public var code: LivePusherStateCode!
    public var message: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "code":
                    self.code = try! utsSubscriptCheckValue(newValue)
                case "message":
                    self.message = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.code = obj["code"] as! LivePusherStateCode
        self.message = obj["message"] as! String
    }
}
public typealias LivePusherStateCode = NSNumber
public protocol UniLivePusherNetstatusEvent : LivePusherEvent {
    var detail: UniLivePusherNetstatusEventDetail { get }
}
@objc(UTSSDKModulesDCloudUniLivePusherUniLivePusherNetstatusEventDetail)
@objcMembers
public class UniLivePusherNetstatusEventDetail : NSObject, UTSObject {
    public var videoBitrate: NSNumber!
    public var audioBitrate: NSNumber!
    public var videoFPS: NSNumber!
    public var videoGOP: NSNumber!
    public var netSpeed: NSNumber!
    public var videoWidth: NSNumber!
    public var videoHeight: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "videoBitrate":
                    self.videoBitrate = try! utsSubscriptCheckValue(newValue)
                case "audioBitrate":
                    self.audioBitrate = try! utsSubscriptCheckValue(newValue)
                case "videoFPS":
                    self.videoFPS = try! utsSubscriptCheckValue(newValue)
                case "videoGOP":
                    self.videoGOP = try! utsSubscriptCheckValue(newValue)
                case "netSpeed":
                    self.netSpeed = try! utsSubscriptCheckValue(newValue)
                case "videoWidth":
                    self.videoWidth = try! utsSubscriptCheckValue(newValue)
                case "videoHeight":
                    self.videoHeight = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.videoBitrate = obj["videoBitrate"] as! NSNumber
        self.audioBitrate = obj["audioBitrate"] as! NSNumber
        self.videoFPS = obj["videoFPS"] as! NSNumber
        self.videoGOP = obj["videoGOP"] as! NSNumber
        self.netSpeed = obj["netSpeed"] as! NSNumber
        self.videoWidth = obj["videoWidth"] as! NSNumber
        self.videoHeight = obj["videoHeight"] as! NSNumber
    }
}
public protocol UniLivePusherErrorEvent : LivePusherEvent {
    var detail: UniLivePusherError { get }
}
public protocol UniLivePusherError : IUniError {
    var errCode: LivePusherErrorCode { get set }
}
public typealias LivePusherErrorCode = NSNumber
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherContextSettings)
@objcMembers
public class LivePusherContextSettings : NSObject, UTSObject {
    public var url: String!
    public var devicePosition: String!
    public var mode: String!
    public var localMirror: String!
    public var remoteMirror: Bool = false
    public var autoFocus: Bool = false
    public var muted: Bool = false
    public var orientation: String!
    public var beauty: NSNumber!
    public var whiten: NSNumber!
    public var enableCamera: Bool = false
    public var enableMic: Bool = false
    public var audioQuality: String!
    public var minBitrate: NSNumber!
    public var maxBitrate: NSNumber!
    public var audioVolumeType: String!
    public var aspect: String!
    public var backgroundMute: Bool = false
    public var waitingImage: String!
    public var zoom: NSNumber!
    public var videoWidth: NSNumber!
    public var videoHeight: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "url":
                    self.url = try! utsSubscriptCheckValue(newValue)
                case "devicePosition":
                    self.devicePosition = try! utsSubscriptCheckValue(newValue)
                case "mode":
                    self.mode = try! utsSubscriptCheckValue(newValue)
                case "localMirror":
                    self.localMirror = try! utsSubscriptCheckValue(newValue)
                case "remoteMirror":
                    self.remoteMirror = try! utsSubscriptCheckValue(newValue)
                case "autoFocus":
                    self.autoFocus = try! utsSubscriptCheckValue(newValue)
                case "muted":
                    self.muted = try! utsSubscriptCheckValue(newValue)
                case "orientation":
                    self.orientation = try! utsSubscriptCheckValue(newValue)
                case "beauty":
                    self.beauty = try! utsSubscriptCheckValue(newValue)
                case "whiten":
                    self.whiten = try! utsSubscriptCheckValue(newValue)
                case "enableCamera":
                    self.enableCamera = try! utsSubscriptCheckValue(newValue)
                case "enableMic":
                    self.enableMic = try! utsSubscriptCheckValue(newValue)
                case "audioQuality":
                    self.audioQuality = try! utsSubscriptCheckValue(newValue)
                case "minBitrate":
                    self.minBitrate = try! utsSubscriptCheckValue(newValue)
                case "maxBitrate":
                    self.maxBitrate = try! utsSubscriptCheckValue(newValue)
                case "audioVolumeType":
                    self.audioVolumeType = try! utsSubscriptCheckValue(newValue)
                case "aspect":
                    self.aspect = try! utsSubscriptCheckValue(newValue)
                case "backgroundMute":
                    self.backgroundMute = try! utsSubscriptCheckValue(newValue)
                case "waitingImage":
                    self.waitingImage = try! utsSubscriptCheckValue(newValue)
                case "zoom":
                    self.zoom = try! utsSubscriptCheckValue(newValue)
                case "videoWidth":
                    self.videoWidth = try! utsSubscriptCheckValue(newValue)
                case "videoHeight":
                    self.videoHeight = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.url = obj["url"] as! String
        self.devicePosition = obj["devicePosition"] as! String
        self.mode = obj["mode"] as! String
        self.localMirror = obj["localMirror"] as! String
        self.remoteMirror = obj["remoteMirror"] as! Bool
        self.autoFocus = obj["autoFocus"] as! Bool
        self.muted = obj["muted"] as! Bool
        self.orientation = obj["orientation"] as! String
        self.beauty = obj["beauty"] as! NSNumber
        self.whiten = obj["whiten"] as! NSNumber
        self.enableCamera = obj["enableCamera"] as! Bool
        self.enableMic = obj["enableMic"] as! Bool
        self.audioQuality = obj["audioQuality"] as! String
        self.minBitrate = obj["minBitrate"] as! NSNumber
        self.maxBitrate = obj["maxBitrate"] as! NSNumber
        self.audioVolumeType = obj["audioVolumeType"] as! String
        self.aspect = obj["aspect"] as! String
        self.backgroundMute = obj["backgroundMute"] as! Bool
        self.waitingImage = obj["waitingImage"] as! String
        self.zoom = obj["zoom"] as! NSNumber
        self.videoWidth = obj["videoWidth"] as! NSNumber
        self.videoHeight = obj["videoHeight"] as! NSNumber
    }
}
public typealias StreamingStateListener = (_ info: UniLivePusherStatechangeEvent) -> Void
public typealias StreamingStatusListener = (_ info: UniLivePusherNetstatusEvent) -> Void
public typealias StreamingErrorListener = (_ info: UniLivePusherErrorEvent) -> Void
@objc(UTSSDKModulesDCloudUniLivePusherSnapCallbackMessage)
@objcMembers
public class SnapCallbackMessage : NSObject, UTSObject {
    public var width: NSNumber!
    public var height: NSNumber!
    public var tempImagePath: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "width":
                    self.width = try! utsSubscriptCheckValue(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValue(newValue)
                case "tempImagePath":
                    self.tempImagePath = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.width = obj["width"] as! NSNumber
        self.height = obj["height"] as! NSNumber
        self.tempImagePath = obj["tempImagePath"] as! String
    }
}
public typealias LivePusherSuccess = UTSJSONObject
public typealias LivePusherSuccessCallback = (_ res: LivePusherSuccess) -> Void
public typealias LivePusherFail = UTSJSONObject
public typealias LivePusherFailCallback = (_ res: LivePusherFail) -> Void
public typealias LivePusherComplete = Any
public typealias LivePusherCompleteCallback = (_ res: LivePusherComplete) -> Void
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherOptions)
@objcMembers
public class LivePusherOptions : NSObject, UTSObject {
    public var success: LivePusherSuccessCallback?
    public var fail: LivePusherFailCallback?
    public var complete: LivePusherCompleteCallback?
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
        self.success = obj["success"] as! LivePusherSuccessCallback?
        self.fail = obj["fail"] as! LivePusherFailCallback?
        self.complete = obj["complete"] as! LivePusherCompleteCallback?
    }
}
public protocol LivePusherContext {
    func start(_ options: LivePusherOptions?)
    func stop(_ options: LivePusherOptions?)
    func switchCamera(_ options: LivePusherOptions?)
    func toggleTorch(_ options: LivePusherOptions?)
    func pause(_ options: LivePusherOptions?)
    func resume(_ options: LivePusherOptions?)
    func getMaxZoom(_ options: LivePusherOptions?)
    func setZoom(_ zoom: NSNumber, _ options: LivePusherOptions?)
    func startPreview(_ options: LivePusherOptions?)
    func stopPreview(_ options: LivePusherOptions?)
    func snapshot(_ options: LivePusherOptions?)
    func sendMessage(_ message: String, _ options: LivePusherOptions?)
}
public typealias CreateLivePusherContext = (_ livePusherId: String, _ component: ComponentPublicInstance?) -> LivePusherContext?
public var UniLivePusherErrorSubject = "uni-live-pusher"
public var LivePusherUniErrors: Map<LivePusherErrorCode, String> = Map([
    [
        3005,
        "IOError"
    ],
    [
        3006,
        "invalidStreamingURL"
    ],
    [
        3007,
        "unauthorizedStreamingURL"
    ],
    [
        3008,
        "unauthorizedPackage"
    ],
    [
        4001,
        "audioRecordingFail"
    ],
    [
        4002,
        "openCameraFail"
    ],
    [
        4003,
        "noNV21PreviewFormat"
    ],
    [
        4004,
        "startVideoEncoderFail"
    ],
    [
        4005,
        "videoEncoderError"
    ],
    [
        4006,
        "startAudioEncoderFail"
    ],
    [
        4007,
        "audioEncoderError"
    ],
    [
        5001,
        "encoderEncodeError"
    ],
    [
        5002,
        "TLSConnectFailed"
    ],
    [
        5003,
        "NoSSLOrTLSSupport"
    ],
    [
        5004,
        "DNSResolveFailed"
    ],
    [
        5005,
        "RTMPPublishStreamFailed"
    ]
])
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherErrorImpl)
@objcMembers
public class LivePusherErrorImpl : UniError, UniLivePusherError {
    public init(_ errCode: LivePusherErrorCode, _ errMsg: String? = nil){
        super.init()
        self.errSubject = UniLivePusherErrorSubject
        self.errCode = errCode
        if (errMsg != nil) {
            self.errMsg = errMsg as! String
        } else {
            self.errMsg = LivePusherUniErrors[errCode] ?? ""
        }
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherCustomEvent)
@objcMembers
public class LivePusherCustomEvent : NSObject {
    public var bubbles: Bool = false
    public var cancelable: Bool = false
    public var type: String = ""
    public var target: UniElement? = nil
    public var currentTarget: UniElement? = nil
    public var timeStamp: NSNumber = 0
    public func stopPropagation() -> Void {}
    public func preventDefault() -> Void {}
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherStatechangeEventImpl)
@objcMembers
public class LivePusherStatechangeEventImpl : LivePusherCustomEvent, UniLivePusherStatechangeEvent {
    public var detail: UniLivePusherStatechangeEventDetail
    public init(_ detail: UniLivePusherStatechangeEventDetail){
        self.detail = detail
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherErrorEventImpl)
@objcMembers
public class LivePusherErrorEventImpl : LivePusherCustomEvent, UniLivePusherErrorEvent {
    public var detail: UniLivePusherError
    public init(_ detail: UniLivePusherError){
        self.detail = detail
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherNetstatusEventImpl)
@objcMembers
public class LivePusherNetstatusEventImpl : LivePusherCustomEvent, UniLivePusherNetstatusEvent {
    public var detail: UniLivePusherNetstatusEventDetail
    public init(_ detail: UniLivePusherNetstatusEventDetail){
        self.detail = detail
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherUniLivePusherElement)
@objcMembers
public class UniLivePusherElement : UniElementImpl {
}
public class Deferred<T> {
    public var resolve = {
    (_ value: T) -> Void in
    }
    public var reject = {
    (_ reason: Any) -> Void in
    }
    public var promise: UTSPromise<T> = UTSPromise()
    public var running = false
    public init(){
        self.promise = UTSPromise<T>({
        (_ resolve, _ reject) -> Void in
        self.resolve = resolve
        self.reject = reject
        })
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherImpl)
@objcMembers
public class LivePusherImpl : NSObject {
    private var livePusher: UniNativeLivePusherImpl? = nil
    public init(_ element: UniNativeViewElement, _ settings: LivePusherContextSettings){
        self.livePusher = UniNativeLivePusherImpl(element, settings)
    }
    public func start(_ callback: @escaping (_ result: Bool) -> Void) -> Void {
        self.livePusher?.start(callback)
    }
    public func stop() -> UTSPromise<Bool> {
        return UTSPromise({
        () -> Any? in
        if (self.livePusher != nil) {
            return try! awaitPromise(self.livePusher!.stop())
        } else {
            return false
        }
        }, Bool.self)
    }
    public func pause() -> UTSPromise<Bool> {
        return UTSPromise({
        () -> Any? in
        if (self.livePusher != nil) {
            return try! awaitPromise(self.livePusher!.pause())
        } else {
            return false
        }
        }, Bool.self)
    }
    public func resume() -> UTSPromise<Bool> {
        return UTSPromise({
        () -> Any? in
        if (self.livePusher != nil) {
            return try! awaitPromise(self.livePusher!.resume())
        } else {
            return false
        }
        }, Bool.self)
    }
    public func destroy() {
        self.livePusher?.destroy()
    }
    public func setWaitingImage(_ url: String) {
        self.livePusher?.setWaitingImage(url)
    }
    public func setStreamStatusListener(_ listener: @escaping StreamingStatusListener) {
        self.livePusher?.setStreamStatusListener(listener)
    }
    public func setStreamingErrorListener(_ listener: @escaping StreamingErrorListener) {
        self.livePusher?.setStreamingErrorListener(listener)
    }
    public func setStreamingStateListener(_ listener: @escaping StreamingStateListener) {
        self.livePusher?.setStreamingStateListener(listener)
    }
    public func switchCamera() -> Bool {
        if (self.livePusher != nil) {
            return self.livePusher!.switchCamera()
        } else {
            return false
        }
    }
    public func startPreview() -> Bool {
        if (self.livePusher != nil) {
            return self.livePusher!.startPreview()
        } else {
            return false
        }
    }
    public func stopPreview() -> Bool {
        if (self.livePusher != nil) {
            return self.livePusher!.stopPreview()
        } else {
            return false
        }
    }
    public func updateFaceBeautySetting(_ beauty: NSNumber, _ whiten: NSNumber) {
        self.livePusher?.updateFaceBeautySetting(beauty, whiten)
    }
    public func setEncodingMirror(_ mirror: Bool) {
        self.livePusher?.setEncodingMirror(mirror)
    }
    public func setPreviewMirror(_ mirror: String) {
        self.livePusher?.setPreviewMirror(mirror)
    }
    public func mute(_ mute: Bool) {
        self.livePusher?.mute(mute)
    }
    public func setBackgroundMute(_ mute: Bool) {
        self.livePusher?.setBackgroundMute(mute)
    }
    public func switchMode(_ mode: String) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        try! awaitPromise(self.livePusher?.switchMode(mode))
        }, Void.self)
    }
    public func setVideoHeight(_ height: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        try! awaitPromise(self.livePusher?.setVideoHeight(height))
        }, Void.self)
    }
    public func setVideoWidth(_ width: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        try! awaitPromise(self.livePusher?.setVideoWidth(width))
        }, Void.self)
    }
    public func setZoom(_ zoom: NSNumber) {
        self.livePusher?.setZoom(zoom)
    }
    public func getMaxZoom() -> NSNumber {
        if (self.livePusher != nil) {
            return self.livePusher!.getMaxZoom()
        } else {
            return 0
        }
    }
    public func setMinBitrate(_ bitrate: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        try! awaitPromise(self.livePusher?.setMinBitrate(bitrate))
        }, Void.self)
    }
    public func setMaxBitrate(_ bitrate: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        try! awaitPromise(self.livePusher?.setMaxBitrate(bitrate))
        }, Void.self)
    }
    public func setAudioVolumeType(_ type: String) {
        self.livePusher?.setAudioVolumeType(type)
    }
    public func setContinuousFocusModeEnabled(_ enable: Bool) {
        self.livePusher?.setContinuousFocusModeEnabled(enable)
    }
    public func setCameraPrvSizeRatio(_ ratio: String) {
        self.livePusher?.setCameraPrvSizeRatio(ratio)
    }
    public func setAudioQuality(_ audioQuality: String) {
        self.livePusher?.setAudioQuality(audioQuality)
    }
    public func enableCamera(_ enable: Bool) {
        self.livePusher?.enableCamera(enable)
    }
    public func enableMic(_ enable: Bool) {
        self.livePusher?.enableMic(enable)
    }
    public func setOrientation(_ newValue: String) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        try! awaitPromise(self.livePusher?.setOrientation(newValue))
        }, Void.self)
    }
    public func togglePictureStreaming() {
        self.livePusher?.togglePictureStreaming()
    }
    public func toggleTorch() -> Bool {
        return self.livePusher?.toggleTorch() ?? false
    }
    public func snapshot() -> UTSPromise<SnapCallbackMessage> {
        return UTSPromise({
        () -> Any? in
        if (self.livePusher != nil) {
            return self.livePusher!.snapshot()
        } else {
            var snapshotInfo = SnapCallbackMessage(UTSJSONObject([
                "width": 0 as NSNumber,
                "height": 0 as NSNumber,
                "tempImagePath": ""
            ]))
            return snapshotInfo
        }
        }, SnapCallbackMessage.self)
    }
    public func sendMessage(_ msg: String) -> Bool {
        if (self.livePusher != nil) {
            return self.livePusher!.sendMessage(msg)
        } else {
            return false
        }
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherUniNativeLivePusherImpl)
@objcMembers
private class UniNativeLivePusherImpl : NSObject, PLMediaStreamingSessionDelegate {
    private var streamingStatusListener: StreamingStatusListener = {
    (_ info: UniLivePusherNetstatusEvent) -> Void in
    }
    private var streamingStateListener: StreamingStateListener = {
    (_ info: UniLivePusherStatechangeEvent) -> Void in
    }
    private var streamingErrorListener: StreamingErrorListener = {
    (_ info: UniLivePusherErrorEvent) -> Void in
    }
    private var videoStreamingConfiguration: PLVideoStreamingConfiguration?
    private var videoCaptureConfiguration: PLVideoCaptureConfiguration?
    private var audioCaptureConfiguration: PLAudioCaptureConfiguration?
    private var audioStreamingConfiguration: PLAudioStreamingConfiguration?
    private var session: PLMediaStreamingSession?
    private var element: UniNativeViewElement?
    private var settings: LivePusherContextSettings?
    private var stopStreamingDeferred = Deferred<Bool>()
    public var currentState: String = ""
    private var maxKeyFrameInterval: NSNumber = 60
    private var videoEncodingFrameRate: NSNumber = 30
    private var videoEncodingHeight: NSNumber = 0
    private var videoEncodingWidth: NSNumber = 0
    private var parentView: UIView?
    private var childView: UIView?
    private var hasCreateSession: Bool = false
    private var rawMuted: Bool = false
    private var beautyReadyTimer: NSNumber = 0
    private var beautyReadyCount: NSNumber = 20
    private var currentMaxBitrate: NSNumber = 0
    private var currentMinBitrate: NSNumber = 0
    public init(_ element: UniNativeViewElement, _ settings: LivePusherContextSettings){
        self.element = element
        self.settings = settings
        super.init()
        PLStreamingEnv.initEnv()
        self.createSession()
        self.parentView = UIView()
        self.parentView!.addSubview(self.session!.previewView)
        var value: NSNumber = 0
        var pointer = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        pointer.pointee = value.toInt()
        var rawPointer = UnsafeRawPointer(pointer)
        self.parentView!.tag = Int(bitPattern: rawPointer)
        objc_setAssociatedObject(self.parentView!, rawPointer, self, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        self.element!.bindIOSView(self.parentView!)
        NotificationCenter.default.addObserver(self, selector: Selector("appDidEnterBackground"), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector("appWillEnterForeground"), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    @objc
    private func appDidEnterBackground() {
        if (self.settings!.backgroundMute == true) {
            self.rawMuted = self.settings!.muted
            self.mute(true)
        }
        if (self.settings!.waitingImage != "") {
            var task = URLSession.shared.dataTask(with: URL(string: self.settings!.waitingImage)!, completionHandler: {
            (_ data, _ response, _ error) -> Void in
            if (error == nil && data != nil) {
                var image = UIImage(data: data!)
                self.session!.setPush(image)
            }
            })
            task.resume()
        }
    }
    @objc
    private func appWillEnterForeground() {
        if (self.settings!.backgroundMute == true) {
            self.mute(self.rawMuted)
        }
        if (self.settings!.waitingImage != "") {
            self.session!.setPush(nil)
        }
    }
    public func setWaitingImage(_ url: String) {
        self.settings!.waitingImage = url
    }
    private func createSession() {
        if (self.hasCreateSession) {
            return
        }
        self.setEncodingVideoProfile()
        self.setCaptureAudioConfiguration()
        self.setCaptureVideoConfiguration()
        self.setEncodingAudioProfile()
        if (self.settings!.enableCamera == true) {
            if (self.settings!.enableMic == true) {
                self.session = PLMediaStreamingSession(videoCaptureConfiguration: self.videoCaptureConfiguration, audioCaptureConfiguration: self.audioCaptureConfiguration, videoStreamingConfiguration: self.videoStreamingConfiguration!, audioStreamingConfiguration: self.audioStreamingConfiguration, stream: nil)
            } else {
                self.session = PLMediaStreamingSession(videoCaptureConfiguration: self.videoCaptureConfiguration, audioCaptureConfiguration: nil, videoStreamingConfiguration: self.videoStreamingConfiguration!, audioStreamingConfiguration: nil, stream: nil)
            }
        } else {
            if (self.settings!.enableMic == true) {
                self.session = PLMediaStreamingSession(videoCaptureConfiguration: nil, audioCaptureConfiguration: self.audioCaptureConfiguration, videoStreamingConfiguration: nil, audioStreamingConfiguration: self.audioStreamingConfiguration, stream: nil)
            } else {
                self.session = PLMediaStreamingSession(videoCaptureConfiguration: self.videoCaptureConfiguration, audioCaptureConfiguration: self.audioCaptureConfiguration, videoStreamingConfiguration: self.videoStreamingConfiguration!, audioStreamingConfiguration: self.audioStreamingConfiguration, stream: nil)
            }
        }
        self.setZoom(self.settings!.zoom)
        self.session!.setBeautifyModeOn(true)
        self.beautyReadyTimer = setInterval({
        () -> Void in
        self.updateFaceBeautySetting(self.settings!.beauty, self.settings!.whiten)
        if (--self.beautyReadyCount == 0) {
            clearInterval(self.beautyReadyTimer)
        }
        }, 20)
        self.session!.isContinuousAutofocusEnable = self.settings!.autoFocus
        self.currentMinBitrate = Math.min(self.currentMaxBitrate, self.settings!.minBitrate)
        self.session!.enableAdaptiveBitrateControl(withMinVideoBitRate: UInt(self.currentMinBitrate))
        self.session!.delegate = self
        self.hasCreateSession = true
    }
    public func mediaStreamingSession(_ session: PLMediaStreamingSession, didGetCameraAuthorizationStatus status: PLAuthorizationStatus) {
        if (status == PLAuthorizationStatus.authorized) {
            self.setZoom(self.settings!.zoom)
        }
    }
    public func mediaStreamingSession(_ session: PLMediaStreamingSession, streamStateDidChange state: PLStreamState) {
        if (state == PLStreamState.connecting) {
            var event: UniLivePusherStatechangeEvent = LivePusherStatechangeEventImpl(UniLivePusherStatechangeEventDetail(UTSJSONObject([
                "code": 1001 as NSNumber,
                "message": "connecting"
            ])))
            self.currentState = "CONNECTING"
            self.streamingStateListener(event)
        } else if (state == PLStreamState.connected) {
            var event: UniLivePusherStatechangeEvent = LivePusherStatechangeEventImpl(UniLivePusherStatechangeEventDetail(UTSJSONObject([
                "code": 1002 as NSNumber,
                "message": "connected"
            ])))
            self.currentState = "STREAMING"
            self.streamingStateListener(event)
        } else if (state == PLStreamState.disconnected) {
            if (self.stopStreamingDeferred.running) {
                self.stopStreamingDeferred.resolve(true)
            }
            var event: UniLivePusherStatechangeEvent = LivePusherStatechangeEventImpl(UniLivePusherStatechangeEventDetail(UTSJSONObject([
                "code": 3004 as NSNumber,
                "message": "RtmpDisconnected"
            ])))
            self.currentState = "SHUTDOWN"
            self.streamingStateListener(event)
        }
    }
    public func mediaStreamingSession(_ session: PLMediaStreamingSession, didDisconnectWithError error: Error) {
        var mError = error as! NSError
        if (mError.code == -1000 || mError.code == -1001 || mError.code == -1002 || mError.code == -1003 || mError.code == -1004 || mError.code == -1005 || mError.code == -1006 || mError.code == -1007 || mError.code == -1008 || mError.code == -1009 || mError.code == -1010 || mError.code == -1011 || mError.code == -1012 || mError.code == -1013 || mError.code == -1014 || mError.code == -1015 || mError.code == -1016) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(3005))
            self.streamingErrorListener(event)
        } else if (mError.code == -1000) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(3006))
            self.streamingErrorListener(event)
        } else if (mError.code == -3) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(3007))
            self.streamingErrorListener(event)
        } else if (mError.code == -1600) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(3008))
            self.streamingErrorListener(event)
        } else if (mError.code == -1700) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(5001))
            self.streamingErrorListener(event)
        } else if (mError.code == -1200) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(5002))
            self.streamingErrorListener(event)
        } else if (mError.code == -1201) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(5003))
            self.streamingErrorListener(event)
        } else if (mError.code == -1300) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(5004))
            self.streamingErrorListener(event)
        } else if (mError.code == -1400) {
            var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(5005))
            self.streamingErrorListener(event)
        } else {
            if ((error as! NSError).domain == "pili.error.rtmp") {
                var event: UniLivePusherErrorEvent = LivePusherErrorEventImpl(LivePusherErrorImpl(-1, (error as! NSError).userInfo[NSLocalizedDescriptionKey] as! String))
                self.streamingErrorListener(event)
            }
        }
    }
    public func mediaStreamingSession(_ session: PLMediaStreamingSession, streamStatusDidUpdate status: PLStreamStatus) {
        var detail = UniLivePusherNetstatusEventDetail(UTSJSONObject([
            "videoBitrate": status.videoBitrate / 1000,
            "audioBitrate": status.audioBitrate / 1000,
            "videoFPS": status.videoFPS,
            "videoGOP": self.maxKeyFrameInterval,
            "netSpeed": status.totalBitrate / 8,
            "videoWidth": self.videoEncodingWidth,
            "videoHeight": self.videoEncodingHeight
        ]))
        var event: UniLivePusherNetstatusEvent = LivePusherNetstatusEventImpl(detail)
        self.streamingStatusListener(event)
    }
    public func initLivePusher() {}
    private func closestAspectRatio(_ numerator: NSNumber, _ denominator: NSNumber) -> String {
        var score = numerator / denominator
        var ratio3_4 = (3 as! NSNumber) / 4
        var ratio9_16 = (9 as! NSNumber) / 16
        var diff3_4 = Math.abs(score - ratio3_4)
        var diff9_16 = Math.abs(score - ratio9_16)
        if (diff3_4 < diff9_16) {
            return "3:4"
        } else if (diff3_4 > diff9_16) {
            return "9:16"
        } else {
            return "3:4"
        }
    }
    private func setCaptureAudioConfiguration() {
        self.audioCaptureConfiguration = PLAudioCaptureConfiguration.default()
    }
    private func setCaptureVideoConfiguration() {
        var position: AVCaptureDevice.Position = AVCaptureDevice.Position.back
        var orientation: AVCaptureVideoOrientation = AVCaptureVideoOrientation.portrait
        var streamMirrorFrontFacing = self.settings!.remoteMirror
        var streamMirrorRearFacing = self.settings!.remoteMirror
        var previewMirrorFrontFacing = false
        var previewMirrorRearFacing = false
        if (self.settings!.localMirror == "enable") {
            previewMirrorFrontFacing = true
            previewMirrorRearFacing = true
        } else if (self.settings!.localMirror == "disable") {
            previewMirrorFrontFacing = false
            previewMirrorRearFacing = false
        } else {
            previewMirrorFrontFacing = true
            previewMirrorRearFacing = false
        }
        if (self.settings!.devicePosition == "front") {
            position = AVCaptureDevice.Position.front
        } else {
            position = AVCaptureDevice.Position.back
        }
        if (self.settings!.orientation == "horizontal") {
            orientation = AVCaptureVideoOrientation.landscapeLeft
        }
        self.videoCaptureConfiguration = PLVideoCaptureConfiguration.init(videoFrameRate: 30, sessionPreset: "AVCaptureSessionPresetHigh", previewMirrorFrontFacing: previewMirrorFrontFacing, previewMirrorRearFacing: previewMirrorRearFacing, streamMirrorFrontFacing: streamMirrorFrontFacing, streamMirrorRearFacing: streamMirrorRearFacing, cameraPosition: position, videoOrientation: orientation)
    }
    private func setEncodingAudioProfile() {
        self.audioStreamingConfiguration = PLAudioStreamingConfiguration.default()
        if (self.settings!.audioQuality == "high") {
            self.audioStreamingConfiguration!.encodedAudioSampleRate = PLStreamingAudioSampleRate._48000Hz
        } else if (self.settings!.audioQuality == "low") {
            self.audioStreamingConfiguration!.encodedAudioSampleRate = PLStreamingAudioSampleRate._44100Hz
        }
    }
    private func setEncodingVideoProfile() {
        var numerator = NSNumber(Int(self.settings!.aspect.split(":")[0])!)
        var denominator = NSNumber(Int(self.settings!.aspect.split(":")[1])!)
        var ratio = self.closestAspectRatio(numerator, denominator)
        if (self.settings!.mode == "SD") {
            self.currentMaxBitrate = Math.min(self.settings!.maxBitrate, 358400)
            self.videoEncodingWidth = 480
            self.videoEncodingHeight = ratio == "9:16" ? 848 : 640
        } else if (self.settings!.mode == "HD") {
            self.currentMaxBitrate = Math.min(self.settings!.maxBitrate, 1024000)
            self.videoEncodingWidth = 720
            self.videoEncodingHeight = ratio == "9:16" ? 1280 : 960
        } else {
            self.currentMaxBitrate = Math.min(self.settings!.maxBitrate, 2048000)
            self.videoEncodingWidth = 1088
            self.videoEncodingHeight = ratio == "9:16" ? 1920 : 1440
        }
        if (self.settings!.videoHeight != 0 && self.settings!.videoWidth != 0) {
            self.videoEncodingWidth = self.settings!.videoWidth
            self.videoEncodingHeight = self.settings!.videoHeight
        }
        self.videoEncodingWidth = Math.min(self.videoEncodingWidth, 1088)
        self.videoEncodingHeight = Math.min(self.videoEncodingHeight, 1920)
        if (self.currentMinBitrate > 0) {
            if (self.currentMaxBitrate < self.currentMinBitrate) {
                self.currentMaxBitrate = self.currentMinBitrate
            }
        }
        self.videoStreamingConfiguration = PLVideoStreamingConfiguration.init(videoSize: CGSize(width: CGFloat(truncating: self.videoEncodingWidth), height: CGFloat(truncating: self.videoEncodingHeight)), expectedSourceVideoFrameRate: UInt(self.videoEncodingFrameRate), videoMaxKeyframeInterval: UInt(self.maxKeyFrameInterval), averageVideoBitRate: UInt(self.currentMaxBitrate), videoProfileLevel: AVVideoProfileLevelH264Baseline41, videoEncoderType: PLH264EncoderType.videoToolbox)
    }
    public func setStreamStatusListener(_ listener: @escaping StreamingStatusListener) {
        self.streamingStatusListener = listener
    }
    public func setStreamingErrorListener(_ listener: @escaping StreamingErrorListener) {
        self.streamingErrorListener = listener
    }
    public func setStreamingStateListener(_ listener: @escaping StreamingStateListener) {
        self.streamingStateListener = listener
    }
    public func start(_ callback: @escaping (_ result: Bool) -> Void) -> Void {
        self.createSession()
        self.parentView!.addSubview(self.session!.previewView)
        self.startPreview()
        self.session!.startStreaming(withPush: URL(string: self.settings!.url)!, feedback: {
        (_ feedback: PLStreamStartStateFeedback) -> Void in
        if (feedback == PLStreamStartStateFeedback.success) {
            callback(true)
        } else {
            callback(false)
        }
        })
    }
    public func stop() -> UTSPromise<Bool> {
        return UTSPromise({
        () -> Any? in
        var result = true
        do {
            self.session!.previewView.removeFromSuperview()
            try awaitPromise(self.pause())
            self.stopPreview()
        }
         catch let e {
            var e = UTSError(e)
            result = false
        }
        return result
        }, Bool.self)
    }
    public func destroy() {
        clearInterval(self.beautyReadyTimer)
        self.session!.destroy()
        UTSiOS.destroyInstance(self)
    }
    public func pause() -> UTSPromise<Bool> {
        return UTSPromise({
        () -> Any? in
        if (self.currentState != "STREAMING") {
            return false
        }
        if (self.stopStreamingDeferred.running) {
            try! awaitPromise(self.stopStreamingDeferred.promise)
        }
        self.stopStreamingDeferred = Deferred<Bool>()
        self.stopStreamingDeferred.running = true
        self.session!.stopStreaming()
        var result = try! awaitPromise(self.stopStreamingDeferred.promise)
        self.stopStreamingDeferred.running = false
        return result
        }, Bool.self)
    }
    public func resume() -> UTSPromise<Bool> {
        return UTSPromise({
        () -> Any? in
        return UTSPromise<Bool>({
        (_ resolve, _ _) -> Void in
        self.session!.startStreaming(withPush: URL(string: self.settings!.url)!, feedback: {
        (_ feedback: PLStreamStartStateFeedback) -> Void in
        if (feedback == PLStreamStartStateFeedback.success) {
            resolve(true)
        } else {
            resolve(false)
        }
        })
        })
        }, Bool.self)
    }
    public func switchCamera() -> Bool {
        var result = true
        var that = self
        do {
            self.settings!.devicePosition = self.settings!.devicePosition == "front" ? "back" : "front"
            that.session!.toggleCamera()
        }
         catch let e {
            var e = UTSError(e)
            result = false
        }
        return result
    }
    public func startPreview() -> Bool {
        var result = true
        do {
            self.session!.startCapture()
        }
         catch let e {
            var e = UTSError(e)
            result = false
        }
        return result
    }
    public func stopPreview() -> Bool {
        var result = true
        do {
            self.session!.stopCapture()
        }
         catch let e {
            var e = UTSError(e)
            result = false
        }
        return result
    }
    public func updateFaceBeautySetting(_ beauty: NSNumber, _ whiten: NSNumber) {
        self.settings!.beauty = beauty
        self.settings!.whiten = whiten
        var _beauty = beauty / 9
        var _whiten = whiten / 9
        self.session!.setBeautify(CGFloat(truncating: Math.max(_beauty, 0.1)))
        self.session!.setWhiten(CGFloat(truncating: Math.max(_whiten, 0.1)))
    }
    public func setEncodingMirror(_ mirror: Bool) {
        self.settings!.remoteMirror = mirror
        self.session!.streamMirrorFrontFacing = mirror
        self.session!.streamMirrorRearFacing = mirror
    }
    public func setPreviewMirror(_ mirror: String) {
        self.settings!.localMirror = mirror
        if (mirror == "enable") {
            self.session!.previewMirrorFrontFacing = true
            self.session!.previewMirrorRearFacing = true
        } else if (mirror == "disable") {
            self.session!.previewMirrorFrontFacing = false
            self.session!.previewMirrorRearFacing = false
        } else {
            self.session!.previewMirrorFrontFacing = true
            self.session!.previewMirrorRearFacing = false
        }
    }
    public func mute(_ mute: Bool) {
        self.settings!.muted = mute
        self.session!.isMuted = mute
    }
    public func setBackgroundMute(_ mute: Bool) {
        self.settings!.backgroundMute = mute
    }
    public func switchMode(_ mode: String) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        self.settings!.mode = mode
        self.setEncodingVideoProfile()
        self.session!.reloadVideoStreamingConfiguration(self.videoStreamingConfiguration!)
        }, Void.self)
    }
    public func setVideoHeight(_ height: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        self.settings!.videoHeight = height
        self.setEncodingVideoProfile()
        self.session!.reloadVideoStreamingConfiguration(self.videoStreamingConfiguration!)
        }, Void.self)
    }
    public func setVideoWidth(_ width: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        self.settings!.videoWidth = width
        self.setEncodingVideoProfile()
        self.session!.reloadVideoStreamingConfiguration(self.videoStreamingConfiguration!)
        }, Void.self)
    }
    public func setZoom(_ zoom: NSNumber) {
        var maxZoom = getMaxZoom()
        if (maxZoom != 0) {
            self.settings!.zoom = Math.min(zoom, maxZoom)
            self.session!.videoZoomFactor = CGFloat(truncating: self.settings!.zoom)
        }
    }
    public func getMaxZoom() -> NSNumber {
        var result = self.session!.videoActiveFormat.videoMaxZoomFactor
        return NSNumber(value: result)
    }
    public func setMinBitrate(_ bitrate: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        self.settings!.minBitrate = bitrate
        self.currentMinBitrate = Math.min(self.currentMaxBitrate, self.settings!.minBitrate)
        self.session!.enableAdaptiveBitrateControl(withMinVideoBitRate: UInt(self.currentMinBitrate))
        }, Void.self)
    }
    public func setMaxBitrate(_ bitrate: NSNumber) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        self.settings!.maxBitrate = bitrate
        self.setEncodingVideoProfile()
        self.session!.reloadVideoStreamingConfiguration(self.videoStreamingConfiguration!)
        }, Void.self)
    }
    public func setAudioVolumeType(_ type: String) {
        self.settings!.audioVolumeType = type
    }
    public func setContinuousFocusModeEnabled(_ enable: Bool) {
        self.settings!.autoFocus = enable
        self.session!.isContinuousAutofocusEnable = enable
    }
    public func setCameraPrvSizeRatio(_ ratio: String) {
        self.settings!.aspect = ratio
    }
    public func setAudioQuality(_ audioQuality: String) {
        self.settings!.audioQuality = audioQuality
        self.setCaptureAudioConfiguration()
        self.setEncodingAudioProfile()
        self.session!.reloadAudioCaptureConfiguration(self.audioCaptureConfiguration!, streamingConfiguration: self.audioStreamingConfiguration!)
    }
    public func enableCamera(_ enable: Bool) {
        self.settings!.enableCamera = enable
    }
    public func enableMic(_ enable: Bool) {
        self.settings!.enableMic = enable
    }
    public func setOrientation(_ newValue: String) -> UTSPromise<Void> {
        return UTSPromise({
        () -> Void in
        self.settings!.orientation = newValue
        }, Void.self)
    }
    public func togglePictureStreaming() -> Bool {
        return true
    }
    public func toggleTorch() -> Bool {
        var result = true
        do {
            var isTorchOn = self.session!.isTorchOn
            self.session!.isTorchOn = !isTorchOn
        }
         catch let e {
            var e = UTSError(e)
            result = false
        }
        return result
    }
    public func snapshot() -> UTSPromise<SnapCallbackMessage> {
        return UTSPromise({
        () -> Any? in
        return UTSPromise<SnapCallbackMessage>({
        (_ resolve, _ reject) -> Void in
        var snapshotInfo = SnapCallbackMessage(UTSJSONObject([
            "width": 0 as NSNumber,
            "height": 0 as NSNumber,
            "tempImagePath": ""
        ]))
        self.session!.getScreenshotWithCompletionHandler({
        (_ image: Optional<UIImage>) -> Void in
        var imageData = image!.jpegData(compressionQuality: 1)
        var documentsDirectory = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)[0]
        var fileURL = documentsDirectory.appendingPathComponent("""
\(UUID().uuidString).jpg
""")
        do {
            try imageData!.write(to: fileURL)
            snapshotInfo.tempImagePath = fileURL.absoluteString
            snapshotInfo.height = self.videoEncodingHeight
            snapshotInfo.width = self.videoEncodingWidth
            resolve(snapshotInfo)
        }
         catch let e {
            var e = UTSError(e)
            resolve(snapshotInfo)
        }
        })
        })
        }, SnapCallbackMessage.self)
    }
    public func sendMessage(_ msg: String) -> Bool {
        var result = true
        do {
            self.session!.pushSEIMessage(msg, repeat: 0)
        }
         catch let e {
            var e = UTSError(e)
            result = false
        }
        return result
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherContextImpl)
@objcMembers
public class LivePusherContextImpl : NSObject, LivePusherContext {
    private var element: UniElement
    private var context: UniNativeLivePusherImpl? = nil
    private var view: UIView? = nil
    private var controlCtrl: Bool = false
    public init(_ element: UniElement){
        self.element = element
        super.init()
        var view = self.element.getIOSView()! as! UIView
        var tagRawPointer = UnsafeRawPointer(bitPattern: view.tag)
        if (tagRawPointer != nil) {
            self.context = objc_getAssociatedObject(view, tagRawPointer!) as! UniNativeLivePusherImpl
        }
    }
    public func start(_ callback: LivePusherOptions?) {
        if (self.controlCtrl == false) {
            self.controlCtrl = true
            self.context!.start({
            (_ res: Bool) -> Void in
            if (res == true) {
                callback?.success?(UTSJSONObject([:]))
            } else {
                callback?.fail?(UTSJSONObject([:]))
            }
            callback?.complete?(UTSJSONObject([:]))
            self.controlCtrl = false
            })
        }
    }
    public func stop(_ callback: LivePusherOptions?) {
        if (self.controlCtrl == false) {
            self.controlCtrl = true
            self.context!.stop().then({
            (_ result: Bool) -> Void in
            if (result == true) {
                callback?.success?(UTSJSONObject([:]))
            } else {
                callback?.fail?(UTSJSONObject([:]))
            }
            callback?.complete?(UTSJSONObject([:]))
            self.controlCtrl = false
            })
        }
    }
    public func switchCamera(_ callback: LivePusherOptions?) {
        var result = self.context!.switchCamera()
        if (result == true) {
            callback?.success?(UTSJSONObject([:]))
        } else {
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func toggleTorch(_ callback: LivePusherOptions?) {
        var result = self.context!.toggleTorch()
        if (result == true) {
            callback?.success?(UTSJSONObject([:]))
        } else {
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func pause(_ callback: LivePusherOptions?) {
        self.context!.pause().then({
        (_ result: Bool) -> Void in
        if (result == true) {
            callback?.success?(UTSJSONObject([:]))
        } else {
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
        })
    }
    public func resume(_ callback: LivePusherOptions?) {
        self.context!.resume().then({
        (_ result: Bool) -> Void in
        if (result == true) {
            callback?.success?(UTSJSONObject([:]))
        } else {
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
        })
    }
    public func getMaxZoom(_ callback: LivePusherOptions?) {
        do {
            var maxZoom = self.context!.getMaxZoom()
            callback?.success?(UTSJSONObject([
                "zoom": maxZoom
            ]))
        }
         catch let e {
            var e = UTSError(e)
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func setZoom(_ zoom: NSNumber, _ callback: LivePusherOptions?) {
        do {
            self.context!.setZoom(zoom)
            callback?.success?(UTSJSONObject([:]))
        }
         catch let e {
            var e = UTSError(e)
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func snapshot(_ callback: LivePusherOptions?) {
        self.context!.snapshot().then({
        (_ info: SnapCallbackMessage) -> Void in
        if (info.tempImagePath == "") {
            callback?.fail?(UTSJSONObject([:]))
        } else {
            callback?.success?(UTSJSONObject([
                "width": info.width,
                "height": info.height,
                "tempImagePath": info.tempImagePath
            ]))
        }
        callback?.complete?(UTSJSONObject([:]))
        })
    }
    public func startPreview(_ callback: LivePusherOptions?) {
        var result = self.context!.startPreview()
        if (result == true) {
            callback?.success?(UTSJSONObject([:]))
        } else {
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func stopPreview(_ callback: LivePusherOptions?) {
        var result = self.context!.stopPreview()
        if (result == true) {
            callback?.success?(UTSJSONObject([:]))
        } else {
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func sendMessage(_ msg: String, _ callback: LivePusherOptions?) {
        var result = self.context!.sendMessage(msg)
        if (result == true) {
            callback?.success?(UTSJSONObject([:]))
        } else {
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
}
public var LivePusherGetNativeViewElemet = {
(_ element: UniElement?) -> UniNativeViewElement? in
if (element == nil) {
    return nil
}
if (UTSiOS.instanceof(element, UniNativeViewElement.self)) {
    return element as! UniNativeViewElement
}
for item in resolveUTSKeyIterator(element!.children){
    var tmp = LivePusherGetNativeViewElemet(item)
    if (tmp != nil) {
        return tmp
    }
}
return nil
}
public var createLivePusherContext: CreateLivePusherContext = {
(_ id: String, _ component: ComponentPublicInstance?) -> LivePusherContext? in
var element: UniNativeViewElement? = nil
var e: UniElement? = nil
if (component == nil) {
    e = DCloudUTSExtAPI.getElementById(id)
} else {
    e = component?.__$$el as! UniElement?
}
if (UTSiOS.instanceof(e, UniNativeViewElement.self)) {
    element = e as! UniNativeViewElement?
} else {
    element = LivePusherGetNativeViewElemet(e)
}
if (element == nil) {
    return nil
}
return LivePusherContextImpl(element!)
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherContextSettingsJSONObject)
@objcMembers
public class LivePusherContextSettingsJSONObject : NSObject {
    public var url: String!
    public var devicePosition: String!
    public var mode: String!
    public var localMirror: String!
    public var remoteMirror: Bool = false
    public var autoFocus: Bool = false
    public var muted: Bool = false
    public var orientation: String!
    public var beauty: NSNumber!
    public var whiten: NSNumber!
    public var enableCamera: Bool = false
    public var enableMic: Bool = false
    public var audioQuality: String!
    public var minBitrate: NSNumber!
    public var maxBitrate: NSNumber!
    public var audioVolumeType: String!
    public var aspect: String!
    public var backgroundMute: Bool = false
    public var waitingImage: String!
    public var zoom: NSNumber!
    public var videoWidth: NSNumber!
    public var videoHeight: NSNumber!
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherOptionsJSONObject)
@objcMembers
public class LivePusherOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniLivePusherUniLivePusherElementByJs)
@objcMembers
public class UniLivePusherElementByJs : UniLivePusherElement {
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherImplByJs)
@objcMembers
public class LivePusherImplByJs : LivePusherImpl {
    public init(_ element: UniNativeViewElement, _ settings: LivePusherContextSettingsJSONObject, _ _byJs: Bool = true){
        super.init(element, LivePusherContextSettings(UTSJSONObject([
            "url": settings.url,
            "devicePosition": settings.devicePosition,
            "mode": settings.mode,
            "localMirror": settings.localMirror,
            "remoteMirror": settings.remoteMirror,
            "autoFocus": settings.autoFocus,
            "muted": settings.muted,
            "orientation": settings.orientation,
            "beauty": settings.beauty,
            "whiten": settings.whiten,
            "enableCamera": settings.enableCamera,
            "enableMic": settings.enableMic,
            "audioQuality": settings.audioQuality,
            "minBitrate": settings.minBitrate,
            "maxBitrate": settings.maxBitrate,
            "audioVolumeType": settings.audioVolumeType,
            "aspect": settings.aspect,
            "backgroundMute": settings.backgroundMute,
            "waitingImage": settings.waitingImage,
            "zoom": settings.zoom,
            "videoWidth": settings.videoWidth,
            "videoHeight": settings.videoHeight
        ])))
    }
    public func startByJs(_ callback: UTSCallback) -> Void {
        return self.start({
        (_ result: Bool) -> Void in
        callback(result)
        })
    }
    public func stopByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.stop().then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func pauseByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.pause().then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func resumeByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.resume().then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func destroyByJs() {
        return self.destroy()
    }
    public func setWaitingImageByJs(_ url: String) {
        return self.setWaitingImage(url)
    }
    public func setStreamStatusListenerByJs(_ listener: UTSCallback) {
        return self.setStreamStatusListener({
        (_ info: UniLivePusherNetstatusEvent) -> Void in
        listener(info)
        })
    }
    public func setStreamingErrorListenerByJs(_ listener: UTSCallback) {
        return self.setStreamingErrorListener({
        (_ info: UniLivePusherErrorEvent) -> Void in
        listener(info)
        })
    }
    public func setStreamingStateListenerByJs(_ listener: UTSCallback) {
        return self.setStreamingStateListener({
        (_ info: UniLivePusherStatechangeEvent) -> Void in
        listener(info)
        })
    }
    public func switchCameraByJs() -> Bool {
        return self.switchCamera()
    }
    public func startPreviewByJs() -> Bool {
        return self.startPreview()
    }
    public func stopPreviewByJs() -> Bool {
        return self.stopPreview()
    }
    public func updateFaceBeautySettingByJs(_ beauty: NSNumber, _ whiten: NSNumber) {
        return self.updateFaceBeautySetting(beauty, whiten)
    }
    public func setEncodingMirrorByJs(_ mirror: Bool) {
        return self.setEncodingMirror(mirror)
    }
    public func setPreviewMirrorByJs(_ mirror: String) {
        return self.setPreviewMirror(mirror)
    }
    public func muteByJs(_ mute: Bool) {
        return self.mute(mute)
    }
    public func setBackgroundMuteByJs(_ mute: Bool) {
        return self.setBackgroundMute(mute)
    }
    public func switchModeByJs(_ mode: String, utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.switchMode(mode).then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func setVideoHeightByJs(_ height: NSNumber, utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.setVideoHeight(height).then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func setVideoWidthByJs(_ width: NSNumber, utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.setVideoWidth(width).then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func setZoomByJs(_ zoom: NSNumber) {
        return self.setZoom(zoom)
    }
    public func getMaxZoomByJs() -> NSNumber {
        return self.getMaxZoom()
    }
    public func setMinBitrateByJs(_ bitrate: NSNumber, utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.setMinBitrate(bitrate).then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func setMaxBitrateByJs(_ bitrate: NSNumber, utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.setMaxBitrate(bitrate).then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func setAudioVolumeTypeByJs(_ type: String) {
        return self.setAudioVolumeType(type)
    }
    public func setContinuousFocusModeEnabledByJs(_ enable: Bool) {
        return self.setContinuousFocusModeEnabled(enable)
    }
    public func setCameraPrvSizeRatioByJs(_ ratio: String) {
        return self.setCameraPrvSizeRatio(ratio)
    }
    public func setAudioQualityByJs(_ audioQuality: String) {
        return self.setAudioQuality(audioQuality)
    }
    public func enableCameraByJs(_ enable: Bool) {
        return self.enableCamera(enable)
    }
    public func enableMicByJs(_ enable: Bool) {
        return self.enableMic(enable)
    }
    public func setOrientationByJs(_ newValue: String, utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.setOrientation(newValue).then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func togglePictureStreamingByJs() {
        return self.togglePictureStreaming()
    }
    public func toggleTorchByJs() -> Bool {
        return self.toggleTorch()
    }
    public func snapshotByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        self.snapshot().then({
        (_ res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (_ err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func sendMessageByJs(_ msg: String) -> Bool {
        return self.sendMessage(msg)
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherContextImplByJs)
@objcMembers
public class LivePusherContextImplByJs : LivePusherContextImpl {
    public func startByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.start(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func stopByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.stop(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func switchCameraByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.switchCamera(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func toggleTorchByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.toggleTorch(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func pauseByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.pause(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func resumeByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.resume(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func getMaxZoomByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.getMaxZoom(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func setZoomByJs(_ zoom: NSNumber, _ callback: LivePusherOptionsJSONObject?) {
        return self.setZoom(zoom, callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func snapshotByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.snapshot(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func startPreviewByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.startPreview(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func stopPreviewByJs(_ callback: LivePusherOptionsJSONObject?) {
        return self.stopPreview(callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func sendMessageByJs(_ msg: String, _ callback: LivePusherOptionsJSONObject?) {
        return self.sendMessage(msg, callback != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
}
public func createLivePusherContextByJs(_ livePusherId: String, _ component: ComponentPublicInstance?) -> Int {
    var ins = createLivePusherContext(livePusherId, component)
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(LivePusherContextByJsProxy(ins!)) : 0
}
@objc(UTSSDKModulesDCloudUniLivePusherLivePusherContextByJsProxy)
@objcMembers
public class LivePusherContextByJsProxy : NSObject {
    public var __instance: LivePusherContext
    public init(_ ins: LivePusherContext){
        __instance = ins
    }
    public func startByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.start(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func stopByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.stop(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func switchCameraByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.switchCamera(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func toggleTorchByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.toggleTorch(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func pauseByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.pause(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func resumeByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.resume(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func getMaxZoomByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.getMaxZoom(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func setZoomByJs(_ zoom: NSNumber, _ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.setZoom(zoom, options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func startPreviewByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.startPreview(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func stopPreviewByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.stopPreview(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func snapshotByJs(_ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.snapshot(options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func sendMessageByJs(_ message: String, _ options: LivePusherOptionsJSONObject?) -> Void {
        return __instance.sendMessage(message, options != nil ? LivePusherOptions(UTSJSONObject([
            "success": {
            (_ res: LivePusherSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePusherFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePusherComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
}
@objc(UTSSDKModulesDCloudUniLivePusherIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniLivePusherIndexSwift : NSObject {
    public static func s_createLivePusherContextByJs(_ livePusherId: String, _ component: ComponentPublicInstance?) -> Int {
        return createLivePusherContextByJs(livePusherId, component)
    }
}
