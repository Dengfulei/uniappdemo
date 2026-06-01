import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import QuickLook
import Swift
@objc(UTSSDKModulesDCloudUniOpenDocumentOpenDocumentSuccess)
@objcMembers
public class OpenDocumentSuccess : NSObject, UTSObject {
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
public typealias OpenDocumentFail = IOpenDocumentError
public typealias OpenDocumentErrorCode = NSNumber
public protocol IOpenDocumentError : IUniError {
    var errCode: OpenDocumentErrorCode { get set }
}
public typealias OpenDocumentSuccessCallback = (_ res: OpenDocumentSuccess) -> Void
public typealias OpenDocumentFailCallback = (_ res: OpenDocumentFail) -> Void
public typealias OpenDocumentCompleteCallback = (_ res: Any) -> Void
public typealias OpenDocumentSupportedTypes = String
@objc(UTSSDKModulesDCloudUniOpenDocumentOpenDocumentOptions)
@objcMembers
public class OpenDocumentOptions : NSObject, UTSObject {
    public var filePath: String!
    public var fileType: OpenDocumentSupportedTypes?
    public var success: OpenDocumentSuccessCallback?
    public var fail: OpenDocumentFailCallback?
    public var complete: OpenDocumentCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValue(newValue)
                case "fileType":
                    self.fileType = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.fileType = obj["fileType"] as! OpenDocumentSupportedTypes?
        self.success = obj["success"] as! OpenDocumentSuccessCallback?
        self.fail = obj["fail"] as! OpenDocumentFailCallback?
        self.complete = obj["complete"] as! OpenDocumentCompleteCallback?
    }
}
public typealias OpenDocument = (_ options: OpenDocumentOptions?) -> Void
public var OpenDocumentUniErrorSubject = "uni-openDocument"
public var OpenDocumentUniErrors: Map<NSNumber, String> = Map([
    [
        1300601,
        "Invalid file path"
    ],
    [
        1300602,
        "File not exist"
    ],
    [
        1300603,
        "Not support this filetype"
    ],
    [
        1300604,
        "Unkowned error"
    ]
])
@objc(UTSSDKModulesDCloudUniOpenDocumentOpenDocumentErrorImpl)
@objcMembers
public class OpenDocumentErrorImpl : UniError, IOpenDocumentError {
    public init(_ code: OpenDocumentErrorCode){
        super.init()
        self.errSubject = OpenDocumentUniErrorSubject
        self.errCode = code
        self.errMsg = OpenDocumentUniErrors[code] ?? ""
    }
}
public var openDocument: OpenDocument = {
(_ options: OpenDocumentOptions?) -> Void in
if (options != nil) {
    DocumentPreviewer.shared.presentDocument(options!)
}
}
@objc(UTSSDKModulesDCloudUniOpenDocumentUniPreviewItem)
@objcMembers
public class UniPreviewItem : NSObject, QLPreviewItem {
    public var previewItemURL: URL?
    public init(_ url: URL){
        self.previewItemURL = url
    }
}
@objc(UTSSDKModulesDCloudUniOpenDocumentDocumentPreviewer)
@objcMembers
public class DocumentPreviewer : NSObject, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    public static var shared = DocumentPreviewer()
    private var options: OpenDocumentOptions?
    private var fileUrl: URL? = nil
    private var innerPreviewController: QLPreviewController?
    public func presentDocument(_ options: OpenDocumentOptions) {
        DocumentPreviewer.shared.options = options
        var filPath: String = options.filePath
        if (filPath.startsWith("http") == false) {
            filPath = UTSiOS.convert2AbsFullPath(filPath)
        }
        var tmpUrl = URL(fileURLWithPath: filPath)
        self.fileUrl = tmpUrl
        if (tmpUrl.isFileURL == false) {
            var err = OpenDocumentErrorImpl(1300601)
            DocumentPreviewer.shared.options?.fail?(err)
            DocumentPreviewer.shared.options?.complete?(err)
            return
        }
        var isExist = FileManager.default.fileExists(atPath: tmpUrl.path)
        if (isExist == false) {
            var err = OpenDocumentErrorImpl(1300602)
            DocumentPreviewer.shared.options?.fail?(err)
            DocumentPreviewer.shared.options?.complete?(err)
            return
        }
        self.innerPreviewController = QLPreviewController()
        self.innerPreviewController!.dataSource = self
        self.innerPreviewController!.delegate = self
        if (self.innerPreviewController != nil) {
            UTSiOS.getCurrentViewController().present(self.innerPreviewController!, animated: false, completion: {
            () -> Void in
            self.innerPreviewController = nil
            })
        }
        var res = OpenDocumentSuccess()
        DocumentPreviewer.shared.options?.success?(res)
        DocumentPreviewer.shared.options?.complete?(res)
    }
    public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return DocumentPreviewer.shared.fileUrl != nil ? 1 : 0
    }
    public func previewController(_ controller: QLPreviewController, previewItemAt: Int) -> QLPreviewItem {
        return UniPreviewItem(DocumentPreviewer.shared.fileUrl!)
    }
    public func previewControllerDidDismiss(_ controller: QLPreviewController) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01, execute: {
        () -> Void in
        if (self.innerPreviewController != nil) {
            UTSiOS.getCurrentViewController().present(self.innerPreviewController!, animated: false, completion: {
            () -> Void in
            self.innerPreviewController = nil
            })
        }
        })
    }
}
@objc(UTSSDKModulesDCloudUniOpenDocumentOpenDocumentOptionsJSONObject)
@objcMembers
public class OpenDocumentOptionsJSONObject : NSObject {
    public var filePath: String!
    public var fileType: OpenDocumentSupportedTypes?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func openDocumentByJs(_ options: OpenDocumentOptionsJSONObject?) -> Void {
    return openDocument(options != nil ? OpenDocumentOptions(UTSJSONObject([
        "filePath": options!.filePath,
        "fileType": options!.fileType,
        "success": {
        (res: OpenDocumentSuccess) -> Void in
        options!.success?(res)
        },
        "fail": {
        (res: OpenDocumentFail) -> Void in
        options!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options!.complete?(res)
        }
    ])) : nil)
}
@objc(UTSSDKModulesDCloudUniOpenDocumentIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniOpenDocumentIndexSwift : NSObject {
    public static func s_openDocumentByJs(_ options: OpenDocumentOptionsJSONObject?) -> Void {
        return openDocumentByJs(options)
    }
}
