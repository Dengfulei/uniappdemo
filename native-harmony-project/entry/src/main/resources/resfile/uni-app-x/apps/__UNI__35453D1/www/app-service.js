import "./assets/pages-json-uts.js";
import { _ as _sfc_main } from "./assets/App.js";
const { createSSRApp } = globalThis.Vue
const __global__ = typeof globalThis === "undefined" ? Function("return this")() : globalThis;
__global__.__uniX = true;
function createApp() {
  const app = createSSRApp(_sfc_main);
  return {
    app
  };
}
__global__.__mount__ = () => {
  createApp().app.mount("#app");
};
