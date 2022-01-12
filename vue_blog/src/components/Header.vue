<template>
<div class="content">
  <h3 v-if="isLogin">欢迎来到{{user.username}}的博客</h3>
  <h3 v-if="!isLogin">欢迎来到lyh博客</h3>
  <div class="block">
    <el-avatar :size="50" :src="user.avatar"></el-avatar>
    <div>{{user.username}}</div>
  </div>
  <div class="link">
    <span><el-link href="/blogs">主页</el-link></span>
    <el-divider direction="vertical"></el-divider>
    <span><el-link type="success" href="/blog/add">发表博客</el-link></span>
    <el-divider direction="vertical"></el-divider>
    <span v-if="!isLogin"><el-link type="primary" href="/login">登录</el-link></span>
    <span v-if="isLogin"><el-link type="danger" @click="logout">退出</el-link></span>
  </div>
</div>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      user: {
        username: '游客',
        avatar: 'https://joeschmoe.io/api/v1/random'
      },
      isLogin: false
    }
  },
  methods: {
    logout() {
      const _this = this
      this.$axios.get('/logout', {
        headers: {
          'Authorization': localStorage.getItem("token")
        }
      }).then(() => {
        _this.$store.commit("REMOVE_INFO")
        _this.$router.push("/login")
      })
    }
  },
  created() {
    if (this.$store.getters.getUserInfo.username) {
      this.user.username = this.$store.getters.getUserInfo.username
      this.user.avatar = this.$store.getters.getUserInfo.avatar
      this.isLogin = true
    }
  }
}
</script>

<style scoped>
.content {
  margin: 0 auto;
  max-width: 960px;
  text-align: center;
}
.link {
  margin: 10px 0;
}
</style>