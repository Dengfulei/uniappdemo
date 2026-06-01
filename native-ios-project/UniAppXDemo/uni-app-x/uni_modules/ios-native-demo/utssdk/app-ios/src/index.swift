import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
@objc(UTSSDKModulesIosNativeDemoIosNativeDemoInfo)
@objcMembers
public class IosNativeDemoInfo : NSObject, UTSObject {
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
public typealias GetIosNativeDemoInfo = () -> IosNativeDemoInfo
public typealias CopyIosNativeDemoText = (_ text: String) -> Bool
@objc(UTSSDKModulesIosNativeDemoIosNativeAlbumResult)
@objcMembers
public class IosNativeAlbumResult : NSObject, UTSObject {
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
public typealias IosNativeAlbumCallback = (_ result: IosNativeAlbumResult) -> Void
public typealias OpenIosNativeAlbum = (_ callback: @escaping IosNativeAlbumCallback) -> Bool
public var getIosNativeDemoInfo: GetIosNativeDemoInfo = {
() -> IosNativeDemoInfo in
var device = UIDevice.current
return IosNativeDemoInfo(UTSJSONObject([
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
public var copyIosNativeDemoText: CopyIosNativeDemoText = {
(_ text: String) -> Bool in
UIPasteboard.general.string = text
return UIPasteboard.general.string == text
}
@objc(UTSSDKModulesIosNativeDemoIosNativeAlbumPickerManager)
@objcMembers
public class IosNativeAlbumPickerManager : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public static var shared: IosNativeAlbumPickerManager? = nil
    public var callback: IosNativeAlbumCallback? = nil
    public func `open`(_ callback: @escaping IosNativeAlbumCallback) -> Bool {
        if (!UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)) {
            callback(IosNativeAlbumResult(UTSJSONObject([
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
        callback(IosNativeAlbumResult(UTSJSONObject([
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
        self.callback?(IosNativeAlbumResult(UTSJSONObject([
            "action": "selected",
            "message": "已从 iOS 系统相册选择资源",
            "mediaType": mediaType
        ])))
    }
    public func imagePickerControllerDidCancel(_ param1: UIImagePickerController) {
        self.dismiss(param1)
        self.callback?(IosNativeAlbumResult(UTSJSONObject([
            "action": "cancel",
            "message": "已取消选择",
            "mediaType": ""
        ])))
    }
}
public var openIosNativeAlbum: OpenIosNativeAlbum = {
(_ callback: @escaping IosNativeAlbumCallback) -> Bool in
IosNativeAlbumPickerManager.shared = IosNativeAlbumPickerManager()
return IosNativeAlbumPickerManager.shared!.open(callback)
}
public func getIosNativeDemoInfoByJs() -> IosNativeDemoInfo {
    return getIosNativeDemoInfo()
}
public func copyIosNativeDemoTextByJs(_ text: String) -> Bool {
    return copyIosNativeDemoText(text)
}
public func openIosNativeAlbumByJs(_ callback: UTSCallback) -> Bool {
    return openIosNativeAlbum({
    (result: IosNativeAlbumResult) -> Void in
    callback(result)
    })
}
@objc(UTSSDKModulesIosNativeDemoIndexSwift)
@objcMembers
public class UTSSDKModulesIosNativeDemoIndexSwift : NSObject {
    public static func s_getIosNativeDemoInfoByJs() -> IosNativeDemoInfo {
        return getIosNativeDemoInfoByJs()
    }
    public static func s_copyIosNativeDemoTextByJs(_ text: String) -> Bool {
        return copyIosNativeDemoTextByJs(text)
    }
    public static func s_openIosNativeAlbumByJs(_ callback: UTSCallback) -> Bool {
        return openIosNativeAlbumByJs(callback)
    }
}
