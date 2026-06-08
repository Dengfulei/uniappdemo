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
val runBlock1 = run {
    __uniConfig.getAppStyles = fun(): Map<String, Map<String, Map<String, Any>>> {
        return GenApp.styles
    }
}
open class GenApp : BaseApp {
    constructor(__ins: ComponentInternalInstance) : super(__ins) {
        onLaunch(fun(_: OnLaunchOptions) {
            console.log("App Launch")
        }
        , __ins)
        onAppShow(fun(_: OnShowOptions) {
            console.log("App Show")
        }
        , __ins)
        onAppHide(fun() {
            console.log("App Hide")
        }
        , __ins)
    }
    companion object {
        val styles: Map<String, Map<String, Map<String, Any>>> by lazy {
            _nCS(_uA())
        }
    }
}
val GenAppClass = CreateVueAppComponent(GenApp::class.java, fun(): VueComponentOptions {
    return VueComponentOptions(type = "app", name = "", inheritAttrs = true, inject = Map(), props = Map(), propsNeedCastKeys = _uA(), emits = Map(), components = Map(), styles = GenApp.styles)
}
, fun(instance): GenApp {
    return GenApp(instance)
}
)
open class Product (
    @JsonNotNull
    open var id: Number,
    @JsonNotNull
    open var name: String,
    @JsonNotNull
    open var price: String,
    @JsonNotNull
    open var desc: String,
    @JsonNotNull
    open var tag: String,
    @JsonNotNull
    open var sold: Number,
    @JsonNotNull
    open var icon: String,
    @JsonNotNull
    open var color: String,
) : UTSReactiveObject() {
    override fun __v_create(__v_isReadonly: Boolean, __v_isShallow: Boolean, __v_skip: Boolean): UTSReactiveObject {
        return ProductReactiveObject(this, __v_isReadonly, __v_isShallow, __v_skip)
    }
}
class ProductReactiveObject : Product, IUTSReactive<Product> {
    override var __v_raw: Product
    override var __v_isReadonly: Boolean
    override var __v_isShallow: Boolean
    override var __v_skip: Boolean
    constructor(__v_raw: Product, __v_isReadonly: Boolean, __v_isShallow: Boolean, __v_skip: Boolean) : super(id = __v_raw.id, name = __v_raw.name, price = __v_raw.price, desc = __v_raw.desc, tag = __v_raw.tag, sold = __v_raw.sold, icon = __v_raw.icon, color = __v_raw.color) {
        this.__v_raw = __v_raw
        this.__v_isReadonly = __v_isReadonly
        this.__v_isShallow = __v_isShallow
        this.__v_skip = __v_skip
    }
    override fun __v_clone(__v_isReadonly: Boolean, __v_isShallow: Boolean, __v_skip: Boolean): ProductReactiveObject {
        return ProductReactiveObject(this.__v_raw, __v_isReadonly, __v_isShallow, __v_skip)
    }
    override var id: Number
        get() {
            return _tRG(__v_raw, "id", __v_raw.id, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("id")) {
                return
            }
            val oldValue = __v_raw.id
            __v_raw.id = value
            _tRS(__v_raw, "id", oldValue, value)
        }
    override var name: String
        get() {
            return _tRG(__v_raw, "name", __v_raw.name, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("name")) {
                return
            }
            val oldValue = __v_raw.name
            __v_raw.name = value
            _tRS(__v_raw, "name", oldValue, value)
        }
    override var price: String
        get() {
            return _tRG(__v_raw, "price", __v_raw.price, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("price")) {
                return
            }
            val oldValue = __v_raw.price
            __v_raw.price = value
            _tRS(__v_raw, "price", oldValue, value)
        }
    override var desc: String
        get() {
            return _tRG(__v_raw, "desc", __v_raw.desc, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("desc")) {
                return
            }
            val oldValue = __v_raw.desc
            __v_raw.desc = value
            _tRS(__v_raw, "desc", oldValue, value)
        }
    override var tag: String
        get() {
            return _tRG(__v_raw, "tag", __v_raw.tag, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("tag")) {
                return
            }
            val oldValue = __v_raw.tag
            __v_raw.tag = value
            _tRS(__v_raw, "tag", oldValue, value)
        }
    override var sold: Number
        get() {
            return _tRG(__v_raw, "sold", __v_raw.sold, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("sold")) {
                return
            }
            val oldValue = __v_raw.sold
            __v_raw.sold = value
            _tRS(__v_raw, "sold", oldValue, value)
        }
    override var icon: String
        get() {
            return _tRG(__v_raw, "icon", __v_raw.icon, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("icon")) {
                return
            }
            val oldValue = __v_raw.icon
            __v_raw.icon = value
            _tRS(__v_raw, "icon", oldValue, value)
        }
    override var color: String
        get() {
            return _tRG(__v_raw, "color", __v_raw.color, __v_isReadonly, __v_isShallow)
        }
        set(value) {
            if (!__v_canSet("color")) {
                return
            }
            val oldValue = __v_raw.color
            __v_raw.color = value
            _tRS(__v_raw, "color", oldValue, value)
        }
}
val GenPagesIndexIndexClass = CreateVueComponent(GenPagesIndexIndex::class.java, fun(): VueComponentOptions {
    return VueComponentOptions(type = "page", name = "", inheritAttrs = GenPagesIndexIndex.inheritAttrs, inject = GenPagesIndexIndex.inject, props = GenPagesIndexIndex.props, propsNeedCastKeys = GenPagesIndexIndex.propsNeedCastKeys, emits = GenPagesIndexIndex.emits, components = GenPagesIndexIndex.components, styles = GenPagesIndexIndex.styles)
}
, fun(instance, renderer): GenPagesIndexIndex {
    return GenPagesIndexIndex(instance, renderer)
}
)
val GenPagesLoginLoginClass = CreateVueComponent(GenPagesLoginLogin::class.java, fun(): VueComponentOptions {
    return VueComponentOptions(type = "page", name = "", inheritAttrs = GenPagesLoginLogin.inheritAttrs, inject = GenPagesLoginLogin.inject, props = GenPagesLoginLogin.props, propsNeedCastKeys = GenPagesLoginLogin.propsNeedCastKeys, emits = GenPagesLoginLogin.emits, components = GenPagesLoginLogin.components, styles = GenPagesLoginLogin.styles)
}
, fun(instance, renderer): GenPagesLoginLogin {
    return GenPagesLoginLogin(instance, renderer)
}
)
fun createApp(): UTSJSONObject {
    val app = createSSRApp(GenAppClass)
    return _uO("app" to app)
}
fun main(app: IApp) {
    definePageRoutes()
    defineAppConfig()
    (createApp()["app"] as VueApp).mount(app, GenUniApp())
}
open class UniAppConfig : io.dcloud.uniapp.appframe.AppConfig {
    override var name: String = "uniappdemo"
    override var appid: String = "__UNI__35453D1"
    override var versionName: String = "1.0.0"
    override var versionCode: String = "100"
    override var uniCompilerVersion: String = "5.07"
    constructor() : super() {}
}
fun definePageRoutes() {
    __uniRoutes.push(UniPageRoute(path = "pages/index/index", component = GenPagesIndexIndexClass, meta = UniPageMeta(isQuit = true), style = _uM("navigationBarTitleText" to "精选商品", "navigationBarBackgroundColor" to "#f6f1e8", "navigationBarTextStyle" to "black")))
    __uniRoutes.push(UniPageRoute(path = "pages/login/login", component = GenPagesLoginLoginClass, meta = UniPageMeta(isQuit = false), style = _uM("navigationBarTitleText" to "登录", "navigationBarBackgroundColor" to "#1f2c2a", "navigationBarTextStyle" to "white")))
}
val __uniLaunchPage: Map<String, Any?> = _uM("url" to "pages/index/index", "style" to _uM("navigationBarTitleText" to "精选商品", "navigationBarBackgroundColor" to "#f6f1e8", "navigationBarTextStyle" to "black"))
fun defineAppConfig() {
    __uniConfig.entryPagePath = "/pages/index/index"
    __uniConfig.globalStyle = _uM("navigationBarTextStyle" to "black", "navigationBarTitleText" to "uni-app-x demo", "navigationBarBackgroundColor" to "#f6f1e8", "backgroundColor" to "#f6f1e8")
    __uniConfig.getTabBarConfig = fun(): Map<String, Any>? {
        return null
    }
    __uniConfig.tabBar = __uniConfig.getTabBarConfig()
    __uniConfig.conditionUrl = ""
    __uniConfig.uniIdRouter = Map()
    __uniConfig.ready = true
}
open class GenUniApp : UniAppImpl() {
    open val vm: GenApp?
        get() {
            return getAppVm() as GenApp?
        }
    open val `$vm`: GenApp?
        get() {
            return getAppVm() as GenApp?
        }
}
fun getApp(): GenUniApp {
    return getUniApp() as GenUniApp
}
