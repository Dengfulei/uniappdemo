import DCloudUTSFoundation
import DCloudUniappRuntime
import UIKit
public typealias OnAppCrashCallback = () -> Void
public typealias OnAppCrash = (_ callback: @escaping OnAppCrashCallback) -> Void
public typealias OffAppCrash = () -> Void
public typealias GetAppCrashInfoIOS = () -> Array<Map<String, Any>>
public typealias DeleteAppCrashInfo = (_ id: String?) -> Void
public typealias CreateAppCrash = () -> Void
public var __onAppCrash: OnAppCrash = {
(_ callback: @escaping OnAppCrashCallback) -> Void in
CrashManager.onAppCrashCallback(callback)
}
public var __offAppCrash: OffAppCrash = {
() -> Void in
UniCrashManager.offAppCrash = true
}
public var __getAppCrashInfo: GetAppCrashInfoIOS = {
() -> Array<Map<String, Any>> in
UniCrashManager.isUniStatistics = true
return CrashManager.getCrashInfo()
}
public var __deleteAppCrashInfo: DeleteAppCrashInfo = {
(_ id: String?) -> Void in
CrashManager.deleteCrashInfo(id)
}
public var __createAppCrash: CreateAppCrash = {
() -> Void in
UniCrashManager.createAppCrash()
}
@objc(UTSSDKModulesDCloudUniCrashCrashManagerHookProxy)
@objcMembers
public class CrashManagerHookProxy : NSObject, UTSiOSHookProxy {
    public func applicationDidFinishLaunchingWithOptions(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>? = nil) -> Bool {
        CrashManager.initCrash()
        return false
    }
}
@objc(UTSSDKModulesDCloudUniCrashCrashManager)
@objcMembers
public class CrashManager : NSObject {
    fileprivate static func initCrash() {
        UniCrashManager.initCrash()
    }
    fileprivate static func onAppCrashCallback(_ callback: @escaping OnAppCrashCallback) -> Void {
        UniCrashManager.offAppCrash = true
        UniCrashManager.onCrash = callback
    }
    fileprivate static func getCrashInfo() -> Array<Map<String, Any>> {
        var tempArray: Array<Map<String, Any>> = Array<Map<String, Any>>()
        var crashReports = UniCrashManager.getCrashReports()
        if (crashReports != nil && crashReports!.length > 0) {
            crashReports!.forEach({
            (e: UniAppCrashInfo) -> Void in
            var crashInfo: Map<String, Any> = Map()
            crashInfo.set("id", e.id)
            crashInfo.set("file", e.file)
            crashInfo.set("time", e.time)
            tempArray.push(crashInfo)
            })
        }
        return tempArray
    }
    fileprivate static func deleteCrashInfo(_ id: String?) {
        if (id != nil) {
            UniCrashManager.deleteCrashReport(reportID: id!)
        } else {
            var array = UniCrashManager.getCrashReports()
            if (array != nil && array!.length > 0) {
                array!.forEach({
                (e: UniAppCrashInfo) -> Void in
                UniCrashManager.deleteCrashReport(reportID: e.id)
                })
            }
        }
    }
}
public func __onAppCrashByJs(_ callback: UTSCallback) -> Void {
    return __onAppCrash({
    () -> Void in
    callback()
    })
}
public func __offAppCrashByJs() -> Void {
    return __offAppCrash()
}
public func __getAppCrashInfoByJs() -> Array<Map<String, Any>> {
    return __getAppCrashInfo()
}
public func __deleteAppCrashInfoByJs(_ id: String?) -> Void {
    return __deleteAppCrashInfo(id)
}
public func __createAppCrashByJs() -> Void {
    return __createAppCrash()
}
@objc(UTSSDKModulesDCloudUniCrashCrashManagerHookProxyByJs)
@objcMembers
public class CrashManagerHookProxyByJs : CrashManagerHookProxy {
    public func applicationDidFinishLaunchingWithOptionsByJs(_ application: UIApplication?, _ launchOptions: Map<UIApplication.LaunchOptionsKey, Any>? = nil) -> Bool {
        return self.applicationDidFinishLaunchingWithOptions(application, launchOptions)
    }
}
@objc(UTSSDKModulesDCloudUniCrashIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniCrashIndexSwift : NSObject {
    public static func s___onAppCrashByJs(_ callback: UTSCallback) -> Void {
        return __onAppCrashByJs(callback)
    }
    public static func s___offAppCrashByJs() -> Void {
        return __offAppCrashByJs()
    }
    public static func s___getAppCrashInfoByJs() -> Array<Map<String, Any>> {
        return __getAppCrashInfoByJs()
    }
    public static func s___deleteAppCrashInfoByJs(_ id: String?) -> Void {
        return __deleteAppCrashInfoByJs(id)
    }
    public static func s___createAppCrashByJs() -> Void {
        return __createAppCrashByJs()
    }
}
