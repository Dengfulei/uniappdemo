import DCloudUTSFoundation
import DCloudUniappRuntime
import Dispatch
import Swift
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadFileSuccessResult)
@objcMembers
public class ReadFileSuccessResult : NSObject, UTSObject {
    public var data: Any!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! Any
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerOpenFileSuccessResult)
@objcMembers
public class OpenFileSuccessResult : NSObject, UTSObject {
    public var fd: String!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.fd = obj["fd"] as! String
        self.errMsg = obj["errMsg"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFileManagerSuccessResult)
@objcMembers
public class FileManagerSuccessResult : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias FileManagerSuccessCallback = (_ res: FileManagerSuccessResult) -> Void
public typealias FileManagerFailCallback = (_ res: FileSystemManagerFail) -> Void
public typealias FileManagerCompleteCallback = (_ res: Any) -> Void
public typealias ReadFileSuccessCallback = (_ res: ReadFileSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadFileOptions)
@objcMembers
public class ReadFileOptions : NSObject, UTSObject {
    public var encoding: String?
    public var filePath: String!
    public var success: ReadFileSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.encoding = obj["encoding"] as! String?
        self.filePath = obj["filePath"] as! String
        self.success = obj["success"] as! ReadFileSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerWriteFileOptions)
@objcMembers
public class WriteFileOptions : NSObject, UTSObject {
    public var filePath: String!
    public var encoding: String?
    public var data: Any!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
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
        self.encoding = obj["encoding"] as! String?
        self.data = obj["data"] as! Any
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerAppendFileOptions)
@objcMembers
public class AppendFileOptions : NSObject, UTSObject {
    public var filePath: String!
    public var encoding: String?
    public var data: Any!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
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
        self.encoding = obj["encoding"] as! String?
        self.data = obj["data"] as! Any
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
public typealias OpenFileSuccessCallback = (_ res: OpenFileSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerOpenFileOptions)
@objcMembers
public class OpenFileOptions : NSObject, UTSObject {
    public var filePath: String!
    public var flag: String!
    public var success: OpenFileSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "flag":
                    self.flag = try! utsSubscriptCheckValue(newValue)
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
        self.flag = obj["flag"] as! String
        self.success = obj["success"] as! OpenFileSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerOpenFileSyncOptions)
@objcMembers
public class OpenFileSyncOptions : NSObject, UTSObject {
    public var filePath: String!
    public var flag: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "flag":
                    self.flag = try! utsSubscriptCheckValue(newValue)
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
        self.flag = obj["flag"] as! String
    }
}
public typealias UnLinkSuccessCallback = (_ res: FileManagerSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerUnLinkOptions)
@objcMembers
public class UnLinkOptions : NSObject, UTSObject {
    public var filePath: String!
    public var success: UnLinkSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
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
        self.success = obj["success"] as! UnLinkSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
public typealias MkDirSuccessCallback = (_ res: FileManagerSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerMkDirOptions)
@objcMembers
public class MkDirOptions : NSObject, UTSObject {
    public var dirPath: String!
    public var recursive: Bool = false
    public var success: MkDirSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "dirPath":
                    self.dirPath = try! utsSubscriptCheckValue(newValue)
                case "recursive":
                    self.recursive = try! utsSubscriptCheckValue(newValue)
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
        self.dirPath = obj["dirPath"] as! String
        self.recursive = obj["recursive"] as! Bool
        self.success = obj["success"] as! MkDirSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerRmDirOptions)
@objcMembers
public class RmDirOptions : NSObject, UTSObject {
    public var dirPath: String!
    public var recursive: Bool = false
    public var success: MkDirSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "dirPath":
                    self.dirPath = try! utsSubscriptCheckValue(newValue)
                case "recursive":
                    self.recursive = try! utsSubscriptCheckValue(newValue)
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
        self.dirPath = obj["dirPath"] as! String
        self.recursive = obj["recursive"] as! Bool
        self.success = obj["success"] as! MkDirSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadDirSuccessResult)
@objcMembers
public class ReadDirSuccessResult : NSObject, UTSObject {
    public var files: [String]!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "files":
                    self.files = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.files = obj["files"] as! [String]
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias ReadDirSuccessCallback = (_ res: ReadDirSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadDirOptions)
@objcMembers
public class ReadDirOptions : NSObject, UTSObject {
    public var dirPath: String!
    public var success: ReadDirSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "dirPath":
                    self.dirPath = try! utsSubscriptCheckValue(newValue)
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
        self.dirPath = obj["dirPath"] as! String
        self.success = obj["success"] as! ReadDirSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerAccessOptions)
@objcMembers
public class AccessOptions : NSObject, UTSObject {
    public var path: String!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
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
        self.path = obj["path"] as! String
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerRenameOptions)
@objcMembers
public class RenameOptions : NSObject, UTSObject {
    public var oldPath: String!
    public var newPath: String!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "oldPath":
                    self.oldPath = try! utsSubscriptCheckValue(newValue)
                case "newPath":
                    self.newPath = try! utsSubscriptCheckValue(newValue)
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
        self.oldPath = obj["oldPath"] as! String
        self.newPath = obj["newPath"] as! String
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerCopyFileOptions)
@objcMembers
public class CopyFileOptions : NSObject, UTSObject {
    public var srcPath: String!
    public var destPath: String!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "srcPath":
                    self.srcPath = try! utsSubscriptCheckValue(newValue)
                case "destPath":
                    self.destPath = try! utsSubscriptCheckValue(newValue)
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
        self.srcPath = obj["srcPath"] as! String
        self.destPath = obj["destPath"] as! String
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerSaveFileOptions)
@objcMembers
public class SaveFileOptions : NSObject, UTSObject {
    public var tempFilePath: String!
    public var filePath: String?
    public var success: SaveFileSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFilePath":
                    self.tempFilePath = try! utsSubscriptCheckValue(newValue)
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.tempFilePath = obj["tempFilePath"] as! String
        self.filePath = obj["filePath"] as! String?
        self.success = obj["success"] as! SaveFileSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
public typealias SaveFileSuccessCallback = (_ res: SaveFileSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerSaveFileSuccessResult)
@objcMembers
public class SaveFileSuccessResult : NSObject, UTSObject {
    public var savedFilePath: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "savedFilePath":
                    self.savedFilePath = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.savedFilePath = obj["savedFilePath"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerGetFileInfoSuccessResult)
@objcMembers
public class GetFileInfoSuccessResult : NSObject, UTSObject {
    public var digest: String!
    public var size: NSNumber!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "digest":
                    self.digest = try! utsSubscriptCheckValue(newValue)
                case "size":
                    self.size = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.digest = obj["digest"] as! String
        self.size = obj["size"] as! NSNumber
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias GetFileInfoSuccessCallback = (_ res: GetFileInfoSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerGetFileInfoOptions)
@objcMembers
public class GetFileInfoOptions : NSObject, UTSObject {
    public var filePath: String!
    public var digestAlgorithm: String?
    public var success: GetFileInfoSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "digestAlgorithm":
                    self.digestAlgorithm = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.digestAlgorithm = obj["digestAlgorithm"] as! String?
        self.success = obj["success"] as! GetFileInfoSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc
public protocol Stats : JSExport {
    var mode: NSNumber { get set }
    var size: NSNumber { get set }
    var lastAccessedTime: NSNumber { get set }
    var lastModifiedTime: NSNumber { get set }
    var mIsFile: Bool { get set }
    func isDirectory() -> Bool
    func isFile() -> Bool
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFileStats)
@objcMembers
public class FileStats : NSObject, UTSObject {
    public var path: String!
    public var stats: Stats!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                case "stats":
                    self.stats = try! utsSubscriptCheckValue(newValue)
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
        self.stats = obj["stats"] as! Stats
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerStatSuccessResult)
@objcMembers
public class StatSuccessResult : NSObject, UTSObject {
    public var errMsg: String!
    public var stats: [FileStats]!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                case "stats":
                    self.stats = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
        self.stats = obj["stats"] as! [FileStats]
    }
}
public typealias StatSuccessCallback = (_ res: StatSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerStatOptions)
@objcMembers
public class StatOptions : NSObject, UTSObject {
    public var path: String!
    public var recursive: Bool = false
    public var success: StatSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                case "recursive":
                    self.recursive = try! utsSubscriptCheckValue(newValue)
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
        self.path = obj["path"] as! String
        self.recursive = obj["recursive"] as! Bool
        self.success = obj["success"] as! StatSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerUnzipFileOptions)
@objcMembers
public class UnzipFileOptions : NSObject, UTSObject {
    public var zipFilePath: String!
    public var targetPath: String!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "zipFilePath":
                    self.zipFilePath = try! utsSubscriptCheckValue(newValue)
                case "targetPath":
                    self.targetPath = try! utsSubscriptCheckValue(newValue)
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
        self.zipFilePath = obj["zipFilePath"] as! String
        self.targetPath = obj["targetPath"] as! String
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerGetSavedFileListResult)
@objcMembers
public class GetSavedFileListResult : NSObject, UTSObject {
    public var fileList: [String]!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fileList":
                    self.fileList = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.fileList = obj["fileList"] as! [String]
    }
}
public typealias GetSavedFileListCallback = (_ res: GetSavedFileListResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerGetSavedFileListOptions)
@objcMembers
public class GetSavedFileListOptions : NSObject, UTSObject {
    public var success: GetSavedFileListCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
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
        self.success = obj["success"] as! GetSavedFileListCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerTruncateFileOptions)
@objcMembers
public class TruncateFileOptions : NSObject, UTSObject {
    public var filePath: String!
    public var length: NSNumber!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "length":
                    self.length = try! utsSubscriptCheckValue(newValue)
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
        self.length = obj["length"] as! NSNumber
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadCompressedFileResult)
@objcMembers
public class ReadCompressedFileResult : NSObject, UTSObject {
    public var data: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! String
    }
}
public typealias ReadCompressedFileCallback = (_ res: ReadCompressedFileResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadCompressedFileOptions)
@objcMembers
public class ReadCompressedFileOptions : NSObject, UTSObject {
    public var filePath: String!
    public var compressionAlgorithm: String!
    public var success: ReadCompressedFileCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "compressionAlgorithm":
                    self.compressionAlgorithm = try! utsSubscriptCheckValue(newValue)
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
        self.compressionAlgorithm = obj["compressionAlgorithm"] as! String
        self.success = obj["success"] as! ReadCompressedFileCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerRemoveSavedFileOptions)
@objcMembers
public class RemoveSavedFileOptions : NSObject, UTSObject {
    public var filePath: String!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
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
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerWriteResult)
@objcMembers
public class WriteResult : NSObject, UTSObject {
    public var bytesWritten: NSNumber!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "bytesWritten":
                    self.bytesWritten = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.bytesWritten = obj["bytesWritten"] as! NSNumber
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias WriteCallback = (_ res: WriteResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerWriteOptions)
@objcMembers
public class WriteOptions : NSObject, UTSObject {
    public var fd: String!
    public var data: Any!
    public var offset: NSNumber?
    public var length: NSNumber?
    public var position: NSNumber?
    public var encoding: String?
    public var success: WriteCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "offset":
                    self.offset = try! utsSubscriptCheckValueIfPresent(newValue)
                case "length":
                    self.length = try! utsSubscriptCheckValueIfPresent(newValue)
                case "position":
                    self.position = try! utsSubscriptCheckValueIfPresent(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.fd = obj["fd"] as! String
        self.data = obj["data"] as! Any
        self.offset = obj["offset"] as! NSNumber?
        self.length = obj["length"] as! NSNumber?
        self.position = obj["position"] as! NSNumber?
        self.encoding = obj["encoding"] as! String?
        self.success = obj["success"] as! WriteCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerWriteSyncOptions)
@objcMembers
public class WriteSyncOptions : NSObject, UTSObject {
    public var fd: String!
    public var data: Any!
    public var encoding: String?
    public var length: NSNumber?
    public var offset: NSNumber?
    public var position: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
                case "length":
                    self.length = try! utsSubscriptCheckValueIfPresent(newValue)
                case "offset":
                    self.offset = try! utsSubscriptCheckValueIfPresent(newValue)
                case "position":
                    self.position = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.fd = obj["fd"] as! String
        self.data = obj["data"] as! Any
        self.encoding = obj["encoding"] as! String?
        self.length = obj["length"] as! NSNumber?
        self.offset = obj["offset"] as! NSNumber?
        self.position = obj["position"] as! NSNumber?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerCloseOptions)
@objcMembers
public class CloseOptions : NSObject, UTSObject {
    public var fd: String!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
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
        self.fd = obj["fd"] as! String
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerCloseSyncOptions)
@objcMembers
public class CloseSyncOptions : NSObject, UTSObject {
    public var fd: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.fd = obj["fd"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFStatSuccessResult)
@objcMembers
public class FStatSuccessResult : NSObject, UTSObject {
    public var stats: Stats!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "stats":
                    self.stats = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.stats = obj["stats"] as! Stats
    }
}
public typealias FStatSuccessCallback = (_ res: FStatSuccessResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerFStatOptions)
@objcMembers
public class FStatOptions : NSObject, UTSObject {
    public var fd: String!
    public var success: FStatSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
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
        self.fd = obj["fd"] as! String
        self.success = obj["success"] as! FStatSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFStatSyncOptions)
@objcMembers
public class FStatSyncOptions : NSObject, UTSObject {
    public var fd: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.fd = obj["fd"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFTruncateFileOptions)
@objcMembers
public class FTruncateFileOptions : NSObject, UTSObject {
    public var fd: String!
    public var length: NSNumber!
    public var success: FileManagerSuccessCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                case "length":
                    self.length = try! utsSubscriptCheckValue(newValue)
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
        self.fd = obj["fd"] as! String
        self.length = obj["length"] as! NSNumber
        self.success = obj["success"] as! FileManagerSuccessCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFTruncateFileSyncOptions)
@objcMembers
public class FTruncateFileSyncOptions : NSObject, UTSObject {
    public var fd: String!
    public var length: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                case "length":
                    self.length = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.fd = obj["fd"] as! String
        self.length = obj["length"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerEntryItem)
@objcMembers
public class EntryItem : NSObject, UTSObject {
    public var path: String!
    public var encoding: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.encoding = obj["encoding"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerEntriesResult)
@objcMembers
public class EntriesResult : NSObject, UTSObject {
    public var entries: Map<String, ZipFileItem>!
    public var result: Map<String, ZipFileItem>!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "entries":
                    self.entries = try! utsSubscriptCheckValue(newValue)
                case "result":
                    self.result = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.entries = obj["entries"] as! Map<String, ZipFileItem>
        self.result = obj["result"] as! Map<String, ZipFileItem>
        self.errMsg = obj["errMsg"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerZipFileItem)
@objcMembers
public class ZipFileItem : NSObject, UTSObject {
    public var data: Any?
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValueIfPresent(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! Any?
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias ReadZipEntryCallback = (_ res: EntriesResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadZipEntryOptions)
@objcMembers
public class ReadZipEntryOptions : NSObject, UTSObject {
    public var filePath: String!
    public var encoding: String?
    public var entries: [EntryItem]?
    public var success: ReadZipEntryCallback?
    public var fail: FileManagerFailCallback?
    public var complete: FileManagerCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "encoding":
                    self.encoding = try! utsSubscriptCheckValueIfPresent(newValue)
                case "entries":
                    self.entries = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.encoding = obj["encoding"] as! String?
        self.entries = obj["entries"] as! [EntryItem]?
        self.success = obj["success"] as! ReadZipEntryCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadSuccessCallbackResult)
@objcMembers
public class ReadSuccessCallbackResult : NSObject, UTSObject {
    public var arrayBuffer: ArrayBuffer!
    public var bytesRead: NSNumber!
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "arrayBuffer":
                    self.arrayBuffer = try! utsSubscriptCheckValue(newValue)
                case "bytesRead":
                    self.bytesRead = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.arrayBuffer = obj["arrayBuffer"] as! ArrayBuffer
        self.bytesRead = obj["bytesRead"] as! NSNumber
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias ReadSuccessCallback = (_ result: ReadSuccessCallbackResult) -> Void
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadOption)
@objcMembers
public class ReadOption : NSObject, UTSObject {
    public var arrayBuffer: ArrayBuffer!
    public var fd: String!
    public var length: NSNumber?
    public var offset: NSNumber?
    public var position: NSNumber?
    public var complete: FileManagerCompleteCallback?
    public var fail: FileManagerFailCallback?
    public var success: ReadSuccessCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "arrayBuffer":
                    self.arrayBuffer = try! utsSubscriptCheckValue(newValue)
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                case "length":
                    self.length = try! utsSubscriptCheckValueIfPresent(newValue)
                case "offset":
                    self.offset = try! utsSubscriptCheckValueIfPresent(newValue)
                case "position":
                    self.position = try! utsSubscriptCheckValueIfPresent(newValue)
                case "complete":
                    self.complete = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.arrayBuffer = obj["arrayBuffer"] as! ArrayBuffer
        self.fd = obj["fd"] as! String
        self.length = obj["length"] as! NSNumber?
        self.offset = obj["offset"] as! NSNumber?
        self.position = obj["position"] as! NSNumber?
        self.complete = obj["complete"] as! FileManagerCompleteCallback?
        self.fail = obj["fail"] as! FileManagerFailCallback?
        self.success = obj["success"] as! ReadSuccessCallback?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadSyncOption)
@objcMembers
public class ReadSyncOption : NSObject, UTSObject {
    public var arrayBuffer: ArrayBuffer!
    public var fd: String!
    public var length: NSNumber?
    public var offset: NSNumber?
    public var position: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "arrayBuffer":
                    self.arrayBuffer = try! utsSubscriptCheckValue(newValue)
                case "fd":
                    self.fd = try! utsSubscriptCheckValue(newValue)
                case "length":
                    self.length = try! utsSubscriptCheckValueIfPresent(newValue)
                case "offset":
                    self.offset = try! utsSubscriptCheckValueIfPresent(newValue)
                case "position":
                    self.position = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.arrayBuffer = obj["arrayBuffer"] as! ArrayBuffer
        self.fd = obj["fd"] as! String
        self.length = obj["length"] as! NSNumber?
        self.offset = obj["offset"] as! NSNumber?
        self.position = obj["position"] as! NSNumber?
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadResult)
@objcMembers
public class ReadResult : NSObject, UTSObject {
    public var arrayBuffer: ArrayBuffer!
    public var bytesRead: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "arrayBuffer":
                    self.arrayBuffer = try! utsSubscriptCheckValue(newValue)
                case "bytesRead":
                    self.bytesRead = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.arrayBuffer = obj["arrayBuffer"] as! ArrayBuffer
        self.bytesRead = obj["bytesRead"] as! NSNumber
    }
}
public protocol FileSystemManager {
    func access(_ options: AccessOptions)
    func accessSync(_ path: String)
    func appendFile(_ options: AppendFileOptions)
    func appendFileSync(_ filePath: String, _ data: Any, _ encoding: String?)
    func close(_ options: CloseOptions)
    func closeSync(_ options: CloseSyncOptions)
    func copyFile(_ options: CopyFileOptions)
    func copyFileSync(_ srcPath: String, _ destPath: String)
    func fstat(_ options: FStatOptions)
    func fstatSync(_ options: FStatSyncOptions) -> Stats
    func ftruncate(_ options: FTruncateFileOptions)
    func ftruncateSync(_ options: FTruncateFileSyncOptions)
    func getFileInfo(_ options: GetFileInfoOptions)
    func getSavedFileList(_ options: GetSavedFileListOptions)
    func mkdir(_ options: MkDirOptions)
    func mkdirSync(_ dirPath: String, _ recursive: Bool)
    func `open`(_ options: OpenFileOptions)
    func openSync(_ options: OpenFileSyncOptions) -> String
    func readFile(_ options: ReadFileOptions)
    func readFileSync(_ filePath: String, _ encoding: String?) -> Any
    func read(_ option: ReadOption)
    func readSync(_ option: ReadSyncOption) -> ReadResult
    func readdir(_ options: ReadDirOptions)
    func readdirSync(_ dirPath: String) -> [String]?
    func readZipEntry(_ options: ReadZipEntryOptions)
    func rmdir(_ options: RmDirOptions)
    func rmdirSync(_ dirPath: String, _ recursive: Bool)
    func rename(_ options: RenameOptions)
    func renameSync(_ oldPath: String, _ newPath: String)
    func removeSavedFile(_ options: RemoveSavedFileOptions)
    func readCompressedFile(_ options: ReadCompressedFileOptions)
    func readCompressedFileSync(_ filePath: String, _ compressionAlgorithm: String) -> String
    func saveFile(_ options: SaveFileOptions)
    func saveFileSync(_ tempFilePath: String, _ filePath: String?) -> String
    func stat(_ options: StatOptions)
    func statSync(_ path: String, _ recursive: Bool) -> Array<Map<String, Any>>
    func truncate(_ options: TruncateFileOptions)
    func truncateSync(_ filePath: String, _ length: NSNumber?)
    func unlink(_ options: UnLinkOptions)
    func unlinkSync(_ filePath: String)
    func unzip(_ options: UnzipFileOptions)
    func writeFile(_ options: WriteFileOptions)
    func writeFileSync(_ filePath: String, _ data: Any, _ encoding: String?)
    func write(_ options: WriteOptions)
    func writeSync(_ options: WriteSyncOptions) -> WriteResult
}
public typealias GetFileSystemManager = () -> FileSystemManager
public typealias FileSystemManagerErrorCode = NSNumber
public typealias FileSystemManagerFail = IFileSystemManagerFail
public protocol IFileSystemManagerFail : IUniError {
    var errCode: FileSystemManagerErrorCode { get set }
}
public var FileSystemManagerUniErrorSubject = "uni-fileSystemManager"
public var FileSystemManagerUniErrors: Map<FileSystemManagerErrorCode, String> = Map([
    [
        1200002,
        "Type error. only support base64 / utf-8"
    ],
    [
        1300002,
        "No such file or directory"
    ],
    [
        1300013,
        "Permission denied"
    ],
    [
        1300021,
        "Is a directory"
    ],
    [
        1300022,
        "Invalid argument"
    ],
    [
        1300066,
        "Directory not empty"
    ],
    [
        1301003,
        "Illegal operation on a directory"
    ],
    [
        1301005,
        "File already exists"
    ],
    [
        1300201,
        "System error"
    ],
    [
        1300202,
        "The maximum size of the file storage limit is exceeded"
    ],
    [
        1301111,
        "Brotli decompress fail"
    ],
    [
        1302003,
        "Invalid flag"
    ],
    [
        1300009,
        "Bad file descriptor"
    ],
    [
        1300010,
        "Try again"
    ],
    [
        1300011,
        "Bad address"
    ],
    [
        1300012,
        "Operation would block"
    ],
    [
        1300014,
        "Network is unreachable"
    ],
    [
        1300015,
        "Unknown error"
    ],
    [
        1300016,
        "Not a directory"
    ],
    [
        1300017,
        "Text file busy"
    ],
    [
        1300018,
        "File too large"
    ],
    [
        1300019,
        "Read-only file system"
    ],
    [
        1300020,
        "File name too long"
    ],
    [
        1300033,
        "Too many symbolic links encountered"
    ]
])
@objc(UTSSDKModulesDCloudUniFileSystemManagerFileSystemManagerFailImpl)
@objcMembers
public class FileSystemManagerFailImpl : UniError, IFileSystemManagerFail {
    public override var errCode: FileSystemManagerErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errCode: FileSystemManagerErrorCode){
        super.init()
        self.errSubject = FileSystemManagerUniErrorSubject
        self.errCode = errCode
        self.errMsg = FileSystemManagerUniErrors.get(errCode) ?? ""
    }
    private var __errCode: FileSystemManagerErrorCode!
}
public var getFileSystemManager: GetFileSystemManager = {
() -> FileSystemManager in
var fileManager = InnerFileSystemManager()
return fileManager
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerUniFileSystemManagerStats)
@objcMembers
public class UniFileSystemManagerStats : NSObject, Stats {
    public var mode: NSNumber = 0
    public var size: NSNumber = 0
    public var lastAccessedTime: NSNumber = 0
    public var lastModifiedTime: NSNumber = 0
    public var mIsFile: Bool = false
    public func isDirectory() -> Bool {
        return (UInt16(truncating: mode) & S_IFMT) == S_IFDIR
    }
    public func isFile() -> Bool {
        return (UInt16(truncating: mode) & S_IFMT) == S_IFDIR
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerInnerFileSystemManager)
@objcMembers
public class InnerFileSystemManager : NSObject, FileSystemManager {
    public func readFile(_ options: ReadFileOptions) {
        UniFileSystemManager.readFile(encoding: options.encoding, path: options.filePath, completionHandler: {
        (data: Any?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        } else if (data != nil) {
            if (options.encoding == nil) {
                var buffer = data! as! ArrayBuffer
                var result = ReadFileSuccessResult(UTSJSONObject([
                    "data": buffer
                ]))
                UniJsSwiftApiWrapper.runOnJsQueue({
                () -> Void in
                options.success?(result)
                options.complete?(result)
                })
            } else {
                var string = data! as! String
                var result = ReadFileSuccessResult(UTSJSONObject([
                    "data": string
                ]))
                UniJsSwiftApiWrapper.runOnJsQueue({
                () -> Void in
                options.success?(result)
                options.complete?(result)
                })
            }
        }
        })
    }
    public func readFileSync(_ filePath: String, _ encoding: String?) -> Any {
        var result: Any = ""
        var semaphore = DispatchSemaphore(value: 0)
        UniFileSystemManager.readFile(encoding: encoding, path: filePath, completionHandler: {
        (data: Any?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.getErrorMessage("readFileSync", error!.errorCode, error!.description)
            console.log(err)
        } else if (data != nil) {
            result = data!
        }
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (UTSiOS.instanceof(result, String.self)) {
            return result as! String
        } else if (UTSiOS.instanceof(result, ArrayBuffer.self)) {
            return result as! ArrayBuffer
        }
        return ""
    }
    public func writeFile(_ options: WriteFileOptions) {
        UniFileSystemManager.writeFile(encoding: options.encoding, path: options.filePath, data: options.data, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "writeFile:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func writeFileSync(_ filePath: String, _ data: Any, _ encoding: String?) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.writeFile(encoding: encoding, path: filePath, data: data, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("writeFileSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("writeFileSync:ok")
        }
    }
    public func unlink(_ options: UnLinkOptions) {
        UniFileSystemManager.removeFile(filePath: options.filePath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "unlink:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func unlinkSync(_ filePath: String) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.removeFile(filePath: filePath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("unlinkSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("unlinkSync:ok")
        }
    }
    public func mkdir(_ options: MkDirOptions) {
        UniFileSystemManager.createDirectory(path: options.dirPath, recursive: options.recursive, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "mkdir:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func mkdirSync(_ dirPath: String, _ recursive: Bool) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.createDirectory(path: dirPath, recursive: recursive, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("mkdirSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("mkdirSync:ok")
        }
    }
    public func rmdir(_ options: RmDirOptions) {
        UniFileSystemManager.removeDirectory(filePath: options.dirPath, recursive: options.recursive, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "rmdir:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func rmdirSync(_ dirPath: String, _ recursive: Bool) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.removeDirectory(filePath: dirPath, recursive: recursive, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("rmdirSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("rmdirSync:ok")
        }
    }
    public func readdir(_ options: ReadDirOptions) {
        UniFileSystemManager.readDirectoryList(options.dirPath, completionHandler: {
        (list: [String]?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (list != nil) {
            var result = ReadDirSuccessResult(UTSJSONObject([
                "files": list!,
                "errMsg": "readdir:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func readdirSync(_ dirPath: String) -> [String]? {
        var files: [String]? = nil
        var group = DispatchGroup()
        group.enter()
        UniFileSystemManager.readDirectoryList(dirPath, completionHandler: {
        (list: [String]?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.getErrorMessage("readdirSync", error!.errorCode, error!.description)
            console.log(err)
        }
        if (list != nil) {
            files = list
        }
        group.leave()
        })
        group.wait()
        return files
    }
    public func access(_ options: AccessOptions) {
        if (UniFileSystemManager.isExist(options.path)) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "access:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        } else {
            var err = self.failedAction(1300002)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
    }
    public func accessSync(_ path: String) {
        if (UniFileSystemManager.isExist(path)) {
            console.log("access:ok")
        } else {
            var error = self.failedAction(1300002)
            var err = self.getErrorMessage("accessSync", 1300002, error.errMsg)
            console.log(err)
        }
    }
    public func rename(_ options: RenameOptions) {
        UniFileSystemManager.rename(oldPath: options.oldPath, newPath: options.newPath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "rename:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func renameSync(_ oldPath: String, _ newPath: String) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.rename(oldPath: oldPath, newPath: newPath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("renameSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("renameSync:ok")
        }
    }
    public func copyFile(_ options: CopyFileOptions) {
        UniFileSystemManager.copyFile(srcPath: options.srcPath, destPath: options.destPath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "copyFile:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func copyFileSync(_ srcPath: String, _ destPath: String) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.copyFile(srcPath: srcPath, destPath: destPath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("copyFileSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("copyFileSync:ok")
        }
    }
    public func getFileInfo(_ options: GetFileInfoOptions) {
        UniFileSystemManager.getFileInfo(filePath: options.filePath, digestAlgorithm: options.digestAlgorithm, completionHandler: {
        (result: GetFileInfoSuccessResult?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (result != nil) {
            var res = GetFileInfoSuccessResult(UTSJSONObject([
                "digest": result!.digest as! String,
                "size": result!.size as! NSNumber,
                "errMsg": "getFileInfo:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(res)
            options.complete?(res)
            })
        }
        })
    }
    public func stat(_ options: StatOptions) {
        UniFileSystemManager.getStat(filePath: options.path, recursive: options.recursive, completionHandler: {
        (fileStatsArray: [FileStats]?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (fileStatsArray != nil) {
            var tempArray: Array<Any> = []
            fileStatsArray!.forEach({
            (e: FileStats) -> Void in
            var fileStats = FileStats(UTSJSONObject([
                "path": e.path,
                "stats": e.stats
            ]))
            tempArray.push(fileStats)
            })
            var res = StatSuccessResult(UTSJSONObject([
                "errMsg": "stat:ok",
                "stats": tempArray
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(res)
            options.complete?(res)
            })
        }
        })
    }
    public func statSync(_ path: String, _ recursive: Bool) -> Array<Map<String, Any>> {
        var array: Array<Map<String, Any>> = []
        var group = DispatchGroup()
        group.enter()
        UniFileSystemManager.getStat(filePath: path, recursive: recursive, completionHandler: {
        (fileStatsArray: [FileStats]?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.getErrorMessage("statSync", error!.errorCode, error!.description)
            console.log(err)
        }
        if (fileStatsArray != nil) {
            fileStatsArray!.forEach({
            (e: FileStats) -> Void in
            var map: Map<String, Any> = Map()
            if (e.path != nil) {
                map.set("path", e.path!)
            }
            if (e.stats != nil) {
                map.set("stats", e.stats!)
            }
            array.push(map)
            })
        }
        group.leave()
        })
        group.wait()
        return array
    }
    public func appendFile(_ options: AppendFileOptions) {
        UniFileSystemManager.appendFile(encoding: options.encoding, path: options.filePath, data: options.data, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "appendFile:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func appendFileSync(_ filePath: String, _ data: Any, _ encoding: String?) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.appendFile(encoding: encoding, path: filePath, data: data, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("appendFileSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("appendFileSync:ok")
        }
    }
    public func saveFile(_ options: SaveFileOptions) {
        UniFileSystemManager.saveFile(tempFilePath: options.tempFilePath, filePath: options.filePath, completionHandler: {
        (path: String?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (path != nil) {
            var result = SaveFileSuccessResult(UTSJSONObject([
                "savedFilePath": path!
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func saveFileSync(_ tempFilePath: String, _ filePath: String?) -> String {
        var semaphore = DispatchSemaphore(value: 0)
        var result = ""
        UniFileSystemManager.saveFile(tempFilePath: tempFilePath, filePath: filePath, completionHandler: {
        (path: String?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.getErrorMessage("saveFileSync", error!.errorCode, error!.description)
            console.log(err)
        } else if (path != nil) {
            result = path!
        }
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        return result
    }
    public func removeSavedFile(_ options: RemoveSavedFileOptions) {
        UniFileSystemManager.removeSavedFile(filePath: options.filePath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "removeSavedFile:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func unzip(_ options: UnzipFileOptions) {
        UniFileSystemManager.unzip(zipFilePath: options.zipFilePath, targetPath: options.targetPath, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "unzip:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func getSavedFileList(_ options: GetSavedFileListOptions) {
        UniFileSystemManager.getSavedFileList(completionHandler: {
        (list: [String]?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (list != nil) {
            var result = GetSavedFileListResult(UTSJSONObject([
                "fileList": list as! [String]
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func truncate(_ options: TruncateFileOptions) {
        UniFileSystemManager.truncate(filePath: options.filePath, length: options.length, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "truncate:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func truncateSync(_ filePath: String, _ length: NSNumber?) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.truncate(filePath: filePath, length: length, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("truncateSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("truncateSync:ok")
        }
    }
    public func readCompressedFile(_ options: ReadCompressedFileOptions) {
        UniFileSystemManager.readCompressedFile(filePath: options.filePath, compressionAlgorithm: options.compressionAlgorithm, completionHandler: {
        (dataString: String?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (dataString != nil) {
            var result = ReadCompressedFileResult(UTSJSONObject([
                "data": dataString as! String
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func readCompressedFileSync(_ filePath: String, _ compressionAlgorithm: String) -> String {
        var semaphore = DispatchSemaphore(value: 0)
        var stringTmp: String? = nil
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.readCompressedFile(filePath: filePath, compressionAlgorithm: compressionAlgorithm, completionHandler: {
        (dataString: String?, error: UniFileSystemManagerError?) -> Void in
        stringTmp = dataString
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil) {
            var err = self.getErrorMessage("readCompressedFileSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (stringTmp != nil) {
            return stringTmp!
        }
        return "-1"
    }
    public func `open`(_ options: OpenFileOptions) {
        UniFileSystemManager.open(filePath: options.filePath, flag: options.flag, completionHandler: {
        (fd: Int32?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (fd != nil) {
            var result = OpenFileSuccessResult(UTSJSONObject([
                "fd": fd!.toString(),
                "errMsg": "open:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func openSync(_ options: OpenFileSyncOptions) -> String {
        var semaphore = DispatchSemaphore(value: 0)
        var fdTmp: Int32? = nil
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.open(filePath: options.filePath, flag: options.flag, completionHandler: {
        (fd: Int32?, error: UniFileSystemManagerError?) -> Void in
        fdTmp = fd
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil) {
            var err = self.getErrorMessage("openSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (fdTmp != nil) {
            return fdTmp!.toString()
        }
        return "-1"
    }
    public func close(_ options: CloseOptions) {
        UniFileSystemManager.close(fd: options.fd, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "close:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func closeSync(_ options: CloseSyncOptions) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.close(fd: options.fd, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("closeSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("closeSync:ok")
        }
    }
    public func fstat(_ options: FStatOptions) {
        UniFileSystemManager.fstat(fd: options.fd, completionHandler: {
        (stats: Stats?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (stats != nil) {
            var result = FStatSuccessResult(UTSJSONObject([
                "stats": stats!
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func fstatSync(_ options: FStatSyncOptions) -> Stats {
        var semaphore = DispatchSemaphore(value: 0)
        var statsTmp: Stats? = nil
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.fstat(fd: options.fd, completionHandler: {
        (stats: Stats?, error: UniFileSystemManagerError?) -> Void in
        statsTmp = stats
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil) {
            var err = self.getErrorMessage("fstatSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (statsTmp != nil) {
            return statsTmp!
        }
        return UniFileSystemManagerStats()
    }
    public func ftruncate(_ options: FTruncateFileOptions) {
        UniFileSystemManager.ftruncate(fd: options.fd, length: options.length, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        if (error != nil && success == false) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (success) {
            var result = FileManagerSuccessResult(UTSJSONObject([
                "errMsg": "ftruncate:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func ftruncateSync(_ options: FTruncateFileSyncOptions) {
        var semaphore = DispatchSemaphore(value: 0)
        var successTmp: Bool = false
        var errorTmp: UniFileSystemManagerError? = nil
        UniFileSystemManager.ftruncate(fd: options.fd, length: options.length, completionHandler: {
        (success: Bool, error: UniFileSystemManagerError?) -> Void in
        successTmp = success
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil && !successTmp) {
            var err = self.getErrorMessage("ftruncateSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (successTmp) {
            console.log("ftruncateSync:ok")
        }
    }
    public func readZipEntry(_ options: ReadZipEntryOptions) {
        UniFileSystemManager.readZipEntry(filePath: options.filePath, encoding: options.encoding, entries: options.entries, completionHandler: {
        (dict: Dictionary<String, ZipFileItem>?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (dict != nil) {
            var map: Map<String, ZipFileItem> = Map()
            dict!.forEach({
            (e) -> Void in
            map.set(e.key, e.value)
            })
            var result = EntriesResult(UTSJSONObject([
                "entries": map,
                "result": map,
                "errMsg": "readZipEntry:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func write(_ options: WriteOptions) {
        UniFileSystemManager.write(fd: options.fd, data: options.data, offset: options.offset, length: options.length, position: options.position, completionHandler: {
        (bytesWritten: Int32?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.fail?(err)
            options.complete?(err)
            })
        }
        if (bytesWritten != nil) {
            var result = WriteResult(UTSJSONObject([
                "bytesWritten": NSNumber.from(bytesWritten!),
                "errMsg": "write:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            options.success?(result)
            options.complete?(result)
            })
        }
        })
    }
    public func writeSync(_ options: WriteSyncOptions) -> WriteResult {
        var bytesWritten = innerWriteSync(options)
        if (bytesWritten != nil) {
            var result = WriteResult(UTSJSONObject([
                "bytesWritten": bytesWritten,
                "errMsg": "write:ok"
            ]))
            return result
        } else {
            var result = WriteResult(UTSJSONObject([
                "bytesWritten": 0 as NSNumber,
                "errMsg": "write: failed"
            ]))
            return result
        }
    }
    public func read(_ option: ReadOption) {
        UniFileSystemManager.read(arrayBuffer: option.arrayBuffer, fd: option.fd, offset: option.offset, length: option.length, position: option.position, completionHandler: {
        (bytesRead: Int32?, error: UniFileSystemManagerError?) -> Void in
        if (error != nil) {
            var err = self.failedAction(error!.errorCode, error!.nativeErrorDescription)
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            option.fail?(err)
            option.complete?(err)
            })
        }
        if (bytesRead != nil) {
            var result = ReadSuccessCallbackResult(UTSJSONObject([
                "arrayBuffer": option.arrayBuffer,
                "bytesRead": bytesRead,
                "errMsg": "read:ok"
            ]))
            UniJsSwiftApiWrapper.runOnJsQueue({
            () -> Void in
            option.success?(result)
            option.complete?(result)
            })
        }
        })
    }
    public func readSync(_ option: ReadSyncOption) -> ReadResult {
        var bytesRead = innerReadSync(option)
        if (bytesRead != nil) {
            var result = ReadResult(UTSJSONObject([
                "arrayBuffer": option.arrayBuffer,
                "bytesRead": bytesRead
            ]))
            return result
        } else {
            var result = ReadResult(UTSJSONObject([
                "arrayBuffer": option.arrayBuffer,
                "bytesRead": 0 as NSNumber
            ]))
            return result
        }
    }
    public func innerReadSync(_ options: ReadSyncOption) -> NSNumber? {
        var semaphore = DispatchSemaphore(value: 0)
        var bytesReadTmp: Int32? = nil
        var errorTmp: UniFileSystemManagerError? = nil
        var bytesRead: NSNumber = 0
        UniFileSystemManager.read(arrayBuffer: options.arrayBuffer, fd: options.fd, offset: options.offset, length: options.length, position: options.position, completionHandler: {
        (bytesRead: Int32?, error: UniFileSystemManagerError?) -> Void in
        bytesReadTmp = bytesRead
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil) {
            var err = self.getErrorMessage("readSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (bytesReadTmp != nil) {
            bytesRead = NSNumber(bytesReadTmp!)
            return bytesRead
        }
        return nil
    }
    public func innerWriteSync(_ options: WriteSyncOptions) -> NSNumber? {
        var semaphore = DispatchSemaphore(value: 0)
        var bytesWrittenTmp: Int32? = nil
        var errorTmp: UniFileSystemManagerError? = nil
        var bytesWritten: NSNumber = 0
        UniFileSystemManager.write(fd: options.fd, data: options.data, offset: options.offset, length: options.length, position: options.position, completionHandler: {
        (bytesWritten: Int32?, error: UniFileSystemManagerError?) -> Void in
        bytesWrittenTmp = bytesWritten
        errorTmp = error
        semaphore.signal()
        })
        semaphore.wait(timeout: DispatchTime.distantFuture)
        if (errorTmp != nil) {
            var err = self.getErrorMessage("writeSync", errorTmp!.errorCode, errorTmp!.description)
            console.log(err)
        } else if (bytesWrittenTmp != nil) {
            bytesWritten = NSNumber(bytesWrittenTmp!)
            return bytesWritten
        }
        return nil
    }
    public func getErrorMessage(_ name: String, _ errorCode: NSNumber, _ description: String) -> String {
        return name + " failed: " + "errorCode = " + errorCode.stringValue + "，errMsg = " + description
    }
    public func failedAction(_ errorCode: NSNumber, _ errMsg: String? = nil) -> FileSystemManagerFailImpl {
        var failImpl = FileSystemManagerFailImpl(errorCode)
        if (errMsg != nil) {
            failImpl.errMsg += ("(" + errMsg! + ")")
        }
        return failImpl
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadFileOptionsJSONObject)
@objcMembers
public class ReadFileOptionsJSONObject : NSObject {
    public var encoding: String?
    public var filePath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerWriteFileOptionsJSONObject)
@objcMembers
public class WriteFileOptionsJSONObject : NSObject {
    public var filePath: String!
    public var encoding: String?
    public var data: Any!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerAppendFileOptionsJSONObject)
@objcMembers
public class AppendFileOptionsJSONObject : NSObject {
    public var filePath: String!
    public var encoding: String?
    public var data: Any!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerOpenFileOptionsJSONObject)
@objcMembers
public class OpenFileOptionsJSONObject : NSObject {
    public var filePath: String!
    public var flag: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerOpenFileSyncOptionsJSONObject)
@objcMembers
public class OpenFileSyncOptionsJSONObject : NSObject {
    public var filePath: String!
    public var flag: String!
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerUnLinkOptionsJSONObject)
@objcMembers
public class UnLinkOptionsJSONObject : NSObject {
    public var filePath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerMkDirOptionsJSONObject)
@objcMembers
public class MkDirOptionsJSONObject : NSObject {
    public var dirPath: String!
    public var recursive: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerRmDirOptionsJSONObject)
@objcMembers
public class RmDirOptionsJSONObject : NSObject {
    public var dirPath: String!
    public var recursive: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadDirOptionsJSONObject)
@objcMembers
public class ReadDirOptionsJSONObject : NSObject {
    public var dirPath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerAccessOptionsJSONObject)
@objcMembers
public class AccessOptionsJSONObject : NSObject {
    public var path: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerRenameOptionsJSONObject)
@objcMembers
public class RenameOptionsJSONObject : NSObject {
    public var oldPath: String!
    public var newPath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerCopyFileOptionsJSONObject)
@objcMembers
public class CopyFileOptionsJSONObject : NSObject {
    public var srcPath: String!
    public var destPath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerSaveFileOptionsJSONObject)
@objcMembers
public class SaveFileOptionsJSONObject : NSObject {
    public var tempFilePath: String!
    public var filePath: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerGetFileInfoOptionsJSONObject)
@objcMembers
public class GetFileInfoOptionsJSONObject : NSObject {
    public var filePath: String!
    public var digestAlgorithm: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerStatOptionsJSONObject)
@objcMembers
public class StatOptionsJSONObject : NSObject {
    public var path: String!
    public var recursive: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerUnzipFileOptionsJSONObject)
@objcMembers
public class UnzipFileOptionsJSONObject : NSObject {
    public var zipFilePath: String!
    public var targetPath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerGetSavedFileListOptionsJSONObject)
@objcMembers
public class GetSavedFileListOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerTruncateFileOptionsJSONObject)
@objcMembers
public class TruncateFileOptionsJSONObject : NSObject {
    public var filePath: String!
    public var length: NSNumber!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadCompressedFileOptionsJSONObject)
@objcMembers
public class ReadCompressedFileOptionsJSONObject : NSObject {
    public var filePath: String!
    public var compressionAlgorithm: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerRemoveSavedFileOptionsJSONObject)
@objcMembers
public class RemoveSavedFileOptionsJSONObject : NSObject {
    public var filePath: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerWriteOptionsJSONObject)
@objcMembers
public class WriteOptionsJSONObject : NSObject {
    public var fd: String!
    public var data: Any!
    public var offset: NSNumber?
    public var length: NSNumber?
    public var position: NSNumber?
    public var encoding: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerWriteSyncOptionsJSONObject)
@objcMembers
public class WriteSyncOptionsJSONObject : NSObject {
    public var fd: String!
    public var data: Any!
    public var encoding: String?
    public var length: NSNumber?
    public var offset: NSNumber?
    public var position: NSNumber?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerCloseOptionsJSONObject)
@objcMembers
public class CloseOptionsJSONObject : NSObject {
    public var fd: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerCloseSyncOptionsJSONObject)
@objcMembers
public class CloseSyncOptionsJSONObject : NSObject {
    public var fd: String!
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFStatOptionsJSONObject)
@objcMembers
public class FStatOptionsJSONObject : NSObject {
    public var fd: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFStatSyncOptionsJSONObject)
@objcMembers
public class FStatSyncOptionsJSONObject : NSObject {
    public var fd: String!
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFTruncateFileOptionsJSONObject)
@objcMembers
public class FTruncateFileOptionsJSONObject : NSObject {
    public var fd: String!
    public var length: NSNumber!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFTruncateFileSyncOptionsJSONObject)
@objcMembers
public class FTruncateFileSyncOptionsJSONObject : NSObject {
    public var fd: String!
    public var length: NSNumber!
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadZipEntryOptionsJSONObject)
@objcMembers
public class ReadZipEntryOptionsJSONObject : NSObject, DCUniModel {
    public var filePath: String!
    public var encoding: String?
    public var entries: [EntryItem]?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
    public static func modelContainerPropertyGenericClass() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = Dictionary()
        dict["entries"] = EntryItem.classForCoder()
        return dict
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadOptionJSONObject)
@objcMembers
public class ReadOptionJSONObject : NSObject {
    public var arrayBuffer: ArrayBuffer!
    public var fd: String!
    public var length: NSNumber?
    public var offset: NSNumber?
    public var position: NSNumber?
    public var complete: UTSCallback?
    public var fail: UTSCallback?
    public var success: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerReadSyncOptionJSONObject)
@objcMembers
public class ReadSyncOptionJSONObject : NSObject {
    public var arrayBuffer: ArrayBuffer!
    public var fd: String!
    public var length: NSNumber?
    public var offset: NSNumber?
    public var position: NSNumber?
}
public func getFileSystemManagerByJs() -> Int {
    var ins = getFileSystemManager()
    return UTSBridge.registerJavaScriptClassInstance(FileSystemManagerByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerFileSystemManagerByJsProxy)
@objcMembers
public class FileSystemManagerByJsProxy : NSObject {
    public var __instance: FileSystemManager
    public init(_ ins: FileSystemManager){
        __instance = ins
    }
    public func accessByJs(_ options: AccessOptionsJSONObject) -> Void {
        return __instance.access(AccessOptions(UTSJSONObject([
            "path": options.path,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func accessSyncByJs(_ path: String) -> Void {
        return __instance.accessSync(path)
    }
    public func appendFileByJs(_ options: AppendFileOptionsJSONObject) -> Void {
        return __instance.appendFile(AppendFileOptions(UTSJSONObject([
            "filePath": options.filePath,
            "encoding": options.encoding,
            "data": options.data,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func appendFileSyncByJs(_ filePath: String, _ data: Any, _ encoding: String?) -> Void {
        return __instance.appendFileSync(filePath, data, encoding)
    }
    public func closeByJs(_ options: CloseOptionsJSONObject) -> Void {
        return __instance.close(CloseOptions(UTSJSONObject([
            "fd": options.fd,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func closeSyncByJs(_ options: CloseSyncOptionsJSONObject) -> Void {
        return __instance.closeSync(CloseSyncOptions(UTSJSONObject([
            "fd": options.fd
        ])))
    }
    public func copyFileByJs(_ options: CopyFileOptionsJSONObject) -> Void {
        return __instance.copyFile(CopyFileOptions(UTSJSONObject([
            "srcPath": options.srcPath,
            "destPath": options.destPath,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func copyFileSyncByJs(_ srcPath: String, _ destPath: String) -> Void {
        return __instance.copyFileSync(srcPath, destPath)
    }
    public func fstatByJs(_ options: FStatOptionsJSONObject) -> Void {
        return __instance.fstat(FStatOptions(UTSJSONObject([
            "fd": options.fd,
            "success": {
            (res: FStatSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func fstatSyncByJs(_ options: FStatSyncOptionsJSONObject) -> Int {
        var ins = __instance.fstatSync(FStatSyncOptions(UTSJSONObject([
            "fd": options.fd
        ])))
        return UTSBridge.registerJavaScriptClassInstance(StatsByJsProxy(ins))
    }
    public func ftruncateByJs(_ options: FTruncateFileOptionsJSONObject) -> Void {
        return __instance.ftruncate(FTruncateFileOptions(UTSJSONObject([
            "fd": options.fd,
            "length": options.length,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func ftruncateSyncByJs(_ options: FTruncateFileSyncOptionsJSONObject) -> Void {
        return __instance.ftruncateSync(FTruncateFileSyncOptions(UTSJSONObject([
            "fd": options.fd,
            "length": options.length
        ])))
    }
    public func getFileInfoByJs(_ options: GetFileInfoOptionsJSONObject) -> Void {
        return __instance.getFileInfo(GetFileInfoOptions(UTSJSONObject([
            "filePath": options.filePath,
            "digestAlgorithm": options.digestAlgorithm,
            "success": {
            (res: GetFileInfoSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func getSavedFileListByJs(_ options: GetSavedFileListOptionsJSONObject) -> Void {
        return __instance.getSavedFileList(GetSavedFileListOptions(UTSJSONObject([
            "success": {
            (res: GetSavedFileListResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func mkdirByJs(_ options: MkDirOptionsJSONObject) -> Void {
        return __instance.mkdir(MkDirOptions(UTSJSONObject([
            "dirPath": options.dirPath,
            "recursive": options.recursive,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func mkdirSyncByJs(_ dirPath: String, _ recursive: Bool) -> Void {
        return __instance.mkdirSync(dirPath, recursive)
    }
    public func openByJs(_ options: OpenFileOptionsJSONObject) -> Void {
        return __instance.open(OpenFileOptions(UTSJSONObject([
            "filePath": options.filePath,
            "flag": options.flag,
            "success": {
            (res: OpenFileSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func openSyncByJs(_ options: OpenFileSyncOptionsJSONObject) -> String {
        return __instance.openSync(OpenFileSyncOptions(UTSJSONObject([
            "filePath": options.filePath,
            "flag": options.flag
        ])))
    }
    public func readFileByJs(_ options: ReadFileOptionsJSONObject) -> Void {
        return __instance.readFile(ReadFileOptions(UTSJSONObject([
            "encoding": options.encoding,
            "filePath": options.filePath,
            "success": {
            (res: ReadFileSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func readFileSyncByJs(_ filePath: String, _ encoding: String?) -> Any {
        return __instance.readFileSync(filePath, encoding)
    }
    public func readByJs(_ option: ReadOptionJSONObject) -> Void {
        return __instance.read(ReadOption(UTSJSONObject([
            "arrayBuffer": option.arrayBuffer,
            "fd": option.fd,
            "length": option.length,
            "offset": option.offset,
            "position": option.position,
            "complete": {
            (res: Any) -> Void in
            option.complete?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            option.fail?(res)
            },
            "success": {
            (result: ReadSuccessCallbackResult) -> Void in
            option.success?(result)
            }
        ])))
    }
    public func readSyncByJs(_ option: ReadSyncOptionJSONObject) -> ReadResult {
        return __instance.readSync(ReadSyncOption(UTSJSONObject([
            "arrayBuffer": option.arrayBuffer,
            "fd": option.fd,
            "length": option.length,
            "offset": option.offset,
            "position": option.position
        ])))
    }
    public func readdirByJs(_ options: ReadDirOptionsJSONObject) -> Void {
        return __instance.readdir(ReadDirOptions(UTSJSONObject([
            "dirPath": options.dirPath,
            "success": {
            (res: ReadDirSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func readdirSyncByJs(_ dirPath: String) -> [String]? {
        return __instance.readdirSync(dirPath)
    }
    public func readZipEntryByJs(_ options: ReadZipEntryOptionsJSONObject) -> Void {
        return __instance.readZipEntry(ReadZipEntryOptions(UTSJSONObject([
            "filePath": options.filePath,
            "encoding": options.encoding,
            "entries": options.entries,
            "success": {
            (res: EntriesResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func rmdirByJs(_ options: RmDirOptionsJSONObject) -> Void {
        return __instance.rmdir(RmDirOptions(UTSJSONObject([
            "dirPath": options.dirPath,
            "recursive": options.recursive,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func rmdirSyncByJs(_ dirPath: String, _ recursive: Bool) -> Void {
        return __instance.rmdirSync(dirPath, recursive)
    }
    public func renameByJs(_ options: RenameOptionsJSONObject) -> Void {
        return __instance.rename(RenameOptions(UTSJSONObject([
            "oldPath": options.oldPath,
            "newPath": options.newPath,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func renameSyncByJs(_ oldPath: String, _ newPath: String) -> Void {
        return __instance.renameSync(oldPath, newPath)
    }
    public func removeSavedFileByJs(_ options: RemoveSavedFileOptionsJSONObject) -> Void {
        return __instance.removeSavedFile(RemoveSavedFileOptions(UTSJSONObject([
            "filePath": options.filePath,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func readCompressedFileByJs(_ options: ReadCompressedFileOptionsJSONObject) -> Void {
        return __instance.readCompressedFile(ReadCompressedFileOptions(UTSJSONObject([
            "filePath": options.filePath,
            "compressionAlgorithm": options.compressionAlgorithm,
            "success": {
            (res: ReadCompressedFileResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func readCompressedFileSyncByJs(_ filePath: String, _ compressionAlgorithm: String) -> String {
        return __instance.readCompressedFileSync(filePath, compressionAlgorithm)
    }
    public func saveFileByJs(_ options: SaveFileOptionsJSONObject) -> Void {
        return __instance.saveFile(SaveFileOptions(UTSJSONObject([
            "tempFilePath": options.tempFilePath,
            "filePath": options.filePath,
            "success": {
            (res: SaveFileSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func saveFileSyncByJs(_ tempFilePath: String, _ filePath: String?) -> String {
        return __instance.saveFileSync(tempFilePath, filePath)
    }
    public func statByJs(_ options: StatOptionsJSONObject) -> Void {
        return __instance.stat(StatOptions(UTSJSONObject([
            "path": options.path,
            "recursive": options.recursive,
            "success": {
            (res: StatSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func statSyncByJs(_ path: String, _ recursive: Bool) -> Array<Map<String, Any>> {
        return __instance.statSync(path, recursive)
    }
    public func truncateByJs(_ options: TruncateFileOptionsJSONObject) -> Void {
        return __instance.truncate(TruncateFileOptions(UTSJSONObject([
            "filePath": options.filePath,
            "length": options.length,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func truncateSyncByJs(_ filePath: String, _ length: NSNumber?) -> Void {
        return __instance.truncateSync(filePath, length)
    }
    public func unlinkByJs(_ options: UnLinkOptionsJSONObject) -> Void {
        return __instance.unlink(UnLinkOptions(UTSJSONObject([
            "filePath": options.filePath,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func unlinkSyncByJs(_ filePath: String) -> Void {
        return __instance.unlinkSync(filePath)
    }
    public func unzipByJs(_ options: UnzipFileOptionsJSONObject) -> Void {
        return __instance.unzip(UnzipFileOptions(UTSJSONObject([
            "zipFilePath": options.zipFilePath,
            "targetPath": options.targetPath,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func writeFileByJs(_ options: WriteFileOptionsJSONObject) -> Void {
        return __instance.writeFile(WriteFileOptions(UTSJSONObject([
            "filePath": options.filePath,
            "encoding": options.encoding,
            "data": options.data,
            "success": {
            (res: FileManagerSuccessResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func writeFileSyncByJs(_ filePath: String, _ data: Any, _ encoding: String?) -> Void {
        return __instance.writeFileSync(filePath, data, encoding)
    }
    public func writeByJs(_ options: WriteOptionsJSONObject) -> Void {
        return __instance.write(WriteOptions(UTSJSONObject([
            "fd": options.fd,
            "data": options.data,
            "offset": options.offset,
            "length": options.length,
            "position": options.position,
            "encoding": options.encoding,
            "success": {
            (res: WriteResult) -> Void in
            options.success?(res)
            },
            "fail": {
            (res: FileSystemManagerFail) -> Void in
            options.fail?(res)
            },
            "complete": {
            (res: Any) -> Void in
            options.complete?(res)
            }
        ])))
    }
    public func writeSyncByJs(_ options: WriteSyncOptionsJSONObject) -> WriteResult {
        return __instance.writeSync(WriteSyncOptions(UTSJSONObject([
            "fd": options.fd,
            "data": options.data,
            "encoding": options.encoding,
            "length": options.length,
            "offset": options.offset,
            "position": options.position
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerStatsByJsProxy)
@objcMembers
public class StatsByJsProxy : NSObject {
    public var __instance: Stats
    public init(_ ins: Stats){
        __instance = ins
    }
    public var mode: NSNumber {
        get {
            return __instance.mode
        }
        set(value) {
            __instance.mode = value
        }
    }
    public var size: NSNumber {
        get {
            return __instance.size
        }
        set(value) {
            __instance.size = value
        }
    }
    public var lastAccessedTime: NSNumber {
        get {
            return __instance.lastAccessedTime
        }
        set(value) {
            __instance.lastAccessedTime = value
        }
    }
    public var lastModifiedTime: NSNumber {
        get {
            return __instance.lastModifiedTime
        }
        set(value) {
            __instance.lastModifiedTime = value
        }
    }
    public var mIsFile: Bool {
        get {
            return __instance.mIsFile
        }
        set(value) {
            __instance.mIsFile = value
        }
    }
    public func isDirectoryByJs() -> Bool {
        return __instance.isDirectory()
    }
    public func isFileByJs() -> Bool {
        return __instance.isFile()
    }
}
@objc(UTSSDKModulesDCloudUniFileSystemManagerIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniFileSystemManagerIndexSwift : NSObject {
    public static func s_getFileSystemManagerByJs() -> Int {
        return getFileSystemManagerByJs()
    }
}
