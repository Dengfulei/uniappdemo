import DCloudUTSFoundation
import DCloudUniappRuntime
public typealias GetRecorderManager = () -> RecorderManager
@objc(UTSSDKModulesDCloudUniRecorderRecorderManagerStartOptions)
@objcMembers
public class RecorderManagerStartOptions : NSObject, UTSObject {
    public var duration: NSNumber?
    public var sampleRate: NSNumber?
    public var numberOfChannels: NSNumber?
    public var encodeBitRate: NSNumber?
    public var format: String?
    public var frameSize: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "duration":
                    self.duration = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sampleRate":
                    self.sampleRate = try! utsSubscriptCheckValueIfPresent(newValue)
                case "numberOfChannels":
                    self.numberOfChannels = try! utsSubscriptCheckValueIfPresent(newValue)
                case "encodeBitRate":
                    self.encodeBitRate = try! utsSubscriptCheckValueIfPresent(newValue)
                case "format":
                    self.format = try! utsSubscriptCheckValueIfPresent(newValue)
                case "frameSize":
                    self.frameSize = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.duration = obj["duration"] as! NSNumber?
        self.sampleRate = obj["sampleRate"] as! NSNumber?
        self.numberOfChannels = obj["numberOfChannels"] as! NSNumber?
        self.encodeBitRate = obj["encodeBitRate"] as! NSNumber?
        self.format = obj["format"] as! String?
        self.frameSize = obj["frameSize"] as! NSNumber?
    }
}
public protocol RecorderManagerOnStopResult {
    var tempFilePath: String { get set }
}
public protocol RecorderManager {
    func start(_ options: RecorderManagerStartOptions)
    func pause()
    func resume()
    func stop()
    func onStart(_ options: @escaping (_ result: Any) -> Void)
    func offStart()
    func onPause(_ options: @escaping (_ result: Any) -> Void)
    func offPause()
    func onStop(_ options: @escaping (_ result: RecorderManagerOnStopResult) -> Void)
    func offStop()
    func onFrameRecorded(_ options: @escaping (_ result: Any) -> Void)
    func offFrameRecorded()
    func onError(_ options: @escaping (_ result: IRecorderManagerFail) -> Void)
    func offError()
    func onResume(_ options: @escaping (_ result: Any) -> Void)
    func offResume()
    func onInterruptionBegin(_ options: @escaping (_ result: Any) -> Void)
    func offInterruptionBegin()
    func onInterruptionEnd(_ options: @escaping (_ result: Any) -> Void)
    func offInterruptionEnd()
}
public typealias RecorderManagerErrorCode = NSNumber
public protocol IRecorderManagerFail : IUniError {
    var errCode: RecorderManagerErrorCode { get set }
}
public var RecorderManagerUniErrorSubject = "uni-recorder"
public var RecorderManagerUniErrors: Map<RecorderManagerErrorCode, String> = Map([
    [
        1107601,
        "No microphone permissions."
    ],
    [
        1107602,
        "This sample rate is not supported."
    ],
    [
        1107603,
        "The sample rate does not match the encoding bitrate."
    ],
    [
        1107604,
        "Failed to start."
    ],
    [
        1107605,
        "This audio format is not supported."
    ],
    [
        1107606,
        "Other errors."
    ],
    [
        1107607,
        "Audio interrupted."
    ],
    [
        1107608,
        "Audio is recording."
    ]
])
@objc(UTSSDKModulesDCloudUniRecorderRecorderManagerFailImpl)
@objcMembers
public class RecorderManagerFailImpl : UniError, IRecorderManagerFail {
    public init(_ errCode: RecorderManagerErrorCode, _ errMsg: String = ""){
        super.init()
        self.errSubject = RecorderManagerUniErrorSubject
        self.errCode = errCode
        self.errMsg = errMsg != "" ? errMsg : (RecorderManagerUniErrors.get(errCode) ?? errMsg)
    }
}
public var getRecorderManager: GetRecorderManager = {
() -> RecorderManager in
var recorderManager = UniAudioRecorderManager.shared
return recorderManager
}
@objc(UTSSDKModulesDCloudUniRecorderRecorderManagerStartOptionsJSONObject)
@objcMembers
public class RecorderManagerStartOptionsJSONObject : NSObject {
    public var duration: NSNumber?
    public var sampleRate: NSNumber?
    public var numberOfChannels: NSNumber?
    public var encodeBitRate: NSNumber?
    public var format: String?
    public var frameSize: NSNumber?
}
@objc(UTSSDKModulesDCloudUniRecorderRecorderManagerFailImplByJs)
@objcMembers
public class RecorderManagerFailImplByJs : RecorderManagerFailImpl {
}
public func getRecorderManagerByJs() -> Int {
    var ins = getRecorderManager()
    return UTSBridge.registerJavaScriptClassInstance(RecorderManagerByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniRecorderRecorderManagerByJsProxy)
@objcMembers
public class RecorderManagerByJsProxy : NSObject {
    public var __instance: RecorderManager
    public init(_ ins: RecorderManager){
        __instance = ins
    }
    public func startByJs(_ options: RecorderManagerStartOptionsJSONObject) -> Void {
        return __instance.start(RecorderManagerStartOptions(UTSJSONObject([
            "duration": options.duration,
            "sampleRate": options.sampleRate,
            "numberOfChannels": options.numberOfChannels,
            "encodeBitRate": options.encodeBitRate,
            "format": options.format,
            "frameSize": options.frameSize
        ])))
    }
    public func pauseByJs() -> Void {
        return __instance.pause()
    }
    public func resumeByJs() -> Void {
        return __instance.resume()
    }
    public func stopByJs() -> Void {
        return __instance.stop()
    }
    public func onStartByJs(_ options: UTSCallback) -> Void {
        return __instance.onStart({
        (result: Any) -> Void in
        options(result)
        })
    }
    public func offStartByJs() -> Void {
        return __instance.offStart()
    }
    public func onPauseByJs(_ options: UTSCallback) -> Void {
        return __instance.onPause({
        (result: Any) -> Void in
        options(result)
        })
    }
    public func offPauseByJs() -> Void {
        return __instance.offPause()
    }
    public func onStopByJs(_ options: UTSCallback) -> Void {
        return __instance.onStop({
        (result: RecorderManagerOnStopResult) -> Void in
        options(result)
        })
    }
    public func offStopByJs() -> Void {
        return __instance.offStop()
    }
    public func onFrameRecordedByJs(_ options: UTSCallback) -> Void {
        return __instance.onFrameRecorded({
        (result: Any) -> Void in
        options(result)
        })
    }
    public func offFrameRecordedByJs() -> Void {
        return __instance.offFrameRecorded()
    }
    public func onErrorByJs(_ options: UTSCallback) -> Void {
        return __instance.onError({
        (result: IRecorderManagerFail) -> Void in
        options(result)
        })
    }
    public func offErrorByJs() -> Void {
        return __instance.offError()
    }
    public func onResumeByJs(_ options: UTSCallback) -> Void {
        return __instance.onResume({
        (result: Any) -> Void in
        options(result)
        })
    }
    public func offResumeByJs() -> Void {
        return __instance.offResume()
    }
    public func onInterruptionBeginByJs(_ options: UTSCallback) -> Void {
        return __instance.onInterruptionBegin({
        (result: Any) -> Void in
        options(result)
        })
    }
    public func offInterruptionBeginByJs() -> Void {
        return __instance.offInterruptionBegin()
    }
    public func onInterruptionEndByJs(_ options: UTSCallback) -> Void {
        return __instance.onInterruptionEnd({
        (result: Any) -> Void in
        options(result)
        })
    }
    public func offInterruptionEndByJs() -> Void {
        return __instance.offInterruptionEnd()
    }
}
@objc(UTSSDKModulesDCloudUniRecorderIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniRecorderIndexSwift : NSObject {
    public static func s_getRecorderManagerByJs() -> Int {
        return getRecorderManagerByJs()
    }
}
