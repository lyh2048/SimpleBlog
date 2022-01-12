import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import axios from 'axios'
import { Message } from 'element-ui'
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'


Vue.use(Element)
Vue.use(mavonEditor)
Vue.config.productionTip = false
Vue.prototype.$message = Message
axios.defaults.baseURL = 'http://47.94.46.65:8084'
axios.interceptors.request.use(config => {
  return config
})
axios.interceptors.response.use(response => {
  let res = response.data
  if (res.code === 200) {
    return response
  } else {
    Element.Message.error(res.msg)
    return Promise.reject(res.msg)
  }
}, err => {
  console.log(err)
  if (err.response.data) {
    err.message = err.response.data.msg
  }
  if (err.response.status === 401) {
    store.commit("REMOVE_INFO")
    router.push("/login")
  }
  Element.Message.error(err.message)
  return Promise.reject(err)
})
router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requireAuth)) {
    const token = localStorage.getItem("token")
    if (token) {
      if (to.path !== '/login') {
        next()
      }
    } else {
      next({path: '/login'})
    }
  } else {
    next()
  }
})
Vue.prototype.$axios = axios

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
