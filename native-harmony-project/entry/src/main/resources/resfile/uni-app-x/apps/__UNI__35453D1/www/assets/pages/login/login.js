const { defineComponent, openBlock, createElementBlock, createElementVNode, withDirectives, vModelText } = globalThis.Vue
import { _ as _export_sfc } from "../../plugin-vue-export-helper.js";
const _sfc_main = defineComponent({
  data() {
    return {
      username: "admin",
      password: "123456"
    };
  },
  methods: {
    fillDemo() {
      this.username = "admin";
      this.password = "123456";
    },
    login() {
      if (this.username == "admin" && this.password == "123456") {
        uni.showToast({
          title: "登录成功",
          icon: "success"
        });
        setTimeout(() => {
          uni.navigateBack();
        }, 800);
      } else {
        uni.showToast({
          title: "帐号或密码错误",
          icon: "none"
        });
      }
    }
  }
});
const _style_0 = { "page": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "paddingTop": 30, "paddingRight": 18, "paddingBottom": 30, "paddingLeft": 18, "backgroundColor": "#1f2c2a" } }, "brand-panel": { "": { "paddingTop": 18, "paddingBottom": 26 } }, "brand-eyebrow": { "": { "color": "#e6b866", "fontSize": 12, "fontWeight": "700", "letterSpacing": 0 } }, "brand-title": { "": { "marginTop": 10, "color": "#fff7e6", "fontSize": 34, "fontWeight": "700" } }, "brand-desc": { "": { "marginTop": 10, "color": "#b9cbc3", "fontSize": 14, "lineHeight": "22px" } }, "form-panel": { "": { "paddingTop": 18, "paddingRight": 18, "paddingBottom": 18, "paddingLeft": 18, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#fffaf1" } }, "field": { "": { "marginBottom": 16 } }, "label": { "": { "marginBottom": 8, "color": "#20302d", "fontSize": 13, "fontWeight": "700" } }, "input": { "": { "height": 48, "paddingTop": 0, "paddingRight": 14, "paddingBottom": 0, "paddingLeft": 14, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#f1e7d4", "color": "#20302d", "fontSize": 15 } }, "test-card": { "": { "marginTop": 2, "marginBottom": 18, "paddingTop": 12, "paddingRight": 12, "paddingBottom": 12, "paddingLeft": 12, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#e8d2a6" } }, "test-title": { "": { "color": "#20302d", "fontSize": 14, "fontWeight": "700" } }, "test-line": { "": { "marginTop": 5, "color": "#5d4f3c", "fontSize": 13 } }, "submit-button": { "": { "height": 50, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#c46141", "alignItems": "center", "justifyContent": "center" } }, "submit-text": { "": { "color": "#fffaf1", "fontSize": 16, "fontWeight": "700" } }, "ghost-button": { "": { "height": 46, "marginTop": 12, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#20302d", "alignItems": "center", "justifyContent": "center" } }, "ghost-text": { "": { "color": "#fffaf1", "fontSize": 14, "fontWeight": "700" } } };
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return openBlock(), createElementBlock("view", { class: "page" }, [
    createElementVNode("view", { class: "brand-panel" }, [
      createElementVNode("text", { class: "brand-eyebrow" }, "DEMO ACCOUNT"),
      createElementVNode("text", { class: "brand-title" }, "欢迎回来"),
      createElementVNode("text", { class: "brand-desc" }, "使用下方测试帐号即可完成登录校验。")
    ]),
    createElementVNode("view", { class: "form-panel" }, [
      createElementVNode("view", { class: "field" }, [
        createElementVNode("text", { class: "label" }, "帐号"),
        withDirectives(createElementVNode("input", {
          class: "input",
          "onUpdate:modelValue": _cache[0] || (_cache[0] = ($event) => $data.username = $event),
          placeholder: "请输入帐号"
        }, null, 512), [
          [vModelText, $data.username]
        ])
      ]),
      createElementVNode("view", { class: "field" }, [
        createElementVNode("text", { class: "label" }, "密码"),
        withDirectives(createElementVNode("input", {
          class: "input",
          "onUpdate:modelValue": _cache[1] || (_cache[1] = ($event) => $data.password = $event),
          password: "true",
          placeholder: "请输入密码"
        }, null, 512), [
          [vModelText, $data.password]
        ])
      ]),
      createElementVNode("view", { class: "test-card" }, [
        createElementVNode("text", { class: "test-title" }, "测试帐号"),
        createElementVNode("text", { class: "test-line" }, "帐号：admin"),
        createElementVNode("text", { class: "test-line" }, "密码：123456")
      ]),
      createElementVNode("button", {
        class: "submit-button",
        onClick: _cache[2] || (_cache[2] = (...args) => $options.login && $options.login(...args))
      }, [
        createElementVNode("text", { class: "submit-text" }, "登录")
      ]),
      createElementVNode("button", {
        class: "ghost-button",
        onClick: _cache[3] || (_cache[3] = (...args) => $options.fillDemo && $options.fillDemo(...args))
      }, [
        createElementVNode("text", { class: "ghost-text" }, "填入测试帐号")
      ])
    ])
  ]);
}
const login = /* @__PURE__ */ _export_sfc(_sfc_main, [["render", _sfc_render], ["styles", [_style_0]]]);
export {
  login as default
};
