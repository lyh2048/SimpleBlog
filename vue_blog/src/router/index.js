import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
    redirect: {name: 'Blogs'}
  },
  {
    path: '/blogs',
    name: 'Blogs',
    component: () => import(/* webpackChunkName: "about" */ '../views/Blogs.vue')
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import(/* webpackChunkName: "about" */ '../views/Login.vue')
  },
  {
    path: '/blog/add',
    name: 'BlogAdd',
    meta: {
      requireAuth: true
    },
    component: () => import(/* webpackChunkName: "about" */ '../views/BlogEdit.vue')
  },
  {
    path: '/blog/:blogId',
    name: 'BlogDetail',
    component: () => import(/* webpackChunkName: "about" */ '../views/BlogDetail.vue')
  },
  {
    path: '/blog/:blogId/edit',
    name: 'BlogEdit',
    meta: {
      requireAuth: true
    },
    component: () => import(/* webpackChunkName: "about" */ '../views/BlogEdit.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
