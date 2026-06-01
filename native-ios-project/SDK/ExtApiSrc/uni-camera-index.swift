import AVFoundation
import CoreImage
import CoreMedia
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
import DCloudUTSExtAPI
public typealias CameraErrorCode = NSNumber
public protocol CameraContextFail : IUniError {
    var errCode: CameraErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextCameraFrameListenerStartOptions)
@objcMembers
public class CameraContextCameraFrameListenerStartOptions : NSObject, UTSObject {
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: Any) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
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
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: Any) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextCameraFrameListenerStopOptions)
@objcMembers
public class CameraContextCameraFrameListenerStopOptions : NSObject, UTSObject {
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: Any) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
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
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: Any) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
public protocol CameraContextCameraFrameListener {
    func start(_ options: CameraContextCameraFrameListenerStartOptions)
    func stop(_ options: CameraContextCameraFrameListenerStopOptions)
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextOnCameraFrame)
@objcMembers
public class CameraContextOnCameraFrame : NSObject, UTSObject {
    public var width: NSNumber?
    public var height: NSNumber?
    public var data: ArrayBuffer?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "width":
                    self.width = try! utsSubscriptCheckValueIfPresent(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValueIfPresent(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.width = obj["width"] as! NSNumber?
        self.height = obj["height"] as! NSNumber?
        self.data = obj["data"] as! ArrayBuffer?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextSetZoomOptions)
@objcMembers
public class CameraContextSetZoomOptions : NSObject, UTSObject {
    public var zoom: NSNumber!
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: Any) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "zoom":
                    self.zoom = try! utsSubscriptCheckValue(newValue)
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
        self.zoom = obj["zoom"] as! NSNumber
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: Any) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextTakePhotoResult)
@objcMembers
public class CameraContextTakePhotoResult : NSObject, UTSObject {
    public var tempImagePath: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempImagePath":
                    self.tempImagePath = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempImagePath = obj["tempImagePath"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextTakePhotoOptions)
@objcMembers
public class CameraContextTakePhotoOptions : NSObject, UTSObject {
    public var quality: String?
    public var selfieMirror: Bool = false
    public var success: ((_ result: CameraContextTakePhotoResult) -> Void)?
    public var fail: ((_ error: CameraContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "quality":
                    self.quality = try! utsSubscriptCheckValueIfPresent(newValue)
                case "selfieMirror":
                    self.selfieMirror = try! utsSubscriptCheckValue(newValue)
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
        self.quality = obj["quality"] as! String?
        self.selfieMirror = (obj["selfieMirror"] as? Bool) ?? false
        self.success = obj["success"] as! ((_ result: CameraContextTakePhotoResult) -> Void)?
        self.fail = obj["fail"] as! ((_ error: CameraContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextStartRecordTimeoutResult)
@objcMembers
public class CameraContextStartRecordTimeoutResult : NSObject, UTSObject {
    public var tempThumbPath: String?
    public var tempVideoPath: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempThumbPath":
                    self.tempThumbPath = try! utsSubscriptCheckValueIfPresent(newValue)
                case "tempVideoPath":
                    self.tempVideoPath = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempThumbPath = obj["tempThumbPath"] as! String?
        self.tempVideoPath = obj["tempVideoPath"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextStartRecordOptions)
@objcMembers
public class CameraContextStartRecordOptions : NSObject, UTSObject {
    public var timeoutCallback: ((_ result: Any) -> Void)?
    public var timeout: NSNumber?
    public var selfieMirror: Bool = false
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ error: CameraContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "timeoutCallback":
                    self.timeoutCallback = try! utsSubscriptCheckValueIfPresent(newValue)
                case "timeout":
                    self.timeout = try! utsSubscriptCheckValueIfPresent(newValue)
                case "selfieMirror":
                    self.selfieMirror = try! utsSubscriptCheckValue(newValue)
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
        self.timeoutCallback = obj["timeoutCallback"] as! ((_ result: Any) -> Void)?
        self.timeout = obj["timeout"] as! NSNumber?
        self.selfieMirror = (obj["selfieMirror"] as? Bool) ?? false
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ error: CameraContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextStopRecordResult)
@objcMembers
public class CameraContextStopRecordResult : NSObject, UTSObject {
    public var tempThumbPath: String?
    public var tempVideoPath: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempThumbPath":
                    self.tempThumbPath = try! utsSubscriptCheckValueIfPresent(newValue)
                case "tempVideoPath":
                    self.tempVideoPath = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempThumbPath = obj["tempThumbPath"] as! String?
        self.tempVideoPath = obj["tempVideoPath"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextStopRecordOptions)
@objcMembers
public class CameraContextStopRecordOptions : NSObject, UTSObject {
    public var compressed: Bool = false
    public var success: ((_ result: CameraContextStopRecordResult) -> Void)?
    public var fail: ((_ error: CameraContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "compressed":
                    self.compressed = try! utsSubscriptCheckValue(newValue)
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
        self.compressed = (obj["compressed"] as? Bool) ?? false
        self.success = obj["success"] as! ((_ result: CameraContextStopRecordResult) -> Void)?
        self.fail = obj["fail"] as! ((_ error: CameraContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
public protocol CameraContext {
    func onCameraFrame(_ callback: @escaping (_ frame: CameraContextOnCameraFrame) -> Void) -> CameraContextCameraFrameListener?
    func onIosCameraOriginalFrame(_ callback: @escaping (_ sampleBuffer: CMSampleBuffer) -> Void)
    func offIosCameraOriginalFrame()
    func getCurrentZoom() -> NSNumber
    func setZoom(_ options: CameraContextSetZoomOptions)
    func takePhoto(_ options: CameraContextTakePhotoOptions)
    func startRecord(_ options: CameraContextStartRecordOptions)
    func stopRecord(_ options: CameraContextStopRecordOptions)
}
public typealias CreateCameraContext = () -> CameraContext?
@objc(UTSSDKModulesDCloudUniCameraBarcodeInformation)
@objcMembers
public class BarcodeInformation : NSObject, UTSObject {
    public var result: String!
    public var scanType: String!
    public var charset: String!
    public var rawData: String!
    public var scanArea: Array<NSNumber>!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "result":
                    self.result = try! utsSubscriptCheckValue(newValue)
                case "scanType":
                    self.scanType = try! utsSubscriptCheckValue(newValue)
                case "charset":
                    self.charset = try! utsSubscriptCheckValue(newValue)
                case "rawData":
                    self.rawData = try! utsSubscriptCheckValue(newValue)
                case "scanArea":
                    self.scanArea = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.result = obj["result"] as! String
        self.scanType = obj["scanType"] as! String
        self.charset = obj["charset"] as! String
        self.rawData = obj["rawData"] as! String
        self.scanArea = obj["scanArea"] as! Array<NSNumber>
    }
}
@objc(UTSSDKModulesDCloudUniCameraIosScreenShot)
@objcMembers
public class IosScreenShot : NSObject, UTSObject {
    public var image: UIImage!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "image":
                    self.image = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.image = obj["image"] as! UIImage
    }
}
public protocol IosScannerListener {
    func onScanSuccess(_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?)
    func onScanFailure(_ error: String)
    func needZoom()
    func onLight(_ light: Bool)
}
@objc(UTSSDKModulesDCloudUniCameraIosFrameScannerOptions)
@objcMembers
public class IosFrameScannerOptions : NSObject, UTSObject {
    public var sampleBuffer: CMSampleBuffer!
    public var scanType: Array<String>!
    public var autoZoom: Bool = false
    public var width: NSNumber!
    public var height: NSNumber!
    public var iosScannerListenner: IosScannerListener?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "sampleBuffer":
                    self.sampleBuffer = try! utsSubscriptCheckValue(newValue)
                case "scanType":
                    self.scanType = try! utsSubscriptCheckValue(newValue)
                case "autoZoom":
                    self.autoZoom = try! utsSubscriptCheckValue(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValue(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValue(newValue)
                case "iosScannerListenner":
                    self.iosScannerListenner = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.sampleBuffer = obj["sampleBuffer"] as! CMSampleBuffer
        self.scanType = obj["scanType"] as! Array<String>
        self.autoZoom = obj["autoZoom"] as! Bool
        self.width = obj["width"] as! NSNumber
        self.height = obj["height"] as! NSNumber
        self.iosScannerListenner = obj["iosScannerListenner"] as! IosScannerListener?
    }
}
@objc(UTSSDKModulesDCloudUniCameraIosPhotoScannerOptions)
@objcMembers
public class IosPhotoScannerOptions : NSObject, UTSObject {
    public var filePath: String!
    public var scanType: Array<String>!
    public var iosScannerListenner: IosScannerListener?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "scanType":
                    self.scanType = try! utsSubscriptCheckValue(newValue)
                case "iosScannerListenner":
                    self.iosScannerListenner = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.filePath = obj["filePath"] as! String
        self.scanType = obj["scanType"] as! Array<String>
        self.iosScannerListenner = obj["iosScannerListenner"] as! IosScannerListener?
    }
}
public protocol IosScanner {
    func processScanBarCode(_ options: IosFrameScannerOptions)
    func processScanBarCodeWithPhoto(_ options: IosPhotoScannerOptions)
}
public var UniCameraErrorSubject = "uni-camera"
public var CameraErrorCodes: Map<CameraErrorCode, String> = Map([
    [
        2003002,
        "permission denied"
    ],
    [
        2003003,
        "take photo failed"
    ],
    [
        2003004,
        "camera is disabled"
    ],
    [
        2003005,
        "camera is in use"
    ],
    [
        2003006,
        "camera fatal error"
    ],
    [
        2003007,
        "video path is empty"
    ],
    [
        2003008,
        "recording failed"
    ],
    [
        2003009,
        "the application enters the background"
    ],
    [
        2003100,
        "system error"
    ],
    [
        2003101,
        "compress video fail"
    ]
])
fileprivate func getErrcode(_ errCode: NSNumber) -> CameraErrorCode {
    var res = CameraErrorCodes[errCode]
    return res == nil ? 2003100 : errCode
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextFailImpl)
@objcMembers
public class CameraContextFailImpl : UniError, CameraContextFail {
    public init(_ errCode: CameraErrorCode){
        super.init()
        self.errSubject = UniCameraErrorSubject
        self.errCode = errCode
        self.errMsg = CameraErrorCodes[errCode] ?? ""
    }
}
@objc(UTSSDKModulesDCloudUniCameraTypeTest)
@objcMembers
public class TypeTest : NSObject {
    public var a: IosScannerListener? = nil
    public var b: IosFrameScannerOptions? = nil
    public var c: IosPhotoScannerOptions? = nil
    public var d: IosScanner? = nil
    public var e: BarcodeInformation? = nil
    public var f: IosScreenShot? = nil
    public override init(){}
}
public var iosScanner: IosScanner? = nil
public func initIosScanner(_ scanner: IosScanner) -> Void {
    iosScanner = scanner
}
public func getIosScanner() -> IosScanner? {
    return iosScanner
}
@objc
public protocol UniCameraElement : JSExport {
    func setZoom(_ zoom: NSNumber)
    func getCurrentZoom() -> NSNumber
    func setFrameCallback(_ callback: @escaping (_ frame: CameraContextOnCameraFrame) -> Void)
    func startOnFrame()
    func stopOnFrame()
    func takePhoto(_ options: CameraContextTakePhotoOptions)
    func startRecord(_ options: CameraContextStartRecordOptions)
    func stopRecord(_ options: CameraContextStopRecordOptions)
    func startAnalysis(_ callback: @escaping (_ sampleBuffer: CMSampleBuffer) -> Void)
    func stopAnalysis()
}
@objc(UTSSDKModulesDCloudUniCameraUniCameraElementImpl)
@objcMembers
public class UniCameraElementImpl : UniElementImpl, UniCameraElement {
    private var cameraImpl: CameraImpl? = nil
    fileprivate func setCamera(_ cameraImpl: CameraImpl) {
        self.cameraImpl = cameraImpl
    }
    public override func getIOSView() -> UIView? {
        var nativeElement = self.firstChild as! UniNativeViewElement
        if (nativeElement == nil) {
            return nil
        } else {
            return nativeElement.getIOSView()
        }
    }
    public func setZoom(_ zoom: NSNumber) -> Void {
        self.cameraImpl?.setZoom(zoom.toFloat())
    }
    public func getCurrentZoom() -> NSNumber {
        var kZoom = self.cameraImpl?.getCurrentZoom() ?? 1
        return NSNumber.from(kZoom)
    }
    public func setFrameCallback(_ callback: @escaping (_ frame: CameraContextOnCameraFrame) -> Void) -> Void {
        self.cameraImpl?.setFrameCallback({
        (type: String, param: Any?) -> Void in
        var map = param as! Map<String, Any>
        var width = map["width"] as! Int
        var height = map["height"] as! Int
        var buffer = map["buffer"] as! Data
        var arrayBuffer = ArrayBuffer.fromData(buffer)
        var frame = CameraContextOnCameraFrame(UTSJSONObject([
            "width": NSNumber.from(width),
            "height": NSNumber.from(height),
            "data": arrayBuffer
        ]))
        callback(frame)
        })
    }
    public func startOnFrame() -> Void {
        self.cameraImpl?.startOnFrame()
    }
    public func stopOnFrame() -> Void {
        self.cameraImpl?.stopOnFrame()
    }
    public func takePhoto(_ options: CameraContextTakePhotoOptions) -> Void {
        var quality = options.quality
        var selfieMirror = options.selfieMirror
        self.cameraImpl?.takePhoto(quality ?? "normal", selfieMirror ?? false, {
        (type: String, param: Any?) -> Void in
        var result = CameraContextTakePhotoResult(UTSJSONObject([
            "tempImagePath": param as! String
        ]))
        options.success?(result)
        options.complete?(result)
        }, {
        (type: String, param: Any?) -> Void in
        var cause = param as! String
        var failResult = CameraContextFailImpl(getErrcode(2003003))
        failResult.cause = SourceError(cause)
        options.fail?(failResult)
        options.complete?(failResult)
        })
    }
    public func startRecord(_ options: CameraContextStartRecordOptions) -> Void {
        var timeout = options.timeout ?? 30
        var selfieMirror = options.selfieMirror ?? true
        self.cameraImpl?.startRecord(timeout.toInt(), selfieMirror, {
        (type: String, param: Any?) -> Void in
        if (UTSiOS.instanceof(param, Map<String, Any>.self)) {
            var map = param as! Map<String, Any>
            var tempThumbPath = map["tempThumbPath"] as! String
            var tempVideoPath = map["tempVideoPath"] as! String
            var result = CameraContextStartRecordTimeoutResult(UTSJSONObject([
                "tempThumbPath": tempThumbPath,
                "tempVideoPath": tempVideoPath
            ]))
            options.timeoutCallback?(result)
        } else if (UTSiOS.typeof(param) == "string") {
            options.timeoutCallback?(param as! String)
        }
        }, {
        (type: String, param: Any?) -> Void in
        var result = "start record success"
        options.success?(result)
        options.complete?(result)
        }, {
        (type: String, param: Any?) -> Void in
        if (param != nil) {
            var cause = param as! String
            var errCode: NSNumber = 2003100
            if (cause == "video path is empty") {
                errCode = 2003007
            } else if (cause == "recording failed") {
                errCode = 2003008
            }
            var failResult = CameraContextFailImpl(getErrcode(errCode))
            failResult.cause = SourceError(cause)
            options.fail?(failResult)
            options.complete?(failResult)
        }
        })
    }
    public func stopRecord(_ options: CameraContextStopRecordOptions) -> Void {
        var compressed = options.compressed ?? false
        self.cameraImpl?.stopRecord(0, {
        (type: String, param: Any?) -> Void in
        var map = param as! Map<String, Any>
        var tempThumbPath = map["tempThumbPath"] as! String
        var tempVideoPath = map["tempVideoPath"] as! String
        if (compressed) {
            DCloudUTSExtAPI.compressVideo(CompressVideoOptions(UTSJSONObject([
                "src": tempVideoPath,
                "quality": "high",
                "success": {
                (res: CompressVideoSuccess) -> Void in
                tempVideoPath = res.tempFilePath
                var result = CameraContextStopRecordResult(UTSJSONObject([
                    "tempThumbPath": tempThumbPath,
                    "tempVideoPath": tempVideoPath
                ]))
                options.success?(result)
                options.complete?(result)
                },
                "fail": {
                (err: IMediaError) -> Void in
                var failResult = CameraContextFailImpl(getErrcode(2003101))
                options.fail?(failResult)
                options.complete?(failResult)
                }
            ])))
        } else {
            var result = CameraContextStopRecordResult(UTSJSONObject([
                "tempThumbPath": tempThumbPath,
                "tempVideoPath": tempVideoPath
            ]))
            options.success?(result)
            options.complete?(result)
        }
        }, {
        (type: String, param: Any?) -> Void in
        var cause = param as! String
        var errCode: NSNumber = 2003100
        if (cause == "video path is empty") {
            errCode = 2003007
        } else if (cause == "recording failed") {
            errCode = 2003008
        }
        var failResult = CameraContextFailImpl(getErrcode(errCode))
        failResult.cause = SourceError(cause)
        options.fail?(failResult)
        options.complete?(failResult)
        })
    }
    public func startAnalysis(_ callback: @escaping (_ sampleBuffer: CMSampleBuffer) -> Void) -> Void {
        self.cameraImpl?.startAnalysis({
        (type: String, param: Any?) -> Void in
        if (param != nil) {
            var sampleBuffer = param as! CMSampleBuffer
            callback(sampleBuffer)
        }
        })
    }
    public func stopAnalysis() -> Void {
        self.cameraImpl?.stopAnalysis()
    }
}
@objc(UTSSDKModulesDCloudUniCameraIosScannerListenerImpl)
@objcMembers
public class IosScannerListenerImpl : NSObject, IosScannerListener {
    private var element: UniNativeViewElement
    public init(_ element: UniNativeViewElement){
        self.element = element
    }
    public func onScanSuccess(_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void {
        if (barcodeInformation.length == 0) {
            return
        }
        var barcode = barcodeInformation[0]
        var result = barcode.result
        var scanType = barcode.scanType
        var charset = barcode.charset
        var rawData = barcode.rawData
        var scanArea = barcode.scanArea
        var event = UniNativeViewEvent("scancode_success", UTSJSONObject([
            "result": result,
            "scanType": scanType,
            "charset": charset,
            "rawData": rawData,
            "scanArea": scanArea
        ]))
        self.element.dispatchEvent("scancode", event)
    }
    public func onScanFailure(_ error: String) -> Void {
        var event = UniNativeViewEvent("scancode_fail", UTSJSONObject([
            "error": error
        ]))
        element.dispatchEvent("scancode", event)
    }
    public func needZoom() -> Void {}
    public func onLight(_ light: Bool) -> Void {}
}
@objc(UTSSDKModulesDCloudUniCameraCameraInstance)
@objcMembers
public class CameraInstance : NSObject {
    public var __$$element: UniNativeViewElement
    private var cameraImpl: CameraImpl? = nil
    private var isReleased = false
    private var isStopped = false
    public init(_ element__1: UniNativeViewElement){
        self.__$$element = element__1
    }
    public func start(_ position: String) {
        if (self.isReleased) {
            return
        }
        if (self.isStopped && self.cameraImpl != nil) {
            self.resume()
            return
        }
        self.cameraImpl = CameraImpl()
        (self.__$$element.parentElement as! UniCameraElementImpl).setCamera(self.cameraImpl!)
        var previewView = self.cameraImpl?.getCameraPreviewView(position ?? "medium")
        if (previewView == nil) {
            self.destory()
            return
        }
        self.__$$element.bindIOSView(previewView!)
        self.registerStopCallback()
        self.registerInitDoneCallback()
        self.registerErrorCallback()
        self.isStopped = false
        self.isReleased = false
    }
    public func stop() {
        if (self.cameraImpl != nil && !self.isStopped) {
            self.cameraImpl?.stopCamera()
            self.isStopped = true
        }
    }
    public func resume() {
        if (self.cameraImpl != nil && self.isStopped) {
            self.cameraImpl?.resumeCamera()
            self.isStopped = false
        }
    }
    public func destory() {
        if (self.cameraImpl != nil) {
            self.cameraImpl?.releaseCamera()
            self.cameraImpl = nil
            self.isReleased = true
            self.isStopped = true
        }
    }
    public func switchCamera(_ position: String) {
        if (self.isReleased || self.isStopped) {
            return
        }
        self.cameraImpl?.switchCamera(position: position)
    }
    public func setFlash(_ flash: String) {
        if (self.isReleased || self.isStopped) {
            return
        }
        self.cameraImpl?.setFlash(flash: flash)
    }
    public func setFrameSize(_ size: String) {
        if (self.isReleased || self.isStopped) {
            return
        }
        self.cameraImpl?.setFrameSize(size: size)
    }
    public func setPhotoResolution(_ resolution: String) {}
    public func setScanCode(_ on: Bool) {
        if (self.isReleased || self.isStopped) {
            return
        }
        if (on) {
            var element__1 = self.__$$element
            self.cameraImpl?.startAnalysis({
            (type: String, param: Any?) -> Void in
            var sampleBuffer = param as! CMSampleBuffer
            var options = IosFrameScannerOptions(UTSJSONObject([
                "sampleBuffer": sampleBuffer,
                "scanType": [] as! [String],
                "autoZoom": false,
                "width": -1 as NSNumber,
                "height": -1 as NSNumber,
                "iosScannerListenner": IosScannerListenerImpl(element__1)
            ]))
            getIosScanner()?.processScanBarCode(options)
            })
        } else {
            self.cameraImpl?.stopAnalysis()
        }
    }
    public func registerStopCallback() {
        if (self.isReleased) {
            return
        }
        var element__1 = self.__$$element
        self.cameraImpl?.setStopCallBack(callback: {
        (type: String, param: Any?) -> Void in
        var error = param as! String
        var event = UniNativeViewEvent(type, UTSJSONObject([
            "error": error
        ]))
        element__1.dispatchEvent("stop", event)
        })
    }
    public func registerInitDoneCallback() {
        if (self.isReleased) {
            return
        }
        var element__1 = self.__$$element
        self.cameraImpl?.setInitDoneCallBack(callback: {
        (type: String, param: Any?) -> Void in
        var maxZoom = param as! NSNumber
        var event = UniNativeViewEvent(type, UTSJSONObject([
            "maxzoom": maxZoom
        ]))
        element__1.dispatchEvent("initdone", event)
        })
    }
    public func registerErrorCallback() {
        if (self.isReleased) {
            return
        }
        var element__1 = self.__$$element
        self.cameraImpl?.setErrorCallBack(callback: {
        (type: String, param: Any?) -> Void in
        var error = param as! String
        var event = UniNativeViewEvent(type, UTSJSONObject([
            "error": error
        ]))
        element__1.dispatchEvent("error", event)
        })
    }
}
public var createCameraContext: CreateCameraContext = {
() -> CameraContext? in
var pages = getCurrentPages()
var currentPage: UniPage? = nil
if (pages.length > 0) {
    currentPage = pages[pages.length - 1]
}
if (currentPage == nil) {
    return nil
}
var nativeCamera: UniElement? = nil
var dialogPages = currentPage?.getDialogPages("systemDialog")
if (dialogPages != nil && dialogPages!.length > 0) {
    var len = dialogPages!.length
    do {
        var i = len - 1
        while(i >= 0){
            var page = dialogPages![i]
            var element__1 = page.getElementById("mnative-camera")
            if (element__1 != nil) {
                nativeCamera = element__1
                break
            }
            i--
        }
    }
}
if (nativeCamera == nil) {
    nativeCamera = currentPage?.getElementById("mnative-camera")
}
if (nativeCamera == nil) {
    return nil
}
if (!(UTSiOS.instanceof(nativeCamera, UniNativeViewElement.self))) {
    return nil
}
var cameraElement = nativeCamera?.parentElement as! UniCameraElement
if (cameraElement == nil) {
    return nil
}
return CameraContextImpl(cameraElement)
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextCameraFrameListenerImpl)
@objcMembers
public class CameraContextCameraFrameListenerImpl : NSObject, CameraContextCameraFrameListener {
    private var element: UniCameraElement
    private var callback: ((_ frame: CameraContextOnCameraFrame) -> Void)
    public init(_ element: UniCameraElement, _ callback: @escaping (_ frame: CameraContextOnCameraFrame) -> Void){
        self.element = element
        self.callback = callback
        element.setFrameCallback(callback)
    }
    public func start(_ options: CameraContextCameraFrameListenerStartOptions) -> Void {
        self.element.startOnFrame()
        var result = "start on camera frame"
        options.success?(result)
        options.complete?(result)
    }
    public func stop(_ options: CameraContextCameraFrameListenerStopOptions) -> Void {
        self.element.stopOnFrame()
        var result = "stop on camera frame"
        options.success?(result)
        options.complete?(result)
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextImpl)
@objcMembers
public class CameraContextImpl : NSObject, CameraContext {
    private var element: UniCameraElement
    public init(_ element: UniCameraElement){
        self.element = element
    }
    public func onCameraFrame(_ callback: @escaping (_ frame: CameraContextOnCameraFrame) -> Void) -> CameraContextCameraFrameListener? {
        var listener = CameraContextCameraFrameListenerImpl(self.element, callback)
        return listener
    }
    public func setZoom(_ options: CameraContextSetZoomOptions) -> Void {
        self.element.setZoom(options.zoom)
        var result = "setZoom success"
        options.success?(result)
        options.complete?(result)
    }
    public func takePhoto(_ options: CameraContextTakePhotoOptions) -> Void {
        self.element.takePhoto(options)
    }
    public func startRecord(_ options: CameraContextStartRecordOptions) -> Void {
        self.element.startRecord(options)
    }
    public func stopRecord(_ options: CameraContextStopRecordOptions) -> Void {
        self.element.stopRecord(options)
    }
    public func onIosCameraOriginalFrame(_ callback: @escaping (_ sampleBuffer: CMSampleBuffer) -> Void) -> Void {
        self.element.startAnalysis(callback)
    }
    public func offIosCameraOriginalFrame() -> Void {
        self.element.stopAnalysis()
    }
    public func getCurrentZoom() -> NSNumber {
        return self.element.getCurrentZoom()
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextCameraFrameListenerStartOptionsJSONObject)
@objcMembers
public class CameraContextCameraFrameListenerStartOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextCameraFrameListenerStopOptionsJSONObject)
@objcMembers
public class CameraContextCameraFrameListenerStopOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextSetZoomOptionsJSONObject)
@objcMembers
public class CameraContextSetZoomOptionsJSONObject : NSObject {
    public var zoom: NSNumber!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextTakePhotoOptionsJSONObject)
@objcMembers
public class CameraContextTakePhotoOptionsJSONObject : NSObject {
    public var quality: String?
    public var selfieMirror: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextStartRecordOptionsJSONObject)
@objcMembers
public class CameraContextStartRecordOptionsJSONObject : NSObject {
    public var timeoutCallback: UTSCallback?
    public var timeout: NSNumber?
    public var selfieMirror: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextStopRecordOptionsJSONObject)
@objcMembers
public class CameraContextStopRecordOptionsJSONObject : NSObject {
    public var compressed: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniCameraIosFrameScannerOptionsJSONObject)
@objcMembers
public class IosFrameScannerOptionsJSONObject : NSObject {
    public var sampleBuffer: CMSampleBuffer!
    public var scanType: Array<String>!
    public var autoZoom: Bool = false
    public var width: NSNumber!
    public var height: NSNumber!
    public var iosScannerListenner: IosScannerListener?
}
@objc(UTSSDKModulesDCloudUniCameraIosPhotoScannerOptionsJSONObject)
@objcMembers
public class IosPhotoScannerOptionsJSONObject : NSObject {
    public var filePath: String!
    public var scanType: Array<String>!
    public var iosScannerListenner: IosScannerListener?
}
@objc(UTSSDKModulesDCloudUniCameraTypeTestByJs)
@objcMembers
public class TypeTestByJs : TypeTest {
}
public func initIosScannerByJs(_ scanner: IosScanner) -> Void {
    return initIosScanner(scanner)
}
public func getIosScannerByJs() -> Int {
    var ins = getIosScanner()
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(IosScannerByJsProxy(ins!)) : 0
}
@objc(UTSSDKModulesDCloudUniCameraCameraInstanceByJs)
@objcMembers
public class CameraInstanceByJs : CameraInstance {
    public func startByJs(_ position: String) {
        return self.start(position)
    }
    public func stopByJs() {
        return self.stop()
    }
    public func resumeByJs() {
        return self.resume()
    }
    public func destoryByJs() {
        return self.destory()
    }
    public func switchCameraByJs(_ position: String) {
        return self.switchCamera(position)
    }
    public func setFlashByJs(_ flash: String) {
        return self.setFlash(flash)
    }
    public func setFrameSizeByJs(_ size: String) {
        return self.setFrameSize(size)
    }
    public func setPhotoResolutionByJs(_ resolution: String) {
        return self.setPhotoResolution(resolution)
    }
    public func setScanCodeByJs(_ on: Bool) {
        return self.setScanCode(on)
    }
    public func registerStopCallbackByJs() {
        return self.registerStopCallback()
    }
    public func registerInitDoneCallbackByJs() {
        return self.registerInitDoneCallback()
    }
    public func registerErrorCallbackByJs() {
        return self.registerErrorCallback()
    }
}
public func createCameraContextByJs() -> Int {
    var ins = createCameraContext()
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(CameraContextByJsProxy(ins!)) : 0
}
@objc(UTSSDKModulesDCloudUniCameraIosScannerByJsProxy)
@objcMembers
public class IosScannerByJsProxy : NSObject {
    public var __instance: IosScanner
    public init(_ ins: IosScanner){
        __instance = ins
    }
    public func processScanBarCodeByJs(_ options: IosFrameScannerOptionsJSONObject) -> Void {
        return __instance.processScanBarCode(IosFrameScannerOptions(UTSJSONObject([
            "sampleBuffer": options.sampleBuffer,
            "scanType": options.scanType,
            "autoZoom": options.autoZoom,
            "width": options.width,
            "height": options.height,
            "iosScannerListenner": options.iosScannerListenner
        ])))
    }
    public func processScanBarCodeWithPhotoByJs(_ options: IosPhotoScannerOptionsJSONObject) -> Void {
        return __instance.processScanBarCodeWithPhoto(IosPhotoScannerOptions(UTSJSONObject([
            "filePath": options.filePath,
            "scanType": options.scanType,
            "iosScannerListenner": options.iosScannerListenner
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextByJsProxy)
@objcMembers
public class CameraContextByJsProxy : NSObject {
    public var __instance: CameraContext
    public init(_ ins: CameraContext){
        __instance = ins
    }
    public func onCameraFrameByJs(_ callback: UTSCallback) -> Int {
        var ins = __instance.onCameraFrame({
        (_ frame: CameraContextOnCameraFrame) -> Void in
        callback(frame)
        })
        return ins != nil ? UTSBridge.registerJavaScriptClassInstance(CameraContextCameraFrameListenerByJsProxy(ins!)) : 0
    }
    public func onIosCameraOriginalFrameByJs(_ callback: UTSCallback) -> Void {
        return __instance.onIosCameraOriginalFrame({
        (sampleBuffer: CMSampleBuffer) -> Void in
        callback(sampleBuffer)
        })
    }
    public func offIosCameraOriginalFrameByJs() -> Void {
        return __instance.offIosCameraOriginalFrame()
    }
    public func getCurrentZoomByJs() -> NSNumber {
        return __instance.getCurrentZoom()
    }
    public func setZoomByJs(_ options: CameraContextSetZoomOptionsJSONObject) -> Void {
        return __instance.setZoom(CameraContextSetZoomOptions(UTSJSONObject([
            "zoom": options.zoom,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: Any) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func takePhotoByJs(_ options: CameraContextTakePhotoOptionsJSONObject) -> Void {
        return __instance.takePhoto(CameraContextTakePhotoOptions(UTSJSONObject([
            "quality": options.quality,
            "selfieMirror": options.selfieMirror,
            "success": {
            (result: CameraContextTakePhotoResult) -> Void in
            options.success?(result)
            },
            "fail": {
            (error: CameraContextFail) -> Void in
            options.fail?(error)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func startRecordByJs(_ options: CameraContextStartRecordOptionsJSONObject) -> Void {
        return __instance.startRecord(CameraContextStartRecordOptions(UTSJSONObject([
            "timeoutCallback": {
            (result: Any) -> Void in
            options.timeoutCallback?(result)
            },
            "timeout": options.timeout,
            "selfieMirror": options.selfieMirror,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (error: CameraContextFail) -> Void in
            options.fail?(error)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func stopRecordByJs(_ options: CameraContextStopRecordOptionsJSONObject) -> Void {
        return __instance.stopRecord(CameraContextStopRecordOptions(UTSJSONObject([
            "compressed": options.compressed,
            "success": {
            (result: CameraContextStopRecordResult) -> Void in
            options.success?(result)
            },
            "fail": {
            (error: CameraContextFail) -> Void in
            options.fail?(error)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniCameraCameraContextCameraFrameListenerByJsProxy)
@objcMembers
public class CameraContextCameraFrameListenerByJsProxy : NSObject {
    public var __instance: CameraContextCameraFrameListener
    public init(_ ins: CameraContextCameraFrameListener){
        __instance = ins
    }
    public func startByJs(_ options: CameraContextCameraFrameListenerStartOptionsJSONObject) -> Void {
        return __instance.start(CameraContextCameraFrameListenerStartOptions(UTSJSONObject([
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: Any) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func stopByJs(_ options: CameraContextCameraFrameListenerStopOptionsJSONObject) -> Void {
        return __instance.stop(CameraContextCameraFrameListenerStopOptions(UTSJSONObject([
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: Any) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniCameraIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniCameraIndexSwift : NSObject {
    public static func s_initIosScannerByJs(_ scanner: IosScanner) -> Void {
        return initIosScannerByJs(scanner)
    }
    public static func s_getIosScannerByJs() -> Int {
        return getIosScannerByJs()
    }
    public static func s_createCameraContextByJs() -> Int {
        return createCameraContextByJs()
    }
}
