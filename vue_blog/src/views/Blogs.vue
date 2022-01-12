<template>
<div>
  <Header></Header>
  <div class="block">
    <el-timeline>
        <el-timeline-item :timestamp="blog.created" placement="top" v-for="(blog, index) in blogs" :key="index">
          <el-card>
            <h4>
              <router-link :to="{name: 'BlogDetail', params: {blogId: blog.id}}">
                {{blog.title}}
              </router-link>
            </h4>
            <p>{{blog.description}}</p>
          </el-card>
        </el-timeline-item>
      </el-timeline>
  </div>
  <el-pagination class="page"
                 background
                 layout="prev, pager, next"
                 :current-page="currentPage"
                 :page-size="pageSize"
                 :total="total"
                 @current-change="pageChange"
  >
  </el-pagination>
</div>
</template>

<script>
import Header from "@/components/Header"
export default {
  name: "Blogs",
  components: {Header},
  data() {
    return {
      blogs: [],
      currentPage: 1,
      total: 0,
      pageSize: 5
    }
  },
  methods: {
    pageChange(currentPage) {
      this.page(currentPage, this.pageSize)
    },
    page(currentPage, pageSize) {
      const _this = this
      this.$axios.get(`/blog/blogs?currentPage=${currentPage}&pageSize=${pageSize}`).then(resp => {
        _this.blogs = resp.data.data.records
        _this.currentPage = resp.data.data.current
        _this.total = resp.data.data.total
        _this.pageSize = resp.data.data.size
      })
    }
  },
  created() {
    this.page(1, 5)
  }
}
</script>

<style scoped>
.page {
  margin: 0 auto;
  text-align: center;
}
</style>