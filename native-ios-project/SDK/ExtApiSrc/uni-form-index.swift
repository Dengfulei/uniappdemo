import DCloudUTSFoundation
import DCloudUniappRuntime
@objc(UTSSDKModulesDCloudUniFormUniCheckboxElement)
@objcMembers
public class UniCheckboxElement : UniFormControlElement<String>, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniCheckboxElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return [
                "name",
                "checked",
                "value",
                "background-color",
                "active-background-color",
                "border-color",
                "active-border-color",
                "fore-color",
                "color",
                "icon-color"
            ]
        }
    }
    private var checkboxView: UniElement!
    private var checkboxText: UniTextElement!
    private var _initialChecked = false
    private var _initialCheckedFlag = false
    private var _checked = false
    public override func __initCustomElement() {
        self.customElementJSExport = UniCheckboxElementJSExportImpl(self)
        self.style.setProperty("flexDirection", "row")
        self.style.setProperty("alignItems", "center")
        var checkboxView = self.uniPage.createElement("view")
        var checkboxViewStyle = checkboxView.style
        checkboxViewStyle.setProperty("alignItems", "center")
        checkboxViewStyle.setProperty("justifyContent", "center")
        checkboxViewStyle.setProperty("borderStyle", "solid")
        checkboxViewStyle.setProperty("borderWidth", "1px")
        checkboxViewStyle.setProperty("borderRadius", "3px")
        checkboxViewStyle.setProperty("width", "22px")
        checkboxViewStyle.setProperty("height", "22px")
        checkboxViewStyle.setProperty("marginRight", "5px")
        var checkboxText = self.uniPage.createElement("text") as! UniTextElement
        checkboxText.setAttribute("value", "\u{EA08}")
        var checkboxTextStyle = checkboxText.style
        checkboxTextStyle.setProperty("fontFamily", "uni-icon")
        checkboxTextStyle.setProperty("fontSize", "16px")
        checkboxTextStyle.setProperty("color", self.foreColor)
        self.checkboxView = checkboxView
        self.checkboxText = checkboxText
        self.addEventListener("click", { [weak self]
        (e: UniPointerEvent) -> Void in
        guard let self = self else { return }
        e.stopPropagation()
        if (self.disabled) {
            return
        }
        self.checked = !self.checked
        self.dispatchGroup()
        })
        self.updateCheckedStyle(false)
    }
    public override var name: String {
        get {
            return self.getAttributeValue("name", "")
        }
        set(value) {
            self.setAttribute("name", value)
        }
    }
    public override var value: String {
        get {
            return self.getAttributeValue("value", "")
        }
        set(value) {
            self.setAttribute("value", value)
        }
    }
    public override func reset() {
        self.checked = self._initialChecked
    }
    public func connectedCallback() {
        if (self.children.length == 0) {
            self.appendChild(self.checkboxView)
        } else {
            self.insertBefore(self.checkboxView, self.firstChild)
        }
    }
    public func disconnectedCallback() {
        self.removeChild(self.checkboxView)
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        switch(name){
            case "checked":
                var value = (UTSiOS.typeof(newValue) == "string" || newValue == true) ? true : false
                if (!self._initialCheckedFlag) {
                    self._initialCheckedFlag = true
                    self._initialChecked = value
                }
                self.checked = value
            case "fore-color":
                fallthrough
            case "icon-color":
                fallthrough
            case "color":
                self.checkboxText.style.setProperty("color", self.foreColor)
            case "background-color":
                fallthrough
            case "active-background-color":
                fallthrough
            case "border-color":
                fallthrough
            case "active-border-color":
                self.updateCheckedStyle(self.checked)
            default:
                break
        }
    }
    public var checked: Bool {
        get {
            return self._checked
        }
        set(value) {
            if (value == self._checked) {
                return
            }
            self._checked = value
            self.updateCheckedStyle(value)
            self.updateCheckedStatus(value)
        }
    }
    public var disabled: Bool {
        get {
            return self.getAttribute("disabled") == "true" ? true : false
        }
    }
    public var foreColor: String {
        get {
            return self.getAttributeValue("foreColor", self.iconColor)
        }
    }
    public var backgroundColor: String {
        get {
            return self.getAttributeValue("backgroundColor", "#ffffff")
        }
    }
    public var activeBackgroundColor: String {
        get {
            return self.getAttributeValue("activeBackgroundColor", "#ffffff")
        }
    }
    public var borderColor: String {
        get {
            return self.getAttributeValue("borderColor", "#d1d1d1")
        }
    }
    public var activeBorderColor: String {
        get {
            return self.getAttributeValue("activeBorderColor", "#d1d1d1")
        }
    }
    public var iconColor: String {
        get {
            return self.getAttributeValue("iconColor", self.color)
        }
    }
    public var color: String {
        get {
            return self.getAttributeValue("color", "#007aff")
        }
    }
    private func getAttributeValue(_ key: String, _ defaultValue: String) -> String {
        var value = self.getAttribute(key)
        if (value != nil && value!.length > 0) {
            return value!
        }
        return defaultValue
    }
    private func updateCheckedStyle(_ checked: Bool) {
        var backgroundColor = checked ? self.activeBackgroundColor : self.backgroundColor
        var borderColor = checked ? self.activeBorderColor : self.borderColor
        self.checkboxView.style.setProperty("backgroundColor", backgroundColor)
        self.checkboxView.style.setProperty("borderColor", borderColor)
    }
    private func updateCheckedStatus(_ checked: Bool) {
        if (checked) {
            self.checkboxView.appendChild(self.checkboxText)
        } else {
            self.checkboxView.removeChild(self.checkboxText)
        }
    }
    private func dispatchGroup() {
        var group = self.parentElement
        var maxRecursiveDeep: NSNumber = 32
        while(group != nil && maxRecursiveDeep > 0){
            maxRecursiveDeep--
            if (UTSiOS.instanceof(group, UniCheckboxGroupElement.self)) {
                break
            }
            group = group!.parentElement
        }
        if (group != nil) {
            (group as! UniCheckboxGroupElement)._checkboxChange()
        }
    }
}
@objc(UTSSDKModulesDCloudUniFormUniCheckboxGroupChangeEventDetail)
@objcMembers
public class UniCheckboxGroupChangeEventDetail : NSObject, UTSObject {
    public var value: Array<String>!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "value":
                    self.value = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.value = obj["value"] as! Array<String>
    }
}
@objc(UTSSDKModulesDCloudUniFormUniCheckboxGroupChangeEvent)
@objcMembers
public class UniCheckboxGroupChangeEvent : UniCustomEvent<UniCheckboxGroupChangeEventDetail> {
    public init(_ value: Array<String>){
        super.init("change", UniCheckboxGroupChangeEventDetail(UTSJSONObject([
            "value": value
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniFormUniCheckboxGroupElement)
@objcMembers
public class UniCheckboxGroupElement : UniFormControlElement<Array<String>>, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniCheckboxGroupElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return []
        }
    }
    public override func __initCustomElement() {
        self.customElementJSExport = UniCheckboxGroupElementJSExportImpl(self)
    }
    public override var name: String {
        get {
            return self.getAttributeValue("name", "")
        }
        set(value) {
            self.setAttribute("name", value)
        }
    }
    public override var value: Array<String> {
        get {
            return self.getCheckboxValues()
        }
        set(value) {
            self.setCheckboxValues(value)
        }
    }
    public override func reset() {
        self.findChildren(self).forEach({
        (item: UniCheckboxElement) -> Void in
        item.reset()
        })
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {}
    private func getAttributeValue(_ key: String, _ defaultValue: String) -> String {
        var value = self.getAttribute(key)
        if (value != nil && value!.length > 0) {
            return value!
        }
        return defaultValue
    }
    public func _checkboxChange() {
        self.dispatchEvent(UniCheckboxGroupChangeEvent(self.getCheckboxValues()))
    }
    private func getCheckboxValues() -> Array<String> {
        var values: Array<String> = []
        self.findChildren(self).forEach({
        (item: UniCheckboxElement) -> Void in
        if (item.checked) {
            values.push(item.value)
        }
        })
        return values
    }
    private func setCheckboxValues(_ values: Array<String>) {
        self.findChildren(self).forEach({
        (item: UniCheckboxElement) -> Void in
        if (values.includes(item.value)) {
            item.checked = true
        }
        })
    }
    private func findChildren(_ el: UniElement) -> [UniCheckboxElement] {
        var controls: [UniCheckboxElement] = []
        el.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniCheckboxElement.self)) {
            controls.push(item as! UniCheckboxElement)
        } else {
            self.findChildren(item).forEach({
            (item: UniCheckboxElement) -> Void in
            controls.push(item as! UniCheckboxElement)
            })
        }
        })
        return controls
    }
}
@objc(UTSSDKModulesDCloudUniFormUniFormSubmitEventDetail)
@objcMembers
public class UniFormSubmitEventDetail : NSObject, UTSObject {
    public var value: UTSJSONObject!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "value":
                    self.value = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.value = obj["value"] as! UTSJSONObject
    }
}
@objc(UTSSDKModulesDCloudUniFormUniFormResetEventDetail)
@objcMembers
public class UniFormResetEventDetail : NSObject, UTSObject {
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
@objc(UTSSDKModulesDCloudUniFormUniFormSubmitEvent)
@objcMembers
public class UniFormSubmitEvent : UniCustomEvent<UniFormSubmitEventDetail> {
    public init(_ value: UTSJSONObject){
        super.init("submit", UniFormSubmitEventDetail(UTSJSONObject([
            "value": value
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniFormUniFormResetEvent)
@objcMembers
public class UniFormResetEvent : UniCustomEvent<UniFormResetEventDetail> {
    public init(){
        super.init("reset", UniFormResetEventDetail(UTSJSONObject([:])))
    }
}
@objc(UTSSDKModulesDCloudUniFormUniFormElement)
@objcMembers
public class UniFormElement : UniViewElementImpl, UniCustomElement, IUniForm {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniFormElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return [
                "disabled"
            ]
        }
    }
    public override func __initCustomElement() {}
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {}
    public var disabled: Bool {
        get {
            return self.getAttribute("disabled") == "true" ? true : false
        }
    }
    public func submit() {
        if (self.disabled) {
            return
        }
        var formData: UTSJSONObject = UTSJSONObject([:])
        self.findFormControls(self).forEach({
        (control: any UniFormControl) -> Void in
        formData[control.name] = control.value
        })
        self.dispatchEvent(UniFormSubmitEvent(formData))
    }
    public func reset() {
        if (self.disabled) {
            return
        }
        self.findFormControls(self).forEach({
        (control: any UniFormControl) -> Void in
        control.reset()
        })
        self.dispatchEvent(UniFormResetEvent())
    }
    private func findFormControls(_ el: UniElement) -> [any UniFormControl] {
        var controls: [any UniFormControl] = []
        el.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniFormControlElement<Any>.self)) {
            var control = item as! any UniFormControl
            if (control.name.length > 0) {
                controls.push(control)
            }
        } else {
            self.findFormControls(item).forEach({
            (item: any UniFormControl) -> Void in
            controls.push(item)
            })
        }
        })
        return controls
    }
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewChangeEventDetail)
@objcMembers
public class UniPickerViewChangeEventDetail : NSObject, UTSObject {
    public var value: [NSNumber]!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "value":
                    self.value = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.value = obj["value"] as! [NSNumber]
    }
}
public func camelize(_ str: String) -> String {
    var parts = str.split("-")
    if (parts.length == 1) {
        return str
    }
    var result = parts[0]
    do {
        var i: NSNumber = 1
        while(i < parts.length){
            var part = parts[i]
            if (part.length > 0) {
                result += part.charAt(0).toUpperCase() + part.slice(1)
            }
            i++
        }
    }
    return result
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewChangeEvent)
@objcMembers
public class UniPickerViewChangeEvent : UniCustomEvent<UniPickerViewChangeEventDetail> {
    public init(_ value: [NSNumber]){
        super.init("change", UniPickerViewChangeEventDetail(UTSJSONObject([
            "value": value
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewElement)
@objcMembers
public class UniPickerViewElement : UniFormControlElement<[NSNumber]>, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniPickerViewElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return [
                "value",
                "indicator-style",
                "indicatorStyle",
                "mask-class",
                "mask-top-style",
                "mask-bottom-style"
            ]
        }
    }
    private var _value = Array<NSNumber>()
    private var _uniResizeObserver: UniResizeObserver!
    public override func __initCustomElement() {
        self.customElementJSExport = UniPickerViewElementJSExportImpl(self)
        self.style.setProperty("flexDirection", "row")
        self._uniResizeObserver = UniResizeObserver({ [weak self]
        (_: Array<UniResizeObserverEntry>) -> Void in
        guard let self = self else { return }
        self._onResize()
        })
    }
    public override var name: String {
        get {
            return self.getAttribute("name") ?? ""
        }
        set(value) {
            self.setAttribute("name", value)
        }
    }
    public override var value: [NSNumber] {
        get {
            var returnValue = Array<NSNumber>()
            self.findChildren(self).forEach({
            (item: UniPickerViewColumnElement) -> Void in
            returnValue.push(item.value)
            })
            return returnValue
        }
        set(value) {
            if (self._value.length == value.length) {
                var isSame = true
                do {
                    var i: NSNumber = 0
                    while(i < value.length){
                        if (self._value[i] !== value[i]) {
                            isSame = false
                            break
                        }
                        i++
                    }
                }
                if (isSame) {
                    return
                }
            }
            var controls: [UniPickerViewColumnElement] = self.findChildren(self)
            var minIndex = Math.min(controls.length as! NSNumber, value.length as! NSNumber)
            do {
                var i: NSNumber = 0
                while(i < minIndex){
                    var changed = controls[i].value != value[i]
                    controls[i].setAnyAttribute("value", value[i])
                    if (changed) {
                        self._columnChange()
                    }
                    i++
                }
            }
            self._value = value
        }
    }
    public override func reset() {
        self.findChildren(self).forEach({
        (item: UniPickerViewColumnElement) -> Void in
        item.reset()
        })
    }
    public func connectedCallback() {
        self._uniResizeObserver!.observe(self)
    }
    public func disconnectedCallback() {
        self._uniResizeObserver.disconnect()
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        if (newValue == nil) {
            return
        }
        switch(name){
            case "value":
                self.value = newValue as! Array<NSNumber>
            case "indicator-style":
                fallthrough
            case "indicatorStyle":
                self._setIndicatorStyle(newValue)
            case "mask-top-style":
                self._setMaskTopStyle(newValue)
            case "mask-bottom-style":
                self._setMaskBottomStyle(newValue)
            default:
                break
        }
    }
    public override func insertBefore(_ child: UniElement, _ anchor: UniElement?) -> UniElement? {
        if (self._value.length > self.children.length) {
            if (UTSiOS.instanceof(child, UniPickerViewColumnElement.self)) {
                (child as! UniPickerViewColumnElement).setAnyAttribute("value", self._value[self.children.length])
            }
        }
        return super.insertBefore(child, anchor)
    }
    public func _columnChange() {
        self.dispatchEvent(UniPickerViewChangeEvent(self.value))
    }
    private func _onResize() {
        self.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniPickerViewColumnElement.self)) {
            (item as! UniPickerViewColumnElement).resize()
        }
        })
    }
    private func _setIndicatorStyle(_ value: Any) {
        var styleMap = self._fixStyleToMap(value)
        self.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniPickerViewColumnElement.self)) {
            (item as! UniPickerViewColumnElement).setIndicatorStyle(styleMap)
        }
        })
        styleMap.clear()
    }
    private func _setMaskTopStyle(_ value: Any) {
        var styleMap = self._fixStyleToMap(value)
        self.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniPickerViewColumnElement.self)) {
            (item as! UniPickerViewColumnElement).setMaskTopStyle(styleMap)
        }
        })
        styleMap.clear()
    }
    private func _setMaskBottomStyle(_ value: Any) {
        var styleMap = self._fixStyleToMap(value)
        self.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniPickerViewColumnElement.self)) {
            (item as! UniPickerViewColumnElement).setMaskBottomStyle(styleMap)
        }
        })
        styleMap.clear()
    }
    private func _fixStyleToMap(_ value: Any) -> Map<String, String> {
        if (UTSiOS.instanceof(value, Map<String, String>.self)) {
            return value as! Map<String, String>
        }
        if (UTSiOS.typeof(value) == "string") {
            var styleMap = Map<String, String>()
            if ((value as! String).length == 0) {
                return styleMap
            }
            var styles = (value as! String).split(";")
            do {
                var i: NSNumber = 0
                while(i < styles.length){
                    var pair = styles[i].split(":")
                    if (pair.length == 2) {
                        styleMap.set(pair[0].trim(), pair[1].trim())
                    }
                    i++
                }
            }
            return styleMap
        }
        return Map<String, String>()
    }
    private func findChildren(_ el: UniElement) -> [UniPickerViewColumnElement] {
        var controls: [UniPickerViewColumnElement] = []
        el.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniPickerViewColumnElement.self)) {
            controls.push(item as! UniPickerViewColumnElement)
        } else {
            self.findChildren(item).forEach({
            (item: UniPickerViewColumnElement) -> Void in
            controls.push(item)
            })
        }
        })
        return controls
    }
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewColumnElement)
@objcMembers
public class UniPickerViewColumnElement : UniFormControlElement<NSNumber>, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniPickerViewColumnElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return [
                "value"
            ]
        }
    }
    private var status: NSNumber = 0
    private var scrollView: UniElement!
    private var contentView: UniElement!
    private var indicatorView: UniElement!
    private var maskViewTop: UniElement!
    private var maskViewBottom: UniElement!
    private var _indicatorHeight: NSNumber = 50
    private var _selectedIndex: NSNumber = 0
    private var _initialValue: NSNumber = 0
    private var _initialValueFlag = false
    private var _skipScrollChangeEventOnce = false
    private var _isAdjusting = false
    private var _lastMaskTopStyle = Map<String, String>()
    private var _lastMaskBottomStyle = Map<String, String>()
    private var _lastIndicatorStyle = Map<String, String>()
    private var basicMaskTopStyle = Map<String, String>([
        [
            "pointerEvents",
            "none"
        ],
        [
            "position",
            "absolute"
        ],
        [
            "height",
            "40%"
        ],
        [
            "left",
            "0px"
        ],
        [
            "top",
            "0px"
        ],
        [
            "right",
            "0px"
        ],
        [
            "backgroundImage",
            "linear-gradient(to bottom, rgba(255, 255, 255, 0.95), rgba(255, 255, 255, 0.6))"
        ]
    ])
    private var basicMaskBottomStyle = Map<String, String>([
        [
            "pointerEvents",
            "none"
        ],
        [
            "position",
            "absolute"
        ],
        [
            "height",
            "40%"
        ],
        [
            "left",
            "0px"
        ],
        [
            "right",
            "0px"
        ],
        [
            "bottom",
            "0px"
        ],
        [
            "backgroundImage",
            "linear-gradient(to top, rgba(255, 255, 255, 0.95), rgba(255, 255, 255, 0.6))"
        ]
    ])
    private var basicIndicatorStyle = Map<String, String>([
        [
            "pointerEvents",
            "none"
        ],
        [
            "boxSizing",
            "content-box"
        ],
        [
            "height",
            "50px"
        ],
        [
            "left",
            "0px"
        ],
        [
            "right",
            "0px"
        ],
        [
            "top",
            "0px"
        ],
        [
            "bottom",
            "0px"
        ],
        [
            "marginTop",
            "auto"
        ],
        [
            "marginBottom",
            "auto"
        ],
        [
            "border",
            "1px solid #e5e5e5"
        ],
        [
            "borderStyle",
            "solid"
        ],
        [
            "borderLeftWidth",
            "0px"
        ],
        [
            "borderTopWidth",
            "1px"
        ],
        [
            "borderRightWidth",
            "0px"
        ],
        [
            "borderBottomWidth",
            "1px"
        ],
        [
            "borderColor",
            "#e5e5e5"
        ]
    ])
    public override func __initCustomElement() {
        self.customElementJSExport = UniPickerViewColumnElementJSExportImpl(self)
        self.style.setProperty("flexGrow", "1")
        self.style.setProperty("position", "relative")
        var scrollView = self.uniPage.createElement("scroll-view")
        scrollView.setAnyAttribute("showScrollbar", false)
        var scrollStyle = scrollView.style
        scrollStyle.setProperty("flexDirection", "column")
        scrollStyle.setProperty("position", "absolute")
        scrollStyle.setProperty("top", "0px")
        scrollStyle.setProperty("left", "0px")
        scrollStyle.setProperty("right", "0px")
        scrollStyle.setProperty("bottom", "0px")
        var contentView = self.uniPage.createElement("view")
        scrollView.appendChild(contentView)
        var indicatorView = self.uniPage.createElement("view")
        var indicatorStyle = indicatorView.style
        self.basicIndicatorStyle.forEach({
        (value, key) -> Void in
        indicatorStyle.setProperty(key, value)
        })
        var maskViewTop = self.uniPage.createElement("view")
        var maskViewTopStyle = maskViewTop.style
        self.basicMaskTopStyle.forEach({
        (value, key) -> Void in
        maskViewTopStyle.setProperty(key, value)
        })
        var maskViewBottom = self.uniPage.createElement("view")
        var maskViewBottomStyle = maskViewBottom.style
        self.basicMaskBottomStyle.forEach({
        (value, key) -> Void in
        maskViewBottomStyle.setProperty(key, value)
        })
        self.scrollView = scrollView
        self.contentView = contentView
        self.maskViewTop = maskViewTop
        self.indicatorView = indicatorView
        self.maskViewBottom = maskViewBottom
        (scrollView as! UniElementImpl).addEventListener("scrollend", { [weak self]
        (e: UniScrollEvent) -> Void in
        guard let self = self else { return }
        if (self._indicatorHeight == 0) {
            return
        }
        self._scrollTopSnap(e.detail.scrollTop as! NSNumber)
        })
        self.addEventListener("touchstart", { [weak self]
        (_: UniTouchEvent) -> Void in
        guard let self = self else { return }
        self._skipScrollChangeEventOnce = false
        })
        self.addEventListener("click", { [weak self]
        (e: UniPointerEvent) -> Void in
        guard let self = self else { return }
        var offsetY = self.getBoundingClientRect().top
        var offsetTop = e.clientY - offsetY - maskViewTop.offsetHeight
        var targetIndex = parseInt((scrollView.scrollTop + offsetTop) / self._indicatorHeight + "")
        self._setIndex(targetIndex)
        self._scrollTopIndex(self._selectedIndex)
        })
    }
    public override var value: NSNumber {
        get {
            return self._selectedIndex
        }
        set(value) {
            self._setIndex(value)
            self._skipScrollChangeEventOnce = true
            if (self.isConnected) {
                self._scrollTopIndex(value)
            }
        }
    }
    public override func reset() {
        self.value = self._initialValue
    }
    public func connectedCallback() {
        self.initialize()
        self.getBoundingClientRectAsync()?.then({
        (_: DOMRect) -> Void in
        self._onLayout()
        self.scrollView.setAnyAttribute("scroll-with-animation", true)
        })
    }
    public func disconnectedCallback() {
        super.removeChild(self.maskViewTop)
        super.removeChild(self.indicatorView)
        super.removeChild(self.maskViewBottom)
        super.removeChild(self.scrollView)
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        switch(name){
            case "value":
                var selectedIndex = newValue as! NSNumber
                if (!self._initialValueFlag) {
                    self._initialValueFlag = true
                    self._initialValue = selectedIndex
                }
                self.value = selectedIndex
            default:
                break
        }
    }
    public override func appendChild(_ child: UniElement) -> Void {
        self.initialize()
        if (self.status === 2) {
            return self.contentView.appendChild(child)
        } else {
            return super.appendChild(child)
        }
    }
    public override func insertBefore(_ child: UniElement, _ anchor: UniElement?) -> UniElement? {
        self.initialize()
        if (self.status === 2) {
            return self.contentView.insertBefore(child, anchor)
        } else {
            return super.insertBefore(child, anchor)
        }
    }
    public override func removeChild(_ child: UniElement) -> UniElement? {
        return self.contentView.removeChild(child)
    }
    public func initialize() {
        if (self.status !== 0) {
            return
        }
        self.status = 1
        self.appendChild(self.indicatorView)
        self.appendChild(self.scrollView)
        self.appendChild(self.maskViewTop)
        self.appendChild(self.maskViewBottom)
        self.status = 2
    }
    public var disabled: Bool {
        get {
            return self.getAttribute("disabled") == "true" ? true : false
        }
    }
    public func resize() {
        self._onLayout()
    }
    private func diffStyle(_ styles: Map<String, String>, _ lastStyles: Map<String, String>, _ basicStyles: Map<String, String>) -> Map<String, String> {
        var diffedStyles = Map<String, String>()
        if (lastStyles.size > 0) {
            lastStyles.forEach({
            (value, key) -> Void in
            if (!styles.has(key)) {
                if (basicStyles.has(key)) {
                    diffedStyles.set(key, basicStyles.get(key) as! String)
                } else if (basicStyles.has(camelize(key))) {
                    diffedStyles.set(key, basicStyles.get(camelize(key)) as! String)
                } else {
                    diffedStyles.set(key, "")
                }
            }
            })
        }
        styles.forEach({
        (value, key) -> Void in
        diffedStyles.set(key, value)
        })
        return diffedStyles
    }
    public func setIndicatorStyle(_ styles: Map<String, String>) -> Void {
        var diffedStyles = self.diffStyle(styles, self._lastIndicatorStyle, self.basicIndicatorStyle)
        self._lastIndicatorStyle.clear()
        diffedStyles.forEach({
        (value, key) -> Void in
        self.indicatorView.style.setProperty(key, value)
        if (value != "") {
            self._lastIndicatorStyle.set(key, value)
        }
        })
        self.getBoundingClientRectAsync()?.then({
        (_: DOMRect) -> Void in
        self._onLayout()
        })
    }
    public func setMaskTopStyle(_ styles: Map<String, String>) -> Void {
        var diffedStyles = self.diffStyle(styles, self._lastMaskTopStyle, self.basicMaskTopStyle)
        self._lastMaskTopStyle.clear()
        diffedStyles.forEach({
        (value, key) -> Void in
        self.maskViewTop.style.setProperty(key, value)
        if (value != "") {
            self._lastMaskTopStyle.set(key, value)
        }
        })
        self._onLayout()
    }
    public func setMaskBottomStyle(_ styles: Map<String, String>) -> Void {
        var diffedStyles = self.diffStyle(styles, self._lastMaskBottomStyle, self.basicMaskBottomStyle)
        self._lastMaskBottomStyle.clear()
        diffedStyles.forEach({
        (value, key) -> Void in
        self.maskViewBottom.style.setProperty(key, value)
        if (value != "") {
            self._lastMaskBottomStyle.set(key, value)
        }
        })
        self._onLayout()
    }
    public func _setIndex(_ reassignedValue: NSNumber) {
        var value = reassignedValue
        if (value < 0) {
            value = 0
        }
        if (value == self._selectedIndex) {
            return
        }
        self._selectedIndex = value
    }
    private func _onLayout() {
        if (!self.isConnected) {
            return
        }
        var indicatorHeight = self._getIndicatorClientHeight()
        var contentPaddingPixel = (self.offsetHeight - indicatorHeight) / 2 + "px"
        self.maskViewTop.style.setProperty("height", contentPaddingPixel)
        self.maskViewBottom.style.setProperty("height", contentPaddingPixel)
        self.contentView.style.setProperty("paddingTop", contentPaddingPixel)
        self.contentView.style.setProperty("paddingBottom", contentPaddingPixel)
        self._indicatorHeight = indicatorHeight
        if (self._indicatorHeight <= 0) {
            self._indicatorHeight = 50
        }
        self._scrollTopIndex(self.value)
    }
    private func _getIndicatorClientHeight() -> NSNumber {
        var borderTopWidth = self.indicatorView.style.getPropertyValue("borderTopWidth")
        var borderBottomWidth = self.indicatorView.style.getPropertyValue("borderBottomWidth")
        var indicatorBorderTop = borderTopWidth.length > 0 ? parseFloat(borderTopWidth) : 0
        var indicatorBorderBottom = borderBottomWidth.length > 0 ? parseFloat(borderBottomWidth) : 0
        var indicatorClientHeight = self.indicatorView.offsetHeight - indicatorBorderTop - indicatorBorderBottom
        return indicatorClientHeight
    }
    private func _scrollTopSnap(_ y: NSNumber) {
        if (self._isAdjusting) {
            return
        }
        var index = Math.round(y / self._indicatorHeight)
        var targetY = index * self._indicatorHeight
        var epsilon: NSNumber = 0.1
        if (Math.abs(y - targetY) > epsilon) {
            self._isAdjusting = true
            self._scrollTopIndex(index)
            setTimeout({
            () -> Void in
            self._isAdjusting = false
            }, 0)
        }
        var changed = self._selectedIndex != index
        self._selectedIndex = index
        if (self._skipScrollChangeEventOnce) {
            self._skipScrollChangeEventOnce = false
            return
        }
        if (changed) {
            self._dispatchUniPickerView()
        }
    }
    private func _scrollTopIndex(_ index: NSNumber) {
        self.scrollView.scrollTo(0, index * self._indicatorHeight)
    }
    private func _dispatchUniPickerView() {
        var pickerView = self.parentElement
        var maxRecursiveDeep: NSNumber = 32
        while(pickerView != nil && maxRecursiveDeep > 0){
            maxRecursiveDeep--
            if (UTSiOS.instanceof(pickerView, UniPickerViewElement.self)) {
                break
            }
            pickerView = pickerView!.parentElement
        }
        if (pickerView != nil) {
            (pickerView as! UniPickerViewElement)._columnChange()
        }
    }
}
@objc(UTSSDKModulesDCloudUniFormUniRadioElement)
@objcMembers
public class UniRadioElement : UniFormControlElement<String>, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniRadioElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return [
                "checked",
                "value",
                "background-Color",
                "active-Background-Color",
                "border-Color",
                "active-Border-Color",
                "fore-Color",
                "color",
                "icon-Color"
            ]
        }
    }
    private var radioView: UniElement!
    private var radioText: UniTextElement!
    private var _initialChecked = false
    private var _initialCheckedFlag = false
    private var _checked = false
    public override func __initCustomElement() {
        self.customElementJSExport = UniRadioElementJSExportImpl(self)
        self.style.setProperty("flexDirection", "row")
        self.style.setProperty("alignItems", "center")
        var radioView = self.uniPage.createElement("view")
        var radioViewStyle = radioView.style
        radioViewStyle.setProperty("alignItems", "center")
        radioViewStyle.setProperty("justifyContent", "center")
        radioViewStyle.setProperty("borderStyle", "solid")
        radioViewStyle.setProperty("borderWidth", "1px")
        radioViewStyle.setProperty("borderColor", "#e9e9ea")
        radioViewStyle.setProperty("borderRadius", "12px")
        radioViewStyle.setProperty("width", "24px")
        radioViewStyle.setProperty("height", "24px")
        radioViewStyle.setProperty("marginRight", "5px")
        var radioText = self.uniPage.createElement("text") as! UniTextElement
        radioText.setAttribute("value", "\u{EA08}")
        var radioTextStyle = radioText.style
        radioTextStyle.setProperty("fontFamily", "uni-icon")
        radioTextStyle.setProperty("fontSize", "16px")
        radioTextStyle.setProperty("color", self.foreColor)
        self.radioView = radioView
        self.radioText = radioText
        self.addEventListener("click", { [weak self]
        (e: UniPointerEvent) -> Void in
        guard let self = self else { return }
        e.stopPropagation()
        if (self.disabled) {
            return
        }
        if (self.checked) {
            return
        }
        self.checked = true
        self.dispatchGroup()
        })
        self.updateCheckedStyle(false)
    }
    public override var name: String {
        get {
            return self.getAttributeValue("name", "")
        }
        set(value) {
            self.setAttribute("name", value)
        }
    }
    public override var value: String {
        get {
            return self.getAttributeValue("value", "")
        }
        set(value) {
            self.setAttribute("value", value)
        }
    }
    public override func reset() {
        self.checked = self._initialChecked
    }
    public func connectedCallback() {
        if (self.children.length == 0) {
            self.appendChild(self.radioView)
        } else {
            self.insertBefore(self.radioView, self.firstChild)
        }
    }
    public func disconnectedCallback() {
        self.removeChild(self.radioView)
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        switch(name){
            case "checked":
                var value = (UTSiOS.typeof(newValue) == "string" || newValue == true) ? true : false
                if (!self._initialCheckedFlag) {
                    self._initialCheckedFlag = true
                    self._initialChecked = value
                }
                self.checked = value
            case "fore-color":
                fallthrough
            case "icon-color":
                self.radioText.style.setProperty("color", self.foreColor)
            case "background-color":
                fallthrough
            case "active-background-color":
                fallthrough
            case "border-color":
                fallthrough
            case "active-border-color":
                fallthrough
            case "color":
                self.updateCheckedStyle(self.checked)
            default:
                break
        }
    }
    public var checked: Bool {
        get {
            return self._checked
        }
        set(value) {
            if (value == self._checked) {
                return
            }
            self._checked = value
            self.updateCheckedStyle(value)
            self.updateCheckedStatus(value)
        }
    }
    public var disabled: Bool {
        get {
            return self.getAttribute("disabled") == "true" ? true : false
        }
    }
    public var foreColor: String {
        get {
            return self.getAttributeValue("foreColor", self.iconColor)
        }
    }
    public var backgroundColor: String {
        get {
            return self.getAttributeValue("backgroundColor", "#ffffff")
        }
    }
    public var activeBackgroundColor: String {
        get {
            return self.getAttributeValue("activeBackgroundColor", self.color)
        }
    }
    public var borderColor: String {
        get {
            return self.getAttributeValue("borderColor", "#d1d1d1")
        }
    }
    public var activeBorderColor: String {
        get {
            return self.getAttributeValue("activeBorderColor", self.activeBackgroundColor)
        }
    }
    public var color: String {
        get {
            return self.getAttributeValue("color", "#007AFF")
        }
    }
    public var iconColor: String {
        get {
            return self.getAttributeValue("iconColor", "#fff")
        }
    }
    private func getAttributeValue(_ key: String, _ defaultValue: String) -> String {
        var value = self.getAttribute(key)
        if (value != nil && value!.length > 0) {
            return value!
        }
        return defaultValue
    }
    private func updateCheckedStyle(_ checked: Bool) {
        var backgroundColor = checked ? self.activeBackgroundColor : self.backgroundColor
        var borderColor = checked ? self.activeBorderColor : self.borderColor
        self.radioView.style.setProperty("backgroundColor", backgroundColor)
        self.radioView.style.setProperty("borderColor", borderColor)
    }
    private func updateCheckedStatus(_ checked: Bool) {
        if (checked) {
            setTimeout({
            () -> Void in
            self.radioView.appendChild(self.radioText)
            }, 1)
        } else {
            self.radioView.removeChild(self.radioText)
        }
    }
    private func dispatchGroup() {
        var group = self.parentElement
        var maxRecursiveDeep: NSNumber = 32
        while(group != nil && maxRecursiveDeep > 0){
            maxRecursiveDeep--
            if (UTSiOS.instanceof(group, UniRadioGroupElement.self)) {
                break
            }
            group = group!.parentElement
        }
        if (group != nil) {
            (group as! UniRadioGroupElement)._radioChange(self, self.value)
        }
    }
}
@objc(UTSSDKModulesDCloudUniFormUniRadioGroupChangeEventDetail)
@objcMembers
public class UniRadioGroupChangeEventDetail : NSObject, UTSObject {
    public var value: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "value":
                    self.value = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.value = obj["value"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniFormUniRadioGroupChangeEvent)
@objcMembers
public class UniRadioGroupChangeEvent : UniCustomEvent<UniRadioGroupChangeEventDetail> {
    public init(_ value: String){
        super.init("change", UniRadioGroupChangeEventDetail(UTSJSONObject([
            "value": value
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniFormUniRadioGroupElement)
@objcMembers
public class UniRadioGroupElement : UniFormControlElement<String>, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniRadioGroupElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return []
        }
    }
    public override func __initCustomElement() {
        self.customElementJSExport = UniRadioGroupElementJSExportImpl(self)
    }
    public override var name: String {
        get {
            return self.getAttributeValue("name", "")
        }
        set(value) {
            self.setAttribute("name", value)
        }
    }
    public override var value: String {
        get {
            var returnValue = ""
            self.findChildren(self).forEach({
            (item: UniRadioElement) -> Void in
            if (item.checked) {
                returnValue = item.value
            }
            })
            return returnValue
        }
        set(value) {
            self.findChildren(self).forEach({
            (item: UniRadioElement) -> Void in
            if (item.value == value) {
                item.checked = true
            }
            })
        }
    }
    public override func reset() {
        self.findChildren(self).forEach({
        (item: UniRadioElement) -> Void in
        item.reset()
        })
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {}
    private func getAttributeValue(_ key: String, _ defaultValue: String) -> String {
        var value = self.getAttribute(key)
        if (value != nil && value!.length > 0) {
            return value!
        }
        return defaultValue
    }
    public func _radioChange(_ el: UniRadioElement, _ value: String) {
        self.findChildren(self).forEach({
        (item: UniRadioElement) -> Void in
        if (item != el) {
            item.checked = false
        }
        })
        self.dispatchEvent(UniRadioGroupChangeEvent(value))
    }
    private func findChildren(_ el: UniElement) -> [UniRadioElement] {
        var controls: [UniRadioElement] = []
        el.children.forEach({
        (item: UniElement) -> Void in
        if (UTSiOS.instanceof(item, UniRadioElement.self)) {
            controls.push(item as! UniRadioElement)
        } else {
            self.findChildren(item).forEach({
            (item: UniRadioElement) -> Void in
            controls.push(item as! UniRadioElement)
            })
        }
        })
        return controls
    }
}
@objc(UTSSDKModulesDCloudUniFormUniSwitchChangeEventDetail)
@objcMembers
public class UniSwitchChangeEventDetail : NSObject, UTSObject {
    public var value: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "value":
                    self.value = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.value = obj["value"] as! Bool
    }
}
@objc(UTSSDKModulesDCloudUniFormUniSwitchChangeEvent)
@objcMembers
public class UniSwitchChangeEvent : UniCustomEvent<UniSwitchChangeEventDetail> {
    public init(_ value: Bool){
        super.init("change", UniSwitchChangeEventDetail(UTSJSONObject([
            "value": value
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniFormUniSwitchElement)
@objcMembers
public class UniSwitchElement : UniFormControlElement<Bool>, UniCustomElement {
    public var _parsedAttributes: Dictionary<String, String>?
    public var _observedAttributes: [String]? {
        get {
            return UniSwitchElement.observedAttributes
        }
    }
    public static var observedAttributes: Array<String> {
        get {
            return [
                "checked",
                "disabled",
                "value",
                "background-color",
                "active-background-color",
                "fore-color",
                "active-fore-color",
                "color"
            ]
        }
    }
    private var switchThumb: UniElement!
    private var _initialChecked = false
    private var _initialCheckedFlag = false
    private var _checked = false
    public override func __initCustomElement() {
        self.customElementJSExport = UniSwitchElementJSExportImpl(self)
        var switchTrackStyle = self.style
        switchTrackStyle.setProperty("borderStyle", "solid")
        switchTrackStyle.setProperty("borderWidth", "2px")
        switchTrackStyle.setProperty("borderRadius", "16px")
        switchTrackStyle.setProperty("width", "52px")
        switchTrackStyle.setProperty("height", "32px")
        switchTrackStyle.setProperty("transitionDuration", "0.1s")
        switchTrackStyle.setProperty("transitionProperty", "backgroundColor")
        var switchThumb = self.uniPage.createElement("view")
        var switchThumbStyle = switchThumb.style
        switchThumbStyle.setProperty("width", "28px")
        switchThumbStyle.setProperty("height", "28px")
        switchThumbStyle.setProperty("borderRadius", "14px")
        self.switchThumb = switchThumb
        self.addEventListener("click", { [weak self]
        (e: UniPointerEvent) -> Void in
        guard let self = self else { return }
        e.stopPropagation()
        if (self.disabled) {
            return
        }
        self.checked = !self.checked
        self.dispatchEvent(UniSwitchChangeEvent(self.checked))
        })
    }
    public override var name: String {
        get {
            return self.getAttributeValue("name", "")
        }
        set(value) {
            self.setAttribute("name", value)
        }
    }
    public override var value: Bool {
        get {
            return self._checked
        }
        set(value) {
            self._checked = value
        }
    }
    public override func reset() {
        self.checked = self._initialChecked
    }
    public func connectedCallback() {
        self.updateCheckStatus()
        self.updateCheckStatusColor()
        self.switchThumb.style.setProperty("transitionDuration", "0.3s")
        self.switchThumb.style.setProperty("transitionProperty", "transform")
        self.appendChild(self.switchThumb)
    }
    public func disconnectedCallback() {
        self.removeChild(self.switchThumb)
    }
    public func attributeChangedCallback(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        switch(name){
            case "checked":
                var value = (UTSiOS.typeof(newValue) == "string" || newValue == true) ? true : false
                if (!self._initialCheckedFlag) {
                    self._initialCheckedFlag = true
                    self._initialChecked = value
                }
                self.checked = value
            case "disabled":
                fallthrough
            case "background-color":
                fallthrough
            case "active-background-color":
                fallthrough
            case "fore-color":
                fallthrough
            case "active-fore-color":
                fallthrough
            case "color":
                if (self.isConnected) {
                    self.updateCheckStatusColor()
                }
            default:
                break
        }
    }
    public var disabled: Bool {
        get {
            return self.getAttribute("disabled") == "true" ? true : false
        }
    }
    public var checked: Bool {
        get {
            return self._checked
        }
        set(value) {
            self._checked = value
            if (self.isConnected) {
                self.updateCheckStatus()
                self.updateCheckStatusColor()
            }
        }
    }
    public var backgroundColor: String {
        get {
            return self.getAttributeValue("backgroundColor", "#e9e9ea")
        }
    }
    public var activeBackgroundColor: String {
        get {
            return self.getAttributeValue("activeBackgroundColor", self.color)
        }
    }
    public var foreColor: String {
        get {
            return self.getAttributeValue("foreColor", "#fff")
        }
    }
    public var activeForeColor: String {
        get {
            return self.getAttributeValue("activeForeColor", "#fff")
        }
    }
    public var color: String {
        get {
            return self.getAttributeValue("color", "#007aff")
        }
    }
    public func updateCheckStatus() {
        if (self.checked) {
            self.switchThumb.style.setProperty("transform", "translateX(20px)")
        } else {
            self.switchThumb.style.setProperty("transform", "translateX(0px)")
        }
    }
    public func updateCheckStatusColor() {
        if (self.disabled) {
            self.style.setProperty("opacity", "0.7")
        } else {
            self.style.setProperty("opacity", "1")
        }
        if (self.checked) {
            self.style.setProperty("backgroundColor", self.activeBackgroundColor)
            self.style.setProperty("borderColor", self.activeBackgroundColor)
            self.switchThumb.style.setProperty("backgroundColor", self.activeForeColor)
        } else {
            self.style.setProperty("backgroundColor", self.backgroundColor)
            self.style.setProperty("borderColor", self.backgroundColor)
            self.switchThumb.style.setProperty("backgroundColor", self.foreColor)
        }
    }
    private func getAttributeValue(_ key: String, _ defaultValue: String) -> String {
        var value = self.getAttribute(key)
        if (value != nil && value!.length > 0) {
            return value!
        }
        return defaultValue
    }
}
@objc(UniCheckboxElementRegister)
@objcMembers
public class UniCheckboxElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "checkbox", nodeClazz: UniCheckboxElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "checkbox")
    }
}
@objc(UniCheckboxGroupElementRegister)
@objcMembers
public class UniCheckboxGroupElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "checkbox-group", nodeClazz: UniCheckboxGroupElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "checkbox-group")
    }
}
@objc(UniFormElementRegister)
@objcMembers
public class UniFormElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "form", nodeClazz: UniFormElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "form")
    }
}
@objc(UniPickerViewElementRegister)
@objcMembers
public class UniPickerViewElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "picker-view", nodeClazz: UniPickerViewElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "picker-view")
    }
}
@objc(UniPickerViewColumnElementRegister)
@objcMembers
public class UniPickerViewColumnElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "picker-view-column", nodeClazz: UniPickerViewColumnElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "picker-view-column")
    }
}
@objc(UniRadioElementRegister)
@objcMembers
public class UniRadioElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "radio", nodeClazz: UniRadioElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "radio")
    }
}
@objc(UniRadioGroupElementRegister)
@objcMembers
public class UniRadioGroupElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "radio-group", nodeClazz: UniRadioGroupElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "radio-group")
    }
}
@objc(UniSwitchElementRegister)
@objcMembers
public class UniSwitchElementRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "switch", nodeClazz: UniSwitchElement.constructor, componentCls: UniViewComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "switch")
    }
}
@objc
public protocol UniCheckboxElementJSExport : JSExport {
    var name: String { get set }
    var value: String { get set }
    func reset()
}
@objc(UTSSDKModulesDCloudUniFormUniCheckboxElementJSExportImpl)
@objcMembers
public class UniCheckboxElementJSExportImpl : NSObject, UniCheckboxElementJSExport {
    private unowned var _element: UniCheckboxElement
    public init(_ element: UniCheckboxElement){
        self._element = element
    }
    public var name: String {
        get {
            return self._element.name
        }
        set(value) {
            self._element.name = value
        }
    }
    public var value: String {
        get {
            return self._element.value
        }
        set(value) {
            self._element.value = value
        }
    }
    public func reset() {
        return self._element.reset()
    }
}
@objc
public protocol UniCheckboxGroupElementJSExport : JSExport {
}
@objc(UTSSDKModulesDCloudUniFormUniCheckboxGroupElementJSExportImpl)
@objcMembers
public class UniCheckboxGroupElementJSExportImpl : NSObject, UniCheckboxGroupElementJSExport {
    private unowned var _element: UniCheckboxGroupElement
    public init(_ element: UniCheckboxGroupElement){
        self._element = element
    }
}
@objc
public protocol UniPickerViewElementJSExport : JSExport {
    var value: [NSNumber] { get set }
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewElementJSExportImpl)
@objcMembers
public class UniPickerViewElementJSExportImpl : NSObject, UniPickerViewElementJSExport {
    private unowned var _element: UniPickerViewElement
    public init(_ element: UniPickerViewElement){
        self._element = element
    }
    public var value: [NSNumber] {
        get {
            return self._element.value
        }
        set(value) {
            self._element.value = value
        }
    }
}
@objc
public protocol UniPickerViewColumnElementJSExport : JSExport {
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewColumnElementJSExportImpl)
@objcMembers
public class UniPickerViewColumnElementJSExportImpl : NSObject, UniPickerViewColumnElementJSExport {
    private unowned var _element: UniPickerViewColumnElement
    public init(_ element: UniPickerViewColumnElement){
        self._element = element
    }
}
@objc
public protocol UniRadioElementJSExport : JSExport {
}
@objc(UTSSDKModulesDCloudUniFormUniRadioElementJSExportImpl)
@objcMembers
public class UniRadioElementJSExportImpl : NSObject, UniRadioElementJSExport {
    private unowned var _element: UniRadioElement
    public init(_ element: UniRadioElement){
        self._element = element
    }
}
@objc
public protocol UniRadioGroupElementJSExport : JSExport {
}
@objc(UTSSDKModulesDCloudUniFormUniRadioGroupElementJSExportImpl)
@objcMembers
public class UniRadioGroupElementJSExportImpl : NSObject, UniRadioGroupElementJSExport {
    private unowned var _element: UniRadioGroupElement
    public init(_ element: UniRadioGroupElement){
        self._element = element
    }
}
@objc
public protocol UniSwitchElementJSExport : JSExport {
}
@objc(UTSSDKModulesDCloudUniFormUniSwitchElementJSExportImpl)
@objcMembers
public class UniSwitchElementJSExportImpl : NSObject, UniSwitchElementJSExport {
    private unowned var _element: UniSwitchElement
    public init(_ element: UniSwitchElement){
        self._element = element
    }
}
@objc(UTSSDKModulesDCloudUniFormUniCheckboxElementByJs)
@objcMembers
public class UniCheckboxElementByJs : UniCheckboxElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func resetByJs() {
        return self.reset()
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
@objc(UTSSDKModulesDCloudUniFormUniCheckboxGroupChangeEventByJs)
@objcMembers
public class UniCheckboxGroupChangeEventByJs : UniCheckboxGroupChangeEvent {
}
@objc(UTSSDKModulesDCloudUniFormUniCheckboxGroupElementByJs)
@objcMembers
public class UniCheckboxGroupElementByJs : UniCheckboxGroupElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func resetByJs() {
        return self.reset()
    }
    public func attributeChangedCallbackByJs(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        return self.attributeChangedCallback(name, oldValue, newValue)
    }
    public func _checkboxChangeByJs() {
        return self._checkboxChange()
    }
}
@objc(UTSSDKModulesDCloudUniFormUniFormSubmitEventByJs)
@objcMembers
public class UniFormSubmitEventByJs : UniFormSubmitEvent {
}
@objc(UTSSDKModulesDCloudUniFormUniFormResetEventByJs)
@objcMembers
public class UniFormResetEventByJs : UniFormResetEvent {
}
@objc(UTSSDKModulesDCloudUniFormUniFormElementByJs)
@objcMembers
public class UniFormElementByJs : UniFormElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func attributeChangedCallbackByJs(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        return self.attributeChangedCallback(name, oldValue, newValue)
    }
    public func submitByJs() {
        return self.submit()
    }
    public func resetByJs() {
        return self.reset()
    }
}
public func camelizeByJs(_ str: String) -> String {
    return camelize(str)
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewChangeEventByJs)
@objcMembers
public class UniPickerViewChangeEventByJs : UniPickerViewChangeEvent {
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewElementByJs)
@objcMembers
public class UniPickerViewElementByJs : UniPickerViewElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func resetByJs() {
        return self.reset()
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
    public func insertBeforeByJs(_ child: UniElement, _ anchor: UniElement?) -> UniElement? {
        return self.insertBefore(child, anchor)
    }
    public func _columnChangeByJs() {
        return self._columnChange()
    }
}
@objc(UTSSDKModulesDCloudUniFormUniPickerViewColumnElementByJs)
@objcMembers
public class UniPickerViewColumnElementByJs : UniPickerViewColumnElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func resetByJs() {
        return self.reset()
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
    public func appendChildByJs(_ child: UniElement) -> Void {
        return self.appendChild(child)
    }
    public func insertBeforeByJs(_ child: UniElement, _ anchor: UniElement?) -> UniElement? {
        return self.insertBefore(child, anchor)
    }
    public func removeChildByJs(_ child: UniElement) -> UniElement? {
        return self.removeChild(child)
    }
    public func initializeByJs() {
        return self.initialize()
    }
    public func resizeByJs() {
        return self.resize()
    }
    public func setIndicatorStyleByJs(_ styles: Map<String, String>) -> Void {
        return self.setIndicatorStyle(styles)
    }
    public func setMaskTopStyleByJs(_ styles: Map<String, String>) -> Void {
        return self.setMaskTopStyle(styles)
    }
    public func setMaskBottomStyleByJs(_ styles: Map<String, String>) -> Void {
        return self.setMaskBottomStyle(styles)
    }
    public func _setIndexByJs(_ value: NSNumber) {
        return self._setIndex(value)
    }
}
@objc(UTSSDKModulesDCloudUniFormUniRadioElementByJs)
@objcMembers
public class UniRadioElementByJs : UniRadioElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func resetByJs() {
        return self.reset()
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
@objc(UTSSDKModulesDCloudUniFormUniRadioGroupChangeEventByJs)
@objcMembers
public class UniRadioGroupChangeEventByJs : UniRadioGroupChangeEvent {
}
@objc(UTSSDKModulesDCloudUniFormUniRadioGroupElementByJs)
@objcMembers
public class UniRadioGroupElementByJs : UniRadioGroupElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func resetByJs() {
        return self.reset()
    }
    public func attributeChangedCallbackByJs(_ name: String, _ oldValue: Any?, _ newValue: Any?) {
        return self.attributeChangedCallback(name, oldValue, newValue)
    }
    public func _radioChangeByJs(_ el: UniRadioElement, _ value: String) {
        return self._radioChange(el, value)
    }
}
@objc(UTSSDKModulesDCloudUniFormUniSwitchChangeEventByJs)
@objcMembers
public class UniSwitchChangeEventByJs : UniSwitchChangeEvent {
}
@objc(UTSSDKModulesDCloudUniFormUniSwitchElementByJs)
@objcMembers
public class UniSwitchElementByJs : UniSwitchElement {
    public func __initCustomElementByJs() {
        return self.__initCustomElement()
    }
    public func resetByJs() {
        return self.reset()
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
    public func updateCheckStatusByJs() {
        return self.updateCheckStatus()
    }
    public func updateCheckStatusColorByJs() {
        return self.updateCheckStatusColor()
    }
}
@objc(UTSSDKModulesDCloudUniFormIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniFormIndexSwift : NSObject {
    public static func s_camelizeByJs(_ str: String) -> String {
        return camelizeByJs(str)
    }
}
