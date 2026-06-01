import DCloudUTSFoundation
import DCloudUniappRuntime
import DCloudUTSExtAPI
public typealias ChooseLocationErrorCode = NSNumber
public protocol ChooseLocationSuccess {
    var errMsg: String { get set }
    var name: String { get set }
    var address: String { get set }
    var latitude: NSNumber { get set }
    var longitude: NSNumber { get set }
}
public typealias ChooseLocationSuccessCallback = (_ result: ChooseLocationSuccess) -> Void
public protocol ChooseLocationFail : IUniError {
    var errCode: ChooseLocationErrorCode { get set }
}
public typealias ChooseLocationFailCallback = (_ result: ChooseLocationFail) -> Void
public typealias ChooseLocationComplete = Any
public typealias ChooseLocationCompleteCallback = (_ result: ChooseLocationComplete) -> Void
@objc(UTSSDKModulesDCloudUniChooseLocationChooseLocationOptions)
@objcMembers
public class ChooseLocationOptions : NSObject, UTSObject {
    public var latitude: NSNumber?
    public var longitude: NSNumber?
    public var keyword: String?
    public var payload: UTSJSONObject?
    public var success: ChooseLocationSuccessCallback?
    public var fail: ChooseLocationFailCallback?
    public var complete: ChooseLocationCompleteCallback?
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
                case "keyword":
                    self.keyword = try! utsSubscriptCheckValueIfPresent(newValue)
                case "payload":
                    self.payload = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.keyword = obj["keyword"] as! String?
        self.payload = obj["payload"] as! UTSJSONObject?
        self.success = obj["success"] as! ChooseLocationSuccessCallback?
        self.fail = obj["fail"] as! ChooseLocationFailCallback?
        self.complete = obj["complete"] as! ChooseLocationCompleteCallback?
    }
}
public typealias ChooseLocation = (_ options: ChooseLocationOptions) -> Void
@objc(UTSSDKModulesDCloudUniChooseLocationChooseLocationSuccessImpl)
@objcMembers
public class ChooseLocationSuccessImpl : NSObject, ChooseLocationSuccess {
    public var errMsg: String
    public var name: String
    public var address: String
    public var latitude: NSNumber
    public var longitude: NSNumber
    public init(_ name: String, _ address: String, _ latitude: NSNumber, _ longitude: NSNumber, _ errMsg: String = "chooseLocation:ok"){
        self.errMsg = errMsg
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
}
@objc(UTSSDKModulesDCloudUniChooseLocationChooseLocationFailImpl)
@objcMembers
public class ChooseLocationFailImpl : UniError, ChooseLocationFail {
    public override var errCode: ChooseLocationErrorCode {
        get {
            return self.__errCode
        }
        set(value) {
            self.__errCode = value
        }
    }
    public init(_ errMsg: String = "chooseLocation:fail cancel", _ errCode: ChooseLocationErrorCode = 1){
        super.init()
        self.errCode = errCode
        self.errMsg = errMsg
    }
    private var __errCode: ChooseLocationErrorCode!
}
public var chooseLocation: ChooseLocation = {
(_ options: ChooseLocationOptions) -> Void in
var uuid = """
\(Date.now())\(Math.floor(Math.random() * 1e7))
"""
var baseEventName = """
uni_choose_location_\(uuid)
"""
var readyEventName = """
\(baseEventName)_ready
"""
var optionsEventName = """
\(baseEventName)_options
"""
var successEventName = """
\(baseEventName)_success
"""
var failEventName = """
\(baseEventName)_fail
"""
DCloudUTSExtAPI.__$$on(readyEventName, {
(_ spread_: Any...) -> Void in
var _ = Array(spread_)
DCloudUTSExtAPI.__$$emit(optionsEventName, JSON.parse(JSON.stringify(options)!))
})
DCloudUTSExtAPI.__$$on(successEventName, {
(_ spreadRes: Any...) -> Void in
var res = Array(spreadRes)
var resObj = res[0] as! UTSJSONObject
var name = resObj["name"] as! String
var address = resObj["address"] as! String
var latitude = resObj["latitude"] as! NSNumber
var longitude = resObj["longitude"] as! NSNumber
var result = ChooseLocationSuccessImpl(name, address, latitude, longitude)
options.success?(result)
options.complete?(result)
})
DCloudUTSExtAPI.__$$on(failEventName, {
(_ spread_: Any...) -> Void in
var _ = Array(spread_)
options.fail?(ChooseLocationFailImpl())
options.complete?(ChooseLocationFailImpl())
})
DCloudUTSExtAPI.openDialogPage(OpenDialogPageOptions(UTSJSONObject([
    "url": """
uni:chooseLocation?readyEventName=\(readyEventName)&optionsEventName=\(optionsEventName)&successEventName=\(successEventName)&failEventName=\(failEventName)
""",
    "triggerParentHide": true,
    "fail": {
    (_ err: OpenDialogPageFail) -> Void in
    options.fail?(ChooseLocationFailImpl("""
chooseLocation:fail \(err.errMsg)
""", 4))
    options.complete?(ChooseLocationFailImpl("""
chooseLocation:fail \(err.errMsg)
""", 4))
    DCloudUTSExtAPI.__$$off(readyEventName, nil)
    DCloudUTSExtAPI.__$$off(successEventName, nil)
    DCloudUTSExtAPI.__$$off(failEventName, nil)
    }
])))
}
@objc(UTSSDKModulesDCloudUniChooseLocationChooseLocationOptionsJSONObject)
@objcMembers
public class ChooseLocationOptionsJSONObject : NSObject {
    public var latitude: NSNumber?
    public var longitude: NSNumber?
    public var keyword: String?
    public var payload: UTSJSONObject?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func chooseLocationByJs(_ options: ChooseLocationOptionsJSONObject) -> Void {
    return chooseLocation(ChooseLocationOptions(UTSJSONObject([
        "latitude": options.latitude,
        "longitude": options.longitude,
        "keyword": options.keyword,
        "payload": options.payload,
        "success": {
        (result: ChooseLocationSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: ChooseLocationFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: ChooseLocationComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniChooseLocationIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniChooseLocationIndexSwift : NSObject {
    public static func s_chooseLocationByJs(_ options: ChooseLocationOptionsJSONObject) -> Void {
        return chooseLocationByJs(options)
    }
}
