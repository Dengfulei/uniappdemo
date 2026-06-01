import DCloudUTSFoundation
import DCloudUniappRuntime
@objc(UTSSDKModulesDCloudUniProgressUniProgressActiveendEventDetail)
@objcMembers
public class UniProgressActiveendEventDetail : NSObject, UTSObject {
    public var curPercent: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "curPercent":
                    self.curPercent = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.curPercent = obj["curPercent"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniProgressUniProgressActiveendEvent)
@objcMembers
public class UniProgressActiveendEvent : UniCustomEvent<UniProgressActiveendEventDetail> {
    public init(_ type: String, _ curPercent: NSNumber){
        super.init(type, UniProgressActiveendEventDetail(UTSJSONObject([
            "curPercent": curPercent
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniProgressUniProgressElement)
@objcMembers
public class UniProgressElement : UniViewElementImpl, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniProgressElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return [
                "duration",
                "percent",
                "show-info",
                "active",
                "active-mode",
                "border-radius",
                "font-size",
                "stroke-width",
                "background-color",
                "active-color",
                "color"
            ]
        }
    }
    private var progressBar: UniElement!
    private var progressBarValue: UniElement!
    private var progressInfo: UniTextElement!
    private var _showInfo = false
    private var _percent: NSNumber = 0
    private var _lastPercent: NSNumber = 0
    private var _timerId: NSNumber = 0
    public override func __initCustomElement() {
        self.style.setProperty("flexDirection", "row")
        self.style.setProperty("align-items", "center")
        var progressBar = self.uniPage.createElement("view")
        var progressBarStyle = progressBar.style
        progressBarStyle.setProperty("flexGrow", "1")
        progressBarStyle.setProperty("flexDirection", "row")
        progressBarStyle.setProperty("backgroundColor", self.backgroundColor)
        progressBarStyle.setProperty("borderRadius", self.borderRadiusToPixel)
        progressBarStyle.setProperty("height", self.strokeWidthToPixel)
        progressBarStyle.setProperty("overflow", "hidden")
        var progressBarValue = self.uniPage.createElement("view")
        var progressValueStyle = progressBarValue.style
        progressValueStyle.setProperty("backgroundColor", self.activeColor)
        progressBar.appendChild(progressBarValue)
        var progressInfo = self.uniPage.createElement("text") as! UniTextElement
        var progressInfoStyle = progressInfo.style
        progressInfoStyle.setProperty("fontSize", self.fontSizeToPixel)
        progressInfoStyle.setProperty("color", "#000000")
        progressInfoStyle.setProperty("marginLeft", "10px")
        progressInfoStyle.setProperty("textAlign", "right")
        self.progressBar = progressBar
        self.progressBarValue = progressBarValue
        self.progressInfo = progressInfo
        self.updateMinWidth()
    }
    public func connectedCallback() {
        self.appendChild(self.progressBar)
        if (self._showInfo) {
            self.appendChild(self.progressInfo)
        }
    }
    public func disconnectedCallback() {
        self.clearTimer()
        self.progressBar.remove()
        self.progressInfo.remove()
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        switch(name){
            case "percent":
                self._percent = newValue as! NSNumber
                self._animate()
            case "background-color":
                self.progressBar.style.setProperty("backgroundColor", self.backgroundColor)
            case "stroke-width":
                self.progressBar.style.setProperty("height", self.strokeWidthToPixel)
            case "border-radius":
                self.progressBar.style.setProperty("borderRadius", self.borderRadiusToPixel)
            case "active-color":
                fallthrough
            case "color":
                self.progressBarValue.style.setProperty("backgroundColor", self.activeColor)
            case "font-size":
                self.progressInfo.style.setProperty("fontSize", self.fontSizeToPixel)
                self.updateMinWidth()
            case "show-info":
                self.showInfo = (UTSiOS.typeof(newValue) == "string" || newValue == true) ? true : false
            default:
                break
        }
    }
    public var active: Bool {
        get {
            return self.getAttribute("active") == "true" ? true : false
        }
    }
    public var activeMode: String {
        get {
            return self.getAttributeValue("activeMode", "backwards")
        }
    }
    public var showInfo: Bool {
        get {
            return self._showInfo
        }
        set(value) {
            self._showInfo = value
            if (!self.isConnected) {
                return
            }
            if (value) {
                self.appendChild(self.progressInfo)
                self.progressInfo.setAttribute("value", self.percentToPixel)
            } else {
                self.progressInfo.remove()
            }
        }
    }
    public var duration: NSNumber {
        get {
            return parseFloat(self.getAttributeValue("duration", "30"))
        }
    }
    public var percent: NSNumber {
        get {
            return self._percent
        }
        set(value) {
            self._percent = value
            var percentString = value + "%"
            self.progressBarValue.style.setProperty("width", percentString)
            if (self.showInfo) {
                self.progressInfo.setAttribute("value", percentString)
            }
        }
    }
    public var percentToPixel: String {
        get {
            return (self.percent + "%")
        }
    }
    public var fontSize: NSNumber {
        get {
            return parseFloat(self.getAttributeValue("fontSize", "12"))
        }
    }
    public var fontSizeToPixel: String {
        get {
            return self.fontSize + "px"
        }
    }
    public var borderRadius: NSNumber {
        get {
            return parseFloat(self.getAttributeValue("borderRadius", "0"))
        }
    }
    public var borderRadiusToPixel: String {
        get {
            return self.borderRadius + "px"
        }
    }
    public var strokeWidth: NSNumber {
        get {
            return parseFloat(self.getAttributeValue("strokeWidth", "3"))
        }
    }
    public var strokeWidthToPixel: String {
        get {
            return self.strokeWidth + "px"
        }
    }
    public var backgroundColor: String {
        get {
            return self.getAttributeValue("backgroundColor", "#ebebeb")
        }
    }
    public var activeColor: String {
        get {
            return self.getAttributeValue("activeColor", self.color)
        }
    }
    public var color: String {
        get {
            return self.getAttributeValue("color", "#007aff")
        }
    }
    public var finalPercent: NSNumber {
        get {
            var percent = self.percent
            if (percent > 100) {
                percent = 100
            }
            if (percent < 0) {
                percent = 0
            }
            return percent
        }
    }
    private func _animate() {
        var finalPercent = self.finalPercent
        if (!self.active) {
            self.percent = finalPercent
            return
        }
        self.clearTimer()
        self.percent = self.activeMode == "forwards" ? self._lastPercent : 0
        self._timerId = setInterval({
        () -> Void in
        if (finalPercent <= self.percent + 1) {
            self.clearTimer()
            self.percent = finalPercent
            self.dispatchEvent(UniProgressActiveendEvent("activeend", self.percent))
            self._lastPercent = finalPercent
        } else {
            ++self.percent
        }
        }, self.duration)
    }
    private func clearTimer() {
        clearInterval(self._timerId)
    }
    private func getAttributeValue(_ key: String, _ defaultValue: String) -> String {
        var value = self.getAttribute(key)
        if (value != nil && value!.length > 0) {
            return value!
        }
        return defaultValue
    }
    private func updateMinWidth() {
        self.progressInfo.style.setProperty("minWidth", self.fontSize * 2.5 + "px")
    }
}
@objc(UniProgressElementRegister)
@objcMembers
public class UniProgressElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "progress", nodeClazz: UniProgressElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "progress")
    }
}
@objc(UTSSDKModulesDCloudUniProgressUniProgressActiveendEventByJs)
@objcMembers
public class UniProgressActiveendEventByJs : UniProgressActiveendEvent {
}
@objc(UTSSDKModulesDCloudUniProgressUniProgressElementByJs)
@objcMembers
public class UniProgressElementByJs : UniProgressElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func connectedCallbackByJs() {
        return self.connectedCallback()
    }
    public func disconnectedCallbackByJs() {
        return self.disconnectedCallback()
    }
    public func attributeChangedCallbackByJs(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        return self.attributeChangedCallback(name, oldValue, newValue)
    }
}
