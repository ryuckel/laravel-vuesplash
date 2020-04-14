require("./bootstrap");
import Vue from "vue";
import store from "./store";
import router from "./router";
// ルートコンポーネントをインポートする
import App from "./App.vue";

new Vue({
  el: "#app",
  router,
  store,
  components: { App },
  template: "<App />"
});
