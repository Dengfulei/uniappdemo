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
import io.dcloud.uniapp.extapi.navigateBack as uni_navigateBack
import io.dcloud.uniapp.extapi.showToast as uni_showToast
open class GenPagesLoginLogin : BasePage {
    constructor(__ins: ComponentInternalInstance, __renderer: String?) : super(__ins, __renderer) {}
    @Suppress("UNUSED_PARAMETER", "UNUSED_VARIABLE")
    override fun `$render`(): Any? {
        val _ctx = this
        val _cache = this.`$`.renderCache
        return _cE("view", _uM("class" to "page"), _uA(
            _cE("view", _uM("class" to "brand-panel"), _uA(
                _cE("text", _uM("class" to "brand-eyebrow"), "DEMO ACCOUNT"),
                _cE("text", _uM("class" to "brand-title"), "欢迎回来"),
                _cE("text", _uM("class" to "brand-desc"), "使用下方测试帐号即可完成登录校验。")
            )),
            _cE("view", _uM("class" to "form-panel"), _uA(
                _cE("view", _uM("class" to "field"), _uA(
                    _cE("text", _uM("class" to "label"), "帐号"),
                    _cE("input", _uM("class" to "input", "modelValue" to _ctx.username, "onInput" to fun(`$event`: UniInputEvent){
                        _ctx.username = `$event`.detail.value
                    }
                    , "placeholder" to "请输入帐号"), null, 40, _uA(
                        "modelValue",
                        "onInput"
                    ))
                )),
                _cE("view", _uM("class" to "field"), _uA(
                    _cE("text", _uM("class" to "label"), "密码"),
                    _cE("input", _uM("class" to "input", "modelValue" to _ctx.password, "onInput" to fun(`$event`: UniInputEvent){
                        _ctx.password = `$event`.detail.value
                    }
                    , "password" to "true", "placeholder" to "请输入密码"), null, 40, _uA(
                        "modelValue",
                        "onInput"
                    ))
                )),
                _cE("view", _uM("class" to "test-card"), _uA(
                    _cE("text", _uM("class" to "test-title"), "测试帐号"),
                    _cE("text", _uM("class" to "test-line"), "帐号：admin"),
                    _cE("text", _uM("class" to "test-line"), "密码：123456")
                )),
                _cE("button", _uM("class" to "submit-button", "onClick" to _ctx.login), _uA(
                    _cE("text", _uM("class" to "submit-text"), "登录")
                ), 8, _uA(
                    "onClick"
                )),
                _cE("button", _uM("class" to "ghost-button", "onClick" to _ctx.fillDemo), _uA(
                    _cE("text", _uM("class" to "ghost-text"), "填入测试帐号")
                ), 8, _uA(
                    "onClick"
                ))
            ))
        ))
    }
    open var username: String by `$data`
    open var password: String by `$data`
    @Suppress("USELESS_CAST")
    override fun data(): Map<String, Any?> {
        return _uM("username" to "admin", "password" to "123456")
    }
    open var fillDemo = ::gen_fillDemo_fn
    open fun gen_fillDemo_fn() {
        this.username = "admin"
        this.password = "123456"
    }
    open var login = ::gen_login_fn
    open fun gen_login_fn() {
        if (this.username == "admin" && this.password == "123456") {
            uni_showToast(ShowToastOptions(title = "登录成功", icon = "success"))
            setTimeout(fun(){
                uni_navigateBack(null)
            }, 800)
        } else {
            uni_showToast(ShowToastOptions(title = "帐号或密码错误", icon = "none"))
        }
    }
    companion object {
        val styles: Map<String, Map<String, Map<String, Any>>> by lazy {
            _nCS(_uA(
                styles0
            ))
        }
        val styles0: Map<String, Map<String, Map<String, Any>>>
            get() {
                return _uM("page" to _pS(_uM("flexGrow" to 1, "flexShrink" to 1, "flexBasis" to "0%", "paddingTop" to 30, "paddingRight" to 18, "paddingBottom" to 30, "paddingLeft" to 18, "backgroundColor" to "#1f2c2a")), "brand-panel" to _pS(_uM("paddingTop" to 18, "paddingBottom" to 26)), "brand-eyebrow" to _pS(_uM("color" to "#e6b866", "fontSize" to 12, "fontWeight" to "700", "letterSpacing" to 0)), "brand-title" to _pS(_uM("marginTop" to 10, "color" to "#fff7e6", "fontSize" to 34, "fontWeight" to "700")), "brand-desc" to _pS(_uM("marginTop" to 10, "color" to "#b9cbc3", "fontSize" to 14, "lineHeight" to "22px")), "form-panel" to _pS(_uM("paddingTop" to 18, "paddingRight" to 18, "paddingBottom" to 18, "paddingLeft" to 18, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#fffaf1")), "field" to _pS(_uM("marginBottom" to 16)), "label" to _pS(_uM("marginBottom" to 8, "color" to "#20302d", "fontSize" to 13, "fontWeight" to "700")), "input" to _pS(_uM("height" to 48, "paddingTop" to 0, "paddingRight" to 14, "paddingBottom" to 0, "paddingLeft" to 14, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#f1e7d4", "color" to "#20302d", "fontSize" to 15)), "test-card" to _pS(_uM("marginTop" to 2, "marginBottom" to 18, "paddingTop" to 12, "paddingRight" to 12, "paddingBottom" to 12, "paddingLeft" to 12, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#e8d2a6")), "test-title" to _pS(_uM("color" to "#20302d", "fontSize" to 14, "fontWeight" to "700")), "test-line" to _pS(_uM("marginTop" to 5, "color" to "#5d4f3c", "fontSize" to 13)), "submit-button" to _pS(_uM("height" to 50, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#c46141", "alignItems" to "center", "justifyContent" to "center")), "submit-text" to _pS(_uM("color" to "#fffaf1", "fontSize" to 16, "fontWeight" to "700")), "ghost-button" to _pS(_uM("height" to 46, "marginTop" to 12, "borderTopLeftRadius" to 8, "borderTopRightRadius" to 8, "borderBottomRightRadius" to 8, "borderBottomLeftRadius" to 8, "backgroundColor" to "#20302d", "alignItems" to "center", "justifyContent" to "center")), "ghost-text" to _pS(_uM("color" to "#fffaf1", "fontSize" to 14, "fontWeight" to "700")))
            }
        var inheritAttrs = true
        var inject: Map<String, Map<String, Any?>> = _uM()
        var emits: Map<String, Any?> = _uM()
        var props = _nP(_uM())
        var propsNeedCastKeys: UTSArray<String> = _uA()
        var components: Map<String, CreateVueComponent> = _uM()
    }
}
