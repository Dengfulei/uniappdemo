const { defineComponent } = globalThis.Vue
const _sfc_main = defineComponent({
  onLaunch: function() {
    uni.__f__("log", "at App.uvue:4", "App Launch");
  },
  onShow: function() {
    uni.__f__("log", "at App.uvue:7", "App Show");
  },
  onHide: function() {
    uni.__f__("log", "at App.uvue:10", "App Hide");
  }
});
export {
  _sfc_main as _
};
