import DCloudUTSFoundation
import DCloudUniappRuntime
public typealias GetLocationFailImpl = GetLocationFailImpl__1
public var LocationUniErrorSubject = "uni-location"
@objc
public protocol UniLocationProvider : JSExport, UniProvider {
    func getLocation(_ options: GetLocationOptions)
    func startLocationUpdate(_ options: StartLocationUpdateOptions)
    func stopLocationUpdate(_ options: StopLocationUpdateOptions)
    func onLocationChange(_ listener: @escaping OnLocationChangeCallback) -> NSNumber
    func offLocationChange(_ listener: Any?)
    func startLocationUpdateBackground(_ options: StartLocationUpdateBackgroundOptions)
    func onLocationChangeError(_ listener: @escaping OnLocationChangeErrorCallback) -> NSNumber
    func offLocationChangeError(_ listener: Any?)
}
public typealias LocationErrorCode = NSNumber
public protocol IGetLocationFail : IUniError {
    var errCode: LocationErrorCode { get set }
}
public typealias GetLocationFail = IGetLocationFail
public typealias GetLocation = (_ options: GetLocationOptions) -> Void
@objc(UTSSDKModulesDCloudUniLocationGetLocationSuccess)
@objcMembers
public class GetLocationSuccess : NSObject, UTSObject {
    public var latitude: NSNumber!
    public var longitude: NSNumber!
    public var speed: NSNumber!
    public var accuracy: NSNumber!
    public var altitude: NSNumber!
    public var verticalAccuracy: NSNumber!
    public var horizontalAccuracy: NSNumber!
    public var address: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "latitude":
                    self.latitude = try! utsSubscriptCheckValue(newValue)
                case "longitude":
                    self.longitude = try! utsSubscriptCheckValue(newValue)
                case "speed":
                    self.speed = try! utsSubscriptCheckValue(newValue)
                case "accuracy":
                    self.accuracy = try! utsSubscriptCheckValue(newValue)
                case "altitude":
                    self.altitude = try! utsSubscriptCheckValue(newValue)
                case "verticalAccuracy":
                    self.verticalAccuracy = try! utsSubscriptCheckValue(newValue)
                case "horizontalAccuracy":
                    self.horizontalAccuracy = try! utsSubscriptCheckValue(newValue)
                case "address":
                    self.address = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.latitude = obj["latitude"] as! NSNumber
        self.longitude = obj["longitude"] as! NSNumber
        self.speed = obj["speed"] as! NSNumber
        self.accuracy = obj["accuracy"] as! NSNumber
        self.altitude = obj["altitude"] as! NSNumber
        self.verticalAccuracy = obj["verticalAccuracy"] as! NSNumber
        self.horizontalAccuracy = obj["horizontalAccuracy"] as! NSNumber
        self.address = obj["address"] as! String?
    }
}
public typealias GetLocationSuccessCallback = (_ result: GetLocationSuccess) -> Void
public typealias GetLocationFailCallback = (_ result: GetLocationFail) -> Void
public typealias GetLocationComplete = Any
public typealias GetLocationCompleteCallback = (_ result: GetLocationComplete) -> Void
@objc(UTSSDKModulesDCloudUniLocationGetLocationOptions)
@objcMembers
public class GetLocationOptions : NSObject, UTSObject {
    public var provider: String?
    public var type: String?
    public var altitude: Bool = false
    public var geocode: Bool = false
    public var highAccuracyExpireTime: NSNumber?
    public var isHighAccuracy: Bool = false
    public var success: GetLocationSuccessCallback?
    public var fail: GetLocationFailCallback?
    public var complete: GetLocationCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "provider":
                    self.provider = try! utsSubscriptCheckValueIfPresent(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
                case "altitude":
                    self.altitude = try! utsSubscriptCheckValue(newValue)
                case "geocode":
                    self.geocode = try! utsSubscriptCheckValue(newValue)
                case "highAccuracyExpireTime":
                    self.highAccuracyExpireTime = try! utsSubscriptCheckValueIfPresent(newValue)
                case "isHighAccuracy":
                    self.isHighAccuracy = try! utsSubscriptCheckValue(newValue)
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
        self.provider = obj["provider"] as! String?
        self.type = obj["type"] as! String?
        self.altitude = (obj["altitude"] as? Bool) ?? false
        self.geocode = (obj["geocode"] as? Bool) ?? false
        self.highAccuracyExpireTime = obj["highAccuracyExpireTime"] as! NSNumber?
        self.isHighAccuracy = (obj["isHighAccuracy"] as? Bool) ?? false
        self.success = obj["success"] as! GetLocationSuccessCallback?
        self.fail = obj["fail"] as! GetLocationFailCallback?
        self.complete = obj["complete"] as! GetLocationCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniLocationStartLocationUpdateSuccess)
@objcMembers
public class StartLocationUpdateSuccess : NSObject, UTSObject {
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
public typealias StartLocationUpdateSuccessCallback = (_ result: StartLocationUpdateSuccess) -> Void
public typealias StartLocationUpdateFailCallback = (_ result: IGetLocationFail) -> Void
public typealias StartLocationUpdateComplete = Any
public typealias StartLocationUpdateCompleteCallback = (_ result: StartLocationUpdateComplete) -> Void
public typealias StartLocationUpdateOptionsType = String
@objc(UTSSDKModulesDCloudUniLocationStartLocationUpdateOptions)
@objcMembers
public class StartLocationUpdateOptions : NSObject, UTSObject {
    public var provider: String?
    public var type: StartLocationUpdateOptionsType?
    public var success: StartLocationUpdateSuccessCallback?
    public var fail: StartLocationUpdateFailCallback?
    public var complete: StartLocationUpdateCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "provider":
                    self.provider = try! utsSubscriptCheckValueIfPresent(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.provider = obj["provider"] as! String?
        self.type = obj["type"] as! StartLocationUpdateOptionsType?
        self.success = obj["success"] as! StartLocationUpdateSuccessCallback?
        self.fail = obj["fail"] as! StartLocationUpdateFailCallback?
        self.complete = obj["complete"] as! StartLocationUpdateCompleteCallback?
    }
}
public typealias StartLocationUpdate = (_ options: StartLocationUpdateOptions) -> Void
@objc(UTSSDKModulesDCloudUniLocationStopLocationUpdateSuccess)
@objcMembers
public class StopLocationUpdateSuccess : NSObject, UTSObject {
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
public typealias StopLocationUpdateSuccessCallback = (_ result: StopLocationUpdateSuccess) -> Void
public typealias StopLocationUpdateFailCallback = (_ result: IGetLocationFail) -> Void
public typealias StopLocationUpdateComplete = Any
public typealias StopLocationUpdateCompleteCallback = (_ result: StopLocationUpdateComplete) -> Void
@objc(UTSSDKModulesDCloudUniLocationStopLocationUpdateOptions)
@objcMembers
public class StopLocationUpdateOptions : NSObject, UTSObject {
    public var success: StopLocationUpdateSuccessCallback?
    public var fail: StopLocationUpdateFailCallback?
    public var complete: StopLocationUpdateCompleteCallback?
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
        self.success = obj["success"] as! StopLocationUpdateSuccessCallback?
        self.fail = obj["fail"] as! StopLocationUpdateFailCallback?
        self.complete = obj["complete"] as! StopLocationUpdateCompleteCallback?
    }
}
public typealias StopLocationUpdate = (_ options: StopLocationUpdateOptions) -> Void
public typealias OnLocationChangeResult = GetLocationSuccess
public typealias OnLocationChangeCallback = (_ res: OnLocationChangeResult) -> Void
public typealias OnLocationChange = (_ listener: @escaping OnLocationChangeCallback) -> NSNumber
public typealias OffLocationChange = (_ listener: Any?) -> Void
public typealias OnLocationChangeErrorCallback = (_ res: UniError) -> Void
public typealias OnLocationChangeError = (_ listener: @escaping OnLocationChangeErrorCallback) -> NSNumber
public typealias OffLocationChangeError = (_ listener: Any?) -> Void
public typealias StartLocationUpdateBackgroundSuccess = StartLocationUpdateSuccess
public typealias StartLocationUpdateBackgroundSuccessCallback = (_ result: StartLocationUpdateBackgroundSuccess) -> Void
public typealias StartLocationUpdateBackgroundFailCallback = (_ result: IGetLocationFail) -> Void
public typealias StartLocationUpdateBackgroundComplete = Any
public typealias StartLocationUpdateBackgroundCompleteCallback = (_ result: StartLocationUpdateBackgroundComplete) -> Void
public typealias StartLocationUpdateBackgroundOptionsType = String
@objc(UTSSDKModulesDCloudUniLocationStartLocationUpdateBackgroundOptions)
@objcMembers
public class StartLocationUpdateBackgroundOptions : NSObject, UTSObject {
    public var provider: String?
    public var type: StartLocationUpdateBackgroundOptionsType?
    public var success: StartLocationUpdateBackgroundSuccessCallback?
    public var fail: StartLocationUpdateBackgroundFailCallback?
    public var complete: StartLocationUpdateBackgroundCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "provider":
                    self.provider = try! utsSubscriptCheckValueIfPresent(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.provider = obj["provider"] as! String?
        self.type = obj["type"] as! StartLocationUpdateBackgroundOptionsType?
        self.success = obj["success"] as! StartLocationUpdateBackgroundSuccessCallback?
        self.fail = obj["fail"] as! StartLocationUpdateBackgroundFailCallback?
        self.complete = obj["complete"] as! StartLocationUpdateBackgroundCompleteCallback?
    }
}
public typealias StartLocationUpdateBackground = (_ options: StartLocationUpdateBackgroundOptions) -> Void
public var LocationUniErrors: Map<LocationErrorCode, String> = Map([
    [
        1505003,
        "maybe not turn on the system location permission."
    ],
    [
        1505004,
        "maybe not obtain GPS Permission."
    ],
    [
        1505600,
        "location fail: timeout"
    ],
    [
        1505601,
        "system location support wgs84 only."
    ],
    [
        1505602,
        "location fail: request error"
    ],
    [
        1505603,
        "The system failed to retrieve geocode for the location."
    ],
    [
        1505604,
        "Failed to get provider."
    ],
    [
        1505700,
        "system location not support geocode."
    ],
    [
        1505701,
        "Provider is not find,Please ensure that the device location function is turned on"
    ],
    [
        1505800,
        "Unauthorized access to high-accuracy location services."
    ],
    [
        1505605,
        "The Tencent api key is misconfigured."
    ],
    [
        1505607,
        "GCJ-02 support only."
    ],
    [
        1505608,
        "Only one provider can have continuous location updates enabled at a time."
    ],
    [
        1505702,
        "Missing background location configuration in iOS plist file：UIBackgroundModes->location "
    ]
])
@objc(UTSSDKModulesDCloudUniLocationGetLocationFailImpl__1)
@objcMembers
public class GetLocationFailImpl__1 : UniError, IGetLocationFail {
    public init(_ errCode: LocationErrorCode){
        super.init()
        self.errSubject = LocationUniErrorSubject
        self.errCode = errCode
        self.errMsg = LocationUniErrors.get(errCode) ?? ""
    }
}
public var locationChangeCallback: Map<NSNumber, OnLocationChangeCallback> = Map()
public var locationChangeIndex: NSNumber = 0
public var locationProvider: UniLocationProvider? = nil
public var selectedProvider: String? = nil
public var getLocation: GetLocation = {
(_ options: GetLocationOptions) -> Void in
var providerName = "system"
if (options.provider != nil) {
    providerName = options.provider!
} else {
    if (options.type == "wgs84") {
        providerName = "system"
    } else if (options.type == "gcj02") {
        providerName = "tencent"
    }
}
var provider = UTSiOS.getProvider("location", providerName, UniLocationProvider.self)
if (provider != nil) {
    provider!.getLocation(options)
} else {
    var err = GetLocationFailImpl(1505604)
    options.fail?(err)
    options.complete?(err)
}
}
public var startLocationUpdate: StartLocationUpdate = {
(_ options: StartLocationUpdateOptions) -> Void in
var providerName = "system"
if (options.provider != nil) {
    providerName = options.provider!
} else {
    if (options.type == "wgs84") {
        providerName = "system"
    } else if (options.type == "gcj02") {
        providerName = "tencent"
    }
}
if (selectedProvider != nil && selectedProvider! != providerName) {
    var err = GetLocationFailImpl(1505608)
    options.fail?(err)
    options.complete?(err)
    return
}
selectedProvider = providerName
locationProvider = UTSiOS.getProvider("location", providerName, UniLocationProvider.self)
if (locationProvider != nil) {
    locationProvider!.onLocationChange(registerLocationChange)
    locationProvider!.onLocationChangeError(registerLocationChangeError)
    locationProvider!.startLocationUpdate(options)
} else {
    var err = GetLocationFailImpl(1505604)
    options.fail?(err)
    options.complete?(err)
}
}
public var stopLocationUpdate: StopLocationUpdate = {
(_ options: StopLocationUpdateOptions) -> Void in
selectedProvider = nil
locationProvider?.stopLocationUpdate(options)
options.success?(StopLocationUpdateSuccess(UTSJSONObject([:])))
options.complete?(UTSJSONObject([:]))
}
public var onLocationChange: OnLocationChange = {
(_ listener: @escaping OnLocationChangeCallback) -> NSNumber in
locationChangeIndex++
locationChangeCallback[locationChangeIndex] = listener
return locationChangeIndex
}
public var offLocationChange: OffLocationChange = {
(_ listener: Any?) -> Void in
if (listener != nil && UTSiOS.typeof(listener!) == "number") {
    var id = listener as! NSNumber
    locationChangeCallback.delete(id)
} else {
    locationChangeCallback.clear()
}
}
public var startLocationUpdateBackground: StartLocationUpdateBackground = {
(_ options: StartLocationUpdateBackgroundOptions) -> Void in
var providerName = "system"
if (options.provider != nil) {
    providerName = options.provider!
} else {
    if (options.type == "wgs84") {
        providerName = "system"
    } else if (options.type == "gcj02") {
        providerName = "tencent"
    }
}
if (selectedProvider != nil && selectedProvider! != providerName) {
    var err = GetLocationFailImpl(1505608)
    options.fail?(err)
    options.complete?(err)
    return
}
selectedProvider = providerName
locationProvider = UTSiOS.getProvider("location", providerName, UniLocationProvider.self)
if (locationProvider != nil) {
    locationProvider!.onLocationChange(registerLocationChange)
    locationProvider!.onLocationChangeError(registerLocationChangeError)
    locationProvider!.startLocationUpdateBackground(options)
} else {
    var err = GetLocationFailImpl(1505604)
    options.fail?(err)
    options.complete?(err)
}
}
public var locationChangeErrorIndex: NSNumber = 0
public var locationChangeErrorCallback: Map<NSNumber, OnLocationChangeErrorCallback> = Map()
public var onLocationChangeError: OnLocationChangeError = {
(_ listener: @escaping OnLocationChangeErrorCallback) -> NSNumber in
locationChangeErrorIndex++
locationChangeErrorCallback[locationChangeErrorIndex] = listener
return locationChangeErrorIndex
}
public var offLocationChangeError: OffLocationChangeError = {
(_ listener: Any?) -> Void in
if (listener != nil && UTSiOS.typeof(listener!) == "number") {
    var id = listener as! NSNumber
    locationChangeErrorCallback.delete(id)
} else {
    locationChangeErrorCallback.clear()
}
}
public var registerLocationChange = {
(_ e: OnLocationChangeResult) -> Void in
locationChangeCallback.forEach({
(_ value: @escaping OnLocationChangeCallback, _ key: NSNumber) -> Void in
value(e)
})
}
public var registerLocationChangeError = {
(_ e: UniError) -> Void in
locationChangeErrorCallback.forEach({
(_ value: @escaping OnLocationChangeErrorCallback, _ key: NSNumber) -> Void in
value(e)
})
}
@objc(UTSSDKModulesDCloudUniLocationGetLocationOptionsJSONObject)
@objcMembers
public class GetLocationOptionsJSONObject : NSObject {
    public var provider: String?
    public var type: String?
    public var altitude: Bool = false
    public var geocode: Bool = false
    public var highAccuracyExpireTime: NSNumber?
    public var isHighAccuracy: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniLocationStartLocationUpdateOptionsJSONObject)
@objcMembers
public class StartLocationUpdateOptionsJSONObject : NSObject {
    public var provider: String?
    public var type: StartLocationUpdateOptionsType?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniLocationStopLocationUpdateOptionsJSONObject)
@objcMembers
public class StopLocationUpdateOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniLocationStartLocationUpdateBackgroundOptionsJSONObject)
@objcMembers
public class StartLocationUpdateBackgroundOptionsJSONObject : NSObject {
    public var provider: String?
    public var type: StartLocationUpdateBackgroundOptionsType?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getLocationByJs(_ options: GetLocationOptionsJSONObject) -> Void {
    return getLocation(GetLocationOptions(UTSJSONObject([
        "provider": options.provider,
        "type": options.type,
        "altitude": options.altitude,
        "geocode": options.geocode,
        "highAccuracyExpireTime": options.highAccuracyExpireTime,
        "isHighAccuracy": options.isHighAccuracy,
        "success": {
        (result: GetLocationSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GetLocationFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GetLocationComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func startLocationUpdateByJs(_ options: StartLocationUpdateOptionsJSONObject) -> Void {
    return startLocationUpdate(StartLocationUpdateOptions(UTSJSONObject([
        "provider": options.provider,
        "type": options.type,
        "success": {
        (result: StartLocationUpdateSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: IGetLocationFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: StartLocationUpdateComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func stopLocationUpdateByJs(_ options: StopLocationUpdateOptionsJSONObject) -> Void {
    return stopLocationUpdate(StopLocationUpdateOptions(UTSJSONObject([
        "success": {
        (result: StopLocationUpdateSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: IGetLocationFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: StopLocationUpdateComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func onLocationChangeByJs(_ listener: UTSCallback) -> NSNumber {
    return onLocationChange({
    (res: OnLocationChangeResult) -> Void in
    listener(res)
    })
}
public func offLocationChangeByJs(_ listener: Any?) -> Void {
    return offLocationChange(listener)
}
public func startLocationUpdateBackgroundByJs(_ options: StartLocationUpdateBackgroundOptionsJSONObject) -> Void {
    return startLocationUpdateBackground(StartLocationUpdateBackgroundOptions(UTSJSONObject([
        "provider": options.provider,
        "type": options.type,
        "success": {
        (result: StartLocationUpdateBackgroundSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: IGetLocationFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: StartLocationUpdateBackgroundComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func onLocationChangeErrorByJs(_ listener: UTSCallback) -> NSNumber {
    return onLocationChangeError({
    (res: UniError) -> Void in
    listener(res)
    })
}
public func offLocationChangeErrorByJs(_ listener: Any?) -> Void {
    return offLocationChangeError(listener)
}
@objc(UTSSDKModulesDCloudUniLocationIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniLocationIndexSwift : NSObject {
    public static func s_getLocationByJs(_ options: GetLocationOptionsJSONObject) -> Void {
        return getLocationByJs(options)
    }
    public static func s_startLocationUpdateByJs(_ options: StartLocationUpdateOptionsJSONObject) -> Void {
        return startLocationUpdateByJs(options)
    }
    public static func s_stopLocationUpdateByJs(_ options: StopLocationUpdateOptionsJSONObject) -> Void {
        return stopLocationUpdateByJs(options)
    }
    public static func s_onLocationChangeByJs(_ listener: UTSCallback) -> NSNumber {
        return onLocationChangeByJs(listener)
    }
    public static func s_offLocationChangeByJs(_ listener: Any?) -> Void {
        return offLocationChangeByJs(listener)
    }
    public static func s_startLocationUpdateBackgroundByJs(_ options: StartLocationUpdateBackgroundOptionsJSONObject) -> Void {
        return startLocationUpdateBackgroundByJs(options)
    }
    public static func s_onLocationChangeErrorByJs(_ listener: UTSCallback) -> NSNumber {
        return onLocationChangeErrorByJs(listener)
    }
    public static func s_offLocationChangeErrorByJs(_ listener: Any?) -> Void {
        return offLocationChangeErrorByJs(listener)
    }
}
