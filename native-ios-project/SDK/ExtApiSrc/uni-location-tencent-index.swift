import CoreLocation
import DCloudUTSExtAPI
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
@_implementationOnly import TencentLBS
@objc
public protocol UniLocationTencentProvider : UniLocationProvider, JSExport {
    func toJSON() -> Map<String, Any>
}
@objc(UTSSDKModulesDCloudUniLocationTencentUniLocationTencentProviderImpl)
@objcMembers
public class UniLocationTencentProviderImpl : NSObject, UniLocationTencentProvider {
    public var id: String
    public override var description: String {
        get {
            return self.__description
        }
        set(value) {
            self.__description = value
        }
    }
    public var isAppExist: Bool = false
    public var locationUpdateCallback: OnLocationChangeCallback? = nil
    public var locationUpdateErrorCallback: OnLocationChangeErrorCallback? = nil
    public func getLocation(_ options: GetLocationOptions) {
        LBSLocation.share.getLocationImpl(options)
    }
    public func startLocationUpdate(_ options: StartLocationUpdateOptions) {
        LBSUpdateLocation.share.startUpdatingLocationImpl(options)
    }
    public func stopLocationUpdate(_ options: StopLocationUpdateOptions) {
        LBSUpdateLocation.share.stopUpdatingLocationImpl(options)
    }
    public func onLocationChange(_ listener: @escaping OnLocationChangeCallback) -> NSNumber {
        self.locationUpdateCallback = listener
        LBSUpdateLocation.share.locationUpdateCallback = listener
        return 0
    }
    public func offLocationChange(_ listener: Any?) {
        self.locationUpdateCallback = nil
        LBSUpdateLocation.share.locationUpdateCallback = nil
    }
    public func startLocationUpdateBackground(_ options: StartLocationUpdateBackgroundOptions) {
        LBSUpdateLocation.share.startUpdatingLocationBackgroundImpl(options)
    }
    public func onLocationChangeError(_ listener: @escaping OnLocationChangeErrorCallback) -> NSNumber {
        self.locationUpdateErrorCallback = listener
        LBSUpdateLocation.share.locationUpdateErrorCallback = listener
        return 0
    }
    public func offLocationChangeError(_ listener: Any?) -> Void {
        self.locationUpdateErrorCallback = nil
        LBSUpdateLocation.share.locationUpdateErrorCallback = nil
    }
    public func toJSON() -> Map<String, Any> {
        var dict = Map<String, Any>()
        dict.set("id", self.id)
        dict.set("description", self.description)
        dict.set("isAppExist", self.isAppExist)
        return dict
    }
    public override init(){
        self.id = "tencent"
        self.isAppExist = true
    }
    private var __description: String = "腾讯定位"
}
@objc(UTSSDKModulesDCloudUniLocationTencentLBSUpdateLocation)
@objcMembers
fileprivate class LBSUpdateLocation : NSObject, TencentLBSLocationManagerDelegate {
    private var type: String = "LBSUpdateLocation"
    public static var share = LBSUpdateLocation()
    private var locationManager: TencentLBSLocationManager!
    public var startLocationUpdateOptions: StartLocationUpdateOptions?
    public var startLocationUpdateBackgroundOptions: StartLocationUpdateBackgroundOptions?
    public var locationUpdateCallback: OnLocationChangeCallback?
    public var locationUpdateErrorCallback: OnLocationChangeErrorCallback?
    private var requestLevel = TencentLBSRequestLevel.geo
    private var isUpdatingLocation: Bool = false
    private var isBackgroundUpdating: Bool = false
    private var isLocationUpdateErrorAction: Bool = false
    private func configLocationManager() {
        if (self.locationManager == nil) {
            TencentLBSLocationManager.setUserAgreePrivacy(true)
            self.locationManager = TencentLBSLocationManager()
            var apiKey = Bundle.main.infoDictionary?["TencentLBSAPIKey"]
            if (apiKey != nil) {
                self.locationManager.apiKey = apiKey! as! String
            }
            self.locationManager.delegate = self
        }
    }
    private func requestLocationWithAuthorization() {
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.notDetermined) {
            self.locationManager.requestWhenInUseAuthorization()
            if (self.isBackgroundUpdating) {
                self.locationManager.requestAlwaysAuthorization()
            }
        } else if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.startUpdatingLocation()
        }
    }
    private func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
        self.successAction()
    }
    private func getAuthorizationStatus() -> CLAuthorizationStatus {
        return self.locationManager.authorizationStatus
    }
    public func startUpdatingLocationImpl(_ options: StartLocationUpdateOptions) {
        self.configLocationManager()
        self.startLocationUpdateOptions = options
        self.isUpdatingLocation = true
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        if (options.type != nil && options.type != "gcj02") {
            self.failedAction(1505607)
            return
        }
        var apiKey = Bundle.main.infoDictionary?["TencentLBSAPIKey"]
        if (apiKey == nil) {
            self.failedAction(1505605)
            return
        }
        self.requestLocationWithAuthorization()
    }
    public func startUpdatingLocationBackgroundImpl(_ options: StartLocationUpdateBackgroundOptions) {
        self.configLocationManager()
        self.startLocationUpdateBackgroundOptions = options
        self.isBackgroundUpdating = true
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        if (options.type != nil && options.type != "gcj02") {
            self.failedAction(1505607)
            return
        }
        var apiKey = Bundle.main.infoDictionary?["TencentLBSAPIKey"]
        if (apiKey == nil) {
            self.failedAction(1505605)
            return
        }
        if (self.isConfigBackgroundLocationOnInfoPlist() == false) {
            self.failedAction(1505702)
            return
        }
        self.locationManager.allowsBackgroundLocationUpdates = true
        self.locationManager.pausesLocationUpdatesAutomatically = false
        self.requestLocationWithAuthorization()
    }
    private func isConfigBackgroundLocationOnInfoPlist() -> Bool {
        var infoDictionary = Bundle.main.infoDictionary
        if (infoDictionary != nil) {
            var backgroundModes = infoDictionary!["UIBackgroundModes"] as! Array<String>?
            if (backgroundModes != nil && backgroundModes!.includes("location")) {
                return true
            }
        }
        return false
    }
    public func stopUpdatingLocationImpl(_ options: StopLocationUpdateOptions) {
        self.isUpdatingLocation = false
        self.isBackgroundUpdating = false
        self.isLocationUpdateErrorAction = false
        self.locationManager.stopUpdatingLocation()
        self.locationManager.allowsBackgroundLocationUpdates = false
    }
    private func failedAction(_ errCode: NSNumber) {
        var err = GetLocationFailImpl(errCode)
        if (self.isUpdatingLocation) {
            self.isUpdatingLocation = false
            self.startLocationUpdateOptions?.fail?(err)
            self.startLocationUpdateOptions?.complete?(err)
        }
        if (self.isBackgroundUpdating) {
            self.startLocationUpdateBackgroundOptions?.fail?(err)
            self.startLocationUpdateBackgroundOptions?.complete?(err)
            self.isBackgroundUpdating = false
        }
    }
    private func successAction() {
        if (self.isUpdatingLocation) {
            self.isUpdatingLocation = false
            self.startLocationUpdateOptions?.success?(StartLocationUpdateSuccess(UTSJSONObject([:])))
            self.startLocationUpdateOptions?.complete?(UTSJSONObject([:]))
        }
        if (self.isBackgroundUpdating) {
            self.isBackgroundUpdating = false
            self.isLocationUpdateErrorAction = false
            self.startLocationUpdateBackgroundOptions?.success?(StartLocationUpdateSuccess(UTSJSONObject([:])))
            self.startLocationUpdateBackgroundOptions?.complete?(UTSJSONObject([:]))
        }
    }
    public func tencentLBSDidChangeAuthorization(_ manager: TencentLBSLocationManager) {
        if (self.type != "LBSUpdateLocation") {
            return
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.startUpdatingLocation()
        }
        })
    }
    public func tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didFailWithError error: Error) {
        if (self.type != "LBSUpdateLocation") {
            return
        }
        if (!self.isLocationUpdateErrorAction && UIApplication.shared.applicationState == UIApplication.State.background) {
            return
        }
        var errCode: NSNumber = 1505602
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            errCode = 1505004
        }
        var tempErr = GetLocationFailImpl(errCode)
        var err = UniError(tempErr.errSubject, tempErr.errCode, tempErr.errMsg, tempErr.data)
        self.locationUpdateErrorCallback?(err)
    }
    public func tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didUpdate location: TencentLBSLocation) {
        if (self.type != "LBSUpdateLocation") {
            return
        }
        var address: String? = nil
        if (location.address != nil) {
            address = location.address!
        }
        var altitude = NSNumber(location.location.altitude)
        var response = GetLocationSuccess(UTSJSONObject([
            "latitude": NSNumber(location.location.coordinate.latitude),
            "longitude": NSNumber(location.location.coordinate.longitude),
            "speed": NSNumber(location.location.speed),
            "altitude": altitude,
            "accuracy": NSNumber(location.location.horizontalAccuracy),
            "verticalAccuracy": NSNumber(location.location.verticalAccuracy),
            "horizontalAccuracy": NSNumber(location.location.horizontalAccuracy),
            "address": address
        ]))
        self.locationUpdateCallback?(response)
    }
}
@objc(UTSSDKModulesDCloudUniLocationTencentLBSLocation)
@objcMembers
fileprivate class LBSLocation : NSObject, TencentLBSLocationManagerDelegate {
    private var type: String = "LBSLocation"
    public static var share = LBSLocation()
    private var locationManager: TencentLBSLocationManager!
    private var locationOptions: GetLocationOptions?
    private var requestLevel = TencentLBSRequestLevel.geo
    private var hasRequestLocationSuccess: Bool = false
    private func configLocationManager() {
        if (self.locationManager == nil) {
            TencentLBSLocationManager.setUserAgreePrivacy(true)
            self.locationManager = TencentLBSLocationManager()
            var apiKey = Bundle.main.infoDictionary?["TencentLBSAPIKey"]
            if (apiKey != nil) {
                self.locationManager.apiKey = apiKey! as! String
            }
            self.locationManager.delegate = self
        }
    }
    private func requestLocationWithAuthorization() {
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.notDetermined) {
            self.locationManager.requestWhenInUseAuthorization()
        } else if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.getLocation()
        }
    }
    private func getAuthorizationStatus() -> CLAuthorizationStatus {
        return self.locationManager.authorizationStatus
    }
    public func getLocationImpl(_ options: GetLocationOptions) {
        self.configLocationManager()
        self.locationOptions = options
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        if (options.highAccuracyExpireTime == nil) {
            self.locationOptions!.highAccuracyExpireTime = 3000
        }
        if (options.type == nil) {
            self.locationOptions!.type = "gcj02"
        }
        if (options.type != "gcj02") {
            self.failedAction(1505607)
            return
        }
        var apiKey = Bundle.main.infoDictionary?["TencentLBSAPIKey"]
        if (apiKey == nil) {
            self.failedAction(1505605)
            return
        }
        if (options.geocode) {
            self.requestLevel = TencentLBSRequestLevel.name
        }
        self.requestLocationWithAuthorization()
    }
    private func getLocation() {
        if #available(iOS 14.0, *) {
            if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true && self.locationManager.accuracyAuthorization == TencentLBSAccuracyAuthorization.reducedAccuracy) {
                self.requestTemporaryFullAccuracyAuthorization()
            } else {
                if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                } else {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                }
                self.requestLocation()
            }
        } else {
            if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
                self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            } else {
                if (self.locationOptions?.altitude != nil && self.locationOptions?.altitude == true) {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                } else {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                }
            }
            self.requestLocation()
        }
    }
    private func getAddress(_ location: TencentLBSLocation?) -> String? {
        var address: String? = nil
        if (self.locationOptions?.geocode != nil && self.locationOptions?.geocode == true) {
            var nation = location?.nation ?? ""
            var province = location?.province ?? ""
            var city = location?.city ?? ""
            var district = location?.district ?? ""
            var street = location?.street ?? ""
            var name = location?.name ?? ""
            if (city == province) {
                address = nation + province + district + street + name
            } else {
                address = nation + province + city + district + street + name
            }
            if (address == name) {
                address = (location?.address ?? "") + name
            }
        }
        return address
    }
    private func requestLocation() {
        self.hasRequestLocationSuccess = false
        self.locationManager.requestLocation(with: self.requestLevel, locationTimeout: 10, completionBlock: {
        (location: TencentLBSLocation?, err: Error?) -> Void in
        if (location == nil) {
            self.failedAction(1505602)
            return
        }
        var altitude: NSNumber = 0.0
        if (self.locationOptions?.altitude != nil && self.locationOptions?.altitude == true) {
            altitude = NSNumber(location!.location.altitude)
        }
        var response = GetLocationSuccess(UTSJSONObject([
            "latitude": NSNumber(location!.location.coordinate.latitude),
            "longitude": NSNumber(location!.location.coordinate.longitude),
            "speed": NSNumber(location!.location.speed),
            "altitude": altitude,
            "accuracy": NSNumber(location!.location.horizontalAccuracy),
            "verticalAccuracy": NSNumber(location!.location.verticalAccuracy),
            "horizontalAccuracy": NSNumber(location!.location.horizontalAccuracy),
            "address": self.getAddress(location)
        ]))
        self.successAction(response)
        })
        if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
            var timeoutMill: Int = self.locationOptions?.highAccuracyExpireTime?.toInt() ?? 3000
            setTimeout({
            () -> Void in
            self.clearWatch()
            if (!self.hasRequestLocationSuccess) {
                self.failedAction(1505600)
            }
            }, timeoutMill)
        }
    }
    private func requestTemporaryFullAccuracyAuthorization() {
        if #available(iOS 14.0, *) {
            self.locationManager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "PurposeKey", completion: {
            (err: Error?) -> Void in
            if (self.locationManager.accuracyAuthorization == TencentLBSAccuracyAuthorization.reducedAccuracy) {
                self.failedAction(1505800)
            }
            })
        }
    }
    private func failedAction(_ errCode: NSNumber) {
        var err = GetLocationFailImpl(errCode)
        self.locationOptions?.fail?(err)
        self.locationOptions?.complete?(err)
        self.clearWatch()
    }
    private func successAction(_ response: GetLocationSuccess) {
        self.locationOptions?.success?(response)
        self.locationOptions?.complete?(response)
        self.hasRequestLocationSuccess = true
        self.clearWatch()
    }
    private func clearWatch() {
        self.locationManager.stopUpdatingLocation()
    }
    public func tencentLBSDidChangeAuthorization(_ manager: TencentLBSLocationManager) {
        if (self.type != "LBSLocation") {
            return
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.getLocation()
        }
    }
    public func tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didFailWithError error: Error) {
        if (self.type != "LBSLocation") {
            return
        }
        self.failedAction(1505602)
    }
}
@objc(UTSSDKModulesDCloudUniLocationTencentUniLocationTencentProviderImplByJs)
@objcMembers
public class UniLocationTencentProviderImplByJs : UniLocationTencentProviderImpl {
    public func getLocationByJs(_ options: GetLocationOptions) {
        return self.getLocation(options)
    }
    public func startLocationUpdateByJs(_ options: StartLocationUpdateOptions) {
        return self.startLocationUpdate(options)
    }
    public func stopLocationUpdateByJs(_ options: StopLocationUpdateOptions) {
        return self.stopLocationUpdate(options)
    }
    public func onLocationChangeByJs(_ listener: @escaping OnLocationChangeCallback) -> NSNumber {
        return self.onLocationChange(listener)
    }
    public func offLocationChangeByJs(_ listener: Any?) {
        return self.offLocationChange(listener)
    }
    public func startLocationUpdateBackgroundByJs(_ options: StartLocationUpdateBackgroundOptions) {
        return self.startLocationUpdateBackground(options)
    }
    public func onLocationChangeErrorByJs(_ listener: @escaping OnLocationChangeErrorCallback) -> NSNumber {
        return self.onLocationChangeError(listener)
    }
    public func offLocationChangeErrorByJs(_ listener: Any?) -> Void {
        return self.offLocationChangeError(listener)
    }
    public func toJSONByJs() -> Map<String, Any> {
        return self.toJSON()
    }
}
