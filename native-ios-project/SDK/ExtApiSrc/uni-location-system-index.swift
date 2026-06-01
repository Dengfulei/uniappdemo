import CoreLocation
import DCloudUTSExtAPI
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
@objc
public protocol UniLocationSystemProvider : UniLocationProvider, JSExport {
    func toJSON() -> Map<String, Any>
}
@objc(UTSSDKModulesDCloudUniLocationSystemUniLocationSystemProviderImpl)
@objcMembers
public class UniLocationSystemProviderImpl : NSObject, UniLocationSystemProvider {
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
        SystemLocation.share.getLocationImpl(options)
    }
    public func startLocationUpdate(_ options: StartLocationUpdateOptions) {
        UpdateSystemLocation.share.startUpdatingLocationImpl(options)
    }
    public func stopLocationUpdate(_ options: StopLocationUpdateOptions) {
        UpdateSystemLocation.share.stopUpdatingLocationImpl(options)
    }
    public func onLocationChange(_ listener: @escaping OnLocationChangeCallback) -> NSNumber {
        self.locationUpdateCallback = listener
        UpdateSystemLocation.share.locationUpdateCallback = listener
        return 0
    }
    public func offLocationChange(_ listener: Any?) {
        self.locationUpdateCallback = nil
        UpdateSystemLocation.share.locationUpdateCallback = nil
    }
    public func startLocationUpdateBackground(_ options: StartLocationUpdateBackgroundOptions) {
        UpdateSystemLocation.share.startUpdatingLocationBackgroundImpl(options)
    }
    public func onLocationChangeError(_ listener: @escaping OnLocationChangeErrorCallback) -> NSNumber {
        self.locationUpdateErrorCallback = listener
        UpdateSystemLocation.share.locationUpdateErrorCallback = listener
        return 0
    }
    public func offLocationChangeError(_ listener: Any?) -> Void {
        self.locationUpdateErrorCallback = nil
        UpdateSystemLocation.share.locationUpdateErrorCallback = nil
    }
    public func toJSON() -> Map<String, Any> {
        var dict = Map<String, Any>()
        dict.set("id", self.id)
        dict.set("description", self.description)
        dict.set("isAppExist", self.isAppExist)
        return dict
    }
    public override init(){
        self.id = "system"
        self.isAppExist = true
    }
    private var __description: String = "系统定位"
}
@objc(UTSSDKModulesDCloudUniLocationSystemSystemLocation)
@objcMembers
public class SystemLocation : NSObject, CLLocationManagerDelegate {
    private var type: String = "SystemLocation"
    public static var share = SystemLocation()
    public var innerLocationManager: CLLocationManager!
    public var locationOptions: GetLocationOptions?
    private var previousResponse: GetLocationSuccess?
    private var hasRequestLocationSuccess: Bool = false
    private var hasReverseGeocodeLocation: Bool = false
    public func configLocationManager() {
        if (self.innerLocationManager == nil) {
            self.innerLocationManager = CLLocationManager()
            self.innerLocationManager.delegate = self
        }
    }
    public func requestLocationWithAuthorization() {
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.notDetermined) {
            self.innerLocationManager.requestWhenInUseAuthorization()
        } else if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.getLocation()
        }
    }
    public func getAuthorizationStatus() -> CLAuthorizationStatus {
        if #available(iOS 14.0, *) {
            return self.innerLocationManager.authorizationStatus
        } else {
            return CLLocationManager.authorizationStatus()
        }
    }
    public func getLocationImpl(_ options: GetLocationOptions) {
        self.configLocationManager()
        self.locationOptions = options
        self.hasReverseGeocodeLocation = false
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        if (options.type == nil) {
            self.locationOptions!.type = "wgs84"
        }
        if (options.highAccuracyExpireTime == nil) {
            self.locationOptions!.highAccuracyExpireTime = 3000
        }
        if (options.type != "wgs84") {
            self.failedAction(1505601)
            return
        }
        self.requestLocationWithAuthorization()
    }
    public func getLocation() {
        if #available(iOS 14.0, *) {
            if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true && self.innerLocationManager.accuracyAuthorization == CLAccuracyAuthorization.reducedAccuracy) {
                self.requestTemporaryFullAccuracyAuthorization()
            } else {
                if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
                    self.innerLocationManager.desiredAccuracy = kCLLocationAccuracyBest
                } else {
                    self.innerLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                }
                self.requestLocation()
            }
        } else {
            if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
                self.innerLocationManager.desiredAccuracy = kCLLocationAccuracyBest
            } else {
                if (self.locationOptions?.altitude != nil && self.locationOptions?.altitude == true) {
                    self.innerLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                } else {
                    self.innerLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                }
            }
            self.requestLocation()
        }
    }
    public func requestLocation() {
        self.hasRequestLocationSuccess = false
        self.innerLocationManager.requestLocation()
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
    public func requestTemporaryFullAccuracyAuthorization() {
        if #available(iOS 14.0, *) {
            self.innerLocationManager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "PurposeKey", completion: {
            (err: Error?) -> Void in
            if (self.innerLocationManager.accuracyAuthorization == CLAccuracyAuthorization.reducedAccuracy) {
                self.failedAction(1505800)
            }
            })
        }
    }
    public func failedAction(_ errCode: NSNumber) {
        var err = GetLocationFailImpl(errCode)
        self.locationOptions?.fail?(err)
        self.locationOptions?.complete?(err)
        self.previousResponse = nil
        self.clearWatch()
    }
    public func successAction(_ response: GetLocationSuccess) {
        self.locationOptions?.success?(response)
        self.locationOptions?.complete?(response)
        self.hasRequestLocationSuccess = true
        self.previousResponse = response
        self.clearWatch()
    }
    public func clearWatch() {
        self.innerLocationManager.stopUpdatingLocation()
    }
    public func isSameLocation(_ left: CLLocation, _ right: CLLocation) -> Bool {
        if (left.coordinate.latitude == right.coordinate.latitude && left.coordinate.longitude == right.coordinate.longitude) {
            return false
        }
        if (left.altitude == right.altitude) {
            return false
        }
        var horizontalAccuracyTolerance = Math.max(NSNumber(left.horizontalAccuracy), NSNumber(right.horizontalAccuracy))
        if (NSNumber(left.distance(from: right)) > horizontalAccuracyTolerance) {
            return false
        }
        var verticalAccuracyTolerance = Math.max(NSNumber(left.verticalAccuracy), NSNumber(right.verticalAccuracy))
        if (Math.abs(NSNumber(left.altitude - right.altitude)) > verticalAccuracyTolerance) {
            return false
        }
        var timeDiff = left.timestamp.timeIntervalSince(right.timestamp)
        if (Math.abs(NSNumber(timeDiff * 1000)) > 500) {
            return false
        }
        return true
    }
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if (self.type != "SystemLocation") {
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
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (self.type != "SystemLocation") {
            return
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        var inner_status = self.getAuthorizationStatus()
        if (inner_status == CLAuthorizationStatus.denied || inner_status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (inner_status == CLAuthorizationStatus.authorizedAlways || inner_status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.getLocation()
        }
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if (self.type != "SystemLocation") {
            return
        }
        self.failedAction(1505602)
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (self.type != "SystemLocation") {
            return
        }
        if (locations.length == 0) {
            self.failedAction(1505602)
            return
        }
        var location = locations[0]
        if (self.hasRequestLocationSuccess == true) {
            if (self.previousResponse != nil) {
                return
            }
        }
        var altitude: NSNumber = 0.0
        if (self.locationOptions?.altitude != nil && self.locationOptions?.altitude == true) {
            altitude = NSNumber(location.altitude)
        }
        if (self.locationOptions?.geocode != nil && self.locationOptions?.geocode == true) {
            var geocoder = CLGeocoder()
            var address = ""
            geocoder.reverseGeocodeLocation(location, completionHandler: {
            (placemarks: [CLPlacemark]?, err: Error?) -> Void in
            if (self.hasReverseGeocodeLocation == true) {
                return
            }
            self.hasReverseGeocodeLocation = true
            if (err != nil) {
                self.failedAction(1505603)
                return
            }
            if (placemarks != nil && placemarks!.length > 0) {
                var placemark = placemarks![0]
                var name = placemark.name ?? ""
                var city = placemark.locality ?? ""
                var country = placemark.country ?? ""
                address = country + city + name
                var response = GetLocationSuccess(UTSJSONObject([
                    "latitude": NSNumber(location.coordinate.latitude),
                    "longitude": NSNumber(location.coordinate.longitude),
                    "speed": NSNumber(location.speed),
                    "altitude": altitude,
                    "accuracy": 0 as NSNumber,
                    "verticalAccuracy": NSNumber(location.verticalAccuracy),
                    "horizontalAccuracy": NSNumber(location.horizontalAccuracy),
                    "address": address
                ]))
                self.successAction(response)
            }
            })
        } else {
            var response = GetLocationSuccess(UTSJSONObject([
                "latitude": NSNumber(location.coordinate.latitude),
                "longitude": NSNumber(location.coordinate.longitude),
                "speed": NSNumber(location.speed),
                "altitude": altitude,
                "accuracy": 0 as NSNumber,
                "verticalAccuracy": NSNumber(location.verticalAccuracy),
                "horizontalAccuracy": NSNumber(location.horizontalAccuracy),
                "address": nil
            ]))
            self.successAction(response)
        }
    }
}
@objc(UTSSDKModulesDCloudUniLocationSystemUpdateSystemLocation)
@objcMembers
public class UpdateSystemLocation : NSObject, CLLocationManagerDelegate {
    private var type: String = "UpdateSystemLocation"
    public static var share = UpdateSystemLocation()
    public var innerLocationManager: CLLocationManager!
    public var startLocationUpdateOptions: StartLocationUpdateOptions?
    public var startLocationUpdateBackgroundOptions: StartLocationUpdateBackgroundOptions?
    public var locationUpdateCallback: OnLocationChangeCallback?
    public var locationUpdateErrorCallback: OnLocationChangeErrorCallback?
    private var isUpdatingLocation: Bool = false
    private var isBackgroundUpdating: Bool = false
    private var isLocationUpdateErrorAction: Bool = false
    public func configLocationManager() {
        if (self.innerLocationManager == nil) {
            self.innerLocationManager = CLLocationManager()
            self.innerLocationManager.delegate = self
        }
    }
    public func requestLocationWithAuthorization() {
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.notDetermined) {
            self.innerLocationManager.requestWhenInUseAuthorization()
            if (self.isBackgroundUpdating) {
                self.innerLocationManager.requestAlwaysAuthorization()
            }
        } else if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.startUpdatingLocation()
        }
    }
    public func startUpdatingLocation() {
        self.innerLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.innerLocationManager.distanceFilter = kCLDistanceFilterNone
        self.innerLocationManager.startUpdatingLocation()
        self.successAction()
    }
    public func getAuthorizationStatus() -> CLAuthorizationStatus {
        if #available(iOS 14.0, *) {
            return self.innerLocationManager.authorizationStatus
        } else {
            return CLLocationManager.authorizationStatus()
        }
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
        if (options.type != nil && options.type != "wgs84") {
            self.failedAction(1505601)
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
        if (options.type != nil && options.type != "wgs84") {
            self.failedAction(1505601)
            return
        }
        if (self.isConfigBackgroundLocationOnInfoPlist() == false) {
            self.failedAction(1505702)
            return
        }
        self.innerLocationManager.allowsBackgroundLocationUpdates = true
        self.innerLocationManager.pausesLocationUpdatesAutomatically = false
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
        self.innerLocationManager.stopUpdatingLocation()
        self.innerLocationManager.allowsBackgroundLocationUpdates = false
    }
    public func addLocationChangeListener(_ listener: @escaping OnLocationChangeCallback) {
        self.locationUpdateCallback = listener
    }
    public func failedAction(_ errCode: NSNumber) {
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
    public func successAction() {
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
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if (self.type != "UpdateSystemLocation") {
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
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (self.type != "UpdateSystemLocation") {
            return
        }
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        var inner_status = self.getAuthorizationStatus()
        if (inner_status == CLAuthorizationStatus.denied || inner_status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (inner_status == CLAuthorizationStatus.authorizedAlways || inner_status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.startUpdatingLocation()
        }
        })
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if (self.type != "UpdateSystemLocation") {
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
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (self.type != "UpdateSystemLocation") {
            return
        }
        if (locations.length == 0) {
            var tempErr = GetLocationFailImpl(1505602)
            var err = UniError(tempErr.errSubject, tempErr.errCode, tempErr.errMsg, tempErr.data)
            self.locationUpdateErrorCallback?(err)
            return
        }
        var location = locations[0]
        var altitude = NSNumber(location.altitude)
        var response = GetLocationSuccess(UTSJSONObject([
            "latitude": NSNumber(location.coordinate.latitude),
            "longitude": NSNumber(location.coordinate.longitude),
            "speed": NSNumber(location.speed),
            "altitude": altitude,
            "accuracy": 0 as NSNumber,
            "verticalAccuracy": NSNumber(location.verticalAccuracy),
            "horizontalAccuracy": NSNumber(location.horizontalAccuracy),
            "address": nil
        ]))
        self.locationUpdateCallback?(response)
    }
}
@objc(UTSSDKModulesDCloudUniLocationSystemUniLocationSystemProviderImplByJs)
@objcMembers
public class UniLocationSystemProviderImplByJs : UniLocationSystemProviderImpl {
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
