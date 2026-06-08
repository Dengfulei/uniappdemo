@file:Suppress("UNCHECKED_CAST", "USELESS_CAST", "INAPPLICABLE_JVM_NAME", "UNUSED_ANONYMOUS_PARAMETER", "SENSELESS_COMPARISON", "NAME_SHADOWING", "UNNECESSARY_NOT_NULL_ASSERTION")
package uni.UNI35453D1
import io.dcloud.uniapp.*
import io.dcloud.uniapp.extapi.*
import io.dcloud.uniapp.framework.*
import io.dcloud.uniapp.runtime.*
import io.dcloud.uniapp.vue.*
import io.dcloud.uniapp.vue.shared.*
import io.dcloud.uts.*
import io.dcloud.uts.Map
import io.dcloud.uts.Set
import io.dcloud.uts.UTSAndroid
import kotlin.properties.Delegates
import uts.sdk.modules.nativeBridge.NativeBridgeMessage
import uts.sdk.modules.nativeBridge.NativeBridgeOptions
import uts.sdk.modules.nativeBridge.offNativeBridgeMessage
import uts.sdk.modules.nativeBridge.onNativeBridgeMessage
import uts.sdk.modules.nativeBridge.openNativeBridge
import uts.sdk.modules.nativeDemo.copyNativeDemoText
import uts.sdk.modules.nativeDemo.getNativeDemoInfo
import uts.sdk.modules.nativeDemo.openNativeAlbum
import io.dcloud.uniapp.extapi.navigateTo as uni_navigateTo
import io.dcloud.uniapp.extapi.showToast as uni_showToast
open class GenPagesIndexIndex : BasePage {
    constructor(__ins: ComponentInternalInstance, __renderer: String?) : super(__ins, __renderer) {
        onLoad(fun(_: OnLoadOptions) {
            onNativeBridgeMessage(fun(message: NativeBridgeMessage){
                this.handleNativeBridgeMessage(message)
            }
            )
        }
        , __ins)
        onUnload(fun() {
            offNativeBridgeMessage()
        }
        , __ins)
    }
    @Suppress("UNUSED_PARAMETER", "UNUSED_VARIABLE")
    override fun `$render`(): Any? {
        val _ctx = this
        val _cache = this.`$`.renderCache
        return _cE("scroll-view", _uM("class" to "page-scroll", "scroll-y" to true), _uA(
            _cE("view", _uM("class" to "page-content"), _uA(
                _cE("view", _uM("class" to "topbar"), _uA(
                    _cE("view", null, _uA(
                        _cE("text", _uM("class" to "eyebrow"), "SPRING MARKET"),
                        _cE("text", _uM("class" to "title"), "今日好物")
                    )),
                    _cE("button", _uM("class" to "login-button", "onClick" to _ctx.goLogin), _uA(
                        _cE("text", _uM("class" to "login-text"), "登录")
                    ), 8, _uA(
                        "onClick"
                    ))
                )),
                _cE("view", _uM("class" to "hero"), _uA(
                    _cE("view", _uM("class" to "hero-copy"), _uA(
                        _cE("text", _uM("class" to "hero-kicker"), "限时精选"),
                        _cE("text", _uM("class" to "hero-title"), "把周末餐桌和日常补给一次配齐"),
                        _cE("text", _uM("class" to "hero-desc"), "新鲜、轻量、适合移动端浏览的商品陈列示例。")
                    )),
                    _cE("view", _uM("class" to "hero-badge"), _uA(
                        _cE("text", _uM("class" to "badge-value"), "8"),
                        _cE("text", _uM("class" to "badge-label"), "件上新")
                    ))
                )),
                _cE("view", _uM("class" to "section-head"), _uA(
                    _cE("text", _uM("class" to "section-title"), "商品列表"),
                    _cE("text", _uM("class" to "section-note"), "测试数据")
                )),
                _cE("view", _uM("class" to "native-demo"), _uA(
                    _cE("view", _uM("class" to "native-demo-copy"), _uA(
                        _cE("text", _uM("class" to "native-demo-title"), "UTS 原生插件"),
                        _cE("text", _uM("class" to "native-demo-desc"), _tD(_ctx.nativeDemoText), 1)
                    )),
                    _cE("view", _uM("class" to "native-demo-actions"), _uA(
                        _cE("button", _uM("class" to "native-demo-button", "onClick" to _ctx.runNativeDemo), _uA(
                            _cE("text", _uM("class" to "native-demo-button-text"), "调用插件")
                        ), 8, _uA(
                            "onClick"
                        )),
                        _cE("button", _uM("class" to "native-demo-button native-demo-button-secondary", "onClick" to _ctx.openNativeAlbumDemo), _uA(
                            _cE("text", _uM("class" to "native-demo-button-text"), "打开相册")
                        ), 8, _uA(
                            "onClick"
                        ))
                    ))
                )),
                _cE("view", _uM("class" to "product-list"), _uA(
                    _cE(Fragment, null, RenderHelpers.renderList(_ctx.products, fun(item, __key, __index, _cached): Any {
                        return _cE("view", _uM("class" to "product-card", "key" to item.id, "onClick" to fun(){
                            _ctx.goProductDetail(item)
                        }
                        ), _uA(
                            _cE("view", _uM("class" to "product-art", "style" to _nS(_uM("backgroundColor" to item.color))), _uA(
                                _cE("text", _uM("class" to "product-emoji"), _tD(item.icon), 1)
                            ), 4),
                            _cE("view", _uM("class" to "product-info"), _uA(
                                _cE("view", _uM("class" to "product-row"), _uA(
                                    _cE("text", _uM("class" to "product-name"), _tD(item.name), 1),
                                    _cE("text", _uM("class" to "product-price"), "¥" + _tD(item.price), 1)
                                )),
                                _cE("text", _uM("class" to "product-desc"), _tD(item.desc), 1),
                                _cE("view", _uM("class" to "meta-row"), _uA(
                                    _cE("text", _uM("class" to "tag"), _tD(item.tag), 1),
                                    _cE("text", _uM("class" to "sold"), "已售 " + _tD(item.sold), 1)
                                ))
                            ))
                        ), 8, _uA(
                            "onClick"
                        ))
                    }
                    ), 128)
                ))
            ))
        ))
    }
    open var nativeDemoText: String by `$data`
    open var products: UTSArray<Product> by `$data`
    @Suppress("USELESS_CAST")
    override fun data(): Map<String, Any?> {
        return _uM("nativeDemoText" to "点击按钮读取当前平台设备信息，并写入系统剪贴板。", "products" to _uA<Product>(Product(id = 1, name = "手冲咖啡豆", price = "68.00", desc = "浅烘焙，柑橘和蜂蜜香气，适合早晨醒脑。", tag = "饮品", sold = 238, icon = "☕", color = "#d9b07a"), Product(id = 2, name = "有机蓝莓盒", price = "36.90", desc = "酸甜均衡，可直接食用，也适合搭配酸奶。", tag = "水果", sold = 521, icon = "🫐", color = "#7d8fc8"), Product(id = 3, name = "山茶花洗护套装", price = "129.00", desc = "清爽花香，旅行和日常都能轻松收纳。", tag = "个护", sold = 96, icon = "✦", color = "#d9868c"), Product(id = 4, name = "轻食鸡胸沙拉", price = "24.50", desc = "高蛋白轻负担，午餐时段的稳妥选择。", tag = "轻食", sold = 314, icon = "🥗", color = "#91b77f"), Product(id = 5, name = "亚麻收纳篮", price = "45.00", desc = "柔软布面和硬挺边缘，适合桌面小物整理。", tag = "家居", sold = 185, icon = "▣", color = "#c49a68"), Product(id = 6, name = "便携香薰蜡烛", price = "59.00", desc = "雪松、无花果与干净皂感，睡前刚刚好。", tag = "香氛", sold = 127, icon = "◐", color = "#85a7a1")))
    }
    open var goLogin = ::gen_goLogin_fn
    open fun gen_goLogin_fn() {
        uni_navigateTo(NavigateToOptions(url = "/pages/login/login"))
    }
    open var goProductDetail = ::gen_goProductDetail_fn
    open fun gen_goProductDetail_fn(item: Product) {
        val data = JSON.stringify(_uO("id" to item.id, "name" to item.name, "price" to item.price, "desc" to item.desc, "tag" to item.tag, "sold" to item.sold, "icon" to item.icon, "color" to item.color))
        val options = NativeBridgeOptions(methodName = "productDetail", data = data)
        openNativeBridge(options)
    }
    open var runNativeDemo = ::gen_runNativeDemo_fn
    open fun gen_runNativeDemo_fn() {
        val info = getNativeDemoInfo()
        val text = "" + info.systemName + " " + info.systemVersion + " / " + info.deviceName
        val copied = copyNativeDemoText("uni-app x 调用 UTS 原生插件成功：" + text)
        this.nativeDemoText = if (copied) {
            "已调用 " + info.platform + " 原生能力：" + text
        } else {
            "已读取设备信息：" + text
        }
        uni_showToast(ShowToastOptions(title = if (copied) {
            "原生插件调用成功"
        } else {
            "已读取设备信息"
        }
        , icon = "none"))
    }
    open var openNativeAlbumDemo = ::gen_openNativeAlbumDemo_fn
    open fun gen_openNativeAlbumDemo_fn() {
        val opened = openNativeAlbum(fun(result){
            this.nativeDemoText = "" + result.message + (if (result.mediaType != "") {
                "：" + result.mediaType
            } else {
                ""
            }
            )
        }
        )
        if (!opened) {
            uni_showToast(ShowToastOptions(title = "相册不可用", icon = "none"))
            return
        }
        uni_showToast(ShowToastOptions(title = "正在打开相册", icon = "none"))
    }
    open var handleNativeBridgeMessage = ::gen_handleNativeBridgeMessage_fn
    open fun gen_handleNativeBridgeMessage_fn(message: NativeBridgeMessage) {
        if (message.methodName == "productNameTap") {
            console.log("收到原生商品标题点击消息: " + message.data)
            uni_showToast(ShowToastOptions(title = "收到原生消息", icon = "none"))
            return
        }
        console.log("收到原生消息: " + message.methodName + ", data: " + message.data)
    }
    companion object {
        val styles: Map<String, Map<String, Map<String, Any>>> by lazy {
            _nCS(_uA(
                styles0
            ))
        }
        val styles0: Map<String, Map<String, Map<String, Any>>>
            get() {
                return _uM("page-scroll" to _pS(_uM("flexGrow" to 1, "flexShrink" to 1, "flexBasis" to "0%", "height" to "100%", "backgroundColor" to "#f6f1e8")), "page-content" to _pS(_uM("paddingTop" to 24, "paddingRight" to 18, "paddingBottom" to 34, "paddingLeft" to 18)), "topbar" to _pS(_uM("flexDirection" to "row", "alignItems" to "center", "justifyContent" to "space-between", "marginBottom" to 18)), "eyebrow" to _pS(_uM("color" to "#89704d", "fontSize" to 11, "fontWeight" to "700", "letterSpacing" to 0)), "title" to _pS(_uM("marginTop" to 4, "color" to "#20302d", "fontSize" to 30, "fontWeight" to "700")), "login-button" to _pS(_uM("width" to 74, "height" to 38, "borderTopLeftRadius" to 19, "borderTopRightRadius" to 19, "borderBottomRightRadius" to 19, "borderBottomLeftRadius" to 19, "backgroundColor" to "#20302d", "alignItems" to "center", "justifyContent" to "center")), "login-text" to _pS(_uM("color" to "#f8f0df", "fontSize" to 14, "fontWeight" to "700")), "hero" to _pS(_uM("paddingTop" to 20, "paddingRight" to 20, "paddingBottom" to 20, "paddingLeft" to 20, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#20302d", "flexDirection" to "row", "justifyContent" to "space-between", "overflow" to "hidden")), "hero-copy" to _pS(_uM("flexGrow" to 1, "flexShrink" to 1, "flexBasis" to "0%")), "hero-kicker" to _pS(_uM("color" to "#e6b866", "fontSize" to 13, "fontWeight" to "700")), "hero-title" to _pS(_uM("marginTop" to 10, "color" to "#fff8ec", "fontSize" to 25, "lineHeight" to "34px", "fontWeight" to "700")), "hero-desc" to _pS(_uM("marginTop" to 10, "color" to "#bfd0c8", "fontSize" to 13, "lineHeight" to "20px")), "hero-badge" to _pS(_uM("width" to 72, "height" to 92, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#e6b866", "alignItems" to "center", "justifyContent" to "center")), "badge-value" to _pS(_uM("color" to "#20302d", "fontSize" to 34, "fontWeight" to "700")), "badge-label" to _pS(_uM("color" to "#20302d", "fontSize" to 12, "fontWeight" to "700")), "section-head" to _pS(_uM("marginTop" to 26, "marginBottom" to 12, "flexDirection" to "row", "alignItems" to "flex-end", "justifyContent" to "space-between")), "section-title" to _pS(_uM("color" to "#20302d", "fontSize" to 20, "fontWeight" to "700")), "section-note" to _pS(_uM("color" to "#8a7a61", "fontSize" to 12)), "native-demo" to _pS(_uM("marginBottom" to 14, "paddingTop" to 14, "paddingRight" to 14, "paddingBottom" to 14, "paddingLeft" to 14, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#fffaf1", "flexDirection" to "row", "alignItems" to "center", "justifyContent" to "space-between", "boxShadow" to "0 8px 18px rgba(36, 45, 41, 0.08)")), "native-demo-copy" to _pS(_uM("flexGrow" to 1, "flexShrink" to 1, "flexBasis" to "0%", "paddingRight" to 12)), "native-demo-actions" to _pS(_uM("width" to 96)), "native-demo-title" to _pS(_uM("color" to "#20302d", "fontSize" to 16, "fontWeight" to "700")), "native-demo-desc" to _pS(_uM("marginTop" to 6, "color" to "#70634e", "fontSize" to 12, "lineHeight" to "18px")), "native-demo-button" to _pS(_uM("width" to 92, "height" to 38, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#c46141", "alignItems" to "center", "justifyContent" to "center")), "native-demo-button-secondary" to _pS(_uM("marginTop" to 8, "backgroundColor" to "#20302d")), "native-demo-button-text" to _pS(_uM("color" to "#fffaf1", "fontSize" to 13, "fontWeight" to "700")), "product-card" to _pS(_uM("marginBottom" to 12, "paddingTop" to 12, "paddingRight" to 12, "paddingBottom" to 12, "paddingLeft" to 12, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#fffaf1", "flexDirection" to "row", "boxShadow" to "0 8px 18px rgba(36, 45, 41, 0.08)")), "product-art" to _pS(_uM("width" to 76, "height" to 86, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "alignItems" to "center", "justifyContent" to "center")), "product-emoji" to _pS(_uM("color" to "#fffaf1", "fontSize" to 30, "fontWeight" to "700")), "product-info" to _pS(_uM("flexGrow" to 1, "flexShrink" to 1, "flexBasis" to "0%", "marginLeft" to 12, "justifyContent" to "space-between")), "product-row" to _pS(_uM("flexDirection" to "row", "alignItems" to "flex-start")), "product-name" to _pS(_uM("width" to 136, "color" to "#20302d", "fontSize" to 16, "fontWeight" to "700", "flexShrink" to 1, "lines" to 1, "textOverflow" to "ellipsis")), "product-price" to _pS(_uM("color" to "#c46141", "fontSize" to 16, "fontWeight" to "700")), "product-desc" to _pS(_uM("marginTop" to 7, "color" to "#70634e", "fontSize" to 12, "lineHeight" to "18px")), "meta-row" to _pS(_uM("marginTop" to 9, "flexDirection" to "row", "alignItems" to "center", "justifyContent" to "space-between")), "tag" to _pS(_uM("paddingTop" to 4, "paddingRight" to 9, "paddingBottom" to 4, "paddingLeft" to 9, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "color" to "#20302d", "backgroundColor" to "#ead9bb", "fontSize" to 11, "fontWeight" to "700")), "sold" to _pS(_uM("color" to "#9b8a6f", "fontSize" to 11)))
            }
        var inheritAttrs = true
        var inject: Map<String, Map<String, Any?>> = _uM()
        var emits: Map<String, Any?> = _uM()
        var props = _nP(_uM())
        var propsNeedCastKeys: UTSArray<String> = _uA()
        var components: Map<String, CreateVueComponent> = _uM()
    }
}
