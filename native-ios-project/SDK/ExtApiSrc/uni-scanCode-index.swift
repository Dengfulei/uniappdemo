import CoreFoundation
import CoreMedia
import DCloudUTSExtAPI
import DCloudUTSFoundation
import DCloudUniappRuntime
import JavaScriptCore
import UIKit
@objc(UTSSDKModulesDCloudUniScanCodeScanCodeSuccess)
@objcMembers
public class ScanCodeSuccess : NSObject, UTSObject {
    public var result: String!
    public var scanType: String!
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
    }
}
@objc(UTSSDKModulesDCloudUniScanCodeScanCodeFail)
@objcMembers
public class ScanCodeFail : NSObject, UTSObject {
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
public typealias ScanCodeSuccessCallback = (_ res: ScanCodeSuccess) -> Void
public typealias ScanCodeFailCallback = (_ res: ScanCodeFail) -> Void
public typealias ScanCodeCompleteCallback = (_ res: Any) -> Void
public typealias ScanCodeSupportedTypes = String
@objc(UTSSDKModulesDCloudUniScanCodeScanCodeOptions)
@objcMembers
public class ScanCodeOptions : NSObject, UTSObject {
    public var onlyFromCamera: Bool = false
    public var scanType: [ScanCodeSupportedTypes]?
    public var success: ScanCodeSuccessCallback?
    public var fail: ScanCodeFailCallback?
    public var complete: ScanCodeCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "onlyFromCamera":
                    self.onlyFromCamera = try! utsSubscriptCheckValue(newValue)
                case "scanType":
                    self.scanType = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.onlyFromCamera = (obj["onlyFromCamera"] as? Bool) ?? false
        self.scanType = obj["scanType"] as! [ScanCodeSupportedTypes]?
        self.success = obj["success"] as! ScanCodeSuccessCallback?
        self.fail = obj["fail"] as! ScanCodeFailCallback?
        self.complete = obj["complete"] as! ScanCodeCompleteCallback?
    }
}
public func scanCode(_ options: ScanCodeOptions?) -> Void {
    var uuid = """
\(Date.now())\(Math.floor(Math.random() * 1e7))
"""
    var baseEventName = """
uni_scan_code_\(uuid)
"""
    var successEventName = """
\(baseEventName)_success
"""
    var failEventName = """
\(baseEventName)_fail
"""
    var onlyFromCamera = options?.onlyFromCamera ?? false
    DCloudUTSExtAPI.__$$on(successEventName, {
    (spread_variadic: Any?...) -> Void in
    var _variadic = Array(spread_variadic)
    var result = _variadic[0] as! UTSJSONObject
    var successResult = ScanCodeSuccess(UTSJSONObject([
        "result": result["result"] as! String,
        "scanType": result["scanType"] as! String
    ]))
    options?.success?(successResult)
    options?.complete?(successResult)
    })
    DCloudUTSExtAPI.__$$on(failEventName, {
    (spread_variadic: Any?...) -> Void in
    var _variadic = Array(spread_variadic)
    var result = _variadic[0] as! UTSJSONObject
    var failResult = ScanCodeFail(UTSJSONObject([:]))
    options?.fail?(failResult)
    options?.complete?(failResult)
    })
    DCloudUTSExtAPI.openDialogPage(OpenDialogPageOptions(UTSJSONObject([
        "triggerParentHide": true,
        "animationType": "zoom-fade-out",
        "url": """
uni:scanCode?successEventName=\(successEventName)&failEventName=\(failEventName)&onlyFromCamera=\(onlyFromCamera)
""",
        "fail": {
        (_ err: OpenDialogPageFail) -> Void in
        DCloudUTSExtAPI.__$$off(successEventName, nil)
        DCloudUTSExtAPI.__$$off(failEventName, nil)
        }
    ])))
}
public func drawImage(_ element: UniElement, _ image: UIImage) -> Void {
    var view = element.getIOSView()
    if (view != nil && UTSiOS.instanceof(view, UIImageView.self)) {
        setTimeout({
        () -> Void in
        var imageView = view! as! UIImageView
        imageView.image = image
        }, 100)
    }
}
@objc(UTSSDKModulesDCloudUniScanCodeIosScannerFrameListenerImpl)
@objcMembers
public class IosScannerFrameListenerImpl : NSObject, IosScannerListener {
    private var successCallback: ((_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void)
    private var zoomCallback: (() -> Void)
    private var lightCallback: ((_ light: Bool) -> Void)
    public init(_ successCallback: @escaping (_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void, _ zoomCallback: @escaping () -> Void, _ lightCallback: @escaping (_ light: Bool) -> Void){
        self.successCallback = successCallback
        self.zoomCallback = zoomCallback
        self.lightCallback = lightCallback
    }
    public func onScanSuccess(_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void {
        self.successCallback(barcodeInformation, screenShot)
    }
    public func onScanFailure(_ error: String) -> Void {}
    public func needZoom() -> Void {
        self.zoomCallback()
    }
    public func onLight(_ light: Bool) -> Void {
        self.lightCallback(light)
    }
}
@objc(UTSSDKModulesDCloudUniScanCodeIosScannerPhotoListenerImpl)
@objcMembers
public class IosScannerPhotoListenerImpl : NSObject, IosScannerListener {
    private var successCallback: ((_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void)
    private var failCallback: ((_ error: String) -> Void)
    public init(_ successCallback: @escaping (_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void, _ failCallback: @escaping (_ error: String) -> Void){
        self.successCallback = successCallback
        self.failCallback = failCallback
    }
    public func onScanSuccess(_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void {
        self.successCallback(barcodeInformation, screenShot)
    }
    public func onScanFailure(_ error: String) -> Void {
        self.failCallback(error)
    }
    public func needZoom() -> Void {}
    public func onLight(_ light: Bool) -> Void {}
}
public var scanCodeSelectionShowStatus: Bool = false
public func setScanCodeSelectionShowStatus(_ show: Bool) {
    scanCodeSelectionShowStatus = show
}
public func utsNativeProcessScanBarCode(_ scanType: [ScanCodeSupportedTypes], _ width: NSNumber, _ height: NSNumber, _ element: UniElement, _ showSelectViewCallback: @escaping (_ show: Bool) -> Void, _ attachTipViewCallback: @escaping (_ barcodeInformation: Array<Map<String, Any>>) -> Void, _ singleBarSuccessCallback: @escaping (_ barcodeInformation: Array<Map<String, Any>>) -> Void, _ zoomCallback: @escaping () -> Void, _ lightCallback: @escaping (_ light: Bool) -> Void) {
    var context = createCameraContext()
    context?.onIosCameraOriginalFrame({
    (sampleBuffer: CMSampleBuffer) -> Void in
    var options = IosFrameScannerOptions(UTSJSONObject([
        "sampleBuffer": sampleBuffer,
        "scanType": scanType,
        "autoZoom": true,
        "width": width,
        "height": height,
        "iosScannerListenner": IosScannerFrameListenerImpl({
        (_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void in
        var data: [Map<String, Any>] = []
        barcodeInformation.forEach({
        (_ value: BarcodeInformation) -> Void in
        var item: Map<String, Any> = Map()
        item["result"] = value.result
        item["scanType"] = value.scanType
        item["charset"] = value.charset
        item["rawData"] = value.rawData
        item["scanArea"] = value.scanArea
        data.push(item)
        })
        if (barcodeInformation.length > 1 && screenShot != nil && !scanCodeSelectionShowStatus) {
            context?.offIosCameraOriginalFrame()
            showSelectViewCallback(true)
            drawImage(element, screenShot!.image)
            attachTipViewCallback(data)
        } else {
            if (barcodeInformation.length == 0) {
                return
            }
            singleBarSuccessCallback(data)
        }
        }, {
        () -> Void in
        zoomCallback()
        }, {
        (_ light: Bool) -> Void in
        lightCallback(light)
        })
    ]))
    getIosScanner()?.processScanBarCode(options)
    })
}
public func utsNativeProcessScanBarCodeWithPhoto(_ filePath: String, _ scanType: [ScanCodeSupportedTypes], _ singleBarSuccessCallback: @escaping (_ barcodeInformation: Array<Map<String, Any>>) -> Void, _ failCallback: @escaping (_ error: String) -> Void) {
    var options = IosPhotoScannerOptions(UTSJSONObject([
        "filePath": filePath,
        "scanType": scanType,
        "iosScannerListenner": IosScannerPhotoListenerImpl({
        (_ barcodeInformation: Array<BarcodeInformation>, _ screenShot: IosScreenShot?) -> Void in
        var data: [Map<String, Any>] = []
        barcodeInformation.forEach({
        (_ value: BarcodeInformation) -> Void in
        var item: Map<String, Any> = Map()
        item["result"] = value.result
        item["scanType"] = value.scanType
        item["charset"] = value.charset
        item["rawData"] = value.rawData
        item["scanArea"] = value.scanArea
        data.push(item)
        })
        singleBarSuccessCallback(data)
        }, {
        (_ error: String) -> Void in
        failCallback(error)
        })
    ]))
    getIosScanner()?.processScanBarCodeWithPhoto(options)
}
@objc(UTSSDKModulesDCloudUniScanCodeScanCodeOptionsJSONObject)
@objcMembers
public class ScanCodeOptionsJSONObject : NSObject {
    public var onlyFromCamera: Bool = false
    public var scanType: [ScanCodeSupportedTypes]?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func scanCodeByJs(_ options: ScanCodeOptionsJSONObject?) -> Void {
    return scanCode(options != nil ? ScanCodeOptions(UTSJSONObject([
        "onlyFromCamera": options!.onlyFromCamera,
        "scanType": options!.scanType,
        "success": {
        (res: ScanCodeSuccess) -> Void in
        options!.success?(res)
        },
        "fail": {
        (res: ScanCodeFail) -> Void in
        options!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options!.complete?(res)
        }
    ])) : nil)
}
public func setScanCodeSelectionShowStatusByJs(_ show: Bool) {
    return setScanCodeSelectionShowStatus(show)
}
public func utsNativeProcessScanBarCodeByJs(_ scanType: [ScanCodeSupportedTypes], _ width: NSNumber, _ height: NSNumber, _ element: UniElement, _ showSelectViewCallback: UTSCallback, _ attachTipViewCallback: UTSCallback, _ singleBarSuccessCallback: UTSCallback, _ zoomCallback: UTSCallback, _ lightCallback: UTSCallback) {
    return utsNativeProcessScanBarCode(scanType, width, height, element, {
    (show: Bool) -> Void in
    showSelectViewCallback(show)
    }, {
    (barcodeInformation: Array<Map<String, Any>>) -> Void in
    attachTipViewCallback(barcodeInformation)
    }, {
    (barcodeInformation: Array<Map<String, Any>>) -> Void in
    singleBarSuccessCallback(barcodeInformation)
    }, {
    () -> Void in
    zoomCallback()
    }, {
    (light: Bool) -> Void in
    lightCallback(light)
    })
}
public func utsNativeProcessScanBarCodeWithPhotoByJs(_ filePath: String, _ scanType: [ScanCodeSupportedTypes], _ singleBarSuccessCallback: UTSCallback, _ failCallback: UTSCallback) {
    return utsNativeProcessScanBarCodeWithPhoto(filePath, scanType, {
    (barcodeInformation: Array<Map<String, Any>>) -> Void in
    singleBarSuccessCallback(barcodeInformation)
    }, {
    (error: String) -> Void in
    failCallback(error)
    })
}
@objc(UTSSDKModulesDCloudUniScanCodeIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniScanCodeIndexSwift : NSObject {
    public static func s_scanCodeByJs(_ options: ScanCodeOptionsJSONObject?) -> Void {
        return scanCodeByJs(options)
    }
    public static func s_setScanCodeSelectionShowStatusByJs(_ show: Bool) {
        return setScanCodeSelectionShowStatusByJs(show)
    }
    public static func s_utsNativeProcessScanBarCodeByJs(_ scanType: [ScanCodeSupportedTypes], _ width: NSNumber, _ height: NSNumber, _ element: UniElement, _ showSelectViewCallback: UTSCallback, _ attachTipViewCallback: UTSCallback, _ singleBarSuccessCallback: UTSCallback, _ zoomCallback: UTSCallback, _ lightCallback: UTSCallback) {
        return utsNativeProcessScanBarCodeByJs(scanType, width, height, element, showSelectViewCallback, attachTipViewCallback, singleBarSuccessCallback, zoomCallback, lightCallback)
    }
    public static func s_utsNativeProcessScanBarCodeWithPhotoByJs(_ filePath: String, _ scanType: [ScanCodeSupportedTypes], _ singleBarSuccessCallback: UTSCallback, _ failCallback: UTSCallback) {
        return utsNativeProcessScanBarCodeWithPhotoByJs(filePath, scanType, singleBarSuccessCallback, failCallback)
    }
}
