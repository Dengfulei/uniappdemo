import AVFoundation
import CoreImage
import CoreMedia
import DCloudUTSExtAPI
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
@objc(UTSSDKModulesDCloudUniBarcodeScanningFrameScannerCallback)
@objcMembers
public class FrameScannerCallback : NSObject, ScannerCallback {
    private var options: IosFrameScannerOptions
    public init(_ options: IosFrameScannerOptions){
        self.options = options
    }
    internal func onScanSuccess(_ barcodeInformation: [IosBarcodeInformation], _ screenShot: ScreenShot?) {
        var bridgeBarcodeInformation: [BarcodeInformation] = []
        for information in resolveUTSValueIterator(barcodeInformation){
            var area = information.scanArea
            var scanArea = [] as! [NSNumber]
            scanArea.push(NSNumber.from(area[0]))
            scanArea.push(NSNumber.from(area[1]))
            scanArea.push(NSNumber.from(area[2]))
            scanArea.push(NSNumber.from(area[3]))
            var bridgeInfomation = BarcodeInformation(UTSJSONObject([
                "result": information.result,
                "scanType": information.scanType,
                "charset": information.charset,
                "rawData": information.rawData,
                "scanArea": scanArea
            ]))
            bridgeBarcodeInformation.push(bridgeInfomation)
        }
        var bridgeScreenShot: IosScreenShot? = nil
        if (screenShot != nil && screenShot!.image != nil) {
            bridgeScreenShot = IosScreenShot(UTSJSONObject([
                "image": screenShot!.image
            ]))
        }
        var listener = self.options.iosScannerListenner
        listener?.onScanSuccess(bridgeBarcodeInformation, bridgeScreenShot)
    }
    internal func onScanFailure(_ error: String) {
        var listener = self.options.iosScannerListenner
        listener?.onScanFailure(error)
    }
    internal func needZoom() {
        var listener = self.options.iosScannerListenner
        listener?.needZoom()
    }
    internal func onLight(_ light: Bool) {
        var listener = self.options.iosScannerListenner
        listener?.onLight(light as! Bool)
    }
}
@objc(UTSSDKModulesDCloudUniBarcodeScanningPhotoScannerCallback)
@objcMembers
public class PhotoScannerCallback : NSObject, ScannerCallback {
    private var options: IosPhotoScannerOptions
    public init(_ options: IosPhotoScannerOptions){
        self.options = options
    }
    internal func onScanSuccess(_ barcodeInformation: [IosBarcodeInformation], _ screenShot: ScreenShot?) {
        var bridgeBarcodeInformation: [BarcodeInformation] = []
        for information in resolveUTSValueIterator(barcodeInformation){
            var area = information.scanArea
            var scanArea = [] as! [NSNumber]
            scanArea.push(NSNumber.from(area[0]))
            scanArea.push(NSNumber.from(area[1]))
            scanArea.push(NSNumber.from(area[2]))
            scanArea.push(NSNumber.from(area[3]))
            var bridgeInfomation = BarcodeInformation(UTSJSONObject([
                "result": information.result,
                "scanType": information.scanType,
                "charset": information.charset,
                "rawData": information.rawData,
                "scanArea": scanArea
            ]))
            bridgeBarcodeInformation.push(bridgeInfomation)
        }
        var listener = self.options.iosScannerListenner
        listener?.onScanSuccess(bridgeBarcodeInformation, nil)
    }
    internal func onScanFailure(_ error: String) {
        var listener = self.options.iosScannerListenner
        listener?.onScanFailure(error)
    }
    internal func needZoom() {}
    internal func onLight(_ light: Bool) {}
}
@objc(UTSSDKModulesDCloudUniBarcodeScanningIosScannerImpl)
@objcMembers
public class IosScannerImpl : NSObject, IosScanner {
    public func processScanBarCode(_ options: IosFrameScannerOptions) {
        var sampleBuffer = options.sampleBuffer
        var scanType = options.scanType
        var autoZoom = options.autoZoom
        var width = options.width
        var height = options.height
        Scanner.processScanBarCode(sampleBuffer!, scanType!, autoZoom, width!.toInt(), height!.toInt(), FrameScannerCallback(options), "back")
    }
    public func processScanBarCodeWithPhoto(_ options: IosPhotoScannerOptions) {
        var scanType = options.scanType
        var filePath = options.filePath
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
        () -> Void in
        Scanner.processScanBarCode(filePath!, scanType!, PhotoScannerCallback(options))
        })
    }
}
@objc(UTSSDKModulesDCloudUniBarcodeScanningAppHookProxy)
@objcMembers
public class AppHookProxy : NSObject, UTSiOSHookProxy {
    public func applicationDidFinishLaunchingWithOptions(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>?) -> Bool {
        var androidScanner = IosScannerImpl()
        initIosScanner(androidScanner)
        return true
    }
}
@objc(UTSSDKModulesDCloudUniBarcodeScanningIosScannerImplByJs)
@objcMembers
public class IosScannerImplByJs : IosScannerImpl {
    public func processScanBarCodeByJs(_ options: IosFrameScannerOptions) {
        return self.processScanBarCode(options)
    }
    public func processScanBarCodeWithPhotoByJs(_ options: IosPhotoScannerOptions) {
        return self.processScanBarCodeWithPhoto(options)
    }
}
@objc(UTSSDKModulesDCloudUniBarcodeScanningAppHookProxyByJs)
@objcMembers
public class AppHookProxyByJs : AppHookProxy {
    public func applicationDidFinishLaunchingWithOptionsByJs(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>?) -> Bool {
        return self.applicationDidFinishLaunchingWithOptions(application, launchOptions)
    }
}
