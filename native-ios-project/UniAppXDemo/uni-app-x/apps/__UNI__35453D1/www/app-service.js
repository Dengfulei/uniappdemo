(function(vue) {
  "use strict";
  const { registerUTSInterface: registerUTSInterface$1, initUTSProxyClass: initUTSProxyClass$1, initUTSProxyFunction: initUTSProxyFunction$1, initUTSPackageName: initUTSPackageName$1, initUTSIndexClassName: initUTSIndexClassName$1, initUTSClassName: initUTSClassName$1 } = uni;
  const name$1 = "nativeBridge";
  const moduleName$1 = "native-bridge";
  const moduleType$1 = "";
  const errMsg$1 = "";
  const is_uni_modules$1 = true;
  const pkg$1 = /* @__PURE__ */ initUTSPackageName$1(name$1, is_uni_modules$1);
  const cls$1 = /* @__PURE__ */ initUTSIndexClassName$1(name$1, is_uni_modules$1);
  const openNativeBridge = /* @__PURE__ */ initUTSProxyFunction$1(false, { moduleName: moduleName$1, moduleType: moduleType$1, errMsg: errMsg$1, main: true, package: pkg$1, class: cls$1, name: "openNativeBridgeByJs", keepAlive: false, params: [{ "name": "options", "type": "UTSSDKModulesNativeBridgeNativeBridgeOptionsJSONObject" }], return: "" });
  const onNativeBridgeMessage = /* @__PURE__ */ initUTSProxyFunction$1(false, { moduleName: moduleName$1, moduleType: moduleType$1, errMsg: errMsg$1, main: true, package: pkg$1, class: cls$1, name: "onNativeBridgeMessageByJs", keepAlive: false, params: [{ "name": "callback", "type": "UTSCallback" }], return: "" });
  const offNativeBridgeMessage = /* @__PURE__ */ initUTSProxyFunction$1(false, { moduleName: moduleName$1, moduleType: moduleType$1, errMsg: errMsg$1, main: true, package: pkg$1, class: cls$1, name: "offNativeBridgeMessageByJs", keepAlive: false, params: [], return: "" });
  const { registerUTSInterface, initUTSProxyClass, initUTSProxyFunction, initUTSPackageName, initUTSIndexClassName, initUTSClassName } = uni;
  const name = "iosNativeDemo";
  const moduleName = "ios-native-demo";
  const moduleType = "";
  const errMsg = "";
  const is_uni_modules = true;
  const pkg = /* @__PURE__ */ initUTSPackageName(name, is_uni_modules);
  const cls = /* @__PURE__ */ initUTSIndexClassName(name, is_uni_modules);
  const getIosNativeDemoInfo = /* @__PURE__ */ initUTSProxyFunction(false, { moduleName, moduleType, errMsg, main: true, package: pkg, class: cls, name: "getIosNativeDemoInfoByJs", keepAlive: false, params: [], return: "" });
  const copyIosNativeDemoText = /* @__PURE__ */ initUTSProxyFunction(false, { moduleName, moduleType, errMsg, main: true, package: pkg, class: cls, name: "copyIosNativeDemoTextByJs", keepAlive: false, params: [{ "name": "text", "type": "string" }], return: "" });
  const openIosNativeAlbum = /* @__PURE__ */ initUTSProxyFunction(false, { moduleName, moduleType, errMsg, main: true, package: pkg, class: cls, name: "openIosNativeAlbumByJs", keepAlive: false, params: [{ "name": "callback", "type": "UTSCallback" }], return: "" });
  class Product extends UTS.UTSType {
    static get$UTSMetadata$() {
      return {
        kind: 2,
        get fields() {
          return {
            id: { type: Number, optional: false },
            name: { type: String, optional: false },
            price: { type: String, optional: false },
            desc: { type: String, optional: false },
            tag: { type: String, optional: false },
            sold: { type: Number, optional: false },
            icon: { type: String, optional: false },
            color: { type: String, optional: false }
          };
        }
      };
    }
    constructor(options, metadata = Product.get$UTSMetadata$(), isJSONParse = false) {
      super();
      this.__props__ = UTS.UTSType.initProps(options, metadata, isJSONParse);
      this.id = this.__props__.id;
      this.name = this.__props__.name;
      this.price = this.__props__.price;
      this.desc = this.__props__.desc;
      this.tag = this.__props__.tag;
      this.sold = this.__props__.sold;
      this.icon = this.__props__.icon;
      this.color = this.__props__.color;
      delete this.__props__;
    }
  }
  const _sfc_main$2 = vue.defineComponent({
    data() {
      return {
        iosNativeDemoText: "点击按钮读取 iOS 设备信息，并写入系统剪贴板。",
        products: [
          new Product({
            id: 1,
            name: "手冲咖啡豆",
            price: "68.00",
            desc: "浅烘焙，柑橘和蜂蜜香气，适合早晨醒脑。",
            tag: "饮品",
            sold: 238,
            icon: "☕",
            color: "#d9b07a"
          }),
          new Product({
            id: 2,
            name: "有机蓝莓盒",
            price: "36.90",
            desc: "酸甜均衡，可直接食用，也适合搭配酸奶。",
            tag: "水果",
            sold: 521,
            icon: "🫐",
            color: "#7d8fc8"
          }),
          new Product({
            id: 3,
            name: "山茶花洗护套装",
            price: "129.00",
            desc: "清爽花香，旅行和日常都能轻松收纳。",
            tag: "个护",
            sold: 96,
            icon: "✦",
            color: "#d9868c"
          }),
          new Product({
            id: 4,
            name: "轻食鸡胸沙拉",
            price: "24.50",
            desc: "高蛋白轻负担，午餐时段的稳妥选择。",
            tag: "轻食",
            sold: 314,
            icon: "🥗",
            color: "#91b77f"
          }),
          new Product({
            id: 5,
            name: "亚麻收纳篮",
            price: "45.00",
            desc: "柔软布面和硬挺边缘，适合桌面小物整理。",
            tag: "家居",
            sold: 185,
            icon: "▣",
            color: "#c49a68"
          }),
          new Product({
            id: 6,
            name: "便携香薰蜡烛",
            price: "59.00",
            desc: "雪松、无花果与干净皂感，睡前刚刚好。",
            tag: "香氛",
            sold: 127,
            icon: "◐",
            color: "#85a7a1"
          })
        ]
      };
    },
    onLoad() {
      onNativeBridgeMessage((message = null) => {
        this.handleNativeBridgeMessage(message);
      });
    },
    onUnload() {
      offNativeBridgeMessage();
    },
    methods: {
      goLogin() {
        uni.navigateTo({
          url: "/pages/login/login"
        });
      },
      goProductDetail(item) {
        const data = UTS.JSON.stringify(new UTSJSONObject({
          id: item.id,
          name: item.name,
          price: item.price,
          desc: item.desc,
          tag: item.tag,
          sold: item.sold,
          icon: item.icon,
          color: item.color
        }));
        const options = {
          methodName: "productDetail",
          data
        };
        openNativeBridge(options);
      },
      runIosNativeDemo() {
        const info = getIosNativeDemoInfo();
        const text = "".concat(info.systemName, " ").concat(info.systemVersion, " / ").concat(info.deviceName);
        const copied = copyIosNativeDemoText("uni-app x 调用 iOS UTS 插件成功：".concat(text));
        this.iosNativeDemoText = copied ? "已调用 iOS 原生能力：".concat(text) : "已读取设备信息：".concat(text);
        uni.showToast({
          title: copied ? "iOS 插件调用成功" : "已读取设备信息",
          icon: "none"
        });
      },
      openIosAlbumDemo() {
        const opened = openIosNativeAlbum((result = null) => {
          this.iosNativeDemoText = "".concat(result.message).concat(result.mediaType != "" ? "：".concat(result.mediaType) : "");
        });
        if (!opened) {
          uni.showToast({
            title: "相册不可用",
            icon: "none"
          });
          return null;
        }
        uni.showToast({
          title: "正在打开相册",
          icon: "none"
        });
      },
      handleNativeBridgeMessage(message = null) {
        if (message.methodName == "productNameTap") {
          uni.__log__("log", "at pages/index/index.uvue:216", "收到原生商品标题点击消息: ".concat(message.data));
          uni.showToast({
            title: "收到原生消息",
            icon: "none"
          });
          return null;
        }
        uni.__log__("log", "at pages/index/index.uvue:224", "收到原生消息: ".concat(message.methodName, ", data: ").concat(message.data));
      }
    }
  });
  const _style_0$1 = { "page-scroll": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "height": "100%", "backgroundColor": "#f6f1e8" } }, "page-content": { "": { "paddingTop": 24, "paddingRight": 18, "paddingBottom": 34, "paddingLeft": 18 } }, "topbar": { "": { "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between", "marginBottom": 18 } }, "eyebrow": { "": { "color": "#89704d", "fontSize": 11, "fontWeight": "700", "letterSpacing": 0 } }, "title": { "": { "marginTop": 4, "color": "#20302d", "fontSize": 30, "fontWeight": "700" } }, "login-button": { "": { "width": 74, "height": 38, "borderTopLeftRadius": 19, "borderTopRightRadius": 19, "borderBottomRightRadius": 19, "borderBottomLeftRadius": 19, "backgroundColor": "#20302d", "alignItems": "center", "justifyContent": "center" } }, "login-text": { "": { "color": "#f8f0df", "fontSize": 14, "fontWeight": "700" } }, "hero": { "": { "minHeight": 168, "paddingTop": 20, "paddingRight": 20, "paddingBottom": 20, "paddingLeft": 20, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#20302d", "flexDirection": "row", "justifyContent": "space-between", "overflow": "hidden" } }, "hero-copy": { "": { "width": 226 } }, "hero-kicker": { "": { "color": "#e6b866", "fontSize": 13, "fontWeight": "700" } }, "hero-title": { "": { "marginTop": 10, "color": "#fff8ec", "fontSize": 25, "lineHeight": "34px", "fontWeight": "700" } }, "hero-desc": { "": { "marginTop": 10, "color": "#bfd0c8", "fontSize": 13, "lineHeight": "20px" } }, "hero-badge": { "": { "width": 72, "height": 92, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#e6b866", "alignItems": "center", "justifyContent": "center" } }, "badge-value": { "": { "color": "#20302d", "fontSize": 34, "fontWeight": "700" } }, "badge-label": { "": { "color": "#20302d", "fontSize": 12, "fontWeight": "700" } }, "section-head": { "": { "marginTop": 26, "marginBottom": 12, "flexDirection": "row", "alignItems": "flex-end", "justifyContent": "space-between" } }, "section-title": { "": { "color": "#20302d", "fontSize": 20, "fontWeight": "700" } }, "section-note": { "": { "color": "#8a7a61", "fontSize": 12 } }, "native-demo": { "": { "marginBottom": 14, "paddingTop": 14, "paddingRight": 14, "paddingBottom": 14, "paddingLeft": 14, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#fffaf1", "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between", "boxShadow": "0 8px 18px rgba(36, 45, 41, 0.08)" } }, "native-demo-copy": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "paddingRight": 12 } }, "native-demo-actions": { "": { "width": 96 } }, "native-demo-title": { "": { "color": "#20302d", "fontSize": 16, "fontWeight": "700" } }, "native-demo-desc": { "": { "marginTop": 6, "color": "#70634e", "fontSize": 12, "lineHeight": "18px" } }, "native-demo-button": { "": { "width": 92, "height": 38, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#c46141", "alignItems": "center", "justifyContent": "center" } }, "native-demo-button-secondary": { "": { "marginTop": 8, "backgroundColor": "#20302d" } }, "native-demo-button-text": { "": { "color": "#fffaf1", "fontSize": 13, "fontWeight": "700" } }, "product-card": { "": { "marginBottom": 12, "paddingTop": 12, "paddingRight": 12, "paddingBottom": 12, "paddingLeft": 12, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#fffaf1", "flexDirection": "row", "boxShadow": "0 8px 18px rgba(36, 45, 41, 0.08)" } }, "product-art": { "": { "width": 76, "height": 86, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "alignItems": "center", "justifyContent": "center" } }, "product-emoji": { "": { "color": "#fffaf1", "fontSize": 30, "fontWeight": "700" } }, "product-info": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "marginLeft": 12, "justifyContent": "space-between" } }, "product-row": { "": { "flexDirection": "row", "justifyContent": "space-between", "alignItems": "flex-start" } }, "product-name": { "": { "width": 136, "color": "#20302d", "fontSize": 16, "fontWeight": "700" } }, "product-price": { "": { "color": "#c46141", "fontSize": 16, "fontWeight": "700" } }, "product-desc": { "": { "marginTop": 7, "color": "#70634e", "fontSize": 12, "lineHeight": "18px" } }, "meta-row": { "": { "marginTop": 9, "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between" } }, "tag": { "": { "paddingTop": 4, "paddingRight": 9, "paddingBottom": 4, "paddingLeft": 9, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "color": "#20302d", "backgroundColor": "#ead9bb", "fontSize": 11, "fontWeight": "700" } }, "sold": { "": { "color": "#9b8a6f", "fontSize": 11 } } };
  const _export_sfc = (sfc, props) => {
    const target = sfc.__vccOpts || sfc;
    for (const [key, val] of props) {
      target[key] = val;
    }
    return target;
  };
  function _sfc_render$1(_ctx, _cache, $props, $setup, $data, $options) {
    return vue.openBlock(), vue.createElementBlock("scroll-view", {
      class: "page-scroll",
      "scroll-y": true
    }, [
      vue.createElementVNode("view", { class: "page-content" }, [
        vue.createElementVNode("view", { class: "topbar" }, [
          vue.createElementVNode("view", null, [
            vue.createElementVNode("text", { class: "eyebrow" }, "SPRING MARKET"),
            vue.createElementVNode("text", { class: "title" }, "今日好物")
          ]),
          vue.createElementVNode("button", {
            class: "login-button",
            onClick: _cache[0] || (_cache[0] = (...args) => $options.goLogin && $options.goLogin(...args))
          }, [
            vue.createElementVNode("text", { class: "login-text" }, "登录")
          ])
        ]),
        vue.createElementVNode("view", { class: "hero" }, [
          vue.createElementVNode("view", { class: "hero-copy" }, [
            vue.createElementVNode("text", { class: "hero-kicker" }, "限时精选"),
            vue.createElementVNode("text", { class: "hero-title" }, "把周末餐桌和日常补给一次配齐"),
            vue.createElementVNode("text", { class: "hero-desc" }, "新鲜、轻量、适合移动端浏览的商品陈列示例。")
          ]),
          vue.createElementVNode("view", { class: "hero-badge" }, [
            vue.createElementVNode("text", { class: "badge-value" }, "8"),
            vue.createElementVNode("text", { class: "badge-label" }, "件上新")
          ])
        ]),
        vue.createElementVNode("view", { class: "section-head" }, [
          vue.createElementVNode("text", { class: "section-title" }, "商品列表"),
          vue.createElementVNode("text", { class: "section-note" }, "测试数据")
        ]),
        vue.createElementVNode("view", { class: "native-demo" }, [
          vue.createElementVNode("view", { class: "native-demo-copy" }, [
            vue.createElementVNode("text", { class: "native-demo-title" }, "iOS UTS 原生插件"),
            vue.createElementVNode("text", { class: "native-demo-desc" }, vue.toDisplayString($data.iosNativeDemoText), 1)
          ]),
          vue.createElementVNode("view", { class: "native-demo-actions" }, [
            vue.createElementVNode("button", {
              class: "native-demo-button",
              onClick: _cache[1] || (_cache[1] = (...args) => $options.runIosNativeDemo && $options.runIosNativeDemo(...args))
            }, [
              vue.createElementVNode("text", { class: "native-demo-button-text" }, "调用插件")
            ]),
            vue.createElementVNode("button", {
              class: "native-demo-button native-demo-button-secondary",
              onClick: _cache[2] || (_cache[2] = (...args) => $options.openIosAlbumDemo && $options.openIosAlbumDemo(...args))
            }, [
              vue.createElementVNode("text", { class: "native-demo-button-text" }, "打开相册")
            ])
          ])
        ]),
        vue.createElementVNode("view", { class: "product-list" }, [
          (vue.openBlock(true), vue.createElementBlock(vue.Fragment, null, vue.renderList($data.products, (item) => {
            return vue.openBlock(), vue.createElementBlock("view", {
              class: "product-card",
              key: item.id,
              onClick: ($event) => $options.goProductDetail(item)
            }, [
              vue.createElementVNode("view", {
                class: "product-art",
                style: vue.normalizeStyle({ backgroundColor: item.color })
              }, [
                vue.createElementVNode("text", { class: "product-emoji" }, vue.toDisplayString(item.icon), 1)
              ], 4),
              vue.createElementVNode("view", { class: "product-info" }, [
                vue.createElementVNode("view", { class: "product-row" }, [
                  vue.createElementVNode("text", { class: "product-name" }, vue.toDisplayString(item.name), 1),
                  vue.createElementVNode("text", { class: "product-price" }, "¥" + vue.toDisplayString(item.price), 1)
                ]),
                vue.createElementVNode("text", { class: "product-desc" }, vue.toDisplayString(item.desc), 1),
                vue.createElementVNode("view", { class: "meta-row" }, [
                  vue.createElementVNode("text", { class: "tag" }, vue.toDisplayString(item.tag), 1),
                  vue.createElementVNode("text", { class: "sold" }, "已售 " + vue.toDisplayString(item.sold), 1)
                ])
              ])
            ], 8, ["onClick"]);
          }), 128))
        ])
      ])
    ]);
  }
  const PagesIndexIndex = /* @__PURE__ */ _export_sfc(_sfc_main$2, [["render", _sfc_render$1], ["styles", [_style_0$1]]]);
  const _sfc_main$1 = vue.defineComponent({
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
    return vue.openBlock(), vue.createElementBlock("view", { class: "page" }, [
      vue.createElementVNode("view", { class: "brand-panel" }, [
        vue.createElementVNode("text", { class: "brand-eyebrow" }, "DEMO ACCOUNT"),
        vue.createElementVNode("text", { class: "brand-title" }, "欢迎回来"),
        vue.createElementVNode("text", { class: "brand-desc" }, "使用下方测试帐号即可完成登录校验。")
      ]),
      vue.createElementVNode("view", { class: "form-panel" }, [
        vue.createElementVNode("view", { class: "field" }, [
          vue.createElementVNode("text", { class: "label" }, "帐号"),
          vue.withDirectives(vue.createElementVNode("input", {
            class: "input",
            "onUpdate:modelValue": _cache[0] || (_cache[0] = ($event) => $data.username = $event),
            placeholder: "请输入帐号"
          }, null, 512), [
            [vue.vModelText, $data.username]
          ])
        ]),
        vue.createElementVNode("view", { class: "field" }, [
          vue.createElementVNode("text", { class: "label" }, "密码"),
          vue.withDirectives(vue.createElementVNode("input", {
            class: "input",
            "onUpdate:modelValue": _cache[1] || (_cache[1] = ($event) => $data.password = $event),
            password: "true",
            placeholder: "请输入密码"
          }, null, 512), [
            [vue.vModelText, $data.password]
          ])
        ]),
        vue.createElementVNode("view", { class: "test-card" }, [
          vue.createElementVNode("text", { class: "test-title" }, "测试帐号"),
          vue.createElementVNode("text", { class: "test-line" }, "帐号：admin"),
          vue.createElementVNode("text", { class: "test-line" }, "密码：123456")
        ]),
        vue.createElementVNode("button", {
          class: "submit-button",
          onClick: _cache[2] || (_cache[2] = (...args) => $options.login && $options.login(...args))
        }, [
          vue.createElementVNode("text", { class: "submit-text" }, "登录")
        ]),
        vue.createElementVNode("button", {
          class: "ghost-button",
          onClick: _cache[3] || (_cache[3] = (...args) => $options.fillDemo && $options.fillDemo(...args))
        }, [
          vue.createElementVNode("text", { class: "ghost-text" }, "填入测试帐号")
        ])
      ])
    ]);
  }
  const PagesLoginLogin = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["render", _sfc_render], ["styles", [_style_0]]]);
  __definePage("pages/index/index", PagesIndexIndex);
  __definePage("pages/login/login", PagesLoginLogin);
  const _sfc_main = vue.defineComponent({
    onLaunch: function() {
      uni.__log__("log", "at App.uvue:4", "App Launch");
    },
    onShow: function() {
      uni.__log__("log", "at App.uvue:7", "App Show");
    },
    onHide: function() {
      uni.__log__("log", "at App.uvue:10", "App Hide");
    }
  });
  const __global__ = typeof globalThis === "undefined" ? Function("return this")() : globalThis;
  __global__.__uniX = true;
  function createApp() {
    const app = vue.createSSRApp(_sfc_main);
    return {
      app
    };
  }
  createApp().app.mount("#app");
})(Vue);
