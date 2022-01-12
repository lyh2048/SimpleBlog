/*
 Navicat Premium Data Transfer

 Source Server         : mysql5
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : simple_blog

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 11/01/2022 21:17:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_blog
-- ----------------------------
DROP TABLE IF EXISTS `m_blog`;
CREATE TABLE `m_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_blog
-- ----------------------------
INSERT INTO `m_blog` VALUES (11, 1, 'Spring Boot跨域问题', '解决Spring Boot跨域问题', '# Spring Boot跨域问题\n```java\npackage com.example.config;\n\nimport org.springframework.context.annotation.Configuration;\nimport org.springframework.web.servlet.config.annotation.CorsRegistry;\nimport org.springframework.web.servlet.config.annotation.WebMvcConfigurer;\n\n/**\n * 解决跨域问题\n */\n@Configuration\npublic class CorsConfig implements WebMvcConfigurer {\n    @Override\n    public void addCorsMappings(CorsRegistry registry) {\n        registry.addMapping(\"/**\")\n                .allowedOriginPatterns(\"*\")\n                .allowedMethods(\"GET\", \"HEAD\", \"POST\", \"PUT\", \"DELETE\", \"OPTIONS\")\n                .allowCredentials(true)\n                .maxAge(3600)\n                .allowedHeaders(\"*\");\n    }\n}\n\n```\n', '2022-01-11 19:23:42', 0);
INSERT INTO `m_blog` VALUES (12, 1, 'img标签访问图片403', '解决img标签访问图片403', '# img标签访问图片403\n在HTML代码的head中添加如下代码\n```html\n<meta name=\"referrer\" content=\"no-referrer\"> \n```\n', '2022-01-11 19:27:08', 0);
INSERT INTO `m_blog` VALUES (13, 1, 'test', 'test', '# 测试\n\n测试修改', '2022-01-11 19:56:29', 0);
INSERT INTO `m_blog` VALUES (14, 1, '一段取值范围的 v-for', 'v-for', '# 一段取值范围的 v-for\nv-for 也可以取整数。在这种情况下，它将重复多次模板。\n```html\n<div>\n    <span v-for=\"n in 10\">{{ n }} </span>\n</div>\n\n```\n输出HTML\n```html\n1 2 3 4 5 6 7 8 9 10\n```\n\n', '2022-01-11 20:07:01', 0);
INSERT INTO `m_blog` VALUES (15, 1, 'Element-UI设计原则', '设计原则', '# Element-UI设计原则\n## 一致性 Consistency\n与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；\n在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。\n## 反馈 Feedback\n控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；\n页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。\n## 效率 Efficiency\n简化流程：设计简洁直观的操作流程；\n清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；\n帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。\n## 可控 Controllability\n用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；\n结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。', '2022-01-11 20:10:04', 0);
INSERT INTO `m_blog` VALUES (16, 1, '安装Element-UI', 'Element-UI', '# 安装Element-UI\n推荐使用 npm 的方式安装，它能更好地和 webpack 打包工具配合使用。\n```bash\nnpm i element-ui -S\n```\n', '2022-01-11 20:11:35', 0);

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(5) NOT NULL,
  `created` datetime NULL DEFAULT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UK_USERNAME`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, 'lyh', 'https://i0.hdslb.com/bfs/face/6e24dc3929c0f4a2982277068cc76d12b0e0f4c6.jpg', '1046818625@qq.com', '96e79218965eb72c92a549dd5a330112', 0, '2020-04-20 10:44:01', NULL);

SET FOREIGN_KEY_CHECKS = 1;
