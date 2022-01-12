<template>
<div>
  <Header></Header>
  <div class="blog">
    <el-link icon="el-icon-edit" v-if="isShowEditBtn">
      <router-link :to="{name: 'BlogEdit', params: {blogId: blog.id}}">
        编辑
      </router-link>
    </el-link>
    <div class="markdown-body" v-html="blog.content"></div>
  </div>
</div>
</template>

<script>
import Header from "@/components/Header"
import "github-markdown-css/github-markdown.css"
export default {
  name: "BlogDetail",
  components: {Header},
  data() {
    return {
      blog: {
        id: '',
        description: '',
        title: '',
        content: ''
      },
      isShowEditBtn: false
    }
  },
  created() {
    const blogId = this.$route.params.blogId
    const _this = this
    this.$axios.get(`/blog/${blogId}`).then(resp => {
      const blog = resp.data.data
      _this.blog.id = blog.id
      _this.blog.title = blog.title
      _this.blog.description = blog.description
      let MarkDownIt = require("markdown-it")
      let md = new MarkDownIt();
      _this.blog.content = md.render(blog.content)
      _this.isShowEditBtn = blog.userId === this.$store.getters.getUserInfo.id
    })
  }
}
</script>

<style scoped>
.blog {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  width: 100%;
  min-height: 700px;
  padding: 20px 15px;
}
</style>