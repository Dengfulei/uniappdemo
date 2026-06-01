const { defineComponent, openBlock, createElementBlock, createElementVNode, Fragment, renderList, normalizeStyle, toDisplayString } = globalThis.Vue
import { _ as _export_sfc } from "../../plugin-vue-export-helper.js";
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
const _sfc_main = defineComponent({
  data() {
    return {
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
  methods: {
    goLogin() {
      uni.navigateTo({
        url: "/pages/login/login"
      });
    }
  }
});
const _style_0 = { "page-scroll": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "height": "100%", "backgroundColor": "#f6f1e8" } }, "page-content": { "": { "paddingTop": 24, "paddingRight": 18, "paddingBottom": 34, "paddingLeft": 18 } }, "topbar": { "": { "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between", "marginBottom": 18 } }, "eyebrow": { "": { "color": "#89704d", "fontSize": 11, "fontWeight": "700", "letterSpacing": 0 } }, "title": { "": { "marginTop": 4, "color": "#20302d", "fontSize": 30, "fontWeight": "700" } }, "login-button": { "": { "width": 74, "height": 38, "borderTopLeftRadius": 19, "borderTopRightRadius": 19, "borderBottomRightRadius": 19, "borderBottomLeftRadius": 19, "backgroundColor": "#20302d", "alignItems": "center", "justifyContent": "center" } }, "login-text": { "": { "color": "#f8f0df", "fontSize": 14, "fontWeight": "700" } }, "hero": { "": { "minHeight": 168, "paddingTop": 20, "paddingRight": 20, "paddingBottom": 20, "paddingLeft": 20, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#20302d", "flexDirection": "row", "justifyContent": "space-between", "overflow": "hidden" } }, "hero-copy": { "": { "width": 226 } }, "hero-kicker": { "": { "color": "#e6b866", "fontSize": 13, "fontWeight": "700" } }, "hero-title": { "": { "marginTop": 10, "color": "#fff8ec", "fontSize": 25, "lineHeight": "34px", "fontWeight": "700" } }, "hero-desc": { "": { "marginTop": 10, "color": "#bfd0c8", "fontSize": 13, "lineHeight": "20px" } }, "hero-badge": { "": { "width": 72, "height": 92, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#e6b866", "alignItems": "center", "justifyContent": "center" } }, "badge-value": { "": { "color": "#20302d", "fontSize": 34, "fontWeight": "700" } }, "badge-label": { "": { "color": "#20302d", "fontSize": 12, "fontWeight": "700" } }, "section-head": { "": { "marginTop": 26, "marginBottom": 12, "flexDirection": "row", "alignItems": "flex-end", "justifyContent": "space-between" } }, "section-title": { "": { "color": "#20302d", "fontSize": 20, "fontWeight": "700" } }, "section-note": { "": { "color": "#8a7a61", "fontSize": 12 } }, "product-card": { "": { "marginBottom": 12, "paddingTop": 12, "paddingRight": 12, "paddingBottom": 12, "paddingLeft": 12, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "backgroundColor": "#fffaf1", "flexDirection": "row", "boxShadow": "0 8px 18px rgba(36, 45, 41, 0.08)" } }, "product-art": { "": { "width": 76, "height": 86, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "alignItems": "center", "justifyContent": "center" } }, "product-emoji": { "": { "color": "#fffaf1", "fontSize": 30, "fontWeight": "700" } }, "product-info": { "": { "flexGrow": 1, "flexShrink": 1, "flexBasis": "0%", "marginLeft": 12, "justifyContent": "space-between" } }, "product-row": { "": { "flexDirection": "row", "justifyContent": "space-between", "alignItems": "flex-start" } }, "product-name": { "": { "width": 136, "color": "#20302d", "fontSize": 16, "fontWeight": "700" } }, "product-price": { "": { "color": "#c46141", "fontSize": 16, "fontWeight": "700" } }, "product-desc": { "": { "marginTop": 7, "color": "#70634e", "fontSize": 12, "lineHeight": "18px" } }, "meta-row": { "": { "marginTop": 9, "flexDirection": "row", "alignItems": "center", "justifyContent": "space-between" } }, "tag": { "": { "paddingTop": 4, "paddingRight": 9, "paddingBottom": 4, "paddingLeft": 9, "borderTopLeftRadius": 8, "borderTopRightRadius": 8, "borderBottomRightRadius": 8, "borderBottomLeftRadius": 8, "color": "#20302d", "backgroundColor": "#ead9bb", "fontSize": 11, "fontWeight": "700" } }, "sold": { "": { "color": "#9b8a6f", "fontSize": 11 } } };
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return openBlock(), createElementBlock("scroll-view", {
    class: "page-scroll",
    "scroll-y": true
  }, [
    createElementVNode("view", { class: "page-content" }, [
      createElementVNode("view", { class: "topbar" }, [
        createElementVNode("view", null, [
          createElementVNode("text", { class: "eyebrow" }, "SPRING MARKET"),
          createElementVNode("text", { class: "title" }, "今日好物")
        ]),
        createElementVNode("button", {
          class: "login-button",
          onClick: _cache[0] || (_cache[0] = (...args) => $options.goLogin && $options.goLogin(...args))
        }, [
          createElementVNode("text", { class: "login-text" }, "登录")
        ])
      ]),
      createElementVNode("view", { class: "hero" }, [
        createElementVNode("view", { class: "hero-copy" }, [
          createElementVNode("text", { class: "hero-kicker" }, "限时精选"),
          createElementVNode("text", { class: "hero-title" }, "把周末餐桌和日常补给一次配齐"),
          createElementVNode("text", { class: "hero-desc" }, "新鲜、轻量、适合移动端浏览的商品陈列示例。")
        ]),
        createElementVNode("view", { class: "hero-badge" }, [
          createElementVNode("text", { class: "badge-value" }, "8"),
          createElementVNode("text", { class: "badge-label" }, "件上新")
        ])
      ]),
      createElementVNode("view", { class: "section-head" }, [
        createElementVNode("text", { class: "section-title" }, "商品列表"),
        createElementVNode("text", { class: "section-note" }, "测试数据")
      ]),
      createElementVNode("view", { class: "product-list" }, [
        (openBlock(true), createElementBlock(Fragment, null, renderList($data.products, (item) => {
          return openBlock(), createElementBlock("view", {
            class: "product-card",
            key: item.id
          }, [
            createElementVNode("view", {
              class: "product-art",
              style: normalizeStyle({ backgroundColor: item.color })
            }, [
              createElementVNode("text", { class: "product-emoji" }, toDisplayString(item.icon), 1)
            ], 4),
            createElementVNode("view", { class: "product-info" }, [
              createElementVNode("view", { class: "product-row" }, [
                createElementVNode("text", { class: "product-name" }, toDisplayString(item.name), 1),
                createElementVNode("text", { class: "product-price" }, "¥" + toDisplayString(item.price), 1)
              ]),
              createElementVNode("text", { class: "product-desc" }, toDisplayString(item.desc), 1),
              createElementVNode("view", { class: "meta-row" }, [
                createElementVNode("text", { class: "tag" }, toDisplayString(item.tag), 1),
                createElementVNode("text", { class: "sold" }, "已售 " + toDisplayString(item.sold), 1)
              ])
            ])
          ]);
        }), 128))
      ])
    ])
  ]);
}
const index = /* @__PURE__ */ _export_sfc(_sfc_main, [["render", _sfc_render], ["styles", [_style_0]]]);
export {
  index as default
};
