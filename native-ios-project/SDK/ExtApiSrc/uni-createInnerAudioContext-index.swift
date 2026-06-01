import DCloudUTSFoundation
import DCloudUniappRuntime
public typealias CreateInnerAudioContext = () -> InnerAudioContext
@objc(UTSSDKModulesDCloudUniCreateInnerAudioContextSetInnerAudioOptionSuccess)
@objcMembers
public class SetInnerAudioOptionSuccess : NSObject, UTSObject {
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
public typealias SetInnerAudioOptionSuccessCallback = (_ result: SetInnerAudioOptionSuccess) -> Void
public typealias SetInnerAudioOptionFail = ICreateInnerAudioContextFail
public typealias SetInnerAudioOptionFailCallback = (_ result: SetInnerAudioOptionFail) -> Void
public typealias SetInnerAudioOptionComplete = Any
public typealias SetInnerAudioOptionCompleteCallback = (_ result: SetInnerAudioOptionComplete) -> Void
@objc(UTSSDKModulesDCloudUniCreateInnerAudioContextSetInnerAudioOptionOptions)
@objcMembers
public class SetInnerAudioOptionOptions : NSObject, UTSObject {
    public var mixWithOther: Bool = false
    public var speakerOn: Bool = false
    public var obeyMuteSwitch: Bool = false
    public var success: SetInnerAudioOptionSuccessCallback?
    public var fail: SetInnerAudioOptionFailCallback?
    public var complete: SetInnerAudioOptionCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "mixWithOther":
                    self.mixWithOther = try! utsSubscriptCheckValue(newValue)
                case "speakerOn":
                    self.speakerOn = try! utsSubscriptCheckValue(newValue)
                case "obeyMuteSwitch":
                    self.obeyMuteSwitch = try! utsSubscriptCheckValue(newValue)
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
        self.mixWithOther = (obj["mixWithOther"] as? Bool) ?? false
        self.speakerOn = (obj["speakerOn"] as? Bool) ?? false
        self.obeyMuteSwitch = (obj["obeyMuteSwitch"] as? Bool) ?? false
        self.success = obj["success"] as! SetInnerAudioOptionSuccessCallback?
        self.fail = obj["fail"] as! SetInnerAudioOptionFailCallback?
        self.complete = obj["complete"] as! SetInnerAudioOptionCompleteCallback?
    }
}
public typealias SetInnerAudioOption = (_ option: SetInnerAudioOptionOptions) -> Void
public protocol InnerAudioContext {
    var duration: NSNumber { get set }
    var currentTime: NSNumber { get set }
    var paused: Bool { get set }
    var src: String { get set }
    var startTime: NSNumber { get set }
    var buffered: NSNumber { get set }
    var autoplay: Bool { get set }
    var loop: Bool { get set }
    var obeyMuteSwitch: Bool { get set }
    var volume: NSNumber { get set }
    var playbackRate: NSNumber? { get set }
    var cache: Bool { get set }
    func pause()
    func stop()
    func play()
    func seek(_ position: NSNumber)
    func destroy()
    func onCanplay(_ callback: @escaping (_ result: Any) -> Void)
    func onPlay(_ callback: @escaping (_ result: Any) -> Void)
    func onPause(_ callback: @escaping (_ result: Any) -> Void)
    func onStop(_ callback: @escaping (_ result: Any) -> Void)
    func onEnded(_ callback: @escaping (_ result: Any) -> Void)
    func onTimeUpdate(_ callback: @escaping (_ result: Any) -> Void)
    func onError(_ callback: @escaping (_ result: ICreateInnerAudioContextFail) -> Void)
    func onWaiting(_ callback: @escaping (_ result: Any) -> Void)
    func onSeeking(_ callback: @escaping (_ result: Any) -> Void)
    func onSeeked(_ callback: @escaping (_ result: Any) -> Void)
    func offCanplay(_ callback: @escaping (_ result: Any) -> Void)
    func offPlay(_ callback: @escaping (_ result: Any) -> Void)
    func offPause(_ callback: @escaping (_ result: Any) -> Void)
    func offStop(_ callback: @escaping (_ result: Any) -> Void)
    func offEnded(_ callback: @escaping (_ result: Any) -> Void)
    func offTimeUpdate(_ callback: @escaping (_ result: Any) -> Void)
    func offError(_ callback: @escaping (_ result: ICreateInnerAudioContextFail) -> Void)
    func offWaiting(_ callback: @escaping (_ result: Any) -> Void)
    func offSeeking(_ callback: @escaping (_ result: Any) -> Void)
    func offSeeked(_ callback: @escaping (_ result: Any) -> Void)
}
public typealias CreateInnerAudioContextErrorCode = NSNumber
public protocol ICreateInnerAudioContextFail : IUniError {
    var errCode: CreateInnerAudioContextErrorCode { get set }
}
public var CreateInnerAudioUniErrorSubject = "uni-createInnerAudioContext"
public var CreateInnerAudioContextUniErrors: Map<CreateInnerAudioContextErrorCode, String> = Map([
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
@objc(UTSSDKModulesDCloudUniCreateInnerAudioContextCreateInnerAudioContextFailImpl)
@objcMembers
public class CreateInnerAudioContextFailImpl : UniError, ICreateInnerAudioContextFail {
    public init(_ errCode: CreateInnerAudioContextErrorCode){
        super.init()
        self.errSubject = CreateInnerAudioUniErrorSubject
        self.errCode = errCode
        self.errMsg = CreateInnerAudioContextUniErrors[errCode] ?? ""
    }
}
public var createInnerAudioContext: CreateInnerAudioContext = {
() -> InnerAudioContext in
var player = UniAudioPlayer()
return player
}
public var setInnerAudioOption: SetInnerAudioOption = {
(_ options: SetInnerAudioOptionOptions) -> Void in
if (options.mixWithOther == nil) {
    UniAudioPlayer.mixWithOther = true
} else {
    UniAudioPlayer.mixWithOther = options.mixWithOther
}
if (options.speakerOn == nil) {
    UniAudioPlayer.speakerOn = true
} else {
    UniAudioPlayer.speakerOn = options.speakerOn
}
if (options.obeyMuteSwitch == nil) {
    UniAudioPlayer.obeyMuteSwitch = true
} else {
    UniAudioPlayer.obeyMuteSwitch = options.obeyMuteSwitch
}
options.success?(SetInnerAudioOptionSuccess(UTSJSONObject([:])))
options.complete?(UTSJSONObject([:]))
}
@objc(UTSSDKModulesDCloudUniCreateInnerAudioContextSetInnerAudioOptionOptionsJSONObject)
@objcMembers
public class SetInnerAudioOptionOptionsJSONObject : NSObject {
    public var mixWithOther: Bool = false
    public var speakerOn: Bool = false
    public var obeyMuteSwitch: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniCreateInnerAudioContextCreateInnerAudioContextFailImplByJs)
@objcMembers
public class CreateInnerAudioContextFailImplByJs : CreateInnerAudioContextFailImpl {
}
public func createInnerAudioContextByJs() -> Int {
    var ins = createInnerAudioContext()
    return UTSBridge.registerJavaScriptClassInstance(InnerAudioContextByJsProxy(ins))
}
public func setInnerAudioOptionByJs(_ option: SetInnerAudioOptionOptionsJSONObject) -> Void {
    return setInnerAudioOption(SetInnerAudioOptionOptions(UTSJSONObject([
        "mixWithOther": option.mixWithOther,
        "speakerOn": option.speakerOn,
        "obeyMuteSwitch": option.obeyMuteSwitch,
        "success": {
        (result: SetInnerAudioOptionSuccess) -> Void in
        option.success?(result)
        },
        "fail": {
        (result: SetInnerAudioOptionFail) -> Void in
        option.fail?(result)
        },
        "complete": {
        (result: SetInnerAudioOptionComplete) -> Void in
        option.complete?(result)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniCreateInnerAudioContextInnerAudioContextByJsProxy)
@objcMembers
public class InnerAudioContextByJsProxy : NSObject {
    public var __instance: InnerAudioContext
    public init(_ ins: InnerAudioContext){
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
    public var autoplay: Bool {
        get {
            return __instance.autoplay
        }
        set(value) {
            __instance.autoplay = value
        }
    }
    public var loop: Bool {
        get {
            return __instance.loop
        }
        set(value) {
            __instance.loop = value
        }
    }
    public var obeyMuteSwitch: Bool {
        get {
            return __instance.obeyMuteSwitch
        }
        set(value) {
            __instance.obeyMuteSwitch = value
        }
    }
    public var volume: NSNumber {
        get {
            return __instance.volume
        }
        set(value) {
            __instance.volume = value
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
    public func pauseByJs() -> Void {
        return __instance.pause()
    }
    public func stopByJs() -> Void {
        return __instance.stop()
    }
    public func playByJs() -> Void {
        return __instance.play()
    }
    public func seekByJs(_ position: NSNumber) -> Void {
        return __instance.seek(position)
    }
    public func destroyByJs() -> Void {
        return __instance.destroy()
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
    public func onTimeUpdateByJs(_ callback: UTSCallback) -> Void {
        return __instance.onTimeUpdate({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.onError({
        (result: ICreateInnerAudioContextFail) -> Void in
        callback(result)
        })
    }
    public func onWaitingByJs(_ callback: UTSCallback) -> Void {
        return __instance.onWaiting({
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
    public func offCanplayByJs(_ callback: UTSCallback) -> Void {
        return __instance.offCanplay({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offPlayByJs(_ callback: UTSCallback) -> Void {
        return __instance.offPlay({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offPauseByJs(_ callback: UTSCallback) -> Void {
        return __instance.offPause({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offStopByJs(_ callback: UTSCallback) -> Void {
        return __instance.offStop({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offEndedByJs(_ callback: UTSCallback) -> Void {
        return __instance.offEnded({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offTimeUpdateByJs(_ callback: UTSCallback) -> Void {
        return __instance.offTimeUpdate({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.offError({
        (result: ICreateInnerAudioContextFail) -> Void in
        callback(result)
        })
    }
    public func offWaitingByJs(_ callback: UTSCallback) -> Void {
        return __instance.offWaiting({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offSeekingByJs(_ callback: UTSCallback) -> Void {
        return __instance.offSeeking({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offSeekedByJs(_ callback: UTSCallback) -> Void {
        return __instance.offSeeked({
        (result: Any) -> Void in
        callback(result)
        })
    }
}
@objc(UTSSDKModulesDCloudUniCreateInnerAudioContextIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniCreateInnerAudioContextIndexSwift : NSObject {
    public static func s_createInnerAudioContextByJs() -> Int {
        return createInnerAudioContextByJs()
    }
    public static func s_setInnerAudioOptionByJs(_ option: SetInnerAudioOptionOptionsJSONObject) -> Void {
        return setInnerAudioOptionByJs(option)
    }
}
