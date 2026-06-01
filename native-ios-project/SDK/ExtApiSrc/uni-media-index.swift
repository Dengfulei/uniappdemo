import AVFoundation
@_implementationOnly import DCloudMediaPicker
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import Photos
import Swift
import UIKit
import DCloudUTSExtAPI
public typealias MediaOrientation = String
public typealias MediaErrorCode = NSNumber
public protocol IMediaError : IUniError {
    var errCode: MediaErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniMediaChooseImageTempFile)
@objcMembers
public class ChooseImageTempFile : NSObject, UTSObject {
    public var path: String!
    public var size: NSNumber!
    public var name: String?
    public var type: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                case "size":
                    self.size = try! utsSubscriptCheckValue(newValue)
                case "name":
                    self.name = try! utsSubscriptCheckValueIfPresent(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.path = obj["path"] as! String
        self.size = obj["size"] as! NSNumber
        self.name = obj["name"] as! String?
        self.type = obj["type"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniMediaChooseImageSuccess)
@objcMembers
public class ChooseImageSuccess : NSObject, UTSObject {
    public var errSubject: String!
    public var errMsg: String!
    public var tempFilePaths: Array<String>!
    public var tempFiles: [ChooseImageTempFile]!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errSubject":
                    self.errSubject = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                case "tempFilePaths":
                    self.tempFilePaths = try! utsSubscriptCheckValue(newValue)
                case "tempFiles":
                    self.tempFiles = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errSubject = obj["errSubject"] as! String
        self.errMsg = obj["errMsg"] as! String
        self.tempFilePaths = obj["tempFilePaths"] as! Array<String>
        self.tempFiles = obj["tempFiles"] as! [ChooseImageTempFile]
    }
}
public typealias ChooseImageFail = IMediaError
public typealias ChooseImageSuccessCallback = (_ callback: ChooseImageSuccess) -> Void
public typealias ChooseImageFailCallback = (_ callback: ChooseImageFail) -> Void
public typealias ChooseImageCompleteCallback = (_ callback: Any) -> Void
@objc(UTSSDKModulesDCloudUniMediaChooseImageCropOptions)
@objcMembers
public class ChooseImageCropOptions : NSObject, UTSObject {
    public var width: NSNumber!
    public var height: NSNumber!
    public var quality: NSNumber?
    public var resize: Bool = false
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
                case "quality":
                    self.quality = try! utsSubscriptCheckValueIfPresent(newValue)
                case "resize":
                    self.resize = try! utsSubscriptCheckValue(newValue)
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
        self.quality = obj["quality"] as! NSNumber?
        self.resize = (obj["resize"] as? Bool) ?? false
    }
}
public typealias ChooseImagePageOrientation = String
public typealias ChooseImageAlbumMode = String
@objc(UTSSDKModulesDCloudUniMediaChooseImageOptions)
@objcMembers
public class ChooseImageOptions : NSObject, UTSObject {
    public var pageOrientation: ChooseImagePageOrientation?
    public var albumMode: ChooseImageAlbumMode?
    public var count: NSNumber?
    public var sizeType: [String]?
    public var sourceType: [String]?
    public var `extension`: [String]?
    public var crop: ChooseImageCropOptions?
    public var success: ChooseImageSuccessCallback?
    public var fail: ChooseImageFailCallback?
    public var complete: ChooseImageCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "pageOrientation":
                    self.pageOrientation = try! utsSubscriptCheckValueIfPresent(newValue)
                case "albumMode":
                    self.albumMode = try! utsSubscriptCheckValueIfPresent(newValue)
                case "count":
                    self.count = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sizeType":
                    self.sizeType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sourceType":
                    self.sourceType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "extension":
                    self.extension = try! utsSubscriptCheckValueIfPresent(newValue)
                case "crop":
                    self.crop = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.pageOrientation = obj["pageOrientation"] as! ChooseImagePageOrientation?
        self.albumMode = obj["albumMode"] as! ChooseImageAlbumMode?
        self.count = obj["count"] as! NSNumber?
        self.sizeType = obj["sizeType"] as! [String]?
        self.sourceType = obj["sourceType"] as! [String]?
        self.extension = obj["extension"] as! [String]?
        self.crop = obj["crop"] as! ChooseImageCropOptions?
        self.success = obj["success"] as! ChooseImageSuccessCallback?
        self.fail = obj["fail"] as! ChooseImageFailCallback?
        self.complete = obj["complete"] as! ChooseImageCompleteCallback?
    }
}
public typealias ChooseImage = (_ options: ChooseImageOptions) -> Void
public typealias GetImageInfo = (_ options: GetImageInfoOptions) -> Void
@objc(UTSSDKModulesDCloudUniMediaGetImageInfoSuccess)
@objcMembers
public class GetImageInfoSuccess : NSObject, UTSObject {
    public var width: NSNumber!
    public var height: NSNumber!
    public var path: String!
    public var orientation: MediaOrientation?
    public var type: String?
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
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                case "orientation":
                    self.orientation = try! utsSubscriptCheckValueIfPresent(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.path = obj["path"] as! String
        self.orientation = obj["orientation"] as! MediaOrientation?
        self.type = obj["type"] as! String?
    }
}
public typealias GetImageInfoFail = IMediaError
public typealias GetImageInfoSuccessCallback = (_ callback: GetImageInfoSuccess) -> Void
public typealias GetImageInfoFailCallback = (_ callback: GetImageInfoFail) -> Void
public typealias GetImageInfoCompleteCallback = ChooseImageCompleteCallback
@objc(UTSSDKModulesDCloudUniMediaGetImageInfoOptions)
@objcMembers
public class GetImageInfoOptions : NSObject, UTSObject {
    public var src: String!
    public var success: GetImageInfoSuccessCallback?
    public var fail: GetImageInfoFailCallback?
    public var complete: GetImageInfoCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "src":
                    self.src = try! utsSubscriptCheckValue(newValue)
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
        self.src = obj["src"] as! String
        self.success = obj["success"] as! GetImageInfoSuccessCallback?
        self.fail = obj["fail"] as! GetImageInfoFailCallback?
        self.complete = obj["complete"] as! GetImageInfoCompleteCallback?
    }
}
public typealias SaveImageToPhotosAlbum = (_ options: SaveImageToPhotosAlbumOptions) -> Void
@objc(UTSSDKModulesDCloudUniMediaSaveImageToPhotosAlbumSuccess)
@objcMembers
public class SaveImageToPhotosAlbumSuccess : NSObject, UTSObject {
    public var path: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.path = obj["path"] as! String
    }
}
public typealias SaveImageToPhotosAlbumFail = IMediaError
public typealias SaveImageToPhotosAlbumSuccessCallback = (_ callback: SaveImageToPhotosAlbumSuccess) -> Void
public typealias SaveImageToPhotosAlbumFailCallback = (_ callback: SaveImageToPhotosAlbumFail) -> Void
public typealias SaveImageToPhotosAlbumCompleteCallback = ChooseImageCompleteCallback
@objc(UTSSDKModulesDCloudUniMediaSaveImageToPhotosAlbumOptions)
@objcMembers
public class SaveImageToPhotosAlbumOptions : NSObject, UTSObject {
    public var filePath: String!
    public var success: SaveImageToPhotosAlbumSuccessCallback?
    public var fail: SaveImageToPhotosAlbumFailCallback?
    public var complete: SaveImageToPhotosAlbumCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
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
        self.filePath = obj["filePath"] as! String
        self.success = obj["success"] as! SaveImageToPhotosAlbumSuccessCallback?
        self.fail = obj["fail"] as! SaveImageToPhotosAlbumFailCallback?
        self.complete = obj["complete"] as! SaveImageToPhotosAlbumCompleteCallback?
    }
}
public typealias CompressImage = (_ options: CompressImageOptions) -> Void
@objc(UTSSDKModulesDCloudUniMediaCompressImageSuccess)
@objcMembers
public class CompressImageSuccess : NSObject, UTSObject {
    public var tempFilePath: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFilePath":
                    self.tempFilePath = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempFilePath = obj["tempFilePath"] as! String
    }
}
public typealias CompressImageFail = IMediaError
public typealias CompressImageSuccessCallback = (_ callback: CompressImageSuccess) -> Void
public typealias CompressImageFailCallback = (_ callback: CompressImageFail) -> Void
public typealias CompressImageCompleteCallback = ChooseImageCompleteCallback
@objc(UTSSDKModulesDCloudUniMediaCompressImageOptions)
@objcMembers
public class CompressImageOptions : NSObject, UTSObject {
    public var src: String!
    public var quality: NSNumber?
    public var rotate: NSNumber?
    public var width: String?
    public var height: String?
    public var compressedHeight: NSNumber?
    public var compressedWidth: NSNumber?
    public var success: CompressImageSuccessCallback?
    public var fail: CompressImageFailCallback?
    public var complete: CompressImageCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "src":
                    self.src = try! utsSubscriptCheckValue(newValue)
                case "quality":
                    self.quality = try! utsSubscriptCheckValueIfPresent(newValue)
                case "rotate":
                    self.rotate = try! utsSubscriptCheckValueIfPresent(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValueIfPresent(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValueIfPresent(newValue)
                case "compressedHeight":
                    self.compressedHeight = try! utsSubscriptCheckValueIfPresent(newValue)
                case "compressedWidth":
                    self.compressedWidth = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.src = obj["src"] as! String
        self.quality = obj["quality"] as! NSNumber?
        self.rotate = obj["rotate"] as! NSNumber?
        self.width = obj["width"] as! String?
        self.height = obj["height"] as! String?
        self.compressedHeight = obj["compressedHeight"] as! NSNumber?
        self.compressedWidth = obj["compressedWidth"] as! NSNumber?
        self.success = obj["success"] as! CompressImageSuccessCallback?
        self.fail = obj["fail"] as! CompressImageFailCallback?
        self.complete = obj["complete"] as! CompressImageCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniMediaChooseVideoSuccess)
@objcMembers
public class ChooseVideoSuccess : NSObject, UTSObject {
    public var tempFilePath: String!
    public var duration: NSNumber!
    public var size: NSNumber!
    public var height: NSNumber!
    public var width: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFilePath":
                    self.tempFilePath = try! utsSubscriptCheckValue(newValue)
                case "duration":
                    self.duration = try! utsSubscriptCheckValue(newValue)
                case "size":
                    self.size = try! utsSubscriptCheckValue(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValue(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempFilePath = obj["tempFilePath"] as! String
        self.duration = obj["duration"] as! NSNumber
        self.size = obj["size"] as! NSNumber
        self.height = obj["height"] as! NSNumber
        self.width = obj["width"] as! NSNumber
    }
}
public typealias ChooseVideoFail = IMediaError
public typealias ChooseVideoSuccessCallback = (_ callback: ChooseVideoSuccess) -> Void
public typealias ChooseVideoFailCallback = (_ callback: ChooseVideoFail) -> Void
public typealias ChooseVideoCompleteCallback = ChooseImageCompleteCallback
public typealias ChooseVideoPageOrientation = ChooseImagePageOrientation
public typealias ChooseVideoAlbumMode = ChooseImageAlbumMode
@objc(UTSSDKModulesDCloudUniMediaChooseVideoOptions)
@objcMembers
public class ChooseVideoOptions : NSObject, UTSObject {
    public var pageOrientation: ChooseVideoPageOrientation?
    public var albumMode: ChooseVideoAlbumMode?
    public var sourceType: [String]?
    public var compressed: Bool = true
    public var maxDuration: NSNumber?
    public var camera: String?
    public var `extension`: [String]?
    public var success: ChooseVideoSuccessCallback?
    public var fail: ChooseVideoFailCallback?
    public var complete: ChooseVideoCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "pageOrientation":
                    self.pageOrientation = try! utsSubscriptCheckValueIfPresent(newValue)
                case "albumMode":
                    self.albumMode = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sourceType":
                    self.sourceType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "compressed":
                    self.compressed = try! utsSubscriptCheckValue(newValue)
                case "maxDuration":
                    self.maxDuration = try! utsSubscriptCheckValueIfPresent(newValue)
                case "camera":
                    self.camera = try! utsSubscriptCheckValueIfPresent(newValue)
                case "extension":
                    self.extension = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.pageOrientation = obj["pageOrientation"] as! ChooseVideoPageOrientation?
        self.albumMode = obj["albumMode"] as! ChooseVideoAlbumMode?
        self.sourceType = obj["sourceType"] as! [String]?
        self.compressed = (obj["compressed"] as? Bool) ?? true
        self.maxDuration = obj["maxDuration"] as! NSNumber?
        self.camera = obj["camera"] as! String?
        self.extension = obj["extension"] as! [String]?
        self.success = obj["success"] as! ChooseVideoSuccessCallback?
        self.fail = obj["fail"] as! ChooseVideoFailCallback?
        self.complete = obj["complete"] as! ChooseVideoCompleteCallback?
    }
}
public typealias ChooseVideo = (_ options: ChooseVideoOptions) -> Void
@objc(UTSSDKModulesDCloudUniMediaGetVideoInfoSuccess)
@objcMembers
public class GetVideoInfoSuccess : NSObject, UTSObject {
    public var orientation: MediaOrientation?
    public var type: String?
    public var duration: NSNumber!
    public var size: NSNumber!
    public var height: NSNumber!
    public var width: NSNumber!
    public var fps: NSNumber?
    public var bitrate: NSNumber?
    public var thumbTempFilePath: String?
    public var byteSize: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "orientation":
                    self.orientation = try! utsSubscriptCheckValueIfPresent(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
                case "duration":
                    self.duration = try! utsSubscriptCheckValue(newValue)
                case "size":
                    self.size = try! utsSubscriptCheckValue(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValue(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValue(newValue)
                case "fps":
                    self.fps = try! utsSubscriptCheckValueIfPresent(newValue)
                case "bitrate":
                    self.bitrate = try! utsSubscriptCheckValueIfPresent(newValue)
                case "thumbTempFilePath":
                    self.thumbTempFilePath = try! utsSubscriptCheckValueIfPresent(newValue)
                case "byteSize":
                    self.byteSize = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.orientation = obj["orientation"] as! MediaOrientation?
        self.type = obj["type"] as! String?
        self.duration = obj["duration"] as! NSNumber
        self.size = obj["size"] as! NSNumber
        self.height = obj["height"] as! NSNumber
        self.width = obj["width"] as! NSNumber
        self.fps = obj["fps"] as! NSNumber?
        self.bitrate = obj["bitrate"] as! NSNumber?
        self.thumbTempFilePath = obj["thumbTempFilePath"] as! String?
        self.byteSize = obj["byteSize"] as! NSNumber?
    }
}
public typealias GetVideoInfoFail = IMediaError
public typealias GetVideoInfoSuccessCallback = (_ callback: GetVideoInfoSuccess) -> Void
public typealias GetVideoInfoFailCallback = (_ callback: GetVideoInfoFail) -> Void
public typealias GetVideoInfoCompleteCallback = ChooseImageCompleteCallback
@objc(UTSSDKModulesDCloudUniMediaGetVideoInfoOptions)
@objcMembers
public class GetVideoInfoOptions : NSObject, UTSObject {
    public var src: String!
    public var success: GetVideoInfoSuccessCallback?
    public var fail: GetVideoInfoFailCallback?
    public var complete: GetVideoInfoCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "src":
                    self.src = try! utsSubscriptCheckValue(newValue)
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
        self.src = obj["src"] as! String
        self.success = obj["success"] as! GetVideoInfoSuccessCallback?
        self.fail = obj["fail"] as! GetVideoInfoFailCallback?
        self.complete = obj["complete"] as! GetVideoInfoCompleteCallback?
    }
}
public typealias GetVideoInfo = (_ options: GetVideoInfoOptions) -> Void
@objc(UTSSDKModulesDCloudUniMediaSaveVideoToPhotosAlbumSuccess)
@objcMembers
public class SaveVideoToPhotosAlbumSuccess : NSObject, UTSObject {
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
public typealias SaveVideoToPhotosAlbumFail = IMediaError
public typealias SaveVideoToPhotosAlbumSuccessCallback = (_ callback: SaveVideoToPhotosAlbumSuccess) -> Void
public typealias SaveVideoToPhotosAlbumFailCallback = (_ callback: SaveVideoToPhotosAlbumFail) -> Void
public typealias SaveVideoToPhotosAlbumCompleteCallback = ChooseImageCompleteCallback
@objc(UTSSDKModulesDCloudUniMediaSaveVideoToPhotosAlbumOptions)
@objcMembers
public class SaveVideoToPhotosAlbumOptions : NSObject, UTSObject {
    public var filePath: String!
    public var success: SaveVideoToPhotosAlbumSuccessCallback?
    public var fail: SaveVideoToPhotosAlbumFailCallback?
    public var complete: SaveVideoToPhotosAlbumCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
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
        self.filePath = obj["filePath"] as! String
        self.success = obj["success"] as! SaveVideoToPhotosAlbumSuccessCallback?
        self.fail = obj["fail"] as! SaveVideoToPhotosAlbumFailCallback?
        self.complete = obj["complete"] as! SaveVideoToPhotosAlbumCompleteCallback?
    }
}
public typealias SaveVideoToPhotosAlbum = (_ options: SaveVideoToPhotosAlbumOptions) -> Void
@objc(UTSSDKModulesDCloudUniMediaCompressVideoSuccess)
@objcMembers
public class CompressVideoSuccess : NSObject, UTSObject {
    public var tempFilePath: String!
    public var size: NSNumber!
    public var byteSize: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFilePath":
                    self.tempFilePath = try! utsSubscriptCheckValue(newValue)
                case "size":
                    self.size = try! utsSubscriptCheckValue(newValue)
                case "byteSize":
                    self.byteSize = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempFilePath = obj["tempFilePath"] as! String
        self.size = obj["size"] as! NSNumber
        self.byteSize = obj["byteSize"] as! NSNumber?
    }
}
public typealias CompressVideoFail = IMediaError
public typealias CompressVideoSuccessCallback = (_ callback: CompressVideoSuccess) -> Void
public typealias CompressVideoFailCallback = (_ callback: CompressVideoFail) -> Void
public typealias CompressVideoCompleteCallback = ChooseImageCompleteCallback
@objc(UTSSDKModulesDCloudUniMediaCompressVideoOptions)
@objcMembers
public class CompressVideoOptions : NSObject, UTSObject {
    public var src: String!
    public var quality: String?
    public var bitrate: NSNumber?
    public var fps: NSNumber?
    public var resolution: NSNumber?
    public var success: CompressVideoSuccessCallback?
    public var fail: CompressVideoFailCallback?
    public var complete: CompressVideoCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "src":
                    self.src = try! utsSubscriptCheckValue(newValue)
                case "quality":
                    self.quality = try! utsSubscriptCheckValueIfPresent(newValue)
                case "bitrate":
                    self.bitrate = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fps":
                    self.fps = try! utsSubscriptCheckValueIfPresent(newValue)
                case "resolution":
                    self.resolution = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.src = obj["src"] as! String
        self.quality = obj["quality"] as! String?
        self.bitrate = obj["bitrate"] as! NSNumber?
        self.fps = obj["fps"] as! NSNumber?
        self.resolution = obj["resolution"] as! NSNumber?
        self.success = obj["success"] as! CompressVideoSuccessCallback?
        self.fail = obj["fail"] as! CompressVideoFailCallback?
        self.complete = obj["complete"] as! CompressVideoCompleteCallback?
    }
}
public typealias CompressVideo = (_ options: CompressVideoOptions) -> Void
public typealias ChooseFile = (_ options: ChooseFileOptions) -> Void
@objc(UTSSDKModulesDCloudUniMediaChooseFileSuccess)
@objcMembers
public class ChooseFileSuccess : NSObject, UTSObject {
    public var tempFilePaths: [String]!
    public var tempFiles: [ChooseFileTempFile]!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFilePaths":
                    self.tempFilePaths = try! utsSubscriptCheckValue(newValue)
                case "tempFiles":
                    self.tempFiles = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempFilePaths = obj["tempFilePaths"] as! [String]
        self.tempFiles = obj["tempFiles"] as! [ChooseFileTempFile]
    }
}
@objc(UTSSDKModulesDCloudUniMediaChooseFileTempFile)
@objcMembers
public class ChooseFileTempFile : NSObject, UTSObject {
    public var name: String!
    public var path: String!
    public var size: NSNumber!
    public var type: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "name":
                    self.name = try! utsSubscriptCheckValue(newValue)
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                case "size":
                    self.size = try! utsSubscriptCheckValue(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.name = obj["name"] as! String
        self.path = obj["path"] as! String
        self.size = obj["size"] as! NSNumber
        self.type = obj["type"] as! String
    }
}
public typealias ChooseFileSuccessCallback = (_ result: ChooseFileSuccess) -> Void
public typealias ChooseFileFail = IMediaError
public typealias ChooseFileFailCallback = (_ result: ChooseFileFail) -> Void
public typealias ChooseFileComplete = Any
public typealias ChooseFileCompleteCallback = (_ result: ChooseFileComplete) -> Void
@objc(UTSSDKModulesDCloudUniMediaChooseFileOptions)
@objcMembers
public class ChooseFileOptions : NSObject, UTSObject {
    public var count: NSNumber?
    public var type: String?
    public var `extension`: [String]?
    public var sizeType: Any?
    public var sourceType: [String]?
    public var success: ChooseFileSuccessCallback?
    public var fail: ChooseFileFailCallback?
    public var complete: ChooseFileCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "count":
                    self.count = try! utsSubscriptCheckValueIfPresent(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
                case "extension":
                    self.extension = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sizeType":
                    self.sizeType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sourceType":
                    self.sourceType = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.count = obj["count"] as! NSNumber?
        self.type = obj["type"] as! String?
        self.extension = obj["extension"] as! [String]?
        self.sizeType = obj["sizeType"] as! Any?
        self.sourceType = obj["sourceType"] as! [String]?
        self.success = obj["success"] as! ChooseFileSuccessCallback?
        self.fail = obj["fail"] as! ChooseFileFailCallback?
        self.complete = obj["complete"] as! ChooseFileCompleteCallback?
    }
}
public var UniError_GetImageInfo = "uni-getImageInfo"
public var UniError_SaveImageToPhotosAlbum = "uni-saveImageToPhotosAlbum"
public var UniError_SaveVideoToPhotosAlbum = "uni-saveVideoToPhotosAlbum"
public var UniError_ChooseImage = "uni-chooseImage"
public var UniError_ChooseVideo = "uni-chooseVideo"
public var UniError_CompressImage = "uni-compressImage"
public var UniError_CompressVideo = "uni-compressVideo"
public var UniError_GetVideoInfo = "uni-getVideoInfo"
public var UniError_ChooseFile = "uni-chooseFile"
public var MediaUniErrors: Map<NSNumber, String> = Map([
    [
        1101001,
        "user cancel"
    ],
    [
        1101002,
        "fail parameter error: parameter.urls should have at least 1 item"
    ],
    [
        1101003,
        "file not find"
    ],
    [
        1101004,
        "Failed to load resource"
    ],
    [
        1101005,
        "No Permission"
    ],
    [
        1101006,
        "save error"
    ],
    [
        1101007,
        "crop error"
    ],
    [
        1101008,
        "camera error"
    ],
    [
        1101009,
        "image output failed"
    ],
    [
        1101010,
        "unexpect error:"
    ]
])
@objc(UTSSDKModulesDCloudUniMediaMediaErrorImpl)
@objcMembers
public class MediaErrorImpl : UniError, IMediaError {
    public init(_ errCode: MediaErrorCode, _ uniErrorSubject: String){
        super.init()
        self.errSubject = uniErrorSubject
        self.errCode = errCode
        self.errMsg = MediaUniErrors.get(errCode) ?? ""
    }
}
public func uniChooseImage(_ options: ChooseImageOptions, _ onSourceTypeSelect: @escaping (_ count: NSNumber, _ index: NSNumber) -> Void) {
    var count = options.count != nil ? options.count! <= 0 ? 9 : options.count : 9
    var sourceType: Array<String> = (options.sourceType != nil && options.sourceType!.length > 0) ? options.sourceType! : [
        "album",
        "camera"
    ]
    var itemList = [
        "拍摄",
        "从相册选择"
    ]
    if (sourceType.length == 1) {
        if (sourceType.indexOf("album") >= 0) {
            onSourceTypeSelect(count!, 1)
        } else if (sourceType.indexOf("camera") >= 0) {
            onSourceTypeSelect(count!, 0)
        }
        return
    }
    if (sourceType.length == 2) {
        DCloudUTSExtAPI.showActionSheet(ShowActionSheetOptions(UTSJSONObject([
            "itemList": itemList,
            "success": {
            (e: ShowActionSheetSuccess) -> Void in
            onSourceTypeSelect(count!, e.tapIndex)
            },
            "fail": {
            (e: ShowActionSheetFail) -> Void in
            var error = MediaErrorImpl(1101001, UniError_ChooseImage)
            options.fail?(error)
            options.complete?(error)
            }
        ])))
    }
}
public func uniChooseVideo(_ options: ChooseVideoOptions, _ onSourceTypeSelect: @escaping (_ index: NSNumber) -> Void) {
    var sourceType: Array<String> = (options.sourceType != nil && options.sourceType!.length > 0) ? options.sourceType! : [
        "album",
        "camera"
    ]
    var itemList = [
        "拍摄",
        "从相册选择"
    ]
    if (sourceType.length == 1) {
        if (sourceType.indexOf("album") >= 0) {
            onSourceTypeSelect(1)
        } else if (sourceType.indexOf("camera") >= 0) {
            onSourceTypeSelect(0)
        }
        return
    }
    if (sourceType.length == 2) {
        DCloudUTSExtAPI.showActionSheet(ShowActionSheetOptions(UTSJSONObject([
            "itemList": itemList,
            "success": {
            (e: ShowActionSheetSuccess) -> Void in
            onSourceTypeSelect(e.tapIndex)
            },
            "fail": {
            (e: ShowActionSheetFail) -> Void in
            var error = MediaErrorImpl(1101001, UniError_ChooseVideo)
            options.fail?(error)
            options.complete?(error)
            }
        ])))
    }
}
public func requestMicrophonePermission(_ completion: @escaping (_ status: NSNumber) -> Void) {
    var authorized = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
    if (authorized == AVAuthorizationStatus.authorized) {
        completion(1)
    } else if (authorized == AVAuthorizationStatus.notDetermined) {
        AVCaptureDevice.requestAccess(for: AVMediaType.audio, completionHandler: {
        (result: Bool) -> Void in
        if (result) {
            completion(1)
        } else {
            completion(0)
        }
        })
    } else {
        completion(0)
    }
}
public func requestCameraPermission(_ completion: @escaping (_ status: NSNumber) -> Void) {
    var cameraAuthorized = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
    if (cameraAuthorized == AVAuthorizationStatus.authorized) {
        completion(1)
    } else if (cameraAuthorized == AVAuthorizationStatus.notDetermined) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: {
        (result: Bool) -> Void in
        if (result) {
            completion(1)
        } else {
            completion(0)
        }
        })
    } else {
        completion(0)
    }
}
public func requestAlbumPermission(_ level: String, _ completion: @escaping (_ status: NSNumber) -> Void) {
    var albumAuthorized = PHAuthorizationStatus.notDetermined
    if #available(iOS 14, *) {
        var level: PHAccessLevel = PHAccessLevel.readWrite
        albumAuthorized = PHPhotoLibrary.authorizationStatus(for: level)
    } else {
        albumAuthorized = PHPhotoLibrary.authorizationStatus()
    }
    if #available(iOS 14, *) {
        if (albumAuthorized == PHAuthorizationStatus.authorized || albumAuthorized == PHAuthorizationStatus.limited) {
            completion(1)
            return
        }
    }
    if (albumAuthorized == PHAuthorizationStatus.authorized) {
        completion(1)
    } else if (albumAuthorized == PHAuthorizationStatus.notDetermined) {
        if #available(iOS 14, *) {
            var accessLevel = (level == "readWrite") ? PHAccessLevel.readWrite : PHAccessLevel.addOnly
            PHPhotoLibrary.requestAuthorization(for: accessLevel, handler: {
            (result: PHAuthorizationStatus) -> Void in
            if (result == PHAuthorizationStatus.authorized || result == PHAuthorizationStatus.limited) {
                completion(1)
            } else {
                completion(0)
            }
            })
        } else {
            PHPhotoLibrary.requestAuthorization({
            (result: PHAuthorizationStatus) -> Void in
            if (result == PHAuthorizationStatus.authorized) {
                completion(1)
            } else {
                completion(0)
            }
            })
        }
    } else {
        completion(0)
    }
}
public func isNetUrl(_ urlStr: String) -> Bool {
    var url = URL(string: urlStr)
    if (url?.scheme?.lowercased() == "http" || url?.scheme?.lowercased() == "https") {
        return true
    }
    return false
}
public func getImageOrientation(_ image: UIImage) -> String {
    var orientationStr = "up"
    var orientation = image.imageOrientation
    switch(orientation){
        case UIImage.Orientation.up:
            orientationStr = "up"
        case UIImage.Orientation.down:
            orientationStr = "down"
        case UIImage.Orientation.left:
            orientationStr = "left"
        case UIImage.Orientation.right:
            orientationStr = "right"
        case UIImage.Orientation.upMirrored:
            orientationStr = "up-mirrored"
        case UIImage.Orientation.downMirrored:
            orientationStr = "down-mirrored"
        case UIImage.Orientation.leftMirrored:
            orientationStr = "left-mirrored"
        case UIImage.Orientation.rightMirrored:
            orientationStr = "right-mirrored"
        default:
            orientationStr = "up"
            break
    }
    return orientationStr
}
public func getImageFormat(_ imageData: Data) -> String {
    if (imageData.count < 16) {
        return "unknown"
    }
    var value = [
        UInt8
    ](repeating: 0, count: 1)
    imageData.copyBytes(to: &value, count: 1)
    switch(value[0]){
        case 0x4D:
            return "TIFF"
        case 0x49:
            return "TIFF"
        case 0x89:
            return "PNG"
        case 0xFF:
            return "JPEG"
        case 0x47:
            return "GIF"
        case 0x52:
            if (imageData.count >= 12) {
                var range = Range(NSMakeRange(0, 12))
                var subData = imageData.subdata(in: range!)
                var infoString = String(data: subData, encoding: String.Encoding.ascii)
                if (infoString != nil) {
                    if (infoString!.hasPrefix("RIFF") && infoString!.hasSuffix("WEBP")) {
                        return "WEBP"
                    }
                }
            }
        case 0x00:
            if (imageData.count >= 12) {
                var range = Range(NSMakeRange(4, 8))
                var subData = imageData.subdata(in: range!)
                var infoString = String(data: subData, encoding: String.Encoding.ascii)
                if (infoString != nil) {
                    if (infoString!.hasPrefix("ftypheic") || infoString!.hasSuffix("ftypheix") || infoString!.hasSuffix("ftyphevc") || infoString!.hasSuffix("ftyphevx")) {
                        return "HEIC"
                    }
                }
            }
        default:
            break
    }
    return "unknown"
}
public func isExistFilePath(_ path: String) -> Bool {
    return FileManager.default.fileExists(atPath: path)
}
public func createFilePath(_ fileName: String) -> String {
    var mediaCachePath = UTSiOS.getMediaCacheDir() + "/"
    var isCreateSuccess = true
    if (isExistFilePath(mediaCachePath) == false) {
        do {
            try FileManager.default.createDirectory(atPath: mediaCachePath, withIntermediateDirectories: true, attributes: nil)
            isCreateSuccess = true
        }
         catch let e {
            var e = UTSError(e)
            isCreateSuccess = false
        }
    }
    return isCreateSuccess == true ? mediaCachePath + fileName : ""
}
public func saveImage(_ imageData: Data, _ type: String) -> String {
    var suffix: String = ".jpeg"
    if (type != "unknown") {
        suffix = "." + type.lowercased()
    }
    var currentTime = Int(Date().timeIntervalSince1970)
    var fileName = currentTime.toString() + suffix
    var path = createFilePath(fileName)
    if (path.length == 0) {
        return ""
    }
    var fileUrl = URL(fileURLWithPath: path)
    var isWriteSuccess = false
    do {
        try imageData.write(to: fileUrl)
        isWriteSuccess = true
    }
     catch let e {}
    return isWriteSuccess == true ? path : ""
}
@objc(UTSSDKModulesDCloudUniMediaDCUniMediaPicker)
@objcMembers
public class DCUniMediaPicker : NSObject {
    private var mediaAlbum: DCloudMediaAlbum? = nil
    private var mediaCamera: DCloudMediaCamera? = nil
    private var imageCompress: DCloudMediaImageCompress? = nil
    public func chooseImageWithCamera(_ option: ChooseImageOptions) {
        self._chooseImageWithCamera(option)
    }
    public func chooseImageWithAlbum(_ option: ChooseImageOptions, _ count: NSNumber) {
        self._chooseImageWithAlbum(option, count)
    }
    public func chooseVideoWithCamera(_ option: ChooseVideoOptions) {
        self._chooseVideoWithCamera(option)
    }
    public func chooseVideoWithAlbum(_ option: ChooseVideoOptions) {
        self._chooseVideoWithAlbum(option)
    }
    public func compressImage(_ option: CompressImageOptions) {
        self._compressImage(option)
    }
    public func getVideoInfo(_ option: GetVideoInfoOptions) {
        self._getVideoInfo(option)
    }
    public func compressVideo(_ option: CompressVideoOptions) {
        self._compressVideo(option)
    }
    private func _compressVideo(_ options: CompressVideoOptions) {
        var path = UTSiOS.getResourceAbsolutePath(options.src, nil)
        var videoUrl = URL(fileURLWithPath: path)
        var fileExtension = videoUrl.pathExtension == nil ? "mp4" : videoUrl.pathExtension
        var resolution: NSNumber = 1
        if (options.resolution != nil) {
            if (options.resolution! < 1 && options.resolution! > 0) {
                resolution = options.resolution!
            }
        }
        var fps: NSNumber = 30
        if (options.fps != nil) {
            fps = options.fps!
        }
        var bitrate: NSNumber = 1500000
        if (options.bitrate != nil) {
            bitrate = options.bitrate! * 1000
        }
        if (options.quality == "high") {
            resolution = 0.8
            fps = 48
        }
        if (options.quality == "medium") {
            resolution = 0.5
            fps = 30
        }
        if (options.quality == "low") {
            resolution = 0.3
            fps = 25
        }
        var currentTime = """
\(Date.now())\(Math.floor(Math.random() * 10000))
"""
        var fileName = "compressVideo_" + currentTime.toString() + "." + fileExtension
        var filePath = createFilePath(fileName)
        var videoInfo = DCloudMediaVideoCompress.getVideoInfo(videoUrl)
        if (videoInfo != nil) {
            var width: NSNumber = videoInfo!.get("width") as! NSNumber
            var compressWidth = width * resolution
            var height: NSNumber = videoInfo!.get("height") as! NSNumber
            var compressHeight = height * resolution
            bitrate = videoInfo!.get("bitrate") as! NSNumber
            DispatchQueue.main.async(execute: {
            () -> Void in
            DCloudMediaVideoCompress.compressVideo(withVideoUrl: videoUrl, outputPath: filePath, withBiteRate: bitrate, withFrameRate: fps, withVideoWidth: compressWidth, withVideoHeight: compressHeight, compressComplete: {
            (response: Map<AnyHashable, Any>) -> Void in
            var result: Map<String, Any> = response as! Map<String, Any>
            if (result.has("tempFilePath") && result.has("size") && result.has("byteSize")) {
                var success = CompressVideoSuccess(UTSJSONObject([
                    "tempFilePath": result.get("tempFilePath"),
                    "size": result.get("size"),
                    "byteSize": result.get("byteSize")
                ]))
                options.success?(success)
                options.complete?(success)
            } else {
                var error = MediaErrorImpl(1101003, UniError_CompressVideo)
                options.fail?(error)
                options.complete?(error)
            }
            })
            })
        } else {
            var error = MediaErrorImpl(1101003, UniError_CompressVideo)
            options.fail?(error)
            options.complete?(error)
        }
    }
    private func _getVideoInfo(_ options: GetVideoInfoOptions) {
        var path = UTSiOS.getResourceAbsolutePath(options.src, nil)
        var url = URL(fileURLWithPath: path)
        var videoInfo = DCloudMediaVideoCompress.getVideoInfo(url)
        if (videoInfo != nil) {
            if (videoInfo!.has("orientation") && videoInfo!.has("duration") && videoInfo!.has("type") && videoInfo!.has("size") && videoInfo!.has("byteSize") && videoInfo!.has("width") && videoInfo!.has("height") && videoInfo!.has("fps") && videoInfo!.has("bitrate") && videoInfo!.has("thumbTempFilePath")) {
                var successCallback = GetVideoInfoSuccess(UTSJSONObject([
                    "orientation": videoInfo!.get("orientation"),
                    "duration": videoInfo!.get("duration"),
                    "type": videoInfo!.get("type"),
                    "size": videoInfo!.get("size"),
                    "byteSize": videoInfo!.get("byteSize"),
                    "width": videoInfo!.get("width"),
                    "height": videoInfo!.get("height"),
                    "fps": videoInfo!.get("fps"),
                    "bitrate": videoInfo!.get("bitrate"),
                    "thumbTempFilePath": videoInfo!.get("thumbTempFilePath")
                ]))
                options.success?(successCallback)
                options.complete?(successCallback)
            } else {
                var error = MediaErrorImpl(1101010, UniError_GetVideoInfo)
                options.fail?(error)
                options.complete?(error)
            }
        } else {
            var error = MediaErrorImpl(1101010, UniError_GetVideoInfo)
            options.fail?(error)
            options.complete?(error)
        }
    }
    private func _compressImage(_ options: CompressImageOptions) {
        var inputPath = UTSiOS.getResourceAbsolutePath(options.src, nil)
        if (isExistFilePath(inputPath) == false) {
            var error = MediaErrorImpl(1101003, UniError_CompressImage)
            options.fail?(error)
            options.complete?(error)
            return
        }
        var quality: NSNumber = 80
        if (options.quality != nil) {
            quality = options.quality!
            if (quality < 1) {
                quality = 1
            }
            if (quality > 100) {
                quality = 100
            }
        }
        var rotate: NSNumber = 0
        if (options.rotate != nil) {
            rotate = options.rotate!
        }
        var mediaCachePath = UTSiOS.getMediaCacheDir() + "/"
        var params: Map<String, Any> = Map()
        params.set("inputPath", inputPath)
        params.set("cachePath", mediaCachePath)
        params.set("quality", quality)
        params.set("rotate", rotate)
        if (options.compressedWidth != nil) {
            params.set("compressedWidth", options.compressedWidth)
        }
        if (options.compressedHeight != nil) {
            params.set("compressedHeight", options.compressedHeight)
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (self.imageCompress == nil) {
            self.imageCompress = DCloudMediaImageCompress()
        }
        self.imageCompress?.compressImage(params, success: {
        (response: Map<AnyHashable, Any>) -> Void in
        if (response.has("tempFilePath")) {
            var success = CompressImageSuccess(UTSJSONObject([
                "tempFilePath": response.get("tempFilePath") as! String
            ]))
            options.success?(success)
            options.complete?(success)
        } else {
            var mediaError = MediaErrorImpl(1101009, UniError_CompressImage)
            options.fail?(mediaError)
            options.complete?(mediaError)
        }
        }, fail: {
        (code: NSNumber) -> Void in
        var mediaError = MediaErrorImpl(code, UniError_CompressImage)
        options.fail?(mediaError)
        options.complete?(mediaError)
        })
        })
    }
    private func _chooseVideoWithAlbum(_ option: ChooseVideoOptions) {
        var path = createFilePath("")
        var options: Map<String, Any> = Map()
        options.set("resolution", "high")
        options.set("videoCompress", option.compressed)
        options.set("filePath", path)
        options.set("maximum", 1)
        options.set("filter", "video")
        options.set("pageOrientation", self.convertPageOrientation(option.pageOrientation).rawValue)
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (self.mediaAlbum == nil) {
            self.mediaAlbum = DCloudMediaAlbum()
        }
        self.mediaAlbum?.start(options, success: {
        (response: Map<AnyHashable, Any>) -> Void in
        if (response.has("tempFiles")) {
            var list: Array<Any> = response.get("tempFiles") as! Array<Any>
            if (list.length > 0) {
                var file: Map<AnyHashable, Any> = list[0] as! Map<AnyHashable, Any>
                if (file.has("tempFilePath") && file.has("width") && file.has("height") && file.has("size") && file.has("duration")) {
                    var success = ChooseVideoSuccess(UTSJSONObject([
                        "tempFilePath": file.get("tempFilePath"),
                        "width": file.get("width"),
                        "height": file.get("height"),
                        "size": file.get("size"),
                        "duration": file.get("duration")
                    ]))
                    option.success?(success)
                    option.complete?(success)
                    return
                }
            }
        }
        var mediaError = MediaErrorImpl(1101009, UniError_ChooseVideo)
        option.fail?(mediaError)
        option.complete?(mediaError)
        }, fail: {
        (code: NSNumber) -> Void in
        var mediaError = MediaErrorImpl(code, UniError_ChooseVideo)
        option.fail?(mediaError)
        option.complete?(mediaError)
        })
        })
    }
    private func convertPageOrientation(_ orientationStr: String?) -> UIInterfaceOrientationMask {
        if (orientationStr == "auto") {
            return UIInterfaceOrientationMask.allButUpsideDown
        }
        if (orientationStr == "portrait") {
            return UIInterfaceOrientationMask.portrait
        }
        if (orientationStr == "landscape") {
            return UIInterfaceOrientationMask.landscape
        }
        return UTSiOS.getSupportOrientation()
    }
    private func _chooseImageWithAlbum(_ option: ChooseImageOptions, _ count: NSNumber) {
        var path = createFilePath("")
        var options: Map<String, Any> = Map()
        options.set("resolution", "high")
        options.set("sizeType", option.sizeType)
        options.set("filePath", path)
        options.set("filter", "image")
        if (count > 0) {
            options.set("maximum", count)
        }
        options.set("pageOrientation", self.convertPageOrientation(option.pageOrientation).rawValue)
        if (option.crop != nil) {
            var crop: Map<String, Any> = Map()
            if (option.crop!.width != nil) {
                crop.set("width", option.crop?.width)
            }
            if (option.crop!.height != nil) {
                crop.set("height", option.crop?.height)
            }
            if (option.crop!.resize != nil) {
                crop.set("resize", option.crop?.resize)
            }
            if (option.crop!.quality != nil) {
                crop.set("quality", option.crop?.quality)
            }
            options.set("crop", crop)
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (self.mediaAlbum == nil) {
            self.mediaAlbum = DCloudMediaAlbum()
        }
        self.mediaAlbum?.start(options, success: {
        (response: Map<AnyHashable, Any>) -> Void in
        if (response.has("tempFiles")) {
            var list: Array<Any> = response.get("tempFiles") as! Array<Any>
            if (list.length > 0) {
                var tempFiles: [ChooseImageTempFile] = Array()
                var tempFilePaths: [String] = Array()
                do {
                    var i: NSNumber = 0
                    while(i < list.length){
                        var file: Map<AnyHashable, Any> = list[i] as! Map<AnyHashable, Any>
                        var path: String = file["tempFilePath"] as! String
                        var size: NSNumber = file["size"] as! NSNumber
                        tempFilePaths.add(path)
                        var tempFile = ChooseImageTempFile(UTSJSONObject([
                            "path": path,
                            "size": size
                        ]))
                        tempFiles.add(tempFile)
                        i++
                    }
                }
                var success = ChooseImageSuccess(UTSJSONObject([
                    "errSubject": "uni-chooseImage",
                    "tempFilePaths": tempFilePaths,
                    "errMsg": "chooseImage:ok",
                    "tempFiles": tempFiles
                ]))
                option.success?(success)
                option.complete?(success)
                return
            }
        }
        var mediaError = MediaErrorImpl(1101004, UniError_ChooseImage)
        option.fail?(mediaError)
        option.complete?(mediaError)
        }, fail: {
        (code: NSNumber) -> Void in
        var mediaError = MediaErrorImpl(code, UniError_ChooseImage)
        option.fail?(mediaError)
        option.complete?(mediaError)
        })
        })
    }
    private func _chooseVideoWithCamera(_ option: ChooseVideoOptions) {
        var filePath = createFilePath("")
        var options: Map<String, Any> = Map()
        options.set("resolution", "high")
        options.set("videoCompress", option.compressed)
        options.set("filePath", filePath)
        options.set("filter", "video")
        if (option.maxDuration != nil) {
            if (option.maxDuration! > 0) {
                options.set("videoMaximumDuration", option.maxDuration)
            }
        } else {
            options.set("videoMaximumDuration", 60)
        }
        if (option.camera != nil) {
            options.set("index", option.camera == "front" ? 2 : 1)
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (self.mediaCamera == nil) {
            self.mediaCamera = DCloudMediaCamera()
        }
        self.mediaCamera?.start(options, success: {
        (response: Map<AnyHashable, Any>) -> Void in
        if (response.has("tempFiles")) {
            var tempFiles: Array<Any> = response.get("tempFiles") as! Array<Any>
            if (tempFiles.length > 0) {
                var result: Map<AnyHashable, Any> = tempFiles[0] as! Map<AnyHashable, Any>
                if (result.has("tempFilePath") && result.has("width") && result.has("height") && result.has("size") && result.has("duration")) {
                    var success = ChooseVideoSuccess(UTSJSONObject([
                        "tempFilePath": result.get("tempFilePath") as! String,
                        "width": result.get("width") as! NSNumber,
                        "height": result.get("height") as! NSNumber,
                        "size": result.get("size") as! NSNumber,
                        "duration": result.get("duration") as! NSNumber
                    ]))
                    option.success?(success)
                    option.complete?(success)
                    return
                }
            }
        }
        var mediaError = MediaErrorImpl(1101008, UniError_ChooseVideo)
        option.fail?(mediaError)
        option.complete?(mediaError)
        }, fail: {
        (code: NSNumber) -> Void in
        var mediaError = MediaErrorImpl(code, UniError_ChooseVideo)
        option.fail?(mediaError)
        option.complete?(mediaError)
        })
        })
    }
    private func _chooseImageWithCamera(_ option: ChooseImageOptions) {
        var filePath = createFilePath("")
        var options: Map<String, Any> = Map()
        options.set("resolution", "high")
        options.set("sizeType", option.sizeType)
        options.set("filePath", filePath)
        options.set("filter", "image")
        if (option.crop != nil) {
            var crop: Map<String, Any> = Map()
            if (option.crop!.width != nil) {
                crop.set("width", option.crop?.width)
            }
            if (option.crop!.height != nil) {
                crop.set("height", option.crop?.height)
            }
            if (option.crop!.resize != nil) {
                crop.set("resize", option.crop?.resize)
            }
            if (option.crop!.quality != nil) {
                crop.set("quality", option.crop?.quality)
            }
            options.set("crop", crop)
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (self.mediaCamera == nil) {
            self.mediaCamera = DCloudMediaCamera()
        }
        self.mediaCamera?.start(options, success: {
        (response: Map<AnyHashable, Any>) -> Void in
        if (response.has("tempFiles")) {
            var tempList: Array<Any> = response.get("tempFiles") as! Array<Any>
            if (tempList.length > 0) {
                var item: Map<AnyHashable, Any> = tempList[0] as! Map<AnyHashable, Any>
                var path: String = item.get("tempFilePath") as! String
                var size: NSNumber = item.get("size") as! NSNumber
                var tempFilePaths: [String] = Array.init(elements: path)
                var tempFile = ChooseImageTempFile(UTSJSONObject([
                    "path": path,
                    "size": size
                ]))
                var tempFiles: [ChooseImageTempFile] = Array.init(elements: tempFile)
                var success = ChooseImageSuccess(UTSJSONObject([
                    "errSubject": "uni-chooseImage",
                    "tempFilePaths": tempFilePaths,
                    "errMsg": "chooseImage:ok",
                    "tempFiles": tempFiles
                ]))
                option.success?(success)
                option.complete?(success)
                return
            }
        }
        var mediaError = MediaErrorImpl(1101008, UniError_ChooseImage)
        option.fail?(mediaError)
        option.complete?(mediaError)
        }, fail: {
        (code: NSNumber) -> Void in
        var mediaError = MediaErrorImpl(code, UniError_ChooseImage)
        option.fail?(mediaError)
        option.complete?(mediaError)
        })
        })
    }
}
public var mediaPicker: DCUniMediaPicker = DCUniMediaPicker()
public var chooseFile: ChooseFile = {
(_ option: ChooseFileOptions) -> Void in
UniChooseFileManager.shared.chooseFile(count: option.count, type: option.type, extension: option.extension, sizeType: option.sizeType, sourceType: option.sourceType, completionHandler: {
(_ res: ChooseFileSuccess?, _ errorCode: NSNumber?) -> Void in
if (errorCode != nil) {
    var err = MediaErrorImpl(errorCode!, UniError_ChooseFile)
    UniJsSwiftApiWrapper.runOnJsQueue({
    () -> Void in
    option.fail?(err)
    option.complete?(err)
    })
} else if (res != nil && res!.tempFiles != nil) {
    var tempFiles = Array<ChooseFileTempFile>()
    res!.tempFiles!.forEach({
    (_ value, _ key) -> Void in
    var tempFile = ChooseFileTempFile()
    tempFile.name = value.name
    tempFile.path = value.path
    tempFile.size = value.size
    tempFile.type = value.type
    tempFiles.push(tempFile)
    })
    var result = ChooseFileSuccess(UTSJSONObject([
        "tempFilePaths": res!.tempFilePaths,
        "tempFiles": tempFiles
    ]))
    UniJsSwiftApiWrapper.runOnJsQueue({
    () -> Void in
    option.success?(result)
    option.complete?(result)
    })
}
})
}
public var chooseImage: ChooseImage = {
(_ option: ChooseImageOptions) -> Void in
uniChooseImage(option, {
(_ count: NSNumber, _ index: NSNumber) -> Void in
if (index == 0) {
    requestCameraPermission({
    (_ status: NSNumber) -> Void in
    if (status == 1) {
        mediaPicker.chooseImageWithCamera(option)
    } else {
        var error = MediaErrorImpl(1101005, UniError_ChooseImage)
        option.fail?(error)
        option.complete?(error)
    }
    })
} else if (index == 1) {
    requestAlbumPermission("readWrite", {
    (_ status: NSNumber) -> Void in
    if (status == 1) {
        mediaPicker.chooseImageWithAlbum(option, count)
    } else {
        var error = MediaErrorImpl(1101005, UniError_ChooseImage)
        option.fail?(error)
        option.complete?(error)
    }
    })
}
})
}
public var chooseVideo: ChooseVideo = {
(_ option: ChooseVideoOptions) -> Void in
uniChooseVideo(option, {
(_ index: NSNumber) -> Void in
if (index == 0) {
    requestCameraPermission({
    (_ status: NSNumber) -> Void in
    if (status == 1) {
        requestMicrophonePermission({
        (_ status: NSNumber) -> Void in
        if (status == 1) {
            mediaPicker.chooseVideoWithCamera(option)
        } else {
            var error = MediaErrorImpl(1101005, UniError_ChooseVideo)
            option.fail?(error)
            option.complete?(error)
        }
        })
    } else {
        var error = MediaErrorImpl(1101005, UniError_ChooseVideo)
        option.fail?(error)
        option.complete?(error)
    }
    })
} else if (index == 1) {
    requestAlbumPermission("readWrite", {
    (_ status: NSNumber) -> Void in
    if (status == 1) {
        mediaPicker.chooseVideoWithAlbum(option)
    } else {
        var error = MediaErrorImpl(1101005, UniError_ChooseVideo)
        option.fail?(error)
        option.complete?(error)
    }
    })
}
})
}
public var saveImageToPhotosAlbum: SaveImageToPhotosAlbum = {
(_ options: SaveImageToPhotosAlbumOptions) -> Void in
var path = UTSiOS.getResourceAbsolutePath(options.filePath, nil)
var url = URL(string: path)
if (url == nil) {
    var error = MediaErrorImpl(1101003, UniError_SaveImageToPhotosAlbum)
    options.fail?(error)
    options.complete?(error)
    return
}
requestAlbumPermission("addOnly", {
(_ status: NSNumber) -> Void in
if (status == 1) {
    do {
        try PHPhotoLibrary.shared().performChangesAndWait({
        () -> Void in
        PHAssetCreationRequest.creationRequestForAssetFromImage(atFileURL: url!)
        })
        var success = SaveImageToPhotosAlbumSuccess(UTSJSONObject([
            "path": path
        ]))
        options.success?(success)
        options.complete?(success)
    } catch let e {
        var e = UTSError(e)
        var error = MediaErrorImpl(1101006, UniError_SaveImageToPhotosAlbum)
        options.fail?(error)
        options.complete?(error)
    }
} else {
    var error = MediaErrorImpl(1101005, UniError_SaveImageToPhotosAlbum)
    options.fail?(error)
    options.complete?(error)
}
})
}
public var saveVideoToPhotosAlbum: SaveVideoToPhotosAlbum = {
(_ options: SaveVideoToPhotosAlbumOptions) -> Void in
var path = UTSiOS.getResourceAbsolutePath(options.filePath, nil)
var url = URL(string: path)
if (url == nil) {
    var error = MediaErrorImpl(1101003, UniError_SaveVideoToPhotosAlbum)
    options.fail?(error)
    options.complete?(error)
    return
}
requestAlbumPermission("addOnly", {
(_ status: NSNumber) -> Void in
if (status == 1) {
    do {
        try PHPhotoLibrary.shared().performChangesAndWait({
        () -> Void in
        PHAssetCreationRequest.creationRequestForAssetFromVideo(atFileURL: url!)
        })
        var success = SaveVideoToPhotosAlbumSuccess(UTSJSONObject([:]))
        options.success?(success)
        options.complete?(success)
    } catch let e {
        var e = UTSError(e)
        var error = MediaErrorImpl(1101006, UniError_SaveVideoToPhotosAlbum)
        options.fail?(error)
        options.complete?(error)
    }
} else {
    var error = MediaErrorImpl(1101005, UniError_SaveVideoToPhotosAlbum)
    options.fail?(error)
    options.complete?(error)
}
})
}
public var getImageInfo: GetImageInfo = {
(_ options: GetImageInfoOptions) -> Void in
if (options.src.length > 0) {
    if (isNetUrl(options.src)) {
        UTSiOS.loadImage(options.src, {
        (_ image, _ data) -> Void in
        if (image != nil) {
            var imageData: Data? = nil
            if (data != nil) {
                imageData = data
            } else {
                imageData = image!.jpegData(compressionQuality: 1.0)
            }
            var type = getImageFormat(imageData!)
            var path = saveImage(imageData!, type)
            if (path.count > 0) {
                DispatchQueue.main.async(execute: {
                () -> Void in
                var successCallback = GetImageInfoSuccess(UTSJSONObject([
                    "width": image!.size.width,
                    "height": image!.size.height,
                    "path": "file://" + path,
                    "orientation": getImageOrientation(image!),
                    "type": type
                ]))
                options.success?(successCallback)
                options.complete?(successCallback)
                })
                return
            }
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        var failCallback = MediaErrorImpl(1101004, UniError_GetImageInfo)
        options.fail?(failCallback)
        options.complete?(failCallback)
        })
        })
    } else {
        var path = UTSiOS.getResourceAbsolutePath(options.src, nil)
        var url = URL(fileURLWithPath: path)
        var imageData: Data? = nil
        do {
            imageData = try Data(contentsOf: url)
        } catch let e {}
        if (imageData != nil) {
            var image = UIImage(data: imageData!)
            if (image != nil) {
                var successCallback = GetImageInfoSuccess(UTSJSONObject([
                    "width": image!.size.width,
                    "height": image!.size.height,
                    "path": "file://" + path,
                    "orientation": getImageOrientation(image!),
                    "type": getImageFormat(imageData!)
                ]))
                options.success?(successCallback)
                options.complete?(successCallback)
                return
            }
        }
        var failCallback = MediaErrorImpl(1101004, UniError_GetImageInfo)
        options.fail?(failCallback)
        options.complete?(failCallback)
    }
} else {
    var failCallback = MediaErrorImpl(1101003, UniError_GetImageInfo)
    options.fail?(failCallback)
    options.complete?(failCallback)
}
}
public var getVideoInfo: GetVideoInfo = {
(_ options: GetVideoInfoOptions) -> Void in
if (options.src.length > 0) {
    mediaPicker.getVideoInfo(options)
} else {
    var error = MediaErrorImpl(1101003, UniError_GetVideoInfo)
    options.fail?(error)
    options.complete?(error)
}
}
public var compressImage: CompressImage = {
(_ options: CompressImageOptions) -> Void in
if (options.src.length > 0) {
    mediaPicker.compressImage(options)
} else {
    var error = MediaErrorImpl(1101003, UniError_CompressImage)
    options.fail?(error)
    options.complete?(error)
}
}
public var compressVideo: CompressVideo = {
(_ options: CompressVideoOptions) -> Void in
if (options.src.length > 0) {
    mediaPicker.compressVideo(options)
} else {
    var error = MediaErrorImpl(1101003, UniError_CompressVideo)
    options.fail?(error)
    options.complete?(error)
}
}
@objc(UTSSDKModulesDCloudUniMediaChooseImageOptionsJSONObject)
@objcMembers
public class ChooseImageOptionsJSONObject : NSObject {
    public var pageOrientation: ChooseImagePageOrientation?
    public var albumMode: ChooseImageAlbumMode?
    public var count: NSNumber?
    public var sizeType: [String]?
    public var sourceType: [String]?
    public var `extension`: [String]?
    public var crop: ChooseImageCropOptions?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMediaGetImageInfoOptionsJSONObject)
@objcMembers
public class GetImageInfoOptionsJSONObject : NSObject {
    public var src: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: GetImageInfoCompleteCallback?
}
@objc(UTSSDKModulesDCloudUniMediaSaveImageToPhotosAlbumOptionsJSONObject)
@objcMembers
public class SaveImageToPhotosAlbumOptionsJSONObject : NSObject {
    public var filePath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: SaveImageToPhotosAlbumCompleteCallback?
}
@objc(UTSSDKModulesDCloudUniMediaCompressImageOptionsJSONObject)
@objcMembers
public class CompressImageOptionsJSONObject : NSObject {
    public var src: String!
    public var quality: NSNumber?
    public var rotate: NSNumber?
    public var width: String?
    public var height: String?
    public var compressedHeight: NSNumber?
    public var compressedWidth: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: CompressImageCompleteCallback?
}
@objc(UTSSDKModulesDCloudUniMediaChooseVideoOptionsJSONObject)
@objcMembers
public class ChooseVideoOptionsJSONObject : NSObject {
    public var pageOrientation: ChooseVideoPageOrientation?
    public var albumMode: ChooseVideoAlbumMode?
    public var sourceType: [String]?
    public var compressed: Bool = true
    public var maxDuration: NSNumber?
    public var camera: String?
    public var `extension`: [String]?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: ChooseVideoCompleteCallback?
}
@objc(UTSSDKModulesDCloudUniMediaGetVideoInfoOptionsJSONObject)
@objcMembers
public class GetVideoInfoOptionsJSONObject : NSObject {
    public var src: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: GetVideoInfoCompleteCallback?
}
@objc(UTSSDKModulesDCloudUniMediaSaveVideoToPhotosAlbumOptionsJSONObject)
@objcMembers
public class SaveVideoToPhotosAlbumOptionsJSONObject : NSObject {
    public var filePath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: SaveVideoToPhotosAlbumCompleteCallback?
}
@objc(UTSSDKModulesDCloudUniMediaCompressVideoOptionsJSONObject)
@objcMembers
public class CompressVideoOptionsJSONObject : NSObject {
    public var src: String!
    public var quality: String?
    public var bitrate: NSNumber?
    public var fps: NSNumber?
    public var resolution: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: CompressVideoCompleteCallback?
}
@objc(UTSSDKModulesDCloudUniMediaChooseFileOptionsJSONObject)
@objcMembers
public class ChooseFileOptionsJSONObject : NSObject {
    public var count: NSNumber?
    public var type: String?
    public var `extension`: [String]?
    public var sizeType: Any?
    public var sourceType: [String]?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func chooseFileByJs(_ options: ChooseFileOptionsJSONObject) -> Void {
    return chooseFile(ChooseFileOptions(UTSJSONObject([
        "count": options.count,
        "type": options.type,
        "extension": options.extension,
        "sizeType": options.sizeType,
        "sourceType": options.sourceType,
        "success": {
        (result: ChooseFileSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: ChooseFileFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: ChooseFileComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func chooseImageByJs(_ options: ChooseImageOptionsJSONObject) -> Void {
    return chooseImage(ChooseImageOptions(UTSJSONObject([
        "pageOrientation": options.pageOrientation,
        "albumMode": options.albumMode,
        "count": options.count,
        "sizeType": options.sizeType,
        "sourceType": options.sourceType,
        "extension": options.extension,
        "crop": options.crop,
        "success": {
        (callback: ChooseImageSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: ChooseImageFail) -> Void in
        options.fail?(callback)
        },
        "complete": {
        (callback: Any) -> Void in
        options.complete?(callback)
        }
    ])))
}
public func chooseVideoByJs(_ options: ChooseVideoOptionsJSONObject) -> Void {
    return chooseVideo(ChooseVideoOptions(UTSJSONObject([
        "pageOrientation": options.pageOrientation,
        "albumMode": options.albumMode,
        "sourceType": options.sourceType,
        "compressed": options.compressed,
        "maxDuration": options.maxDuration,
        "camera": options.camera,
        "extension": options.extension,
        "success": {
        (callback: ChooseVideoSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: ChooseVideoFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
public func saveImageToPhotosAlbumByJs(_ options: SaveImageToPhotosAlbumOptionsJSONObject) -> Void {
    return saveImageToPhotosAlbum(SaveImageToPhotosAlbumOptions(UTSJSONObject([
        "filePath": options.filePath,
        "success": {
        (callback: SaveImageToPhotosAlbumSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: SaveImageToPhotosAlbumFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
public func saveVideoToPhotosAlbumByJs(_ options: SaveVideoToPhotosAlbumOptionsJSONObject) -> Void {
    return saveVideoToPhotosAlbum(SaveVideoToPhotosAlbumOptions(UTSJSONObject([
        "filePath": options.filePath,
        "success": {
        (callback: SaveVideoToPhotosAlbumSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: SaveVideoToPhotosAlbumFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
public func getImageInfoByJs(_ options: GetImageInfoOptionsJSONObject) -> Void {
    return getImageInfo(GetImageInfoOptions(UTSJSONObject([
        "src": options.src,
        "success": {
        (callback: GetImageInfoSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: GetImageInfoFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
public func getVideoInfoByJs(_ options: GetVideoInfoOptionsJSONObject) -> Void {
    return getVideoInfo(GetVideoInfoOptions(UTSJSONObject([
        "src": options.src,
        "success": {
        (callback: GetVideoInfoSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: GetVideoInfoFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
public func compressImageByJs(_ options: CompressImageOptionsJSONObject) -> Void {
    return compressImage(CompressImageOptions(UTSJSONObject([
        "src": options.src,
        "quality": options.quality,
        "rotate": options.rotate,
        "width": options.width,
        "height": options.height,
        "compressedHeight": options.compressedHeight,
        "compressedWidth": options.compressedWidth,
        "success": {
        (callback: CompressImageSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: CompressImageFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
public func compressVideoByJs(_ options: CompressVideoOptionsJSONObject) -> Void {
    return compressVideo(CompressVideoOptions(UTSJSONObject([
        "src": options.src,
        "quality": options.quality,
        "bitrate": options.bitrate,
        "fps": options.fps,
        "resolution": options.resolution,
        "success": {
        (callback: CompressVideoSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: CompressVideoFail) -> Void in
        options.fail?(callback)
        },
        "complete": options.complete
    ])))
}
@objc(UTSSDKModulesDCloudUniMediaIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniMediaIndexSwift : NSObject {
    public static func s_chooseFileByJs(_ options: ChooseFileOptionsJSONObject) -> Void {
        return chooseFileByJs(options)
    }
    public static func s_chooseImageByJs(_ options: ChooseImageOptionsJSONObject) -> Void {
        return chooseImageByJs(options)
    }
    public static func s_chooseVideoByJs(_ options: ChooseVideoOptionsJSONObject) -> Void {
        return chooseVideoByJs(options)
    }
    public static func s_saveImageToPhotosAlbumByJs(_ options: SaveImageToPhotosAlbumOptionsJSONObject) -> Void {
        return saveImageToPhotosAlbumByJs(options)
    }
    public static func s_saveVideoToPhotosAlbumByJs(_ options: SaveVideoToPhotosAlbumOptionsJSONObject) -> Void {
        return saveVideoToPhotosAlbumByJs(options)
    }
    public static func s_getImageInfoByJs(_ options: GetImageInfoOptionsJSONObject) -> Void {
        return getImageInfoByJs(options)
    }
    public static func s_getVideoInfoByJs(_ options: GetVideoInfoOptionsJSONObject) -> Void {
        return getVideoInfoByJs(options)
    }
    public static func s_compressImageByJs(_ options: CompressImageOptionsJSONObject) -> Void {
        return compressImageByJs(options)
    }
    public static func s_compressVideoByJs(_ options: CompressVideoOptionsJSONObject) -> Void {
        return compressVideoByJs(options)
    }
}
