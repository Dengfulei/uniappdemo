import DCloudUTSFoundation
import DCloudUniappRuntime
public typealias GetElementById = (_ id: String) -> UniElement?
public var getElementById: GetElementById = {
(_ id: String) -> UniElement? in
return DCUniGetElementById.getElementById(id)
}
public func getElementByIdByJs(_ id: String) -> UniElement? {
    return getElementById(id)
}
@objc(UTSSDKModulesDCloudUniGetElementByIdIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetElementByIdIndexSwift : NSObject {
    public static func s_getElementByIdByJs(_ id: String) -> UniElement? {
        return getElementByIdByJs(id)
    }
}
