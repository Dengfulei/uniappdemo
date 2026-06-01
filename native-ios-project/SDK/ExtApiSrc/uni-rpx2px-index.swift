import DCloudUTSFoundation
import DCloudUniappRuntime
import DCloudUTSExtAPI
public typealias Rpx2px = (_ number: NSNumber) -> NSNumber
public var EPS: NSNumber = 1e-4
public var BASE_DEVICE_WIDTH: NSNumber = 750
public var windowWidth: NSNumber = 0
public var pixelRatio: NSNumber = 1
public var rpx2px: Rpx2px = {
(_ number: NSNumber) -> NSNumber in
if (number == 0) {
    return 0
}
if (windowWidth == 0) {
    var windowInfo = DCloudUTSExtAPI.getWindowInfo()
    windowWidth = windowInfo.windowWidth
    pixelRatio = windowInfo.pixelRatio
}
var result = (number / BASE_DEVICE_WIDTH) * windowWidth
if (result < 0) {
    result = -result
}
result = Math.floor(result + EPS)
if (result == 0) {
    if (pixelRatio == 1) {
        result = 1
    } else {
        result = 0.5
    }
}
return number < 0 ? -result : result
}
public func rpx2pxByJs(_ number: NSNumber) -> NSNumber {
    return rpx2px(number)
}
@objc(UTSSDKModulesDCloudUniRpx2pxIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniRpx2pxIndexSwift : NSObject {
    public static func s_rpx2pxByJs(_ number: NSNumber) -> NSNumber {
        return rpx2pxByJs(number)
    }
}
