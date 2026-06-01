import DCloudUTSFoundation
import DCloudUniappRuntime
public typealias GetBackgroundAudioManager = () -> BackgroundAudioManager
public protocol BackgroundAudioManager {
    var duration: NSNumber { get set }
    var currentTime: NSNumber { get set }
    var paused: Bool { get set }
    var src: String { get set }
    var startTime: NSNumber { get set }
    var buffered: NSNumber { get set }
    var title: String { get set }
    var epname: String { get set }
    var singer: String { get set }
    var coverImgUrl: String { get set }
    var webUrl: String { get set }
    var `protocol`: String { get set }
    var playbackRate: NSNumber? { get set }
    var cache: Bool { get set }
    func play()
    func pause()
    func seek(_ position: NSNumber)
    func stop()
    func onCanplay(_ callback: @escaping (_ result: Any) -> Void)
    func onPlay(_ callback: @escaping (_ result: Any) -> Void)
    func onPause(_ callback: @escaping (_ result: Any) -> Void)
    func onStop(_ callback: @escaping (_ result: Any) -> Void)
    func onEnded(_ callback: @escaping (_ result: Any) -> Void)
    func onSeeking(_ callback: @escaping (_ result: Any) -> Void)
    func onSeeked(_ callback: @escaping (_ result: Any) -> Void)
    func onTimeUpdate(_ callback: @escaping (_ result: Any) -> Void)
    func onPrev(_ callback: @escaping (_ result: Any) -> Void)
    func onNext(_ callback: @escaping (_ result: Any) -> Void)
    func onError(_ callback: @escaping (_ result: ICreateBackgroundAudioFail) -> Void)
    func onWaiting(_ callback: @escaping (_ result: Any) -> Void)
    func offCanplay()
    func offPlay()
    func offPause()
    func offStop()
    func offEnded()
    func offSeeking()
    func offSeeked()
    func offTimeUpdate()
    func offPrev()
    func offNext()
    func offError()
    func offWaiting()
}
public typealias CreateBackgroundAudioErrorCode = NSNumber
public protocol ICreateBackgroundAudioFail : IUniError {
    var errCode: CreateBackgroundAudioErrorCode { get set }
}
public var CreateBackgroundAudioUniErrorSubject = "uni-getBackgroundAudioManager"
public var CreateBackgroundAudioUniErrors: Map<CreateBackgroundAudioErrorCode, String> = Map([
    [
        1107601,
        "system error."
    ],
    [
        1107602,
        "network error."
    ],
    [
        1107603,
        "file error."
    ],
    [
        1107604,
        "format error."
    ],
    [
        1107605,
        "unknown error."
    ],
    [
        1107609,
        "empty src."
    ]
])
@objc(UTSSDKModulesDCloudUniGetBackgroundAudioManagerCreateBackgroundAudioFailImpl)
@objcMembers
public class CreateBackgroundAudioFailImpl : UniError, ICreateBackgroundAudioFail {
    public init(_ errCode: CreateBackgroundAudioErrorCode){
        super.init()
        self.errSubject = CreateBackgroundAudioUniErrorSubject
        self.errCode = errCode
        self.errMsg = CreateBackgroundAudioUniErrors[errCode] ?? ""
    }
}
public var getBackgroundAudioManager: GetBackgroundAudioManager = {
() -> BackgroundAudioManager in
var player = UniBackgroundAudioManager.shared
return player
}
@objc(UTSSDKModulesDCloudUniGetBackgroundAudioManagerCreateBackgroundAudioFailImplByJs)
@objcMembers
public class CreateBackgroundAudioFailImplByJs : CreateBackgroundAudioFailImpl {
}
public func getBackgroundAudioManagerByJs() -> Int {
    var ins = getBackgroundAudioManager()
    return UTSBridge.registerJavaScriptClassInstance(BackgroundAudioManagerByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniGetBackgroundAudioManagerBackgroundAudioManagerByJsProxy)
@objcMembers
public class BackgroundAudioManagerByJsProxy : NSObject {
    public var __instance: BackgroundAudioManager
    public init(_ ins: BackgroundAudioManager){
        __instance = ins
    }
    public var duration: NSNumber {
        get {
            return __instance.duration
        }
        set(value) {
            __instance.duration = value
        }
    }
    public var currentTime: NSNumber {
        get {
            return __instance.currentTime
        }
        set(value) {
            __instance.currentTime = value
        }
    }
    public var paused: Bool {
        get {
            return __instance.paused
        }
        set(value) {
            __instance.paused = value
        }
    }
    public var src: String {
        get {
            return __instance.src
        }
        set(value) {
            __instance.src = value
        }
    }
    public var startTime: NSNumber {
        get {
            return __instance.startTime
        }
        set(value) {
            __instance.startTime = value
        }
    }
    public var buffered: NSNumber {
        get {
            return __instance.buffered
        }
        set(value) {
            __instance.buffered = value
        }
    }
    public var title: String {
        get {
            return __instance.title
        }
        set(value) {
            __instance.title = value
        }
    }
    public var epname: String {
        get {
            return __instance.epname
        }
        set(value) {
            __instance.epname = value
        }
    }
    public var singer: String {
        get {
            return __instance.singer
        }
        set(value) {
            __instance.singer = value
        }
    }
    public var coverImgUrl: String {
        get {
            return __instance.coverImgUrl
        }
        set(value) {
            __instance.coverImgUrl = value
        }
    }
    public var webUrl: String {
        get {
            return __instance.webUrl
        }
        set(value) {
            __instance.webUrl = value
        }
    }
    public var `protocol`: String {
        get {
            return __instance.protocol
        }
        set(value) {
            __instance.protocol = value
        }
    }
    public var playbackRate: NSNumber? {
        get {
            return __instance.playbackRate
        }
        set(value) {
            __instance.playbackRate = value
        }
    }
    public var cache: Bool {
        get {
            return __instance.cache
        }
        set(value) {
            __instance.cache = value
        }
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
    public func onCanplayByJs(_ callback: UTSCallback) -> Void {
        return __instance.onCanplay({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onPlayByJs(_ callback: UTSCallback) -> Void {
        return __instance.onPlay({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onPauseByJs(_ callback: UTSCallback) -> Void {
        return __instance.onPause({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onStopByJs(_ callback: UTSCallback) -> Void {
        return __instance.onStop({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onEndedByJs(_ callback: UTSCallback) -> Void {
        return __instance.onEnded({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onSeekingByJs(_ callback: UTSCallback) -> Void {
        return __instance.onSeeking({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onSeekedByJs(_ callback: UTSCallback) -> Void {
        return __instance.onSeeked({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onTimeUpdateByJs(_ callback: UTSCallback) -> Void {
        return __instance.onTimeUpdate({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onPrevByJs(_ callback: UTSCallback) -> Void {
        return __instance.onPrev({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onNextByJs(_ callback: UTSCallback) -> Void {
        return __instance.onNext({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.onError({
        (result: ICreateBackgroundAudioFail) -> Void in
        callback(result)
        })
    }
    public func onWaitingByJs(_ callback: UTSCallback) -> Void {
        return __instance.onWaiting({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offCanplayByJs() -> Void {
        return __instance.offCanplay()
    }
    public func offPlayByJs() -> Void {
        return __instance.offPlay()
    }
    public func offPauseByJs() -> Void {
        return __instance.offPause()
    }
    public func offStopByJs() -> Void {
        return __instance.offStop()
    }
    public func offEndedByJs() -> Void {
        return __instance.offEnded()
    }
    public func offSeekingByJs() -> Void {
        return __instance.offSeeking()
    }
    public func offSeekedByJs() -> Void {
        return __instance.offSeeked()
    }
    public func offTimeUpdateByJs() -> Void {
        return __instance.offTimeUpdate()
    }
    public func offPrevByJs() -> Void {
        return __instance.offPrev()
    }
    public func offNextByJs() -> Void {
        return __instance.offNext()
    }
    public func offErrorByJs() -> Void {
        return __instance.offError()
    }
    public func offWaitingByJs() -> Void {
        return __instance.offWaiting()
    }
}
@objc(UTSSDKModulesDCloudUniGetBackgroundAudioManagerIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetBackgroundAudioManagerIndexSwift : NSObject {
    public static func s_getBackgroundAudioManagerByJs() -> Int {
        return getBackgroundAudioManagerByJs()
    }
}
