import Vue from 'vue'
import App from './App.vue'
import { sync } from 'vuex-router-sync'
import router from './router'
import store from './store'
import './http'

sync(store, router)

import dateFilter from './filters/dateFilter'
Vue.filter('date', dateFilter)

import VueMdl from 'vue-mdl'
import 'material-design-lite'
Vue.use(VueMdl)

const app = new Vue({
    router,
    store,
    ...App
})

app.$mount('#app')

import moment from 'moment'
moment.locale('fr')

import Raven from 'raven-js';
import RavenVue from 'raven-js/plugins/vue';

if(process.env.NODE_ENV === "production") {
    Raven.config(process.env.SENTRY_DSN)
        .addPlugin(RavenVue, Vue)
        .install();
}
