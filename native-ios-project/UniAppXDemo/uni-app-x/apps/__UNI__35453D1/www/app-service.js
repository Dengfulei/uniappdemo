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
  const name = "nativeDemo";
  const moduleName = "native-demo";
  const moduleType = "";
  const errMsg = "";
  const is_uni_modules = true;
  const pkg = /* @__PURE__ */ initUTSPackageName(name, is_uni_modules);
  const cls = /* @__PURE__ */ initUTSIndexClassName(name, is_uni_modules);
  const getNativeDemoInfo = /* @__PURE__ */ initUTSProxyFunction(false, { moduleName, moduleType, errMsg, main: true, package: pkg, class: cls, name: "getNativeDemoInfoByJs", keepAlive: false, params: [], return: "" });
  const copyNativeDemoText = /* @__PURE__ */ initUTSProxyFunction(false, { moduleName, moduleType, errMsg, main: true, package: pkg, class: cls, name: "copyNativeDemoTextByJs", keepAlive: false, params: [{ "name": "text", "type": "string" }], return: "" });
  const openNativeAlbum = /* @__PURE__ */ initUTSProxyFunction(false, { moduleName, moduleType, errMsg, main: true, package: pkg, class: cls, name: "openNativeAlbumByJs", keepAlive: false, params: [{ "name": "callback", "type": "UTSCallback" }], return: "" });
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
        nativeDemoText: "点击按钮读取当前平台设备信息，并写入系统剪贴板。",
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
            name: "亚麻收纳篮--亚麻收纳篮-/亚麻收纳篮亚麻收纳篮亚麻收纳篮亚麻收纳篮亚麻收纳篮亚麻收纳篮",
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
      runNativeDemo() {
        const info = getNativeDemoInfo();
        const text = "".concat(info.systemName, " ").concat(info.systemVersion, " / ").concat(info.deviceName);
        const copied = copyNativeDemoText("uni-app x 调用 UTS 原生插件成功：".concat(text));
        this.nativeDemoText = copied ? "已调用 ".concat(info.platform, " 原生能力：").concat(text) : "已读取设备信息：".concat(text);
        uni.showToast({
          title: copied ? "原生插件调用成功" : "已读取设备信息",
          icon: "none"
        });
      },
      openNativeAlbumDemo() {
        const opened = openNativeAlbum((result = null) => {
          this.nativeDemoText = "".concat(result.message).concat(result.mediaType != "" ? "：".concat(result.mediaType) : "");
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
  const _style_0$1 = { "page-scroll": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "height": "100%", "backgroundColor": "#f6f1e8" } }, "page-content": { "": { "paddingTop": 24, "paddingRight": 18, "paddingBottom": 34, "paddingLeft": 18 } }, "topbar": { "": { "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between", "marginBottom": 18 } }, "eyebrow": { "": { "color": "#89704d", "fontSize": 11, "fontWeight": "700", "letterSpacing": 0 } }, "title": { "": { "marginTop": 4, "color": "#20302d", "fontSize": 30, "fontWeight": "700" } }, "login-button": { "": { "width": 74, "height": 38, "paddingTop": 0, "paddingRight": 0, "paddingBottom": 0, "paddingLeft": 0, "marginTop": 0, "marginRight": 0, "marginBottom": 0, "marginLeft": 0, "lineHeight": "38px", "borderTopLeftRadius": 19, "borderTopRightRadius": 19, "borderBottomRightRadius": 19, "borderBottomLeftRadius": 19, "backgroundColor": "#800080", "alignItems": "center", "justifyContent": "center" } }, "login-text": { "": { "width": "100%", "height": "100%", "lineHeight": "38px", "textAlign": "center", "color": "#f8f0df", "fontSize": 14, "fontWeight": "700" } }, "hero": { "": { "paddingTop": 20, "paddingRight": 20, "paddingBottom": 20, "paddingLeft": 20, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#20302d", "flexDirection": "row", "justifyContent": "space-between", "overflow": "hidden" } }, "hero-copy": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%" } }, "hero-kicker": { "": { "color": "#e6b866", "fontSize": 13, "fontWeight": "700" } }, "hero-title": { "": { "marginTop": 10, "color": "#fff8ec", "fontSize": 25, "lineHeight": "34px", "fontWeight": "700" } }, "hero-desc": { "": { "marginTop": 10, "color": "#bfd0c8", "fontSize": 13, "lineHeight": "20px" } }, "hero-badge": { "": { "width": 72, "height": 92, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#e6b866", "alignItems": "center", "justifyContent": "center" } }, "badge-value": { "": { "color": "#20302d", "fontSize": 34, "fontWeight": "700" } }, "badge-label": { "": { "color": "#20302d", "fontSize": 12, "fontWeight": "700" } }, "section-head": { "": { "marginTop": 26, "marginBottom": 12, "flexDirection": "row", "alignItems": "flex-end", "justifyContent": "space-between" } }, "section-title": { "": { "color": "#20302d", "fontSize": 20, "fontWeight": "700" } }, "section-note": { "": { "color": "#8a7a61", "fontSize": 12 } }, "native-demo": { "": { "marginBottom": 14, "paddingTop": 14, "paddingRight": 14, "paddingBottom": 14, "paddingLeft": 14, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#fffaf1", "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between", "boxShadow": "0 8px 18px rgba(36, 45, 41, 0.08)" } }, "native-demo-copy": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "paddingRight": 12 } }, "native-demo-actions": { "": { "width": 96 } }, "native-demo-title": { "": { "color": "#20302d", "fontSize": 16, "fontWeight": "700" } }, "native-demo-desc": { "": { "marginTop": 6, "color": "#70634e", "fontSize": 12, "lineHeight": "18px" } }, "native-demo-button": { "": { "width": 92, "height": 38, "lineHeight": "38px", "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#c46141", "alignItems": "center", "justifyContent": "center" } }, "native-demo-button-secondary": { "": { "marginTop": 8, "backgroundColor": "#20302d" } }, "native-demo-button-text": { "": { "color": "#fffaf1", "fontSize": 13, "fontWeight": "700", "lineHeight": "38px", "width": "100%", "height": "100%", "lines": 1, "textOverflow": "ellipsis" } }, "product-card": { "": { "marginBottom": 12, "paddingTop": 12, "paddingRight": 12, "paddingBottom": 12, "paddingLeft": 12, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#fffaf1", "flexDirection": "row", "boxShadow": "0 8px 18px rgba(36, 45, 41, 0.08)" } }, "product-art": { "": { "width": 76, "height": 86, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "alignItems": "center", "justifyContent": "center" } }, "product-emoji": { "": { "color": "#fffaf1", "fontSize": 30, "fontWeight": "700" } }, "product-info": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "marginLeft": 12, "justifyContent": "space-between" } }, "product-row": { "": { "flexDirection": "row", "justifyContent": "space-between", "alignItems": "flex-start" } }, "product-name": { "": { "width": 136, "color": "#20302d", "fontSize": 16, "fontWeight": "700", "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "lines": 1, "textOverflow": "ellipsis" } }, "product-price": { "": { "color": "#c46141", "fontSize": 16, "fontWeight": "700" } }, "product-desc": { "": { "marginTop": 7, "color": "#70634e", "fontSize": 12, "lineHeight": "18px" } }, "meta-row": { "": { "marginTop": 9, "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between" } }, "tag": { "": { "paddingTop": 4, "paddingRight": 9, "paddingBottom": 4, "paddingLeft": 9, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "color": "#20302d", "backgroundColor": "#ead9bb", "fontSize": 11, "fontWeight": "700" } }, "sold": { "": { "color": "#9b8a6f", "fontSize": 11 } } };
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
            vue.createElementVNode("text", { class: "native-demo-title" }, "UTS 原生插件"),
            vue.createElementVNode("text", { class: "native-demo-desc" }, vue.toDisplayString($data.nativeDemoText), 1)
          ]),
          vue.createElementVNode("view", { class: "native-demo-actions" }, [
            vue.createElementVNode("button", {
              class: "native-demo-button",
              onClick: _cache[1] || (_cache[1] = (...args) => $options.runNativeDemo && $options.runNativeDemo(...args))
            }, [
              vue.createElementVNode("text", { class: "native-demo-button-text" }, "调用插件")
            ]),
            vue.createElementVNode("button", {
              class: "native-demo-button native-demo-button-secondary",
              onClick: _cache[2] || (_cache[2] = (...args) => $options.openNativeAlbumDemo && $options.openNativeAlbumDemo(...args))
            }, [
              vue.createElementVNode("text", { class: "native-demo-button-text" }, "打开相册打开相册打开相册")
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
  const _style_0 = { "page": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "height": "100%", "backgroundColor": "#ead9bd" } }, "page-content": { "": { "paddingTop": 30, "paddingRight": 18, "paddingBottom": 24, "paddingLeft": 18 } }, "top-row": { "": { "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between" } }, "brand-panel": { "": { "paddingTop": 34 } }, "app-mark": { "": { "width": 58, "height": 58, "borderTopLeftRadius": 20, "borderTopRightRadius": 20, "borderBottomRightRadius": 20, "borderBottomLeftRadius": 20, "backgroundColor": "#213a34", "alignItems": "center", "justifyContent": "center", "boxShadow": "0 12px 24px rgba(33, 58, 52, 0.24)" } }, "app-mark-text": { "": { "color": "#e6b866", "fontSize": 29, "fontWeight": "700" } }, "mode-pill": { "": { "height": 34, "paddingLeft": 13, "paddingRight": 14, "borderTopLeftRadius": 17, "borderTopRightRadius": 17, "borderBottomRightRadius": 17, "borderBottomLeftRadius": 17, "backgroundColor": "#fff8ed", "flexDirection": "row", "alignItems": "center" } }, "mode-leaf": { "": { "width": 10, "height": 14, "marginRight": 7, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#7f955f" } }, "mode-text": { "": { "color": "#213a34", "fontSize": 12, "fontWeight": "700" } }, "brand-eyebrow": { "": { "color": "#c45f3d", "fontSize": 12, "fontWeight": "700", "letterSpacing": 0 } }, "brand-title": { "": { "marginTop": 12, "color": "#172623", "fontSize": 42, "lineHeight": "48px", "fontWeight": "700" } }, "brand-desc": { "": { "width": 286, "marginTop": 12, "color": "#776b5d", "fontSize": 15, "lineHeight": "24px" } }, "market-strip": { "": { "height": 126, "marginTop": 22, "flexDirection": "row", "alignItems": "flex-start" } }, "produce-card": { "": { "width": 108, "height": 108, "borderTopLeftRadius": 28, "borderTopRightRadius": 28, "borderBottomRightRadius": 28, "borderBottomLeftRadius": 28, "backgroundColor": "#fff8ed", "boxShadow": "0 16px 34px rgba(49, 37, 24, 0.13)" } }, "produce-card-one": { "": { "marginTop": 12 } }, "produce-card-two": { "": { "marginTop": 22, "marginLeft": -8 } }, "produce-card-three": { "": { "marginTop": 2, "marginLeft": -7 } }, "produce-dot": { "": { "borderTopLeftRadius": 99, "borderTopRightRadius": 99, "borderBottomRightRadius": 99, "borderBottomLeftRadius": 99 } }, "produce-dot-coral": { "": { "width": 42, "height": 42, "marginTop": 30, "marginLeft": 46, "backgroundColor": "#df8b61" } }, "produce-dot-green": { "": { "width": 30, "height": 30, "marginTop": -10, "marginLeft": 34, "backgroundColor": "#9dbb77" } }, "produce-dot-gold": { "": { "width": 30, "height": 30, "marginTop": -30, "marginLeft": 68, "backgroundColor": "#f0c565" } }, "produce-dot-pine": { "": { "width": 48, "height": 48, "marginTop": 32, "marginLeft": 42, "backgroundColor": "#6f8f84" } }, "produce-dot-tan": { "": { "width": 28, "height": 28, "marginTop": -6, "marginLeft": 36, "backgroundColor": "#d6a96b" } }, "produce-dot-dark": { "": { "width": 22, "height": 22, "marginTop": -28, "marginLeft": 76, "backgroundColor": "#2e524b" } }, "produce-dot-red": { "": { "width": 39, "height": 39, "marginTop": 28, "marginLeft": 48, "backgroundColor": "#c45f3d" } }, "produce-dot-olive": { "": { "width": 28, "height": 28, "marginTop": -9, "marginLeft": 38, "backgroundColor": "#7f955f" } }, "produce-dot-gold-large": { "": { "width": 38, "height": 38, "marginTop": -34, "marginLeft": 66, "backgroundColor": "#e4b762" } }, "form-panel": { "": { "marginTop": -8, "paddingTop": 10, "paddingRight": 22, "paddingBottom": 24, "paddingLeft": 22, "borderTopLeftRadius": 32, "borderTopRightRadius": 32, "borderBottomRightRadius": 32, "borderBottomLeftRadius": 32, "backgroundColor": "#fffaf1", "boxShadow": "0 -12px 34px rgba(54, 40, 24, 0.13)" } }, "sheet-handle": { "": { "width": 48, "height": 5, "marginBottom": 18, "marginLeft": "auto", "marginRight": "auto", "borderTopLeftRadius": 3, "borderTopRightRadius": 3, "borderBottomRightRadius": 3, "borderBottomLeftRadius": 3, "backgroundColor": "#d7c5aa" } }, "quick-account": { "": { "height": 62, "marginBottom": 18, "paddingLeft": 16, "paddingRight": 13, "borderTopLeftRadius": 22, "borderTopRightRadius": 22, "borderBottomRightRadius": 22, "borderBottomLeftRadius": 22, "backgroundColor": "#213a34", "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between" } }, "quick-copy": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%" } }, "quick-title": { "": { "color": "#fff8ec", "fontSize": 14, "fontWeight": "700" } }, "quick-detail": { "": { "marginTop": 4, "color": "#c9d8d1", "fontSize": 13 } }, "quick-action": { "": { "width": 48, "height": 34, "borderTopLeftRadius": 17, "borderTopRightRadius": 17, "borderBottomRightRadius": 17, "borderBottomLeftRadius": 17, "backgroundColor": "#e4b762", "color": "#172623", "fontSize": 13, "fontWeight": "700", "textAlign": "center", "lineHeight": "34px" } }, "field": { "": { "marginBottom": 12 } }, "label": { "": { "color": "#756857", "fontSize": 11, "fontWeight": "700" } }, "input-shell": { "": { "height": 58, "paddingLeft": 15, "paddingRight": 15, "borderTopLeftRadius": 21, "borderTopRightRadius": 21, "borderBottomRightRadius": 21, "borderBottomLeftRadius": 21, "backgroundColor": "#f2e4cf", "flexDirection": "row", "alignItems": "center" } }, "input-icon": { "": { "width": 32, "height": 32, "marginRight": 12, "borderTopLeftRadius": 16, "borderTopRightRadius": 16, "borderBottomRightRadius": 16, "borderBottomLeftRadius": 16, "backgroundColor": "#e3c99d", "color": "#213a34", "fontSize": 14, "fontWeight": "700", "textAlign": "center", "lineHeight": "32px" } }, "input-copy": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%" } }, "input": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "height": 32, "color": "#172623", "fontSize": 16, "fontWeight": "700" } }, "assist-row": { "": { "marginTop": 1, "marginBottom": 18, "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between" } }, "assist-text": { "": { "color": "#8a7d6c", "fontSize": 12, "fontWeight": "700" } }, "assist-link": { "": { "color": "#c45f3d", "fontSize": 12, "fontWeight": "700" } }, "submit-button": { "": { "height": 58, "borderTopLeftRadius": 29, "borderTopRightRadius": 29, "borderBottomRightRadius": 29, "borderBottomLeftRadius": 29, "backgroundColor": "#c45f3d", "alignItems": "center", "justifyContent": "center", "boxShadow": "0 14px 24px rgba(196, 95, 61, 0.26)" } }, "submit-text": { "": { "color": "#fffaf1", "fontSize": 17, "fontWeight": "700" } } };
  function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
    return vue.openBlock(), vue.createElementBlock("scroll-view", {
      class: "page",
      "scroll-y": true
    }, [
      vue.createElementVNode("view", { class: "page-content" }, [
        vue.createElementVNode("view", { class: "top-row" }, [
          vue.createElementVNode("view", { class: "app-mark" }, [
            vue.createElementVNode("text", { class: "app-mark-text" }, "M")
          ]),
          vue.createElementVNode("view", { class: "mode-pill" }, [
            vue.createElementVNode("view", { class: "mode-leaf" }),
            vue.createElementVNode("text", { class: "mode-text" }, "演示账号")
          ])
        ]),
        vue.createElementVNode("view", { class: "brand-panel" }, [
          vue.createElementVNode("text", { class: "brand-eyebrow" }, "SPRING MARKET"),
          vue.createElementVNode("text", { class: "brand-title" }, "欢迎回来"),
          vue.createElementVNode("text", { class: "brand-desc" }, "登录后继续浏览精选商品、原生能力与移动端购物体验。")
        ]),
        vue.createElementVNode("view", { class: "market-strip" }, [
          vue.createElementVNode("view", { class: "produce-card produce-card-one" }, [
            vue.createElementVNode("view", { class: "produce-dot produce-dot-coral" }),
            vue.createElementVNode("view", { class: "produce-dot produce-dot-green" }),
            vue.createElementVNode("view", { class: "produce-dot produce-dot-gold" })
          ]),
          vue.createElementVNode("view", { class: "produce-card produce-card-two" }, [
            vue.createElementVNode("view", { class: "produce-dot produce-dot-pine" }),
            vue.createElementVNode("view", { class: "produce-dot produce-dot-tan" }),
            vue.createElementVNode("view", { class: "produce-dot produce-dot-dark" })
          ]),
          vue.createElementVNode("view", { class: "produce-card produce-card-three" }, [
            vue.createElementVNode("view", { class: "produce-dot produce-dot-red" }),
            vue.createElementVNode("view", { class: "produce-dot produce-dot-olive" }),
            vue.createElementVNode("view", { class: "produce-dot produce-dot-gold-large" })
          ])
        ]),
        vue.createElementVNode("view", { class: "form-panel" }, [
          vue.createElementVNode("view", { class: "sheet-handle" }),
          vue.createElementVNode("view", {
            class: "quick-account",
            onClick: _cache[0] || (_cache[0] = (...args) => $options.fillDemo && $options.fillDemo(...args))
          }, [
            vue.createElementVNode("view", { class: "quick-copy" }, [
              vue.createElementVNode("text", { class: "quick-title" }, "测试帐号"),
              vue.createElementVNode("text", { class: "quick-detail" }, "admin / 123456")
            ]),
            vue.createElementVNode("text", { class: "quick-action" }, "填入")
          ]),
          vue.createElementVNode("view", { class: "field" }, [
            vue.createElementVNode("view", { class: "input-shell" }, [
              vue.createElementVNode("text", { class: "input-icon" }, "人"),
              vue.createElementVNode("view", { class: "input-copy" }, [
                vue.createElementVNode("text", { class: "label" }, "帐号"),
                vue.withDirectives(vue.createElementVNode("input", {
                  class: "input",
                  "onUpdate:modelValue": _cache[1] || (_cache[1] = ($event) => $data.username = $event),
                  placeholder: "请输入帐号"
                }, null, 512), [
                  [vue.vModelText, $data.username]
                ])
              ])
            ])
          ]),
          vue.createElementVNode("view", { class: "field" }, [
            vue.createElementVNode("view", { class: "input-shell" }, [
              vue.createElementVNode("text", { class: "input-icon" }, "锁"),
              vue.createElementVNode("view", { class: "input-copy" }, [
                vue.createElementVNode("text", { class: "label" }, "密码"),
                vue.withDirectives(vue.createElementVNode("input", {
                  class: "input",
                  "onUpdate:modelValue": _cache[2] || (_cache[2] = ($event) => $data.password = $event),
                  password: "true",
                  placeholder: "请输入密码"
                }, null, 512), [
                  [vue.vModelText, $data.password]
                ])
              ])
            ])
          ]),
          vue.createElementVNode("view", { class: "assist-row" }, [
            vue.createElementVNode("text", { class: "assist-text" }, "本地校验"),
            vue.createElementVNode("text", { class: "assist-link" }, "安全演示模式")
          ]),
          vue.createElementVNode("button", {
            class: "submit-button",
            onClick: _cache[3] || (_cache[3] = (...args) => $options.login && $options.login(...args))
          }, [
            vue.createElementVNode("text", { class: "submit-text" }, "立即登录")
          ])
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
