import Vue from "vue";

import items from "./components/items";
import detail from "./components/details";
Vue.component("items", items);
Vue.component("detail", detail);
new Vue({}).$mount("#auctionsystem-app");
