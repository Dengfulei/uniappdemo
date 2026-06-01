import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import JavaScriptCore
@_implementationOnly import QMapKit
import DCloudUTSExtAPI
@objc(UTSSDKModulesDCloudUniMapTencentLocationObject)
@objcMembers
public class LocationObject : NSObject, UTSObject {
    public var latitude: NSNumber!
    public var longitude: NSNumber!
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
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMarker)
@objcMembers
public class Marker : NSObject, UTSObject {
    public var id: NSNumber!
    public var latitude: NSNumber!
    public var longitude: NSNumber!
    public var iconPath: String!
    public var title: String?
    public var rotate: NSNumber?
    public var alpha: NSNumber?
    public var width: NSNumber?
    public var height: NSNumber?
    public var ariaLabel: String?
    public var anchor: Anchor?
    public var callout: MapMarkerCallout?
    public var label: MapMarkerLabel?
    public var clusterId: NSNumber?
    public var customCallout: MapMarkerCallout?
    public var joinCluster: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "id":
                    self.id = try! utsSubscriptCheckValue(newValue)
                case "latitude":
                    self.latitude = try! utsSubscriptCheckValue(newValue)
                case "longitude":
                    self.longitude = try! utsSubscriptCheckValue(newValue)
                case "iconPath":
                    self.iconPath = try! utsSubscriptCheckValue(newValue)
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "rotate":
                    self.rotate = try! utsSubscriptCheckValueIfPresent(newValue)
                case "alpha":
                    self.alpha = try! utsSubscriptCheckValueIfPresent(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValueIfPresent(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValueIfPresent(newValue)
                case "ariaLabel":
                    self.ariaLabel = try! utsSubscriptCheckValueIfPresent(newValue)
                case "anchor":
                    self.anchor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "callout":
                    self.callout = try! utsSubscriptCheckValueIfPresent(newValue)
                case "label":
                    self.label = try! utsSubscriptCheckValueIfPresent(newValue)
                case "clusterId":
                    self.clusterId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "customCallout":
                    self.customCallout = try! utsSubscriptCheckValueIfPresent(newValue)
                case "joinCluster":
                    self.joinCluster = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.id = obj["id"] as! NSNumber
        self.latitude = obj["latitude"] as! NSNumber
        self.longitude = obj["longitude"] as! NSNumber
        self.iconPath = obj["iconPath"] as! String
        self.title = obj["title"] as! String?
        self.rotate = obj["rotate"] as! NSNumber?
        self.alpha = obj["alpha"] as! NSNumber?
        self.width = obj["width"] as! NSNumber?
        self.height = obj["height"] as! NSNumber?
        self.ariaLabel = obj["ariaLabel"] as! String?
        self.anchor = obj["anchor"] as! Anchor?
        self.callout = obj["callout"] as! MapMarkerCallout?
        self.label = obj["label"] as! MapMarkerLabel?
        self.clusterId = obj["clusterId"] as! NSNumber?
        self.customCallout = obj["customCallout"] as! MapMarkerCallout?
        self.joinCluster = (obj["joinCluster"] as? Bool) ?? false
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapMarkerCallout)
@objcMembers
public class MapMarkerCallout : NSObject, UTSObject {
    public var content: String?
    public var color: String?
    public var fontSize: NSNumber?
    public var borderRadius: NSNumber?
    public var borderWidth: NSNumber?
    public var borderColor: String?
    public var bgColor: String?
    public var padding: NSNumber?
    public var display: String?
    public var textAlign: String?
    public var anchorX: NSNumber?
    public var anchorY: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "content":
                    self.content = try! utsSubscriptCheckValueIfPresent(newValue)
                case "color":
                    self.color = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fontSize":
                    self.fontSize = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderRadius":
                    self.borderRadius = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderWidth":
                    self.borderWidth = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderColor":
                    self.borderColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "bgColor":
                    self.bgColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "padding":
                    self.padding = try! utsSubscriptCheckValueIfPresent(newValue)
                case "display":
                    self.display = try! utsSubscriptCheckValueIfPresent(newValue)
                case "textAlign":
                    self.textAlign = try! utsSubscriptCheckValueIfPresent(newValue)
                case "anchorX":
                    self.anchorX = try! utsSubscriptCheckValueIfPresent(newValue)
                case "anchorY":
                    self.anchorY = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.content = obj["content"] as! String?
        self.color = obj["color"] as! String?
        self.fontSize = obj["fontSize"] as! NSNumber?
        self.borderRadius = obj["borderRadius"] as! NSNumber?
        self.borderWidth = obj["borderWidth"] as! NSNumber?
        self.borderColor = obj["borderColor"] as! String?
        self.bgColor = obj["bgColor"] as! String?
        self.padding = obj["padding"] as! NSNumber?
        self.display = obj["display"] as! String?
        self.textAlign = obj["textAlign"] as! String?
        self.anchorX = obj["anchorX"] as! NSNumber?
        self.anchorY = obj["anchorY"] as! NSNumber?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapMarkerLabel)
@objcMembers
public class MapMarkerLabel : NSObject, UTSObject {
    public var content: String?
    public var color: String?
    public var fontSize: NSNumber?
    public var x: NSNumber?
    public var y: NSNumber?
    public var anchorX: NSNumber?
    public var anchorY: NSNumber?
    public var borderWidth: NSNumber?
    public var borderColor: String?
    public var borderRadius: NSNumber?
    public var bgColor: String?
    public var padding: NSNumber?
    public var textAlign: String?
    public var ariaLabel: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "content":
                    self.content = try! utsSubscriptCheckValueIfPresent(newValue)
                case "color":
                    self.color = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fontSize":
                    self.fontSize = try! utsSubscriptCheckValueIfPresent(newValue)
                case "x":
                    self.x = try! utsSubscriptCheckValueIfPresent(newValue)
                case "y":
                    self.y = try! utsSubscriptCheckValueIfPresent(newValue)
                case "anchorX":
                    self.anchorX = try! utsSubscriptCheckValueIfPresent(newValue)
                case "anchorY":
                    self.anchorY = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderWidth":
                    self.borderWidth = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderColor":
                    self.borderColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderRadius":
                    self.borderRadius = try! utsSubscriptCheckValueIfPresent(newValue)
                case "bgColor":
                    self.bgColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "padding":
                    self.padding = try! utsSubscriptCheckValueIfPresent(newValue)
                case "textAlign":
                    self.textAlign = try! utsSubscriptCheckValueIfPresent(newValue)
                case "ariaLabel":
                    self.ariaLabel = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.content = obj["content"] as! String?
        self.color = obj["color"] as! String?
        self.fontSize = obj["fontSize"] as! NSNumber?
        self.x = obj["x"] as! NSNumber?
        self.y = obj["y"] as! NSNumber?
        self.anchorX = obj["anchorX"] as! NSNumber?
        self.anchorY = obj["anchorY"] as! NSNumber?
        self.borderWidth = obj["borderWidth"] as! NSNumber?
        self.borderColor = obj["borderColor"] as! String?
        self.borderRadius = obj["borderRadius"] as! NSNumber?
        self.bgColor = obj["bgColor"] as! String?
        self.padding = obj["padding"] as! NSNumber?
        self.textAlign = obj["textAlign"] as! String?
        self.ariaLabel = obj["ariaLabel"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentAnchor)
@objcMembers
public class Anchor : NSObject, UTSObject {
    public var x: NSNumber!
    public var y: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "x":
                    self.x = try! utsSubscriptCheckValue(newValue)
                case "y":
                    self.y = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.x = obj["x"] as! NSNumber
        self.y = obj["y"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentPolyline)
@objcMembers
public class Polyline : NSObject, UTSObject {
    public var points: [LocationObject]!
    public var color: String?
    public var width: NSNumber?
    public var dottedLine: Bool = false
    public var arrowLine: Bool = false
    public var arrowIconPath: String?
    public var borderColor: String?
    public var borderWidth: NSNumber?
    public var colorList: [String]?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "points":
                    self.points = try! utsSubscriptCheckValue(newValue)
                case "color":
                    self.color = try! utsSubscriptCheckValueIfPresent(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValueIfPresent(newValue)
                case "dottedLine":
                    self.dottedLine = try! utsSubscriptCheckValue(newValue)
                case "arrowLine":
                    self.arrowLine = try! utsSubscriptCheckValue(newValue)
                case "arrowIconPath":
                    self.arrowIconPath = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderColor":
                    self.borderColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "borderWidth":
                    self.borderWidth = try! utsSubscriptCheckValueIfPresent(newValue)
                case "colorList":
                    self.colorList = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.points = obj["points"] as! [LocationObject]
        self.color = obj["color"] as! String?
        self.width = obj["width"] as! NSNumber?
        self.dottedLine = (obj["dottedLine"] as? Bool) ?? false
        self.arrowLine = (obj["arrowLine"] as? Bool) ?? false
        self.arrowIconPath = obj["arrowIconPath"] as! String?
        self.borderColor = obj["borderColor"] as! String?
        self.borderWidth = obj["borderWidth"] as! NSNumber?
        self.colorList = obj["colorList"] as! [String]?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentPolygon)
@objcMembers
public class Polygon : NSObject, UTSObject {
    public var points: [LocationObject]!
    public var strokeWidth: NSNumber?
    public var strokeColor: String?
    public var fillColor: String?
    public var zIndex: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "points":
                    self.points = try! utsSubscriptCheckValue(newValue)
                case "strokeWidth":
                    self.strokeWidth = try! utsSubscriptCheckValueIfPresent(newValue)
                case "strokeColor":
                    self.strokeColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fillColor":
                    self.fillColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "zIndex":
                    self.zIndex = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.points = obj["points"] as! [LocationObject]
        self.strokeWidth = obj["strokeWidth"] as! NSNumber?
        self.strokeColor = obj["strokeColor"] as! String?
        self.fillColor = obj["fillColor"] as! String?
        self.zIndex = obj["zIndex"] as! NSNumber?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentCircle)
@objcMembers
public class Circle : NSObject, UTSObject {
    public var latitude: NSNumber!
    public var longitude: NSNumber!
    public var radius: NSNumber!
    public var color: String?
    public var fillColor: String?
    public var strokeWidth: NSNumber?
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
                case "radius":
                    self.radius = try! utsSubscriptCheckValue(newValue)
                case "color":
                    self.color = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fillColor":
                    self.fillColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "strokeWidth":
                    self.strokeWidth = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.radius = obj["radius"] as! NSNumber
        self.color = obj["color"] as! String?
        self.fillColor = obj["fillColor"] as! String?
        self.strokeWidth = obj["strokeWidth"] as! NSNumber?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentControlPosition)
@objcMembers
public class ControlPosition : NSObject, UTSObject {
    public var left: NSNumber?
    public var top: NSNumber?
    public var width: NSNumber?
    public var height: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "left":
                    self.left = try! utsSubscriptCheckValueIfPresent(newValue)
                case "top":
                    self.top = try! utsSubscriptCheckValueIfPresent(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValueIfPresent(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.left = obj["left"] as! NSNumber?
        self.top = obj["top"] as! NSNumber?
        self.width = obj["width"] as! NSNumber?
        self.height = obj["height"] as! NSNumber?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentControl)
@objcMembers
public class Control : NSObject, UTSObject {
    public var position: ControlPosition!
    public var iconPath: String!
    public var id: NSNumber?
    public var clickable: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "position":
                    self.position = try! utsSubscriptCheckValue(newValue)
                case "iconPath":
                    self.iconPath = try! utsSubscriptCheckValue(newValue)
                case "id":
                    self.id = try! utsSubscriptCheckValueIfPresent(newValue)
                case "clickable":
                    self.clickable = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.position = obj["position"] as! ControlPosition
        self.iconPath = obj["iconPath"] as! String
        self.id = obj["id"] as! NSNumber?
        self.clickable = (obj["clickable"] as? Bool) ?? false
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentBounds)
@objcMembers
public class Bounds : NSObject, UTSObject {
    public var southwest: LocationObject!
    public var northeast: LocationObject!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "southwest":
                    self.southwest = try! utsSubscriptCheckValue(newValue)
                case "northeast":
                    self.northeast = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.southwest = obj["southwest"] as! LocationObject
        self.northeast = obj["northeast"] as! LocationObject
    }
}
public typealias CreateMapContext = (_ mapId: String, _ component: ComponentPublicInstance?) -> MapContext?
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetCenterLocationOptions)
@objcMembers
public class MapContextGetCenterLocationOptions : NSObject, UTSObject {
    public var success: ((_ result: LocationObject) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
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
        self.success = obj["success"] as! ((_ result: LocationObject) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextMoveToLocationOptions)
@objcMembers
public class MapContextMoveToLocationOptions : NSObject, UTSObject {
    public var latitude: NSNumber?
    public var longitude: NSNumber?
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "latitude":
                    self.latitude = try! utsSubscriptCheckValueIfPresent(newValue)
                case "longitude":
                    self.longitude = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.latitude = obj["latitude"] as! NSNumber?
        self.longitude = obj["longitude"] as! NSNumber?
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextTranslateMarkerOptions)
@objcMembers
public class MapContextTranslateMarkerOptions : NSObject, UTSObject {
    public var markerId: NSNumber!
    public var destination: LocationObject!
    public var autoRotate: Bool = false
    public var rotate: NSNumber?
    public var moveWithRotate: Bool = false
    public var duration: NSNumber?
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "markerId":
                    self.markerId = try! utsSubscriptCheckValue(newValue)
                case "destination":
                    self.destination = try! utsSubscriptCheckValue(newValue)
                case "autoRotate":
                    self.autoRotate = try! utsSubscriptCheckValue(newValue)
                case "rotate":
                    self.rotate = try! utsSubscriptCheckValueIfPresent(newValue)
                case "moveWithRotate":
                    self.moveWithRotate = try! utsSubscriptCheckValue(newValue)
                case "duration":
                    self.duration = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.markerId = obj["markerId"] as! NSNumber
        self.destination = obj["destination"] as! LocationObject
        self.autoRotate = (obj["autoRotate"] as? Bool) ?? false
        self.rotate = obj["rotate"] as! NSNumber?
        self.moveWithRotate = (obj["moveWithRotate"] as? Bool) ?? false
        self.duration = obj["duration"] as! NSNumber?
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextIncludePointsOptions)
@objcMembers
public class MapContextIncludePointsOptions : NSObject, UTSObject {
    public var points: [LocationObject]!
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "points":
                    self.points = try! utsSubscriptCheckValue(newValue)
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
        self.points = obj["points"] as! [LocationObject]
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetRegionResult)
@objcMembers
public class MapContextGetRegionResult : NSObject, UTSObject {
    public var southwest: LocationObject!
    public var northeast: LocationObject!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "southwest":
                    self.southwest = try! utsSubscriptCheckValue(newValue)
                case "northeast":
                    self.northeast = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.southwest = obj["southwest"] as! LocationObject
        self.northeast = obj["northeast"] as! LocationObject
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetRegionOptions)
@objcMembers
public class MapContextGetRegionOptions : NSObject, UTSObject {
    public var success: ((_ result: MapContextGetRegionResult) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
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
        self.success = obj["success"] as! ((_ result: MapContextGetRegionResult) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetScaleResult)
@objcMembers
public class MapContextGetScaleResult : NSObject, UTSObject {
    public var scale: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "scale":
                    self.scale = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.scale = obj["scale"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetScaleOptions)
@objcMembers
public class MapContextGetScaleOptions : NSObject, UTSObject {
    public var success: ((_ result: MapContextGetScaleResult) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
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
        self.success = obj["success"] as! ((_ result: MapContextGetScaleResult) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextAddGroundOverlayOptions)
@objcMembers
public class MapContextAddGroundOverlayOptions : NSObject, UTSObject {
    public var id: String!
    public var src: String!
    public var bounds: Bounds!
    public var visible: Bool = false
    public var zIndex: NSNumber?
    public var opacity: NSNumber?
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "id":
                    self.id = try! utsSubscriptCheckValue(newValue)
                case "src":
                    self.src = try! utsSubscriptCheckValue(newValue)
                case "bounds":
                    self.bounds = try! utsSubscriptCheckValue(newValue)
                case "visible":
                    self.visible = try! utsSubscriptCheckValue(newValue)
                case "zIndex":
                    self.zIndex = try! utsSubscriptCheckValueIfPresent(newValue)
                case "opacity":
                    self.opacity = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.id = obj["id"] as! String
        self.src = obj["src"] as! String
        self.bounds = obj["bounds"] as! Bounds
        self.visible = (obj["visible"] as? Bool) ?? false
        self.zIndex = obj["zIndex"] as! NSNumber?
        self.opacity = obj["opacity"] as! NSNumber?
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextAddMarkersOptions)
@objcMembers
public class MapContextAddMarkersOptions : NSObject, UTSObject {
    public var markers: [Marker]!
    public var clear: Bool = false
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "markers":
                    self.markers = try! utsSubscriptCheckValue(newValue)
                case "clear":
                    self.clear = try! utsSubscriptCheckValue(newValue)
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
        self.markers = obj["markers"] as! [Marker]
        self.clear = obj["clear"] as! Bool
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextMoveAlongOptions)
@objcMembers
public class MapContextMoveAlongOptions : NSObject, UTSObject {
    public var markerId: NSNumber!
    public var path: [LocationObject]!
    public var duration: NSNumber?
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "markerId":
                    self.markerId = try! utsSubscriptCheckValue(newValue)
                case "path":
                    self.path = try! utsSubscriptCheckValue(newValue)
                case "duration":
                    self.duration = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.markerId = obj["markerId"] as! NSNumber
        self.path = obj["path"] as! [LocationObject]
        self.duration = obj["duration"] as! NSNumber?
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextRemoveGroundOverlayOptions)
@objcMembers
public class MapContextRemoveGroundOverlayOptions : NSObject, UTSObject {
    public var id: String!
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "id":
                    self.id = try! utsSubscriptCheckValue(newValue)
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
        self.id = obj["id"] as! String
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextRemoveMarkersOptions)
@objcMembers
public class MapContextRemoveMarkersOptions : NSObject, UTSObject {
    public var markerIds: [NSNumber]!
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "markerIds":
                    self.markerIds = try! utsSubscriptCheckValue(newValue)
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
        self.markerIds = obj["markerIds"] as! [NSNumber]
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextUpdateGroundOverlayOptions)
@objcMembers
public class MapContextUpdateGroundOverlayOptions : NSObject, UTSObject {
    public var id: String!
    public var src: String!
    public var bounds: Bounds!
    public var visible: Bool = false
    public var zIndex: NSNumber?
    public var opacity: NSNumber?
    public var success: ((_ result: Any) -> Void)?
    public var fail: ((_ result: MapContextFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "id":
                    self.id = try! utsSubscriptCheckValue(newValue)
                case "src":
                    self.src = try! utsSubscriptCheckValue(newValue)
                case "bounds":
                    self.bounds = try! utsSubscriptCheckValue(newValue)
                case "visible":
                    self.visible = try! utsSubscriptCheckValue(newValue)
                case "zIndex":
                    self.zIndex = try! utsSubscriptCheckValueIfPresent(newValue)
                case "opacity":
                    self.opacity = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.id = obj["id"] as! String
        self.src = obj["src"] as! String
        self.bounds = obj["bounds"] as! Bounds
        self.visible = (obj["visible"] as? Bool) ?? false
        self.zIndex = obj["zIndex"] as! NSNumber?
        self.opacity = obj["opacity"] as! NSNumber?
        self.success = obj["success"] as! ((_ result: Any) -> Void)?
        self.fail = obj["fail"] as! ((_ result: MapContextFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
public typealias MapErrorCode = NSNumber
public protocol MapContextFail : IUniError {
    var errCode: MapErrorCode { get set }
}
public protocol MapContext {
    func getCenterLocation(_ options: MapContextGetCenterLocationOptions)
    func moveToLocation(_ options: MapContextMoveToLocationOptions)
    func translateMarker(_ options: MapContextTranslateMarkerOptions)
    func includePoints(_ options: MapContextIncludePointsOptions)
    func getRegion(_ options: MapContextGetRegionOptions)
    func getScale(_ options: MapContextGetScaleOptions)
    func addGroundOverlay(_ options: MapContextAddGroundOverlayOptions)
    func addMarkers(_ options: MapContextAddMarkersOptions)
    func moveAlong(_ options: MapContextMoveAlongOptions)
    func removeGroundOverlay(_ options: MapContextRemoveGroundOverlayOptions)
    func removeMarkers(_ options: MapContextRemoveMarkersOptions)
    func updateGroundOverlay(_ options: MapContextUpdateGroundOverlayOptions)
}
public var UniMapErrorSubject = "uni-map"
public var MapUniErrors: Map<MapErrorCode, String> = Map([
    [
        500001,
        "failed to obtain the latitude and longitude of the current map center"
    ],
    [
        500002,
        "current location not found"
    ],
    [
        500003,
        "marker not found"
    ],
    [
        500004,
        "create groundOverlay fail"
    ],
    [
        500005,
        "id not found"
    ],
    [
        500006,
        "network image loading failed"
    ],
    [
        500012,
        "system error"
    ]
])
fileprivate func getErrcode(_ errCode: NSNumber) -> MapErrorCode {
    var res = MapUniErrors[errCode]
    return res == nil ? 500012 : errCode
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextFailImpl)
@objcMembers
public class MapContextFailImpl : UniError, MapContextFail {
    public init(_ errCode: MapErrorCode){
        super.init()
        self.errSubject = UniMapErrorSubject
        self.errCode = errCode
        self.errMsg = MapUniErrors[errCode] ?? ""
    }
}
@objc
public protocol UniMapElement : JSExport {
    func moveAlong(_ options: MapContextMoveAlongOptions)
    func translateMarker(_ options: MapContextTranslateMarkerOptions)
    func addGroundOverlay(_ options: MapContextAddGroundOverlayOptions)
    func updateGroundOverlay(_ options: MapContextUpdateGroundOverlayOptions)
    func removeGroundOverlay(_ options: MapContextRemoveGroundOverlayOptions)
    func getCenterLocation(_ options: MapContextGetCenterLocationOptions)
    func addMarkers(_ options: MapContextAddMarkersOptions)
    func removeMarkers(_ options: MapContextRemoveMarkersOptions)
    func getScale(_ options: MapContextGetScaleOptions)
    func moveToLocation(_ options: MapContextMoveToLocationOptions)
    func getRegion(_ options: MapContextGetRegionOptions)
    func includePoints(_ options: MapContextIncludePointsOptions)
}
@objc(UTSSDKModulesDCloudUniMapTencentUniMapElementImpl)
@objcMembers
public class UniMapElementImpl : UniElementImpl, UniMapElement {
    private var internalMap: IInternalMap? = nil
    fileprivate func setMap(_ internalMap: IInternalMap) {
        self.internalMap = internalMap
    }
    public override func getIOSView() -> UIView? {
        var nativeElement = self.firstChild as! UniNativeViewElement
        if (nativeElement == nil) {
            return nil
        } else {
            return nativeElement.getIOSView()
        }
    }
    public func moveAlong(_ options: MapContextMoveAlongOptions) -> Void {
        var points = self.convertLatLngArray(options.path)
        self.internalMap!.moveAlong(markerId: options.markerId.toInt(), path: points, duration: options.duration?.toDouble(), callback: {
        (param) -> Void in
        var map = param as! Map<String, String>
        if (map["type"] == "success") {
            options.success?(UTSJSONObject([
                "errMsg": "moveAlong:ok"
            ]))
            options.complete?(UTSJSONObject([
                "errMsg": "moveAlong:ok"
            ]))
        } else {
            var error = MapContextFailImpl(getErrcode(500003))
            options.fail?(error)
            options.complete?(error)
        }
        })
    }
    public func translateMarker(_ options: MapContextTranslateMarkerOptions) -> Void {
        var latlng = DCLatLng(latitude: options.destination.latitude.toDouble(), longitude: options.destination.longitude.toDouble())
        self.internalMap!.translateMarker(markerId: options.markerId.toInt(), destination: latlng, rotate: options.rotate?.toDouble(), moveWithRotate: options.moveWithRotate, duration: options.duration?.toDouble(), callback: {
        (param) -> Void in
        var map = param as! Map<String, String>
        if (map["type"] == "success") {
            options.success?(UTSJSONObject([
                "errMsg": "translateMarker:ok"
            ]))
            options.complete?(UTSJSONObject([
                "errMsg": "translateMarker:ok"
            ]))
        } else {
            var error = MapContextFailImpl(getErrcode(500003))
            options.fail?(error)
            options.complete?(error)
        }
        })
    }
    public func addGroundOverlay(_ options: MapContextAddGroundOverlayOptions) -> Void {
        var southwest = self.convertLatLng(options.bounds.southwest)
        var northeast = self.convertLatLng(options.bounds.northeast)
        var bounds = DCBounds(southwest: southwest, northeast: northeast)
        var src = ""
        if (options.src.startsWith("http")) {
            src = options.src
        } else {
            src = UTSiOS.convert2AbsFullPath(options.src)
        }
        var ground = DCGroundOverlayModel(id: options.id, src: src, bounds: bounds)
        self.internalMap!.addGroundOverlay(model: ground, callback: {
        (param) -> Void in
        var map = param as! Map<String, String>
        if (map["type"] == "success") {
            options.success?(UTSJSONObject([
                "errMsg": "addGroundOverlay:ok"
            ]))
            options.complete?(UTSJSONObject([
                "errMsg": "addGroundOverlay:ok"
            ]))
        } else {
            var errCode: NSNumber = 500012
            if (map["errMsg"] == "network image loading failed") {
                errCode = 500006
            }
            var error = MapContextFailImpl(getErrcode(errCode))
            options.fail?(error)
            options.complete?(error)
        }
        })
    }
    public func updateGroundOverlay(_ options: MapContextUpdateGroundOverlayOptions) -> Void {
        var southwest = self.convertLatLng(options.bounds.southwest)
        var northeast = self.convertLatLng(options.bounds.northeast)
        var bounds = DCBounds(southwest: southwest, northeast: northeast)
        var src = ""
        if (options.src.startsWith("http")) {
            src = options.src
        } else {
            src = UTSiOS.convert2AbsFullPath(options.src)
        }
        var ground = DCGroundOverlayModel(id: options.id, src: src, bounds: bounds)
        self.internalMap!.updateGroundOverlay(model: ground, callback: {
        (param) -> Void in
        var map = param as! Map<String, String>
        if (map["type"] == "success") {
            options.success?(UTSJSONObject([
                "errMsg": "updateGroundOverlay:ok"
            ]))
            options.complete?(UTSJSONObject([
                "errMsg": "updateGroundOverlay:ok"
            ]))
        } else {
            var errCode: NSNumber = 500012
            if (map["errMsg"] == "network image loading failed") {
                errCode = 500006
            }
            var error = MapContextFailImpl(getErrcode(errCode))
            options.fail?(error)
            options.complete?(error)
        }
        })
    }
    public func removeGroundOverlay(_ options: MapContextRemoveGroundOverlayOptions) -> Void {
        self.internalMap!.removeGroundOverlay(id: options.id, callback: {
        (param) -> Void in
        var map = param as! Map<String, String>
        if (map["type"] == "success") {
            options.success?(UTSJSONObject([
                "errMsg": "removeGroundOverlay:ok"
            ]))
            options.complete?(UTSJSONObject([
                "errMsg": "removeGroundOverlay:ok"
            ]))
        } else {
            var errCode: NSNumber = 500012
            if (map["errMsg"] == "id not found") {
                errCode = 500005
            }
            var error = MapContextFailImpl(getErrcode(errCode))
            options.fail?(error)
            options.complete?(error)
        }
        })
    }
    public func getCenterLocation(_ options: MapContextGetCenterLocationOptions) -> Void {
        var latlng = self.internalMap!.getCenterLocation()
        if (latlng.latitude == 0.0 || latlng.longitude == 0.0) {
            var error = MapContextFailImpl(getErrcode(500001))
            options.fail?(error)
            options.complete?(error)
        } else {
            var result = LocationObject(UTSJSONObject([
                "latitude": latlng.latitude,
                "longitude": latlng.longitude
            ]))
            options.success?(result)
            options.complete?(result)
        }
    }
    public func addMarkers(_ options: MapContextAddMarkersOptions) -> Void {
        var markerModels = options.markers.map({
        (_ marker) -> DCMakerModel in
        var markerModel = DCMakerModel(id: marker.id.toInt(), latitude: marker.latitude.toDouble(), longitude: marker.longitude.toDouble(), iconPath: marker.iconPath)
        markerModel.title = marker.title
        markerModel.rotate = marker.rotate?.toDouble() ?? 0.0
        markerModel.alpha = marker.alpha?.toDouble() ?? 1.0
        markerModel.width = marker.width?.toDouble()
        markerModel.height = marker.height?.toDouble()
        markerModel.ariaLabel = marker.ariaLabel
        var anchor = [
            Float(0.5),
            Float(1.0)
        ]
        if (marker.anchor != nil) {
            anchor[0] = Float(marker.anchor!.x)
            anchor[1] = Float(marker.anchor!.y)
        }
        markerModel.anchor = anchor
        var callout = marker.callout
        if (callout != nil) {
            var calloutModel = DCMarkerCalloutModel()
            calloutModel.content = callout!.content
            if (callout!.color != nil) {
                var color = callout!.color!
                calloutModel.color = UTSiOS.colorWithString(color)
            }
            if (callout!.fontSize != nil) {
                calloutModel.fontSize = callout!.fontSize!.toDouble()
            }
            if (callout!.borderRadius != nil) {
                calloutModel.borderRadius = callout!.borderRadius!.toDouble()
            }
            if (callout!.borderWidth != nil) {
                calloutModel.borderWidth = callout!.borderWidth!.toDouble()
            }
            if (callout!.borderColor != nil) {
                var borderColor = callout!.borderColor!
                calloutModel.borderColor = UTSiOS.colorWithString(borderColor)
            }
            if (callout!.bgColor != nil) {
                var bgColor = callout!.bgColor!
                calloutModel.bgColor = UTSiOS.colorWithString(bgColor)
            }
            if (callout!.padding != nil) {
                calloutModel.padding = callout!.padding!.toDouble()
            }
            var display = callout!.display == "ALWAYS"
            calloutModel.display = display
            calloutModel.textAlign = callout!.textAlign
            markerModel.callout = calloutModel
        }
        return markerModel
        })
        if (options.clear) {
            self.internalMap!.setMarkers(markerModels: markerModels)
        } else {
            self.internalMap!.addMarkers(markerModels: markerModels)
        }
        options.success?(UTSJSONObject([
            "errMsg": "addMarkers:ok"
        ]))
        options.complete?(UTSJSONObject([
            "errMsg": "addMarkers:ok"
        ]))
    }
    public func removeMarkers(_ options: MapContextRemoveMarkersOptions) -> Void {
        var ids = options.markerIds.map({
        (_ value: NSNumber) -> Int in
        return value.toInt()
        })
        self.internalMap!.removeMarkers(ids: ids)
        options.success?(UTSJSONObject([
            "errMsg": "removeMarkers:ok"
        ]))
        options.complete?(UTSJSONObject([
            "errMsg": "removeMarkers:ok"
        ]))
    }
    public func getScale(_ options: MapContextGetScaleOptions) -> Void {
        var scale = self.internalMap!.getScale()
        var result = MapContextGetScaleResult(UTSJSONObject([
            "scale": NSNumber.from(scale)
        ]))
        options.success?(result)
        options.complete?(result)
    }
    public func moveToLocation(_ options: MapContextMoveToLocationOptions) -> Void {
        var latlng: DCLatLng? = nil
        if (options.latitude != nil || options.longitude != nil) {
            latlng = DCLatLng(latitude: options.latitude!.toDouble(), longitude: options.longitude!.toDouble())
        }
        self.internalMap!.moveToLocation(latLng: latlng, iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, String>
        if (map["type"] == "success") {
            options.success?(UTSJSONObject([
                "errMsg": "moveToLocation:ok"
            ]))
            options.complete?(UTSJSONObject([
                "errMsg": "moveToLocation:ok"
            ]))
        } else {
            var error = MapContextFailImpl(getErrcode(500002))
            options.fail?(error)
            options.complete?(error)
        }
        })
    }
    public func getRegion(_ options: MapContextGetRegionOptions) -> Void {
        var bounds = self.internalMap!.getRegion()
        var southwest = bounds.southwest
        var northeast = bounds.northeast
        var sw = LocationObject(UTSJSONObject([
            "latitude": southwest.latitude,
            "longitude": southwest.longitude
        ]))
        var ne = LocationObject(UTSJSONObject([
            "latitude": northeast.latitude,
            "longitude": northeast.longitude
        ]))
        var result = MapContextGetRegionResult(UTSJSONObject([
            "southwest": sw,
            "northeast": ne
        ]))
        options.success?(result)
        options.complete?(result)
    }
    public func includePoints(_ options: MapContextIncludePointsOptions) -> Void {
        var points = self.convertLatLngArray(options.points)
        self.internalMap!.setIncludePoints(points: points, animate: true)
        options.success?(UTSJSONObject([
            "errMsg": "includePoints:ok"
        ]))
        options.complete?(UTSJSONObject([
            "errMsg": "includePoints:ok"
        ]))
    }
    private func convertLatLng(_ latLng: LocationObject) -> DCLatLng {
        return DCLatLng(latitude: latLng.latitude.toDouble(), longitude: latLng.longitude.toDouble())
    }
    private func convertLatLngArray(_ latLngArray: [LocationObject]) -> [DCLatLng] {
        return latLngArray.map({
        (latLng) -> DCLatLng in
        return self.convertLatLng(latLng)
        })
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentTencentMap)
@objcMembers
public class TencentMap : NSObject {
    public var __$$element: UniNativeViewElement
    private var internalMap = TencentMapImpl()
    public init(_ element: UniNativeViewElement){
        self.__$$element = element
        super.init()
        self.start()
        (self.__$$element.parentElement as! UniMapElementImpl).setMap(self.internalMap)
    }
    public func start() {
        var appkey_ios: String? = Bundle.main.object(forInfoDictionaryKey: "TencentLBSAPIKey") as! String?
        if (appkey_ios == nil) {
            return
        }
        QMapServices.shared().apiKey = appkey_ios!
        QMapServices.shared().setPrivacyAgreement(true)
        var mapView = self.internalMap.getMap()
        self.__$$element.bindIOSView(mapView)
        self.setOnMapLoadedCallback()
        self.setOnMapClickCallback()
        self.setOnMapMarkerTap()
        self.setOnMapControlTap()
        self.setOnMapAnchorPointTap()
        self.setOnMapPoiTap()
        self.setOnMapCalloutTap()
        setTimeout({
        () -> Void in
        self.setOnMapRegionChange()
        }, 500)
    }
    public func destroy() {
        self.internalMap.destroy()
    }
    public func setCenter(_ latitude: NSNumber, _ longitude: NSNumber, _ animate: Bool = true) {
        self.internalMap.setCenter(latitude: latitude.toDouble(), longitude: longitude.toDouble(), animate: animate)
    }
    public func setMinScale(_ zoom: NSNumber) {
        self.internalMap.setMinScale(zoom: zoom.toInt())
    }
    public func setMaxScale(_ zoom: NSNumber) {
        self.internalMap.setMaxScale(zoom: zoom.toInt())
    }
    public func setScale(_ zoom: NSNumber, _ animate: Bool = true) {
        self.internalMap.setScale(zoom: zoom.toInt(), animate: animate)
    }
    public func getScale() -> NSNumber {
        return NSNumber.from(self.internalMap.getScale())
    }
    public func setTheme(_ theme: String) {
        self.internalMap.setTheme(theme: theme)
    }
    public func setLayerStyle(_ id: String) {
        self.internalMap.setLayerStyle(id: id)
    }
    public func setMarkers(_ markers: [Marker]) {
        var markerModels = markers.map({
        (_ marker) -> DCMakerModel in
        var markerModel = DCMakerModel(id: marker.id.toInt(), latitude: marker.latitude.toDouble(), longitude: marker.longitude.toDouble(), iconPath: marker.iconPath)
        markerModel.title = marker.title
        markerModel.rotate = marker.rotate?.toDouble() ?? 0.0
        markerModel.alpha = marker.alpha?.toDouble() ?? 1.0
        markerModel.width = marker.width?.toDouble()
        markerModel.height = marker.height?.toDouble()
        markerModel.ariaLabel = marker.ariaLabel
        var anchor = [
            Float(0.5),
            Float(1.0)
        ]
        if (marker.anchor != nil) {
            anchor[0] = Float(marker.anchor!.x)
            anchor[1] = Float(marker.anchor!.y)
        }
        markerModel.anchor = anchor
        var callout = marker.callout
        if (callout != nil) {
            var calloutModel = DCMarkerCalloutModel()
            calloutModel.content = callout!.content
            if (callout!.color != nil) {
                var color = callout!.color!
                calloutModel.color = UTSiOS.colorWithString(color)
            }
            if (callout!.fontSize != nil) {
                calloutModel.fontSize = callout!.fontSize!.toDouble()
            }
            if (callout!.borderRadius != nil) {
                calloutModel.borderRadius = callout!.borderRadius!.toDouble()
            }
            if (callout!.borderWidth != nil) {
                calloutModel.borderWidth = callout!.borderWidth!.toDouble()
            }
            if (callout!.borderColor != nil) {
                var borderColor = callout!.borderColor!
                calloutModel.borderColor = UTSiOS.colorWithString(borderColor)
            }
            if (callout!.bgColor != nil) {
                var bgColor = callout!.bgColor!
                calloutModel.bgColor = UTSiOS.colorWithString(bgColor)
            }
            if (callout!.padding != nil) {
                calloutModel.padding = callout!.padding!.toDouble()
            }
            var display = callout!.display == "ALWAYS"
            calloutModel.display = display
            calloutModel.textAlign = callout!.textAlign
            markerModel.callout = calloutModel
        }
        return markerModel
        })
        self.internalMap.setMarkers(markerModels: markerModels)
    }
    public func setPolyline(_ polylines: [Polyline]) {
        var models = polylines.map({
        (_ polyline) -> DCPolylineModel in
        var points = self.convertLatLngArray(polyline.points)
        var polylineModel = DCPolylineModel(points: points)
        if (polyline.color != nil) {
            var color = polyline.color!
            polylineModel.color = UTSiOS.colorWithString(color)
        }
        if (polyline.width != nil) {
            polylineModel.width = polyline.width!.toDouble()
        }
        polylineModel.dottedLine = polyline.dottedLine ?? false
        polylineModel.arrowLine = polyline.arrowLine ?? false
        if (polyline.arrowIconPath != nil) {
            polylineModel.arrowIconPath = UTSiOS.convert2AbsFullPath(polyline.arrowIconPath!)
        }
        if (polyline.colorList != nil) {
            var convertedColorList: [UIColor] = []
            var colorList = polyline.colorList!
            colorList.forEach({
            (_ colorStr: String) -> Void in
            convertedColorList.push(UTSiOS.colorWithString(colorStr))
            })
            polylineModel.colorList = convertedColorList
        }
        return polylineModel
        })
        self.internalMap.setPolyline(list: models)
    }
    public func setCircle(_ circles: [Circle]) {
        var models = circles.map({
        (_ circle) -> DCCircleModel in
        var circleModel = DCCircleModel(latitude: circle.latitude.toDouble(), longitude: circle.longitude.toDouble(), radius: circle.radius.toDouble())
        if (circle.color != nil) {
            circleModel.color = UTSiOS.colorWithString(circle.color!)
        }
        if (circle.fillColor != nil) {
            circleModel.fillColor = UTSiOS.colorWithString(circle.fillColor!)
        }
        if (circle.strokeWidth != nil) {
            circleModel.strokeWidth = circle.strokeWidth!.toDouble()
        }
        return circleModel
        })
        self.internalMap.setCircle(list: models)
    }
    public func setControl(_ controls: [Control]) {
        var models = controls.map({
        (_ control) -> DCControlModel in
        var position = DCPosition()
        position.left = control.position.left?.toDouble()
        position.top = control.position.top?.toDouble()
        position.width = control.position.width?.toDouble()
        position.height = control.position.height?.toDouble()
        var iconPath = ""
        if (control.iconPath.startsWith("http")) {
            iconPath = control.iconPath
        } else {
            iconPath = UTSiOS.convert2AbsFullPath(control.iconPath)
        }
        var controlModel = DCControlModel(position: position, iconPath: iconPath)
        controlModel.id = control.id?.toInt()
        controlModel.clickable = control.clickable
        return controlModel
        })
        self.internalMap.setControl(list: models)
    }
    public func setPolygon(_ polygons: [Polygon]) {
        var models = polygons.map({
        (_ polygon) -> DCPolygonModel in
        var latlngs = self.convertLatLngArray(polygon.points)
        var polygonModel = DCPolygonModel(points: latlngs)
        if (polygon.strokeWidth != nil) {
            polygonModel.strokeWidth = polygon.strokeWidth!.toDouble()
        }
        if (polygon.strokeColor != nil) {
            polygonModel.strokeColor = UTSiOS.colorWithString(polygon.strokeColor!)
        }
        if (polygon.fillColor != nil) {
            polygonModel.fillColor = UTSiOS.colorWithString(polygon.fillColor!)
        }
        polygonModel.zIndex = polygon.zIndex?.toDouble()
        return polygonModel
        })
        self.internalMap.setPolygon(list: models)
    }
    public func setIncludePoints(_ points: [LocationObject], _ animate: Bool = true) {
        self.internalMap.setIncludePoints(points: self.convertLatLngArray(points), animate: animate)
    }
    public func enable3D(_ enable: Bool) {
        self.internalMap.enable3D(enable: enable)
    }
    public func showCompass(_ enable: Bool) {
        self.internalMap.showCompass(enable: enable)
    }
    public func enableZoom(_ enable: Bool) {
        self.internalMap.enableZoom(enable: enable)
    }
    public func enableScroll(_ enable: Bool) {
        self.internalMap.enableScroll(enable: enable)
    }
    public func enableRotate(_ enable: Bool) {
        self.internalMap.enableRotate(enable: enable)
    }
    public func setRotate(_ rotate: NSNumber, _ animate: Bool = true) {
        self.internalMap.setRotate(rotate: rotate.toFloat(), animate: animate)
    }
    public func setSkew(_ skew: NSNumber, _ animate: Bool = true) {
        self.internalMap.setSkew(skew: skew.toFloat(), animate: animate)
    }
    public func setEnableOverlooking(_ enable: Bool) {
        self.internalMap.setEnableOverlooking(enable: enable)
    }
    public func setEnableSatellite(_ enable: Bool) {
        self.internalMap.setEnableSatellite(enable: enable)
    }
    public func setEnableTraffic(_ enable: Bool) {
        self.internalMap.setEnableTraffic(enable: enable)
    }
    public func setEnablePoi(_ enable: Bool) {
        self.internalMap.setEnablePoi(enable: enable)
    }
    public func setEnableBuilding(_ enable: Bool) {
        self.internalMap.setEnableBuilding(enable: enable)
    }
    public func setShowLocation(_ show: Bool) {
        self.internalMap.setShowLocation(show: show)
    }
    public func setEnableIndoorMap(_ enable: Bool) {
        self.internalMap.setEnableIndoorMap(enable: enable)
    }
    private func convertLatLng(_ latLng: LocationObject) -> DCLatLng {
        return DCLatLng(latitude: latLng.latitude.toDouble(), longitude: latLng.longitude.toDouble())
    }
    private func convertLatLngArray(_ latLngArray: [LocationObject]) -> [DCLatLng] {
        return latLngArray.map({
        (latLng) -> DCLatLng in
        return self.convertLatLng(latLng)
        })
    }
    public func setOnMapLoadedCallback() {
        var element = self.__$$element
        self.internalMap.setOnMapLoadedCallback(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var event = UniNativeViewEvent(map["type"] as! String, UTSJSONObject([:]))
        element.dispatchEvent("updated", event)
        })
    }
    public func setOnMapClickCallback() {
        var element = self.__$$element
        self.internalMap.setOnMapClickCallback(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var detail = map["detail"] as! Map<String, Any>
        var event = UniNativeViewEvent(map["type"] as! String, UTSJSONObject(detail))
        element.dispatchEvent("tapNative", event)
        })
    }
    public func setOnMapRegionChange() {
        var element = self.__$$element
        self.internalMap.setOnMapRegionChange(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var detail = map["detail"]
        var jsonObject = UTSJSONObject(detail)
        jsonObject["causedBy"] = map["causedBy"]
        var event = UniNativeViewEvent(map["type"] as! String, jsonObject)
        element.dispatchEvent("regionchange", event)
        })
    }
    public func setOnMapMarkerTap() {
        var element = self.__$$element
        self.internalMap.setOnMarkerClick(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var detail = map["detail"]
        var event = UniNativeViewEvent(map["type"] as! String, UTSJSONObject(detail))
        element.dispatchEvent("markertap", event)
        })
    }
    public func setOnMapControlTap() {
        var element = self.__$$element
        self.internalMap.setControlTap(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var detail = map["detail"]
        var event = UniNativeViewEvent(map["type"] as! String, UTSJSONObject(detail))
        element.dispatchEvent("controltap", event)
        })
    }
    public func setOnMapAnchorPointTap() {
        var element = self.__$$element
        self.internalMap.setMyLocationClick(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var detail = map["detail"]
        var event = UniNativeViewEvent(map["type"] as! String, UTSJSONObject(detail))
        element.dispatchEvent("anchorpointtap", event)
        })
    }
    public func setOnMapPoiTap() {
        var element = self.__$$element
        self.internalMap.setPoiTapClick(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var detail = map["detail"]
        var event = UniNativeViewEvent(map["type"] as! String, UTSJSONObject(detail))
        element.dispatchEvent("poitap", event)
        })
    }
    public func setOnMapCalloutTap() {
        var element = self.__$$element
        self.internalMap.setOnCalloutClick(iCallBack: {
        (param) -> Void in
        var map = param as! Map<String, Any>
        var detail = map["detail"]
        var event = UniNativeViewEvent(map["type"] as! String, UTSJSONObject(detail))
        element.dispatchEvent("callouttap", event)
        })
    }
}
public var createMapContext: CreateMapContext = {
(_ mapId: String, _ component: ComponentPublicInstance?) -> MapContext? in
var mapElement: UniMapElement? = nil
if (component == nil) {
    mapElement = DCloudUTSExtAPI.getElementById(mapId) as! UniMapElement?
} else {
    mapElement = component?.__$$el(mapId) as! UniMapElement?
}
if (mapElement == nil) {
    return nil
}
return MapContextImpl(mapElement!)
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextImpl)
@objcMembers
private class MapContextImpl : NSObject, MapContext {
    private var mapElement: UniMapElement
    public init(_ mapElement: UniMapElement){
        self.mapElement = mapElement
    }
    public func moveAlong(_ options: MapContextMoveAlongOptions) -> Void {
        self.mapElement.moveAlong(options)
    }
    public func translateMarker(_ options: MapContextTranslateMarkerOptions) -> Void {
        self.mapElement.translateMarker(options)
    }
    public func addGroundOverlay(_ options: MapContextAddGroundOverlayOptions) -> Void {
        self.mapElement.addGroundOverlay(options)
    }
    public func updateGroundOverlay(_ options: MapContextUpdateGroundOverlayOptions) -> Void {
        self.mapElement.updateGroundOverlay(options)
    }
    public func removeGroundOverlay(_ options: MapContextRemoveGroundOverlayOptions) -> Void {
        self.mapElement.removeGroundOverlay(options)
    }
    public func getCenterLocation(_ options: MapContextGetCenterLocationOptions) -> Void {
        self.mapElement.getCenterLocation(options)
    }
    public func addMarkers(_ options: MapContextAddMarkersOptions) -> Void {
        self.mapElement.addMarkers(options)
    }
    public func removeMarkers(_ options: MapContextRemoveMarkersOptions) -> Void {
        self.mapElement.removeMarkers(options)
    }
    public func getScale(_ options: MapContextGetScaleOptions) -> Void {
        self.mapElement.getScale(options)
    }
    public func moveToLocation(_ options: MapContextMoveToLocationOptions) -> Void {
        self.mapElement.moveToLocation(options)
    }
    public func getRegion(_ options: MapContextGetRegionOptions) -> Void {
        self.mapElement.getRegion(options)
    }
    public func includePoints(_ options: MapContextIncludePointsOptions) -> Void {
        self.mapElement.includePoints(options)
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentLocationObjectJSONObject)
@objcMembers
public class LocationObjectJSONObject : NSObject {
    public var latitude: NSNumber!
    public var longitude: NSNumber!
}
@objc(UTSSDKModulesDCloudUniMapTencentMarkerJSONObject)
@objcMembers
public class MarkerJSONObject : NSObject {
    public var id: NSNumber!
    public var latitude: NSNumber!
    public var longitude: NSNumber!
    public var iconPath: String!
    public var title: String?
    public var rotate: NSNumber?
    public var alpha: NSNumber?
    public var width: NSNumber?
    public var height: NSNumber?
    public var ariaLabel: String?
    public var anchor: Anchor?
    public var callout: MapMarkerCallout?
    public var label: MapMarkerLabel?
    public var clusterId: NSNumber?
    public var customCallout: MapMarkerCallout?
    public var joinCluster: Bool = false
}
@objc(UTSSDKModulesDCloudUniMapTencentPolylineJSONObject)
@objcMembers
public class PolylineJSONObject : NSObject, DCUniModel {
    public var points: [LocationObject]!
    public var color: String?
    public var width: NSNumber?
    public var dottedLine: Bool = false
    public var arrowLine: Bool = false
    public var arrowIconPath: String?
    public var borderColor: String?
    public var borderWidth: NSNumber?
    public var colorList: [String]?
    public static func modelContainerPropertyGenericClass() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = Dictionary()
        dict["points"] = LocationObject.classForCoder()
        return dict
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentPolygonJSONObject)
@objcMembers
public class PolygonJSONObject : NSObject, DCUniModel {
    public var points: [LocationObject]!
    public var strokeWidth: NSNumber?
    public var strokeColor: String?
    public var fillColor: String?
    public var zIndex: NSNumber?
    public static func modelContainerPropertyGenericClass() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = Dictionary()
        dict["points"] = LocationObject.classForCoder()
        return dict
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentCircleJSONObject)
@objcMembers
public class CircleJSONObject : NSObject {
    public var latitude: NSNumber!
    public var longitude: NSNumber!
    public var radius: NSNumber!
    public var color: String?
    public var fillColor: String?
    public var strokeWidth: NSNumber?
}
@objc(UTSSDKModulesDCloudUniMapTencentControlJSONObject)
@objcMembers
public class ControlJSONObject : NSObject {
    public var position: ControlPosition!
    public var iconPath: String!
    public var id: NSNumber?
    public var clickable: Bool = false
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetCenterLocationOptionsJSONObject)
@objcMembers
public class MapContextGetCenterLocationOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextMoveToLocationOptionsJSONObject)
@objcMembers
public class MapContextMoveToLocationOptionsJSONObject : NSObject {
    public var latitude: NSNumber?
    public var longitude: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextTranslateMarkerOptionsJSONObject)
@objcMembers
public class MapContextTranslateMarkerOptionsJSONObject : NSObject {
    public var markerId: NSNumber!
    public var destination: LocationObject!
    public var autoRotate: Bool = false
    public var rotate: NSNumber?
    public var moveWithRotate: Bool = false
    public var duration: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextIncludePointsOptionsJSONObject)
@objcMembers
public class MapContextIncludePointsOptionsJSONObject : NSObject, DCUniModel {
    public var points: [LocationObject]!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
    public static func modelContainerPropertyGenericClass() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = Dictionary()
        dict["points"] = LocationObject.classForCoder()
        return dict
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetRegionOptionsJSONObject)
@objcMembers
public class MapContextGetRegionOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextGetScaleOptionsJSONObject)
@objcMembers
public class MapContextGetScaleOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextAddGroundOverlayOptionsJSONObject)
@objcMembers
public class MapContextAddGroundOverlayOptionsJSONObject : NSObject {
    public var id: String!
    public var src: String!
    public var bounds: Bounds!
    public var visible: Bool = false
    public var zIndex: NSNumber?
    public var opacity: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextAddMarkersOptionsJSONObject)
@objcMembers
public class MapContextAddMarkersOptionsJSONObject : NSObject, DCUniModel {
    public var markers: [Marker]!
    public var clear: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
    public static func modelContainerPropertyGenericClass() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = Dictionary()
        dict["markers"] = Marker.classForCoder()
        return dict
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextMoveAlongOptionsJSONObject)
@objcMembers
public class MapContextMoveAlongOptionsJSONObject : NSObject, DCUniModel {
    public var markerId: NSNumber!
    public var path: [LocationObject]!
    public var duration: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
    public static func modelContainerPropertyGenericClass() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = Dictionary()
        dict["path"] = LocationObject.classForCoder()
        return dict
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextRemoveGroundOverlayOptionsJSONObject)
@objcMembers
public class MapContextRemoveGroundOverlayOptionsJSONObject : NSObject {
    public var id: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextRemoveMarkersOptionsJSONObject)
@objcMembers
public class MapContextRemoveMarkersOptionsJSONObject : NSObject {
    public var markerIds: [NSNumber]!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextUpdateGroundOverlayOptionsJSONObject)
@objcMembers
public class MapContextUpdateGroundOverlayOptionsJSONObject : NSObject {
    public var id: String!
    public var src: String!
    public var bounds: Bounds!
    public var visible: Bool = false
    public var zIndex: NSNumber?
    public var opacity: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniMapTencentTencentMapByJs)
@objcMembers
public class TencentMapByJs : TencentMap {
    public func startByJs() {
        return self.start()
    }
    public func destroyByJs() {
        return self.destroy()
    }
    public func setCenterByJs(_ latitude: NSNumber, _ longitude: NSNumber, _ animate: Bool = true) {
        return self.setCenter(latitude, longitude, animate)
    }
    public func setMinScaleByJs(_ zoom: NSNumber) {
        return self.setMinScale(zoom)
    }
    public func setMaxScaleByJs(_ zoom: NSNumber) {
        return self.setMaxScale(zoom)
    }
    public func setScaleByJs(_ zoom: NSNumber, _ animate: Bool = true) {
        return self.setScale(zoom, animate)
    }
    public func getScaleByJs() -> NSNumber {
        return self.getScale()
    }
    public func setThemeByJs(_ theme: String) {
        return self.setTheme(theme)
    }
    public func setLayerStyleByJs(_ id: String) {
        return self.setLayerStyle(id)
    }
    public func setMarkersByJs(_ markers: [MarkerJSONObject]) {
        return self.setMarkers(markers.map({
        (item) -> Marker in
        return Marker(UTSJSONObject([
            "id": item.id,
            "latitude": item.latitude,
            "longitude": item.longitude,
            "iconPath": item.iconPath,
            "title": item.title,
            "rotate": item.rotate,
            "alpha": item.alpha,
            "width": item.width,
            "height": item.height,
            "ariaLabel": item.ariaLabel,
            "anchor": item.anchor,
            "callout": item.callout,
            "label": item.label,
            "clusterId": item.clusterId,
            "customCallout": item.customCallout,
            "joinCluster": item.joinCluster
        ]))
        }))
    }
    public func setPolylineByJs(_ polylines: [PolylineJSONObject]) {
        return self.setPolyline(polylines.map({
        (item) -> Polyline in
        return Polyline(UTSJSONObject([
            "points": item.points,
            "color": item.color,
            "width": item.width,
            "dottedLine": item.dottedLine,
            "arrowLine": item.arrowLine,
            "arrowIconPath": item.arrowIconPath,
            "borderColor": item.borderColor,
            "borderWidth": item.borderWidth,
            "colorList": item.colorList
        ]))
        }))
    }
    public func setCircleByJs(_ circles: [CircleJSONObject]) {
        return self.setCircle(circles.map({
        (item) -> Circle in
        return Circle(UTSJSONObject([
            "latitude": item.latitude,
            "longitude": item.longitude,
            "radius": item.radius,
            "color": item.color,
            "fillColor": item.fillColor,
            "strokeWidth": item.strokeWidth
        ]))
        }))
    }
    public func setControlByJs(_ controls: [ControlJSONObject]) {
        return self.setControl(controls.map({
        (item) -> Control in
        return Control(UTSJSONObject([
            "position": item.position,
            "iconPath": item.iconPath,
            "id": item.id,
            "clickable": item.clickable
        ]))
        }))
    }
    public func setPolygonByJs(_ polygons: [PolygonJSONObject]) {
        return self.setPolygon(polygons.map({
        (item) -> Polygon in
        return Polygon(UTSJSONObject([
            "points": item.points,
            "strokeWidth": item.strokeWidth,
            "strokeColor": item.strokeColor,
            "fillColor": item.fillColor,
            "zIndex": item.zIndex
        ]))
        }))
    }
    public func setIncludePointsByJs(_ points: [LocationObjectJSONObject], _ animate: Bool = true) {
        return self.setIncludePoints(points.map({
        (item) -> LocationObject in
        return LocationObject(UTSJSONObject([
            "latitude": item.latitude,
            "longitude": item.longitude
        ]))
        }), animate)
    }
    public func enable3DByJs(_ enable: Bool) {
        return self.enable3D(enable)
    }
    public func showCompassByJs(_ enable: Bool) {
        return self.showCompass(enable)
    }
    public func enableZoomByJs(_ enable: Bool) {
        return self.enableZoom(enable)
    }
    public func enableScrollByJs(_ enable: Bool) {
        return self.enableScroll(enable)
    }
    public func enableRotateByJs(_ enable: Bool) {
        return self.enableRotate(enable)
    }
    public func setRotateByJs(_ rotate: NSNumber, _ animate: Bool = true) {
        return self.setRotate(rotate, animate)
    }
    public func setSkewByJs(_ skew: NSNumber, _ animate: Bool = true) {
        return self.setSkew(skew, animate)
    }
    public func setEnableOverlookingByJs(_ enable: Bool) {
        return self.setEnableOverlooking(enable)
    }
    public func setEnableSatelliteByJs(_ enable: Bool) {
        return self.setEnableSatellite(enable)
    }
    public func setEnableTrafficByJs(_ enable: Bool) {
        return self.setEnableTraffic(enable)
    }
    public func setEnablePoiByJs(_ enable: Bool) {
        return self.setEnablePoi(enable)
    }
    public func setEnableBuildingByJs(_ enable: Bool) {
        return self.setEnableBuilding(enable)
    }
    public func setShowLocationByJs(_ show: Bool) {
        return self.setShowLocation(show)
    }
    public func setEnableIndoorMapByJs(_ enable: Bool) {
        return self.setEnableIndoorMap(enable)
    }
    public func setOnMapLoadedCallbackByJs() {
        return self.setOnMapLoadedCallback()
    }
    public func setOnMapClickCallbackByJs() {
        return self.setOnMapClickCallback()
    }
    public func setOnMapRegionChangeByJs() {
        return self.setOnMapRegionChange()
    }
    public func setOnMapMarkerTapByJs() {
        return self.setOnMapMarkerTap()
    }
    public func setOnMapControlTapByJs() {
        return self.setOnMapControlTap()
    }
    public func setOnMapAnchorPointTapByJs() {
        return self.setOnMapAnchorPointTap()
    }
    public func setOnMapPoiTapByJs() {
        return self.setOnMapPoiTap()
    }
    public func setOnMapCalloutTapByJs() {
        return self.setOnMapCalloutTap()
    }
}
public func createMapContextByJs(_ mapId: String, _ component: ComponentPublicInstance?) -> Int {
    var ins = createMapContext(mapId, component)
    return ins != nil ? UTSBridge.registerJavaScriptClassInstance(MapContextByJsProxy(ins!)) : 0
}
@objc(UTSSDKModulesDCloudUniMapTencentMapContextByJsProxy)
@objcMembers
public class MapContextByJsProxy : NSObject {
    public var __instance: MapContext
    public init(_ ins: MapContext){
        __instance = ins
    }
    public func getCenterLocationByJs(_ options: MapContextGetCenterLocationOptionsJSONObject) -> Void {
        return __instance.getCenterLocation(MapContextGetCenterLocationOptions(UTSJSONObject([
            "success": {
            (result: LocationObject) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func moveToLocationByJs(_ options: MapContextMoveToLocationOptionsJSONObject) -> Void {
        return __instance.moveToLocation(MapContextMoveToLocationOptions(UTSJSONObject([
            "latitude": options.latitude,
            "longitude": options.longitude,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func translateMarkerByJs(_ options: MapContextTranslateMarkerOptionsJSONObject) -> Void {
        return __instance.translateMarker(MapContextTranslateMarkerOptions(UTSJSONObject([
            "markerId": options.markerId,
            "destination": options.destination,
            "autoRotate": options.autoRotate,
            "rotate": options.rotate,
            "moveWithRotate": options.moveWithRotate,
            "duration": options.duration,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func includePointsByJs(_ options: MapContextIncludePointsOptionsJSONObject) -> Void {
        return __instance.includePoints(MapContextIncludePointsOptions(UTSJSONObject([
            "points": options.points,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func getRegionByJs(_ options: MapContextGetRegionOptionsJSONObject) -> Void {
        return __instance.getRegion(MapContextGetRegionOptions(UTSJSONObject([
            "success": {
            (result: MapContextGetRegionResult) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func getScaleByJs(_ options: MapContextGetScaleOptionsJSONObject) -> Void {
        return __instance.getScale(MapContextGetScaleOptions(UTSJSONObject([
            "success": {
            (result: MapContextGetScaleResult) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func addGroundOverlayByJs(_ options: MapContextAddGroundOverlayOptionsJSONObject) -> Void {
        return __instance.addGroundOverlay(MapContextAddGroundOverlayOptions(UTSJSONObject([
            "id": options.id,
            "src": options.src,
            "bounds": options.bounds,
            "visible": options.visible,
            "zIndex": options.zIndex,
            "opacity": options.opacity,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func addMarkersByJs(_ options: MapContextAddMarkersOptionsJSONObject) -> Void {
        return __instance.addMarkers(MapContextAddMarkersOptions(UTSJSONObject([
            "markers": options.markers,
            "clear": options.clear,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func moveAlongByJs(_ options: MapContextMoveAlongOptionsJSONObject) -> Void {
        return __instance.moveAlong(MapContextMoveAlongOptions(UTSJSONObject([
            "markerId": options.markerId,
            "path": options.path,
            "duration": options.duration,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func removeGroundOverlayByJs(_ options: MapContextRemoveGroundOverlayOptionsJSONObject) -> Void {
        return __instance.removeGroundOverlay(MapContextRemoveGroundOverlayOptions(UTSJSONObject([
            "id": options.id,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func removeMarkersByJs(_ options: MapContextRemoveMarkersOptionsJSONObject) -> Void {
        return __instance.removeMarkers(MapContextRemoveMarkersOptions(UTSJSONObject([
            "markerIds": options.markerIds,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func updateGroundOverlayByJs(_ options: MapContextUpdateGroundOverlayOptionsJSONObject) -> Void {
        return __instance.updateGroundOverlay(MapContextUpdateGroundOverlayOptions(UTSJSONObject([
            "id": options.id,
            "src": options.src,
            "bounds": options.bounds,
            "visible": options.visible,
            "zIndex": options.zIndex,
            "opacity": options.opacity,
            "success": {
            (result: Any) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: MapContextFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniMapTencentIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniMapTencentIndexSwift : NSObject {
    public static func s_createMapContextByJs(_ mapId: String, _ component: ComponentPublicInstance?) -> Int {
        return createMapContextByJs(mapId, component)
    }
}
