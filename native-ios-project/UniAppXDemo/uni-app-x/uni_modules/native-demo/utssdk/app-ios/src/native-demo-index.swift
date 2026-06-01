import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
@objc(UTSSDKModulesNativeDemoNativeDemoInfo)
@objcMembers
public class NativeDemoInfo : NSObject, UTSObject {
    public var platform: String!
    public var deviceName: String!
    public var systemName: String!
    public var systemVersion: String!
    public var model: String!
    public var timestamp: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "platform":
                    self.platform = try! utsSubscriptCheckValue(newValue)
                case "deviceName":
                    self.deviceName = try! utsSubscriptCheckValue(newValue)
                case "systemName":
                    self.systemName = try! utsSubscriptCheckValue(newValue)
                case "systemVersion":
                    self.systemVersion = try! utsSubscriptCheckValue(newValue)
                case "model":
                    self.model = try! utsSubscriptCheckValue(newValue)
                case "timestamp":
                    self.timestamp = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.platform = obj["platform"] as! String
        self.deviceName = obj["deviceName"] as! String
        self.systemName = obj["systemName"] as! String
        self.systemVersion = obj["systemVersion"] as! String
        self.model = obj["model"] as! String
        self.timestamp = obj["timestamp"] as! String
    }
}
public typealias GetNativeDemoInfo = () -> NativeDemoInfo
public typealias CopyNativeDemoText = (_ text: String) -> Bool
@objc(UTSSDKModulesNativeDemoNativeAlbumResult)
@objcMembers
public class NativeAlbumResult : NSObject, UTSObject {
    public var action: String!
    public var message: String!
    public var mediaType: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "action":
                    self.action = try! utsSubscriptCheckValue(newValue)
                case "message":
                    self.message = try! utsSubscriptCheckValue(newValue)
                case "mediaType":
                    self.mediaType = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.action = obj["action"] as! String
        self.message = obj["message"] as! String
        self.mediaType = obj["mediaType"] as! String
    }
}
public typealias NativeAlbumCallback = (_ result: NativeAlbumResult) -> Void
public typealias OpenNativeAlbum = (_ callback: @escaping NativeAlbumCallback) -> Bool
public var getNativeDemoInfo: GetNativeDemoInfo = {
() -> NativeDemoInfo in
var device = UIDevice.current
return NativeDemoInfo(UTSJSONObject([
    "platform": "iOS",
    "deviceName": device.name,
    "systemName": device.systemName,
    "systemVersion": device.systemVersion,
    "model": device.model,
    "timestamp": """
\(Date.now())
"""
]))
}
public var copyNativeDemoText: CopyNativeDemoText = {
(_ text: String) -> Bool in
UIPasteboard.general.string = text
return UIPasteboard.general.string == text
}
@objc(UTSSDKModulesNativeDemoNativeAlbumPickerManager)
@objcMembers
public class NativeAlbumPickerManager : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public static var shared: NativeAlbumPickerManager? = nil
    public var callback: NativeAlbumCallback? = nil
    public func `open`(_ callback: @escaping NativeAlbumCallback) -> Bool {
        if (!UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)) {
            callback(NativeAlbumResult(UTSJSONObject([
                "action": "unavailable",
                "message": "当前设备不可用系统相册",
                "mediaType": ""
            ])))
            return false
        }
        self.callback = callback
        var pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        pickerController.mediaTypes = [
            "public.image"
        ]
        UTSiOS.getCurrentViewController().present(pickerController, animated: true, completion: nil)
        callback(NativeAlbumResult(UTSJSONObject([
            "action": "opened",
            "message": "已打开 iOS 系统相册",
            "mediaType": "public.image"
        ])))
        return true
    }
    public func dismiss(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        picker.delegate = nil
    }
    public func imagePickerController(_ param1: UIImagePickerController, didFinishPickingMediaWithInfo info: Map<UIImagePickerController.InfoKey, Any>) {
        var mediaType = """
\(info.get(UIImagePickerController.InfoKey.mediaType) ?? "public.image")
"""
        self.dismiss(param1)
        self.callback?(NativeAlbumResult(UTSJSONObject([
            "action": "selected",
            "message": "已从 iOS 系统相册选择资源",
            "mediaType": mediaType
        ])))
    }
    public func imagePickerControllerDidCancel(_ param1: UIImagePickerController) {
        self.dismiss(param1)
        self.callback?(NativeAlbumResult(UTSJSONObject([
            "action": "cancel",
            "message": "已取消选择",
            "mediaType": ""
        ])))
    }
}
public var openNativeAlbum: OpenNativeAlbum = {
(_ callback: @escaping NativeAlbumCallback) -> Bool in
NativeAlbumPickerManager.shared = NativeAlbumPickerManager()
return NativeAlbumPickerManager.shared!.open(callback)
}
public func getNativeDemoInfoByJs() -> NativeDemoInfo {
    return getNativeDemoInfo()
}
public func copyNativeDemoTextByJs(_ text: String) -> Bool {
    return copyNativeDemoText(text)
}
public func openNativeAlbumByJs(_ callback: UTSCallback) -> Bool {
    return openNativeAlbum({
    (result: NativeAlbumResult) -> Void in
    callback(result)
    })
}
@objc(UTSSDKModulesNativeDemoIndexSwift)
@objcMembers
public class UTSSDKModulesNativeDemoIndexSwift : NSObject {
    public static func s_getNativeDemoInfoByJs() -> NativeDemoInfo {
        return getNativeDemoInfoByJs()
    }
    public static func s_copyNativeDemoTextByJs(_ text: String) -> Bool {
        return copyNativeDemoTextByJs(text)
    }
    public static func s_openNativeAlbumByJs(_ callback: UTSCallback) -> Bool {
        return openNativeAlbumByJs(callback)
    }
}
