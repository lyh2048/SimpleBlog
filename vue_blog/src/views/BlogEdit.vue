<template>
<div>
  <Header></Header>
  <div class="content">
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="标题" prop="title">
        <el-input v-model="ruleForm.title"></el-input>
      </el-form-item>
      <el-form-item label="摘要" prop="description">
        <el-input v-model="ruleForm.description"></el-input>
      </el-form-item>
      <el-form-item label="内容" prop="content">
        <mavon-editor v-model="ruleForm.content"></mavon-editor>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">发表</el-button>
        <el-button @click="resetForm('ruleForm')">清空</el-button>
      </el-form-item>
    </el-form>
  </div>
</div>
</template>

<script>
import Header from "@/components/Header"
export default {
  name: "BlogEdit",
  components: {Header},
  data() {
    return {
      ruleForm: {
        id: '',
        title: '',
        description: '',
        content: ''
      },
      rules: {
        title: [
          { required: true, message: '请输入标题', trigger: 'blur' },
          { min: 3, max: 25, message: '长度在 3 到 25 个字符', trigger: 'blur' }
        ],
        description: [
          { required: true, message: '请输入摘要', trigger: 'blur' },
          { min: 3, max: 50, message: '长度在 3 到 50 个字符', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输入内容', trigger: 'blur' },
        ]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          const _this = this
          this.$axios.post('/blog/addOrEdit', this.ruleForm, {
            headers: {
              'Authorization': localStorage.getItem("token")
            }
          }).then(resp => {
            this.$alert('操作成功', '提示', {
              confirmButtonText: '确定',
              callback: () => {
                _this.$router.push("/blogs")
              }
            })
          })
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  },
  created() {
    const blogId = this.$route.params.blogId
    const _this = this
    if (blogId) {
      this.$axios.get(`/blog/${blogId}`).then(resp => {
        const blog = resp.data.data
        _this.ruleForm.id = blog.id
        _this.ruleForm.title = blog.title
        _this.ruleForm.description = blog.description
        _this.ruleForm.content = blog.content
      })
    }
  }
}
</script>

<style scoped>
.content {
  text-align: center;
}
</style>