<template>
<div>
  <el-container>
    <el-header>
      <img src="@/assets/logo.png" alt="logo" class="logo" />
    </el-header>
    <el-main>
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="ruleForm.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input type="password" v-model="ruleForm.password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">登录</el-button>
          <el-button @click="resetForm('ruleForm')">清空</el-button>
        </el-form-item>
      </el-form>
    </el-main>
  </el-container>
</div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      ruleForm: {
        username: 'lyh',
        password: '111111'
      },
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, max: 18, message: '长度在 6 到 18 个字符', trigger: 'blur' }
        ]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          const _this = this
          this.$axios.post('/login', this.ruleForm).then(resp => {
            const token = resp.headers['authorization']
            const userInfo = resp.data.data
            _this.$store.commit("SET_TOKEN", token)
            _this.$store.commit("SET_USER_INFO", userInfo)
            _this.$router.push("/blogs")
          })
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
}
</script>

<style scoped>
.el-main {
  color: #333;
  text-align: center;
  line-height: 160px;
}
.el-header {
  background-color: #B3C0D1;
  color: #333;
  text-align: center;
  line-height: 60px;
}
body > .el-container {
  margin-bottom: 40px;
}
.logo {
  height: 60%;
  margin-top: 15px;
}
.demo-ruleForm {
  max-width: 500px;
  margin: 0 auto;
}
</style>