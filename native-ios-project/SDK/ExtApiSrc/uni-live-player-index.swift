import AVFAudio
import Accessibility
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import Swift
import UIKit
@_implementationOnly import qplayer2_core
import DCloudUTSExtAPI
@objc(UTSSDKModulesDCloudUniLivePlayerStreamingContextListener)
@objcMembers
public class StreamingContextListener : NSObject, UTSObject {
    public var play: (() -> Void)!
    public var pause: (() -> Void)!
    public var replay: (() -> Void)!
    public var requestFullScreen: ((_ callback: LivePlayerOptions?) -> Void)!
    public var exitFullScreen: ((_ callback: LivePlayerOptions?) -> Void)!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "play":
                    self.play = try! utsSubscriptCheckValue(newValue)
                case "pause":
                    self.pause = try! utsSubscriptCheckValue(newValue)
                case "replay":
                    self.replay = try! utsSubscriptCheckValue(newValue)
                case "requestFullScreen":
                    self.requestFullScreen = try! utsSubscriptCheckValue(newValue)
                case "exitFullScreen":
                    self.exitFullScreen = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.play = obj["play"] as! (() -> Void)
        self.pause = obj["pause"] as! (() -> Void)
        self.replay = obj["replay"] as! (() -> Void)
        self.requestFullScreen = obj["requestFullScreen"] as! ((_ callback: LivePlayerOptions?) -> Void)
        self.exitFullScreen = obj["exitFullScreen"] as! ((_ callback: LivePlayerOptions?) -> Void)
    }
}
@objc(UTSSDKModulesDCloudUniLivePlayerStreamingBufferingListener)
@objcMembers
public class StreamingBufferingListener : NSObject, UTSObject {
    public var onBufferingStart: (() -> Void)!
    public var onBufferingEnd: (() -> Void)!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "onBufferingStart":
                    self.onBufferingStart = try! utsSubscriptCheckValue(newValue)
                case "onBufferingEnd":
                    self.onBufferingEnd = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.onBufferingStart = obj["onBufferingStart"] as! (() -> Void)
        self.onBufferingEnd = obj["onBufferingEnd"] as! (() -> Void)
    }
}
public typealias StreamingMuteChangedListener = (_ isMute: Bool) -> Void
public typealias StreamingProgressListener = (_ progress: NSNumber, _ duration: NSNumber) -> Void
public typealias LivePlayerStreamingStateListener = (_ info: UniLivePlayerStatechangeEvent) -> Void
public typealias LivePlayerStreamingErrorListener = (_ info: UniLivePlayerErrorEvent) -> Void
public typealias StreamingFullScreenChangedListener = (_ info: UniLivePlayerFullscreenchangeEvent) -> Void
public protocol LivePlayerEvent {
    var bubbles: Bool { get set }
    var cancelable: Bool { get set }
    var type: String { get set }
    var target: UniElement? { get set }
    var currentTarget: UniElement? { get set }
    var timeStamp: NSNumber { get set }
    func stopPropagation()
    func preventDefault()
}
public protocol UniLivePlayerStatechangeEvent : LivePlayerEvent {
    var detail: UniLivePlayerStatechangeEventDetail { get }
}
@objc(UTSSDKModulesDCloudUniLivePlayerUniLivePlayerStatechangeEventDetail)
@objcMembers
public class UniLivePlayerStatechangeEventDetail : NSObject, UTSObject {
    public var code: LivePlayerStateCode!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "code":
                    self.code = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.code = obj["code"] as! LivePlayerStateCode
    }
}
public typealias LivePlayerStateCode = NSNumber
public protocol UniLivePlayerFullscreenchangeEvent : LivePlayerEvent {
    var detail: UniLivePlayerFullscreenchangeEventDetail { get }
}
@objc(UTSSDKModulesDCloudUniLivePlayerUniLivePlayerFullscreenchangeEventDetail)
@objcMembers
public class UniLivePlayerFullscreenchangeEventDetail : NSObject, UTSObject {
    public var direction: String!
    public var fullScreen: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "direction":
                    self.direction = try! utsSubscriptCheckValue(newValue)
                case "fullScreen":
                    self.fullScreen = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.direction = obj["direction"] as! String
        self.fullScreen = obj["fullScreen"] as! Bool
    }
}
public protocol UniLivePlayerErrorEvent : LivePlayerEvent {
    var detail: UniLivePlayerError { get }
}
public protocol UniLivePlayerError : IUniError {
    var errCode: LivePlayerErrorCode { get set }
}
public typealias LivePlayerErrorCode = NSNumber
public typealias LivePlayerSuccess = UTSJSONObject
public typealias LivePlayerSuccessCallback = (_ res: LivePlayerSuccess) -> Void
public typealias LivePlayerFail = UTSJSONObject
public typealias LivePlayerFailCallback = (_ res: LivePlayerFail) -> Void
public typealias LivePlayerComplete = Any
public typealias LivePlayerCompleteCallback = (_ res: LivePlayerComplete) -> Void
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerOptions)
@objcMembers
public class LivePlayerOptions : NSObject, UTSObject {
    public var success: LivePlayerSuccessCallback?
    public var fail: LivePlayerFailCallback?
    public var complete: LivePlayerCompleteCallback?
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
        self.success = obj["success"] as! LivePlayerSuccessCallback?
        self.fail = obj["fail"] as! LivePlayerFailCallback?
        self.complete = obj["complete"] as! LivePlayerCompleteCallback?
    }
}
public protocol LivePlayerContext {
    func play(_ options: LivePlayerOptions?)
    func pause(_ options: LivePlayerOptions?)
    func stop(_ options: LivePlayerOptions?)
    func resume(_ options: LivePlayerOptions?)
    func mute(_ options: LivePlayerOptions?)
    func requestFullScreen(_ options: LivePlayerOptions?)
    func exitFullScreen(_ options: LivePlayerOptions?)
}
public typealias CreateLivePlayerContext = (_ livePlayerId: String, _ component: ComponentPublicInstance?) -> LivePlayerContext?
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerCustomEvent)
@objcMembers
public class LivePlayerCustomEvent : NSObject {
    public var bubbles: Bool = false
    public var cancelable: Bool = false
    public var type: String = ""
    public var target: UniElement? = nil
    public var currentTarget: UniElement? = nil
    public var timeStamp: NSNumber = 0
    public func stopPropagation() -> Void {}
    public func preventDefault() -> Void {}
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerStatechangeEventImpl)
@objcMembers
public class LivePlayerStatechangeEventImpl : LivePlayerCustomEvent, UniLivePlayerStatechangeEvent {
    public var detail: UniLivePlayerStatechangeEventDetail
    public init(_ detail: UniLivePlayerStatechangeEventDetail){
        self.detail = detail
    }
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerErrorEventImpl)
@objcMembers
public class LivePlayerErrorEventImpl : LivePlayerCustomEvent, UniLivePlayerErrorEvent {
    public var detail: UniLivePlayerError
    public init(_ detail: UniLivePlayerError){
        self.detail = detail
    }
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerFullscreenchangeEventImpl)
@objcMembers
public class LivePlayerFullscreenchangeEventImpl : LivePlayerCustomEvent, UniLivePlayerFullscreenchangeEvent {
    public var detail: UniLivePlayerFullscreenchangeEventDetail
    public init(_ detail: UniLivePlayerFullscreenchangeEventDetail){
        self.detail = detail
    }
}
public var UniLivePlayerErrorSubject = "uni-live-player"
public var LivePlayerUniErrors: Map<LivePlayerErrorCode, String> = Map([
    [
        3001,
        "当前视频格式不支持，视频无法播放"
    ],
    [
        3002,
        "视频解码失败"
    ],
    [
        3003,
        "不支持的解码格式"
    ],
    [
        3004,
        "重连失败，请检查网络情况"
    ],
    [
        3005,
        "视频播放失败,请检查网络或视频资源"
    ]
])
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerErrorImpl)
@objcMembers
public class LivePlayerErrorImpl : UniError, UniLivePlayerError {
    public init(_ errCode: LivePlayerErrorCode){
        super.init()
        self.errSubject = UniLivePlayerErrorSubject
        self.errCode = errCode
        self.errMsg = LivePlayerUniErrors[errCode] ?? ""
    }
}
public var QPLAYER_STATE_NONE: NSNumber = 10000
public var QPLAYER_STATE_INIT: NSNumber = 10001
public var QPLAYER_STATE_PREPARE: NSNumber = 10002
public var QPLAYER_STATE_PLAYING: NSNumber = 10004
public var QPLAYER_STATE_PAUSED_RENDER: NSNumber = 10006
public var QPLAYER_STATE_COMPLETED: NSNumber = 10007
public var QPLAYER_STATE_SEEKING: NSNumber = 10008
public var QPLAYER_STATE_STOPPED: NSNumber = 10009
public var QPLAYER_STATE_ERROR: NSNumber = 10010
public var QPLAYER_STATE_END: NSNumber = 10011
public var QPLAYER_STATE_MEDIA_ITEM_PREPARE: NSNumber = 10012
public var QPLAYER_STATE_RELEASE: NSNumber = 10013
@objc(UTSSDKModulesDCloudUniLivePlayerUniLivePlayerElement)
@objcMembers
public class UniLivePlayerElement : UniElementImpl {
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerVideoContext)
@objcMembers
public class LivePlayerVideoContext : NSObject {
    private var livePlayer: UniNativeLivePlayerVideoContext? = nil
    public init(_ element: UniNativeViewElement){
        self.livePlayer = UniNativeLivePlayerVideoContext(element)
    }
    public func initQPlayer(_ url: String, _ startPos: NSNumber, _ isLive: Bool, _ controls: Bool) {
        self.livePlayer?.initQPlayer(url, startPos, isLive, controls)
    }
    public func setStreamingStateListener(_ listener: @escaping LivePlayerStreamingStateListener) {
        self.livePlayer?.setStreamingStateListener(listener)
    }
    public func setStreamingProgressListener(_ listener: @escaping StreamingProgressListener) {
        self.livePlayer?.setStreamingProgressListener(listener)
    }
    public func setStreamingMuteChangedListener(_ listener: @escaping StreamingMuteChangedListener) {
        self.livePlayer?.setStreamingMuteChangedListener(listener)
    }
    public func setStreamingErrorListener(_ listener: @escaping LivePlayerStreamingErrorListener) {
        self.livePlayer?.setStreamingErrorListener(listener)
    }
    public func setSrc(_ url: String) {
        self.livePlayer?.setSrc(url)
    }
    public func play() {
        self.livePlayer?.play()
    }
    public func pause() {
        self.livePlayer?.pause()
    }
    public func resumeRender() {
        self.livePlayer?.resumeRender()
    }
    public func stop() {
        self.livePlayer?.stop()
    }
    public func configureBackgroundMute(_ mute: Bool) {
        self.livePlayer?.configureBackgroundMute(mute)
    }
    public func configureSoundMode(_ mode: String) {
        self.livePlayer?.configureSoundMode(mode)
    }
    public func seek(_ position: NSNumber) {
        self.livePlayer?.seek(position)
    }
    public func playerRelease() {
        self.livePlayer?.playerRelease()
    }
    public func setMute(_ mute: Bool) {
        self.livePlayer?.setMute(mute)
    }
    public func setSpeed(_ speed: NSNumber) {
        self.livePlayer?.setSpeed(speed)
    }
    public func destroy() {
        self.livePlayer?.destroy()
    }
    public func setStartAction(_ startAction: String) {
        self.livePlayer?.setStartAction(startAction)
    }
    public func setCodec(_ decoderType: String) {
        self.livePlayer?.setCodec(decoderType)
    }
    public func setRenderRatio(_ ratio: String) {
        self.livePlayer?.setRenderRatio(ratio)
    }
    public func setSeekMode(_ mode: String) {
        self.livePlayer?.setSeekMode(mode)
    }
    public func fullscreenchange(_ direction: String, _ fullScreen: Bool) {
        self.livePlayer?.fullscreenchange(direction, fullScreen)
    }
    public func setPlayerContextListener(_ listener: StreamingContextListener) {
        self.livePlayer?.setPlayerContextListener(listener)
    }
    public func setPlayerBufferingChangeListener(_ listener: StreamingBufferingListener) {
        self.livePlayer?.setPlayerBufferingChangeListener(listener)
    }
    public func setStreamingFullScreenChangedListener(_ listener: @escaping StreamingFullScreenChangedListener) {
        self.livePlayer?.setStreamingFullScreenChangedListener(listener)
    }
}
@objc(UTSSDKModulesDCloudUniLivePlayerUniNativeLivePlayerVideoContext)
@objcMembers
private class UniNativeLivePlayerVideoContext : NSObject, QIPlayerRenderListener, QIPlayerSeekListener, QIPlayerVideoDecodeListener, QIPlayerMediaNetworkListener, QIPlayerFormatListener, QIPlayerStateChangeListener, QIPlayerAudioListener, QIPlayerProgressListener, QIPlayerBufferingListener {
    public var element: UniNativeViewElement
    public var qplayerView: QPlayerView? = nil
    public var mBufferingListener: StreamingBufferingListener? = nil
    public var mContextListener: StreamingContextListener? = nil
    private var streamingFullScreenChangedListener: StreamingFullScreenChangedListener = {
    (_ info: UniLivePlayerFullscreenchangeEvent) -> Void in
    }
    private var streamingErrorListener: LivePlayerStreamingErrorListener = {
    (_ info: UniLivePlayerErrorEvent) -> Void in
    }
    private var streamingMuteChangedListener: StreamingMuteChangedListener = {
    (_ isMute: Bool) -> Void in
    }
    private var streamingProgressListener: StreamingProgressListener = {
    (_ progress: NSNumber, _ duration: NSNumber) -> Void in
    }
    private var streamingStateListener: LivePlayerStreamingStateListener = {
    (_ info: UniLivePlayerStatechangeEvent) -> Void in
    }
    public var url: String = ""
    public var startPos: NSNumber = 0
    public var isLive: Bool = false
    public var controls: Bool = false
    public var rawMuted: Bool = false
    public var isMute: Bool = false
    public var backgroundMute: Bool = false
    public var currentState: NSNumber = QPLAYER_STATE_NONE
    public var audioSession: AVAudioSession = AVAudioSession.sharedInstance()
    public init(_ element: UniNativeViewElement){
        self.element = element
        super.init()
        var documentsDir = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).last?.path
        self.qplayerView = QPlayerView(frame: CGRect(x: 1, y: 1, width: 1, height: 1), appVersion: "uni-app-video", localStorageDir: documentsDir!, logLevel: QLogLevel.LOG_VERBOSE, authorid: "com.qiniu.uni-app-video")
        var value: NSNumber = 0
        var pointer = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        pointer.pointee = value.toInt()
        var rawPointer = UnsafeRawPointer(pointer)
        self.qplayerView!.tag = Int(bitPattern: rawPointer)
        objc_setAssociatedObject(self.qplayerView!, rawPointer, self, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        self.element.bindIOSView(self.qplayerView!)
        NotificationCenter.default.addObserver(self, selector: Selector("appDidEnterBackground"), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector("appWillEnterForeground"), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    @objc
    private func appDidEnterBackground() {
        if (self.backgroundMute == true) {
            self.rawMuted = self.isMute
            self.setMute(true)
        }
    }
    @objc
    private func appWillEnterForeground() {
        if (self.backgroundMute == true) {
            self.setMute(self.rawMuted)
        }
    }
    public func initQPlayer(_ url: String, _ startPos: NSNumber, _ isLive: Bool, _ controls: Bool) {
        self.url = url
        self.startPos = startPos
        self.isLive = isLive
        self.qplayerView?.controlHandler.addPlayerStateListener(listener: self)
        self.qplayerView?.controlHandler.addPlayerAudioListener(listener: self)
        self.qplayerView?.controlHandler.addPlayerProgressChangeListener(listener: self)
        self.qplayerView?.controlHandler.addPlayerBufferingChangeListener(listener: self)
        self.qplayerView?.controlHandler.addPlayerFormatListener(listener: self)
        self.qplayerView?.controlHandler.addPlayerMediaNetworkListener(listener: self)
        self.qplayerView?.controlHandler.addPlayerVideoDecodeTypeListener(listener: self)
        self.qplayerView?.controlHandler.addPlayerSeekListener(listener: self)
        self.qplayerView?.renderHandler.addPlayerRenderListener(listener: self)
    }
    public func onFormatNotSupport(_ context: QPlayerContext) {
        var event: UniLivePlayerErrorEvent = LivePlayerErrorEventImpl(LivePlayerErrorImpl(3001))
        self.streamingErrorListener(event)
    }
    public func onFirstFrameRendered(_ context: QPlayerContext, elapsedTime: Int64) {}
    public func onReconnectEnd(_ context: QPlayerContext, userType: String, urlType: QPlayerURLType, url: String, retryTime: Int64, error: QPlayerOpenError) {
        if (error == QPlayerOpenError.QPLAYER_OPEN_ERROR_NONE) {
            return
        }
        var event: UniLivePlayerErrorEvent = LivePlayerErrorEventImpl(LivePlayerErrorImpl(3004))
        self.streamingErrorListener(event)
    }
    public func onOpenFailed(_ context: QPlayerContext, userType: String, urlType: QPlayerURLType, url: String, error: QPlayerOpenError) {
        var event: UniLivePlayerErrorEvent = LivePlayerErrorEventImpl(LivePlayerErrorImpl(3005))
        self.streamingErrorListener(event)
    }
    public func onBufferingStart(_ context: QPlayerContext) {
        self.mBufferingListener?.onBufferingStart()
    }
    public func onBufferingEnd(_ context: QPlayerContext) {
        self.mBufferingListener?.onBufferingEnd()
    }
    public func onMuteChanged(_ context: QPlayerContext, isMute: Bool) {
        self.isMute = isMute
        self.streamingMuteChangedListener(isMute.valueOf())
    }
    public func onProgressChanged(_ context: QPlayerContext, progress: Int64, duration: Int64) {
        self.streamingProgressListener(NSNumber(progress), NSNumber(duration))
    }
    public func onDecodeFailed(_ context: QPlayerContext, retry: Bool) {
        var event: UniLivePlayerErrorEvent = LivePlayerErrorEventImpl(LivePlayerErrorImpl(3002))
        self.streamingErrorListener(event)
    }
    public func notSupportCodecFormat(_ context: QPlayerContext, codec: Int64) {
        var event: UniLivePlayerErrorEvent = LivePlayerErrorEventImpl(LivePlayerErrorImpl(3003))
        self.streamingErrorListener(event)
    }
    public func onSeekFailed(_ context: QPlayerContext) {}
    public func onStateChange(_ context: QPlayerContext, state: QPlayerState) {
        var stateNum = QPLAYER_STATE_NONE
        switch(state){
            case QPlayerState.QPLAYER_STATE_NONE:
                stateNum = QPLAYER_STATE_NONE
            case QPlayerState.QPLAYER_STATE_INIT:
                stateNum = QPLAYER_STATE_INIT
            case QPlayerState.QPLAYER_STATE_PREPARE:
                stateNum = QPLAYER_STATE_PREPARE
            case QPlayerState.QPLAYER_STATE_PLAYING:
                stateNum = QPLAYER_STATE_PLAYING
            case QPlayerState.QPLAYER_STATE_PAUSED_RENDER:
                stateNum = QPLAYER_STATE_PAUSED_RENDER
            case QPlayerState.QPLAYER_STATE_COMPLETED:
                stateNum = QPLAYER_STATE_COMPLETED
            case QPlayerState.QPLAYER_STATE_SEEKING:
                stateNum = QPLAYER_STATE_SEEKING
            case QPlayerState.QPLAYER_STATE_STOPPED:
                stateNum = QPLAYER_STATE_STOPPED
            case QPlayerState.QPLAYER_STATE_ERROR:
                stateNum = QPLAYER_STATE_ERROR
            case QPlayerState.QPLAYER_STATE_END:
                stateNum = QPLAYER_STATE_END
            case QPlayerState.QPLAYER_STATE_MEDIA_ITEM_PREPARE:
                stateNum = QPLAYER_STATE_MEDIA_ITEM_PREPARE
            case QPlayerState.QPLAYER_STATE_RELEASE:
                stateNum = QPLAYER_STATE_RELEASE
            default:
                stateNum = QPLAYER_STATE_NONE
                break
        }
        self.currentState = stateNum
        var event = LivePlayerStatechangeEventImpl(UniLivePlayerStatechangeEventDetail(UTSJSONObject([
            "code": stateNum
        ])))
        self.streamingStateListener(event)
    }
    public func setStreamingStateListener(_ listener: @escaping LivePlayerStreamingStateListener) {
        self.streamingStateListener = listener
    }
    public func setStreamingProgressListener(_ listener: @escaping StreamingProgressListener) {
        self.streamingProgressListener = listener
    }
    public func setStreamingMuteChangedListener(_ listener: @escaping StreamingMuteChangedListener) {
        self.streamingMuteChangedListener = listener
    }
    public func setStreamingErrorListener(_ listener: @escaping LivePlayerStreamingErrorListener) {
        self.streamingErrorListener = listener
    }
    public func play() {
        var builder: QMediaModelBuilder = QMediaModelBuilder(isLive: self.isLive)
        builder.addStreamElement(userType: "", urlType: QPlayerURLType.QURL_TYPE_QAUDIO_AND_VIDEO, url: self.url, quality: 0, isSelected: true, backupUrl: "", referer: "", renderType: QPlayerRenderType.QPLAYER_RENDER_TYPE_PLANE)
        var model: QMediaModel = builder.build()
        self.qplayerView?.controlHandler.playMediaModel(pmediaModel: model, startPos: self.startPos.toInt64())
    }
    public func setSrc(_ url: String) {
        self.url = url
    }
    public func pause() {
        self.qplayerView?.controlHandler.pauseRender()
    }
    public func resumeRender() {
        self.qplayerView?.controlHandler.resumeRender()
    }
    public func stop() {
        self.qplayerView?.controlHandler.stop()
    }
    public func configureBackgroundMute(_ mute: Bool) {
        self.backgroundMute = mute
    }
    public func configureSoundMode(_ mode: String) {
        do {
            try self.audioSession.setCategory(AVAudioSession.Category.playAndRecord)
        }
         catch let e {
            var e = UTSError(e)
            console.error("configureSoundMode setCategory error", e)
        }
        if (mode == "speaker") {
            do {
                try self.audioSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            } catch let e {
                var e = UTSError(e)
                console.error("configureSoundMode overrideOutputAudioPort error", e)
            }
        } else {
            do {
                try self.audioSession.overrideOutputAudioPort(AVAudioSession.PortOverride.none)
            }
             catch let e {
                var e = UTSError(e)
                console.error("configureSoundMode overrideOutputAudioPort error", e)
            }
        }
        do {
            try self.audioSession.setCategory(AVAudioSession.Category.playAndRecord)
        }
         catch let e {
            var e = UTSError(e)
            console.error("configureSoundMode setCategory error", e)
        }
        do {
            try self.audioSession.setActive(true)
        }
         catch let e {
            var e = UTSError(e)
            console.error("configureSoundMode setActive error", e)
        }
    }
    public func seek(_ position: NSNumber) {
        self.qplayerView?.controlHandler.seek(position: (position * 1000).toInt64())
    }
    public func playerRelease() {
        self.qplayerView?.controlHandler.playerRelease()
    }
    public func setMute(_ mute: Bool) {
        self.qplayerView?.controlHandler.setMute(isMute: mute)
    }
    public func setSpeed(_ speed: NSNumber) {
        self.qplayerView?.controlHandler.setSpeed(speed: (speed as! Float))
    }
    public func destroy() {
        console.log("destroy")
        self.mBufferingListener = nil
        UTSiOS.destroyInstance(self)
    }
    public func setStartAction(_ startAction: String) {
        if (startAction == "pause") {
            self.qplayerView?.controlHandler.setStartAction(action: QPlayerStart.QPLAYER_START_SETTING_PAUSE)
        } else if (startAction == "playing") {
            self.qplayerView?.controlHandler.setStartAction(action: QPlayerStart.QPLAYER_START_SETTING_PLAYING)
        }
    }
    public func setCodec(_ decoderType: String) {
        if (decoderType == "auto") {
            self.qplayerView?.controlHandler.setDecoderType(type: QPlayerDecoder.QPLAYER_DECODER_SETTING_AUTO)
        } else if (decoderType == "hardware") {
            self.qplayerView?.controlHandler.setDecoderType(type: QPlayerDecoder.QPLAYER_DECODER_SETTING_HARDWARE_PRIORITY)
        } else if (decoderType == "software") {
            self.qplayerView?.controlHandler.setDecoderType(type: QPlayerDecoder.QPLAYER_DECODER_SETTING_SOFT_PRIORITY)
        }
    }
    public func setRenderRatio(_ ratio: String) {
        if (ratio == "contain") {
            self.qplayerView?.renderHandler.setRenderRatio(ratio: QPlayerRenderRatio.QPLAYER_RATIO_SETTING_AUTO)
        } else if (ratio == "fill") {
            self.qplayerView?.renderHandler.setRenderRatio(ratio: QPlayerRenderRatio.QPLAYER_RATIO_SETTING_STRETCH)
        } else if (ratio == "cover") {
            self.qplayerView?.renderHandler.setRenderRatio(ratio: QPlayerRenderRatio.QPLAYER_RATIO_SETTING_FULL_SCREEN)
        } else if (ratio == "16:9") {
            self.qplayerView?.renderHandler.setRenderRatio(ratio: QPlayerRenderRatio.QPLAYER_RATIO_SETTING_16_9)
        } else if (ratio == "4:3") {
            self.qplayerView?.renderHandler.setRenderRatio(ratio: QPlayerRenderRatio.QPLAYER_RATIO_SETTING_4_3)
        }
    }
    public func setSeekMode(_ mode: String) {
        if (mode == "normal") {
            self.qplayerView?.controlHandler.setSeekMode(mode: QPlayerSeek.QPLAYER_SEEK_SETTING_NORMAL)
        } else if (mode == "accurate") {
            self.qplayerView?.controlHandler.setSeekMode(mode: QPlayerSeek.QPLAYER_SEEK_SETTING_ACCURATE)
        }
    }
    public func fullscreenchange(_ direction: String, _ fullScreen: Bool) {
        var info: UniLivePlayerFullscreenchangeEvent = LivePlayerFullscreenchangeEventImpl(UniLivePlayerFullscreenchangeEventDetail(UTSJSONObject([
            "direction": direction,
            "fullScreen": fullScreen
        ])))
        self.streamingFullScreenChangedListener(info)
    }
    public func setPlayerContextListener(_ listener: StreamingContextListener) {
        self.mContextListener = listener
    }
    public func setPlayerBufferingChangeListener(_ listener: StreamingBufferingListener) {
        self.mBufferingListener = listener
    }
    public func setStreamingFullScreenChangedListener(_ listener: @escaping StreamingFullScreenChangedListener) {
        self.streamingFullScreenChangedListener = listener
    }
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerContextImpl)
@objcMembers
public class LivePlayerContextImpl : NSObject, LivePlayerContext {
    private var element: UniElement
    private var context: UniNativeLivePlayerVideoContext? = nil
    private var view: UIView? = nil
    private var controlCtrl: Bool = false
    public init(_ element: UniElement){
        self.element = element
        super.init()
        var view = self.element.getIOSView()! as! UIView
        var tagRawPointer = UnsafeRawPointer(bitPattern: view.tag)
        if (tagRawPointer != nil) {
            self.context = objc_getAssociatedObject(view, tagRawPointer!) as! UniNativeLivePlayerVideoContext
        }
    }
    public func play(_ callback: LivePlayerOptions?) {
        do {
            var currentState = self.context!.currentState
            if (currentState != QPLAYER_STATE_PAUSED_RENDER && currentState != QPLAYER_STATE_PLAYING && currentState != QPLAYER_STATE_SEEKING) {
                self.context!.play()
            } else {
                self.context!.resumeRender()
            }
            self.context!.mContextListener!.play()
            callback?.success?(UTSJSONObject([:]))
        }
         catch let e {
            var e = UTSError(e)
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func stop(_ callback: LivePlayerOptions?) {
        do {
            self.context!.stop()
            callback?.success?(UTSJSONObject([:]))
        }
         catch let e {
            var e = UTSError(e)
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func pause(_ callback: LivePlayerOptions?) {
        do {
            self.context!.pause()
            self.context!.mContextListener!.pause()
            callback?.success?(UTSJSONObject([:]))
        }
         catch let e {
            var e = UTSError(e)
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func resume(_ callback: LivePlayerOptions?) {
        do {
            self.context!.resumeRender()
            self.context!.mContextListener!.play()
            callback?.success?(UTSJSONObject([:]))
        }
         catch let e {
            var e = UTSError(e)
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func mute(_ callback: LivePlayerOptions?) {
        do {
            self.context!.setMute(!self.context!.isMute)
            callback?.success?(UTSJSONObject([:]))
        }
         catch let e {
            var e = UTSError(e)
            callback?.fail?(UTSJSONObject([:]))
        }
        callback?.complete?(UTSJSONObject([:]))
    }
    public func requestFullScreen(_ callback: LivePlayerOptions?) {
        self.context!.mContextListener!.requestFullScreen(callback)
    }
    public func exitFullScreen(_ callback: LivePlayerOptions?) {
        self.context!.mContextListener!.exitFullScreen(callback)
    }
}
public var LivePlayerGetNativeViewElemet = {
(_ element: UniElement?) -> UniNativeViewElement? in
if (element == nil) {
    return nil
}
if (UTSiOS.instanceof(element, UniNativeViewElement.self)) {
    return element as! UniNativeViewElement
}
for item in resolveUTSKeyIterator(element!.children){
    var tmp = LivePlayerGetNativeViewElemet(item)
    if (tmp != nil) {
        return tmp
    }
}
return nil
}
public var createLivePlayerContext: CreateLivePlayerContext = {
(_ id: String, _ component: ComponentPublicInstance?) -> LivePlayerContext? in
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
    element = LivePlayerGetNativeViewElemet(e)
}
if (element == nil) {
    return nil
}
return LivePlayerContextImpl(element!)
}
@objc(UTSSDKModulesDCloudUniLivePlayerStreamingContextListenerJSONObject)
@objcMembers
public class StreamingContextListenerJSONObject : NSObject {
    public var play: UTSCallback!
    public var pause: UTSCallback!
    public var replay: UTSCallback!
    public var requestFullScreen: UTSCallback!
    public var exitFullScreen: UTSCallback!
}
@objc(UTSSDKModulesDCloudUniLivePlayerStreamingBufferingListenerJSONObject)
@objcMembers
public class StreamingBufferingListenerJSONObject : NSObject {
    public var onBufferingStart: UTSCallback!
    public var onBufferingEnd: UTSCallback!
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerOptionsJSONObject)
@objcMembers
public class LivePlayerOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniLivePlayerUniLivePlayerElementByJs)
@objcMembers
public class UniLivePlayerElementByJs : UniLivePlayerElement {
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerVideoContextByJs)
@objcMembers
public class LivePlayerVideoContextByJs : LivePlayerVideoContext {
    public func initQPlayerByJs(_ url: String, _ startPos: NSNumber, _ isLive: Bool, _ controls: Bool) {
        return self.initQPlayer(url, startPos, isLive, controls)
    }
    public func setStreamingStateListenerByJs(_ listener: UTSCallback) {
        return self.setStreamingStateListener({
        (_ info: UniLivePlayerStatechangeEvent) -> Void in
        listener(info)
        })
    }
    public func setStreamingProgressListenerByJs(_ listener: UTSCallback) {
        return self.setStreamingProgressListener({
        (_ progress: NSNumber, _ duration: NSNumber) -> Void in
        listener(progress, duration)
        })
    }
    public func setStreamingMuteChangedListenerByJs(_ listener: UTSCallback) {
        return self.setStreamingMuteChangedListener({
        (_ isMute: Bool) -> Void in
        listener(isMute)
        })
    }
    public func setStreamingErrorListenerByJs(_ listener: UTSCallback) {
        return self.setStreamingErrorListener({
        (_ info: UniLivePlayerErrorEvent) -> Void in
        listener(info)
        })
    }
    public func setSrcByJs(_ url: String) {
        return self.setSrc(url)
    }
    public func playByJs() {
        return self.play()
    }
    public func pauseByJs() {
        return self.pause()
    }
    public func resumeRenderByJs() {
        return self.resumeRender()
    }
    public func stopByJs() {
        return self.stop()
    }
    public func configureBackgroundMuteByJs(_ mute: Bool) {
        return self.configureBackgroundMute(mute)
    }
    public func configureSoundModeByJs(_ mode: String) {
        return self.configureSoundMode(mode)
    }
    public func seekByJs(_ position: NSNumber) {
        return self.seek(position)
    }
    public func playerReleaseByJs() {
        return self.playerRelease()
    }
    public func setMuteByJs(_ mute: Bool) {
        return self.setMute(mute)
    }
    public func setSpeedByJs(_ speed: NSNumber) {
        return self.setSpeed(speed)
    }
    public func destroyByJs() {
        return self.destroy()
    }
    public func setStartActionByJs(_ startAction: String) {
        return self.setStartAction(startAction)
    }
    public func setCodecByJs(_ decoderType: String) {
        return self.setCodec(decoderType)
    }
    public func setRenderRatioByJs(_ ratio: String) {
        return self.setRenderRatio(ratio)
    }
    public func setSeekModeByJs(_ mode: String) {
        return self.setSeekMode(mode)
    }
    public func fullscreenchangeByJs(_ direction: String, _ fullScreen: Bool) {
        return self.fullscreenchange(direction, fullScreen)
    }
    public func setPlayerContextListenerByJs(_ listener: StreamingContextListenerJSONObject) {
        return self.setPlayerContextListener(StreamingContextListener(UTSJSONObject([
            "play": {
            () -> Void in
            listener.play()
            },
            "pause": {
            () -> Void in
            listener.pause()
            },
            "replay": {
            () -> Void in
            listener.replay()
            },
            "requestFullScreen": {
            (_ callback: LivePlayerOptions?) -> Void in
            listener.requestFullScreen(callback)
            },
            "exitFullScreen": {
            (_ callback: LivePlayerOptions?) -> Void in
            listener.exitFullScreen(callback)
            }
        ])))
    }
    public func setPlayerBufferingChangeListenerByJs(_ listener: StreamingBufferingListenerJSONObject) {
        return self.setPlayerBufferingChangeListener(StreamingBufferingListener(UTSJSONObject([
            "onBufferingStart": {
            () -> Void in
            listener.onBufferingStart()
            },
            "onBufferingEnd": {
            () -> Void in
            listener.onBufferingEnd()
            }
        ])))
    }
    public func setStreamingFullScreenChangedListenerByJs(_ listener: UTSCallback) {
        return self.setStreamingFullScreenChangedListener({
        (_ info: UniLivePlayerFullscreenchangeEvent) -> Void in
        listener(info)
        })
    }
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerContextImplByJs)
@objcMembers
public class LivePlayerContextImplByJs : LivePlayerContextImpl {
    public func playByJs(_ callback: LivePlayerOptionsJSONObject?) {
        return self.play(callback != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func stopByJs(_ callback: LivePlayerOptionsJSONObject?) {
        return self.stop(callback != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func pauseByJs(_ callback: LivePlayerOptionsJSONObject?) {
        return self.pause(callback != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func resumeByJs(_ callback: LivePlayerOptionsJSONObject?) {
        return self.resume(callback != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func muteByJs(_ callback: LivePlayerOptionsJSONObject?) {
        return self.mute(callback != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func requestFullScreenByJs(_ callback: LivePlayerOptionsJSONObject?) {
        return self.requestFullScreen(callback != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
    public func exitFullScreenByJs(_ callback: LivePlayerOptionsJSONObject?) {
        return self.exitFullScreen(callback != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            callback!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            callback!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            callback!.complete?(res)
            }
        ])) : nil)
    }
}
public func createLivePlayerContextByJs(_ livePlayerId: String, _ component: ComponentPublicInstance?) -> Int {
    var ins = createLivePlayerContext(livePlayerId, component)
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(LivePlayerContextByJsProxy(ins!)) : 0
}
@objc(UTSSDKModulesDCloudUniLivePlayerLivePlayerContextByJsProxy)
@objcMembers
public class LivePlayerContextByJsProxy : NSObject {
    public var __instance: LivePlayerContext
    public init(_ ins: LivePlayerContext){
        __instance = ins
    }
    public func playByJs(_ options: LivePlayerOptionsJSONObject?) -> Void {
        return __instance.play(options != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func pauseByJs(_ options: LivePlayerOptionsJSONObject?) -> Void {
        return __instance.pause(options != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func stopByJs(_ options: LivePlayerOptionsJSONObject?) -> Void {
        return __instance.stop(options != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func resumeByJs(_ options: LivePlayerOptionsJSONObject?) -> Void {
        return __instance.resume(options != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func muteByJs(_ options: LivePlayerOptionsJSONObject?) -> Void {
        return __instance.mute(options != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func requestFullScreenByJs(_ options: LivePlayerOptionsJSONObject?) -> Void {
        return __instance.requestFullScreen(options != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
    public func exitFullScreenByJs(_ options: LivePlayerOptionsJSONObject?) -> Void {
        return __instance.exitFullScreen(options != nil ? LivePlayerOptions(UTSJSONObject([
            "success": {
            (_ res: LivePlayerSuccess) -> Void in
            options!.success?(res)
            },
            "fail": {
            (_ res: LivePlayerFail) -> Void in
            options!.fail?(res)
            },
            "complete": {
            (_ res: LivePlayerComplete) -> Void in
            options!.complete?(res)
            }
        ])) : nil)
    }
}
@objc(UTSSDKModulesDCloudUniLivePlayerIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniLivePlayerIndexSwift : NSObject {
    public static func s_createLivePlayerContextByJs(_ livePlayerId: String, _ component: ComponentPublicInstance?) -> Int {
        return createLivePlayerContextByJs(livePlayerId, component)
    }
}
