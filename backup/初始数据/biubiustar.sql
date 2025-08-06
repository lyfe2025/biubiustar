/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728 (5.7.28)
 Source Host           : localhost:3306
 Source Schema         : biubiustar

 Target Server Type    : MySQL
 Target Server Version : 50728 (5.7.28)
 File Encoding         : 65001

 Date: 07/08/2025 03:50:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` bigint(16) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
BEGIN;
INSERT INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `mobile`, `loginfailure`, `logintime`, `loginip`, `createtime`, `updatetime`, `token`, `status`) VALUES (1, 'admin', 'Admin', '6261e4e095a899f4c9a0bcc05f8471d1', '079598', '/assets/img/avatar.png', 'admin@admin.com', '', 0, 1754506594, '127.0.0.1', 1491635035, 1754506594, '75c66231-8fae-4d2f-a209-8b41c5b27c7e', 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` longtext NOT NULL COMMENT '内容',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `createtime` bigint(16) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES (1, 1, 'admin', '/SWTvGsCQjH.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"uptn\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 1754506594);
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES (2, 1, 'admin', '/SWTvGsCQjH.php/addon/install', '插件管理', '{\"name\":\"ldcms\",\"force\":\"0\",\"uid\":\"2839\",\"token\":\"***\",\"version\":\"1.4.3\",\"faversion\":\"1.6.1.20250430\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 1754507319);
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES (3, 1, 'admin', '/SWTvGsCQjH.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"ldcms\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 1754507319);
INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES (4, 1, 'admin', '/SWTvGsCQjH.php/addon/testdata', '插件管理', '{\"name\":\"ldcms\",\"uid\":\"2839\",\"token\":\"***\",\"version\":\"1.4.3\",\"faversion\":\"1.6.1.20250430\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 1754507338);
COMMIT;

-- ----------------------------
-- Table structure for fa_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_area`;
CREATE TABLE `fa_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) DEFAULT NULL COMMENT '简称',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区表';

-- ----------------------------
-- Records of fa_area
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) DEFAULT '' COMMENT '类别',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) DEFAULT '' COMMENT '物理路径',
  `imagewidth` int(10) unsigned DEFAULT '0' COMMENT '宽度',
  `imageheight` int(10) unsigned DEFAULT '0' COMMENT '高度',
  `imagetype` varchar(30) DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) DEFAULT '' COMMENT '透传数据',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建日期',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` bigint(16) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
BEGIN;
INSERT INTO `fa_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (1, '', 1, 0, '/assets/img/qrcode.png', 150, 150, 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
COMMIT;

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
BEGIN;
INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal');
INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
BEGIN;
INSERT INTO `fa_auth_group_access` (`uid`, `group_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `url` varchar(255) DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) DEFAULT '' COMMENT '条件',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 137, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 0, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1491635035, 119, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 1, NULL, '', 'cjgl', 'chajianguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (66, 'file', 0, 'user', 'User', 'fa fa-user-circle', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (85, 'file', 0, 'ldcms', '企业官网管理', 'fa fa-desktop', '', '', '', 1, NULL, '', 'qygwgl', 'qiyeguanwangguanli', 1754507319, 1754507319, 1, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (86, 'file', 85, 'ldcms/config', '系统配置', 'fa fa-sliders', '', '', '管理网站的系统配置信息,非开发人员请谨慎使用', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1754507319, 1754507319, 99, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (87, 'file', 86, 'ldcms/config/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (88, 'file', 86, 'ldcms/config/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (89, 'file', 86, 'ldcms/config/delcfg', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (90, 'file', 85, 'ldcms/site_info', '站点信息', 'fa fa-gear', '', '', '用于管理网站的前台信息', 1, NULL, '', 'zdxx', 'zhandianxinxi', 1754507319, 1754507319, 95, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (91, 'file', 90, 'ldcms/site_info/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (92, 'file', 90, 'ldcms/site_info/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (93, 'file', 90, 'ldcms/site_info/delcfg', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (94, 'file', 85, 'ldcms/models', '模型管理', 'fa fa-th-large', '', '', '管理网站的模型与字段', 1, NULL, '', 'mxgl', 'moxingguanli', 1754507319, 1754507319, 90, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (95, 'file', 94, 'ldcms/models/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (96, 'file', 94, 'ldcms/models/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (97, 'file', 94, 'ldcms/models/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (98, 'file', 94, 'ldcms/models/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (99, 'file', 94, 'ldcms/models/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (100, 'file', 94, 'ldcms/models/copy', '复制模型', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'fzmx', 'fuzhimoxing', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (101, 'file', 85, 'ldcms/fields', '字段管理', 'fa fa-fields', '', '', '用于管理模型的字段', 0, NULL, '', 'zdgl', 'ziduanguanli', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (102, 'file', 101, 'ldcms/fields/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (103, 'file', 101, 'ldcms/fields/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (104, 'file', 101, 'ldcms/fields/edit', '修改', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xg', 'xiugai', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (105, 'file', 101, 'ldcms/fields/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (106, 'file', 101, 'ldcms/fields/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (107, 'file', 85, 'ldcms/category', '栏目管理', 'fa fa-file-text-o', '', '', '管理网站的栏目与导航', 1, NULL, '', 'lmgl', 'lanmuguanli', 1754507319, 1754507319, 85, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (108, 'file', 107, 'ldcms/category/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (109, 'file', 107, 'ldcms/category/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (110, 'file', 107, 'ldcms/category/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (111, 'file', 107, 'ldcms/category/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (112, 'file', 107, 'ldcms/category/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (113, 'file', 107, 'ldcms/category/adds', '批量添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'pltj', 'piliangtianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (114, 'file', 107, 'ldcms/category/translate', 'api翻译', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'afy', 'apifanyi', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (115, 'file', 85, 'ldcms/document', '内容管理', 'fa fa-list', '', '', '', 1, NULL, '', 'nrgl', 'neirongguanli', 1754507319, 1754507319, 80, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (116, 'file', 115, 'ldcms/document/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (117, 'file', 115, 'ldcms/document/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (118, 'file', 115, 'ldcms/document/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (119, 'file', 115, 'ldcms/document/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (120, 'file', 115, 'ldcms/document/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (121, 'file', 115, 'ldcms/document/move', '移动', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'yd', 'yidong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (122, 'file', 115, 'ldcms/document/copy', '复制', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'fz', 'fuzhi', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (123, 'file', 115, 'ldcms/document/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (124, 'file', 115, 'ldcms/document/destroy', '清空回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'qkhsz', 'qingkonghuishouzhan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (125, 'file', 115, 'ldcms/document/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (126, 'file', 115, 'ldcms/document/baidupush', '百度推送', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bdts', 'baidutuisong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (127, 'file', 115, 'ldcms/document/sensitive', '敏感词查询', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'mgccx', 'mingancichaxun', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (128, 'file', 115, 'ldcms/document/translate', 'api翻译', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'afy', 'apifanyi', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (129, 'file', 115, 'ldcms/document/index/mid/1', '单页内容', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'dynr', 'danyeneirong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (130, 'file', 115, 'ldcms/document/index/mid/2', '新闻内容', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'xwnr', 'xinwenneirong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (131, 'file', 115, 'ldcms/document/index/mid/6', '产品内容', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'cpnr', 'chanpinneirong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (132, 'file', 115, 'ldcms/document/index/mid/7', '案例内容', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'alnr', 'anlineirong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (133, 'file', 115, 'ldcms/document/index/mid/8', '团队内容', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'tdnr', 'tuanduineirong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (134, 'file', 85, 'ldcms/slider', '轮播图管理', 'fa fa-photo', '', '', '用于管理站点的Banner图、幻灯片等', 1, NULL, '', 'lbtgl', 'lunbotuguanli', 1754507319, 1754507319, 75, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (135, 'file', 134, 'ldcms/slider/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (136, 'file', 134, 'ldcms/slider/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (137, 'file', 134, 'ldcms/slider/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (138, 'file', 134, 'ldcms/slider/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (139, 'file', 134, 'ldcms/slider/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (140, 'file', 85, 'ldcms/links', '友情链接管理', 'fa fa-share-alt', '', '', '用于管理站点的友情链接，支持添加图片', 1, NULL, '', 'yqljgl', 'youqinglianjieguanli', 1754507319, 1754507319, 70, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (141, 'file', 140, 'ldcms/links/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (142, 'file', 140, 'ldcms/links/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (143, 'file', 140, 'ldcms/links/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (144, 'file', 140, 'ldcms/links/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (145, 'file', 140, 'ldcms/links/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (146, 'file', 85, 'ldcms/diyform', '自定义表单管理', 'fa fa-list', '', '', '支持创建表单，创建表单字段，但不会生成前台的表单HTML,需要手动制作form表单', 1, NULL, '', 'zdybdgl', 'zidingyibiaodanguanli', 1754507319, 1754507319, 70, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (147, 'file', 146, 'ldcms/diyform/index', '自定义表单列表', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'zdybdlb', 'zidingyibiaodanliebiao', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (148, 'file', 146, 'ldcms/diyform/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (149, 'file', 146, 'ldcms/diyform/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (150, 'file', 146, 'ldcms/diyform/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (151, 'file', 146, 'ldcms/diyform/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (152, 'file', 146, 'ldcms/diyform_fields', '自定义字段管理', 'fa fa-th-list', '', '', '', 0, NULL, '', 'zdyzdgl', 'zidingyiziduanguanli', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (153, 'file', 152, 'ldcms/diyform_fields/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (154, 'file', 152, 'ldcms/diyform_fields/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (155, 'file', 152, 'ldcms/diyform_fields/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (156, 'file', 152, 'ldcms/diyform_fields/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (157, 'file', 152, 'ldcms/diyform_fields/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (158, 'file', 146, 'ldcms/diyform_data', '自定义表单数据', 'fa fa-list-alt', '', '', '', 0, NULL, '', 'zdybdsj', 'zidingyibiaodanshuju', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (159, 'file', 158, 'ldcms/diyform_data/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (160, 'file', 158, 'ldcms/diyform_data/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (161, 'file', 158, 'ldcms/diyform_data/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (162, 'file', 158, 'ldcms/diyform_data/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (163, 'file', 158, 'ldcms/diyform_data/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (164, 'file', 85, 'ldcms/content_url', '内链管理', 'fa fa-random', '', '', '自动替换生成文章正文内容中文本的链接', 1, NULL, '', 'nlgl', 'neilianguanli', 1754507319, 1754507319, 65, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (165, 'file', 164, 'ldcms/content_url/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (166, 'file', 164, 'ldcms/content_url/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (167, 'file', 164, 'ldcms/content_url/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (168, 'file', 164, 'ldcms/content_url/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (169, 'file', 164, 'ldcms/content_url/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (170, 'file', 85, 'ldcms/tags', '内容Tags', 'fa fa-tags', '', '', '用于管理文章内容的tags标签', 1, NULL, '', 'nrT', 'neirongTags', 1754507319, 1754507319, 60, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (171, 'file', 170, 'ldcms/tags/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (172, 'file', 170, 'ldcms/tags/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (173, 'file', 170, 'ldcms/tags/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (174, 'file', 170, 'ldcms/tags/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (175, 'file', 170, 'ldcms/tags/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (176, 'file', 85, 'ldcms/langs', '多语言管理', 'fa fa-language', '', '', '管理网站的多语言，默认自带中英文2种语言，如果新增语言会默认复制中文的\"站点信息,前端语言文件\"', 1, NULL, '', 'dyygl', 'duoyuyanguanli', 1754507319, 1754507319, 60, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (177, 'file', 176, 'ldcms/langs/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (178, 'file', 176, 'ldcms/langs/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (179, 'file', 176, 'ldcms/langs/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (180, 'file', 176, 'ldcms/langs/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (181, 'file', 176, 'ldcms/langs/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (182, 'file', 176, 'ldcms/langs/editLangFile', '编辑语言文件', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bjyywj', 'bianjiyuyanwenjian', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (183, 'file', 85, 'ldcms/category_fields', '自定义栏目字段', '', '', '', '', 0, NULL, '', 'zdylmzd', 'zidingyilanmuziduan', 1754507319, 1754507319, 60, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (184, 'file', 183, 'ldcms/category_fields/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (185, 'file', 183, 'ldcms/category_fields/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (186, 'file', 183, 'ldcms/category_fields/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (187, 'file', 183, 'ldcms/category_fields/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (188, 'file', 183, 'ldcms/category_fields/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (189, 'file', 85, 'ldcms/copy_langs', '跨语言复制数据', '', '', '', '', 0, NULL, '', 'kyyfzsj', 'kuayuyanfuzhishuju', 1754507319, 1754507319, 60, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (190, 'file', 189, 'ldcms/copy_langs/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (191, 'file', 189, 'ldcms/copy_langs/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (192, 'file', 189, 'ldcms/copy_langs/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (193, 'file', 189, 'ldcms/copy_langs/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (194, 'file', 189, 'ldcms/copy_langs/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (195, 'file', 189, 'ldcms/copy_langs/category', '复制栏目', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'fzlm', 'fuzhilanmu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (196, 'file', 189, 'ldcms/copy_langs/document', '复制内容', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'fznr', 'fuzhineirong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (197, 'file', 85, 'ldcms/themes', '模板管理', 'fa fa-delicious', '', '', '可上传安装（压缩包）、切换前台模板、下载模板备份、导入模板自带数据', 1, NULL, '', 'mbgl', 'mubanguanli', 1754507319, 1754507319, 10, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (198, 'file', 197, 'ldcms/themes/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (199, 'file', 197, 'ldcms/themes/local', '上传安装', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'scaz', 'shangchuananzhuang', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (200, 'file', 197, 'ldcms/themes/install', '直接安装', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zjaz', 'zhijieanzhuang', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (201, 'file', 197, 'ldcms/themes/enable', '启用', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'qy', 'qiyong', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (202, 'file', 197, 'ldcms/themes/download', '下载', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xz', 'xiazai', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (203, 'file', 85, 'ldcms/tagaction', '万能标签管理', 'fa fa-code', '', '', '可以在此进行自定义模板标签<br> 教程：<a href=\"https://doc.fastadmin.net/ldcms/3421.html\" target=\"_blank\">https://doc.fastadmin.net/ldcms/3421.html</a>', 1, NULL, '', 'wnbqgl', 'wannengbiaoqianguanli', 1754507319, 1754507319, 10, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (204, 'file', 203, 'ldcms/tagaction/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (205, 'file', 203, 'ldcms/tagaction/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (206, 'file', 203, 'ldcms/tagaction/copy', '复制', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'fz', 'fuzhi', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (207, 'file', 203, 'ldcms/tagaction/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (208, 'file', 203, 'ldcms/tagaction/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1754507319, 1754507319, 0, 'normal');
INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (209, 'file', 203, 'ldcms/tagaction/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1754507319, 1754507319, 0, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `flag` set('hot','index','recommend') DEFAULT '',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
BEGIN;
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1491635035, 1491635035, 3, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1491635035, 1491635035, 13, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '变量名',
  `group` varchar(30) DEFAULT '' COMMENT '分组',
  `title` varchar(100) DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) DEFAULT '' COMMENT '可见条件',
  `value` text COMMENT '变量值',
  `content` text COMMENT '变量字典数据',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
BEGIN;
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', 'BiuBiuStar', '', 'required', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1.0.1', '', 'required', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'password', '', '', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '', '', '', '', '', '');
INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"category1\":\"Category1\",\"category2\":\"Category2\",\"custom\":\"Custom\"}', '', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of fa_ems
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_ad
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_ad`;
CREATE TABLE `fa_ldcms_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '类型',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '标题',
  `content` varchar(1500) DEFAULT '' COMMENT '内容',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '图片',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) NOT NULL DEFAULT '9' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 ',
  `target` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '跳转',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `lang` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '语言',
  `is_video` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用视频',
  `video` varchar(255) DEFAULT NULL COMMENT '视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COMMENT='广告表';

-- ----------------------------
-- Records of fa_ldcms_ad
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (96, 'banner', '首页轮播图1', ' <div class=\"style-banner \">\r\n        <h5>运输行业解决方案</h5>\r\n        <h4 class=\"mb-lg-3 mb-2\">Transportation industry solutions</h4>\r\n  </div>\r\n<div class=\"view-buttn mt-md-4 mt-sm-4 mt-3\">\r\n          <a href=\"{$item.url}\" class=\"btn scroll\">立即查看</a>\r\n</div>', '', '/assets/addons/ldcms/default/images/banner1.jpeg', '#', 1, 1, '_self', 1661085982, 1689385082, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (97, 'news_banner', '新闻页banner', '', '', '/assets/addons/ldcms/default/images/banner2.jpeg', '#', 9, 1, '_self', 1661091370, 1689385132, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (98, 'banner', '首页轮播图2', ' <div class=\"style-banner \">\r\n       <h5>建筑行业解决方案</h5>\r\n       <h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n  </div>\r\n<div class=\"view-buttn mt-md-4 mt-sm-4 mt-3\">\r\n          <a href=\"{$item.url}\" class=\"btn scroll\">立即查看</a>\r\n</div>', '', '/assets/addons/ldcms/default/images/banner2.jpeg', '#', 2, 1, '_self', 1661092145, 1689385092, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (99, 'banner', '首页轮播3', ' <div class=\"style-banner \">\r\n      <h5>钢铁行业解决方案</h5>\r\n      <h4 class=\"mb-lg-3 mb-2\">Solutions for steel industry</h4>\r\n  </div>\r\n<div class=\"view-buttn mt-md-4 mt-sm-4 mt-3\">\r\n          <a href=\"{$item.url}\" class=\"btn scroll\">立即查看</a>\r\n</div>', '', '/assets/addons/ldcms/default/images/banner3.jpeg', '#', 3, 1, '_self', 1661777214, 1689385100, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (100, 'product_banner', '产品页banner', '', '', '/assets/addons/ldcms/default/images/banner1.jpeg', '#', 9, 1, '_self', 1662126162, 1689385125, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (101, 'team_banner', '服务团队页banner', NULL, '', '/assets/addons/ldcms/default/images/casebanner.jpeg', '#', 9, 1, '_self', 1662212366, 1673535239, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (102, 'api_about', 'api关于我们背景', '', '', '/assets/addons/ldcms/default/images/ebg.jpg', '#', 9, 1, '_self', 1671413071, 1689385114, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (108, 'news_banner', '新闻页banner', '', '', '/assets/addons/ldcms/default/images/banner2.jpeg', '#', 9, 1, '_self', 1661091370, 1689387826, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (106, 'case_banner', '案例页banner', '', '', '/assets/addons/ldcms/default/images/banner3.jpeg', '#', 9, 1, '_self', 1673535228, 1689385107, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (107, 'banner', '首页轮播图1', '<div class=\"container slide-content text-center\">\r\n        <div class=\"style-banner \">\r\n              <h4 class=\"mb-lg-3 mb-2\">Transportation industry solutions</h4>\r\n               <h5>Transportation industry solutions</h5>\r\n        </div>\r\n\r\n        <div class=\"view-buttn mt-md-4 mt-sm-4 mt-3\">\r\n               <a href=\"{$item.url}\" class=\"btn scroll\">More</a>\r\n         </div>\r\n</div>', '', '/assets/addons/ldcms/default/images/banner1.jpeg', '#', 1, 1, '_self', 1661085982, 1689387774, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (109, 'banner', '首页轮播图2', '<div class=\"container slide-content text-center\">\r\n        <div class=\"style-banner \">\r\n              <h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n              <h5>Construction industry solutions</h5>\r\n        </div>\r\n\r\n        <div class=\"view-buttn mt-md-4 mt-sm-4 mt-3\">\r\n               <a href=\"{$item.url}\" class=\"btn scroll\">More</a>\r\n         </div>\r\n</div>', '', '/assets/addons/ldcms/default/images/banner2.jpeg', '#', 2, 1, '_self', 1661092145, 1689387789, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (110, 'banner', '首页轮播3', '<div class=\"container slide-content text-center\">\r\n        <div class=\"style-banner \">\r\n              <h4 class=\"mb-lg-3 mb-2\">Solutions for steel industry</h4>\r\n              <h5>Solutions for steel industry</h5>\r\n        </div>\r\n\r\n        <div class=\"view-buttn mt-md-4 mt-sm-4 mt-3\">\r\n               <a href=\"{$item.url}\" class=\"btn scroll\">More</a>\r\n         </div>\r\n</div>', '', '/assets/addons/ldcms/default/images/banner3.jpeg', '#', 3, 1, '_self', 1661777214, 1689387796, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (111, 'product_banner', '产品页banner', '', '', '/assets/addons/ldcms/default/images/banner1.jpeg', '#', 9, 1, '_self', 1662126162, 1689387820, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (112, 'team_banner', '服务团队页banner', NULL, '', '/assets/addons/ldcms/default/images/casebanner.jpeg', '#', 9, 1, '_self', 1662212366, 1673535239, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (113, 'api_about', 'api关于我们背景', '', '', '/assets/addons/ldcms/default/images/ebg.jpg', '#', 9, 1, '_self', 1671413071, 1689387811, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (114, 'case_banner', '案例页banner', '', '', '/assets/addons/ldcms/default/images/banner3.jpeg', '#', 9, 1, '_self', 1673535228, 1689387803, 'en', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (115, 'about', '首页关于我们背景', '', '', '/assets/addons/ldcms/default/images/ebg.jpg', '#', 9, 1, '_self', 1689385792, 1689385807, 'zh-cn', 0, NULL);
INSERT INTO `fa_ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES (116, 'about', '首页关于我们背景', '', '', '/assets/addons/ldcms/default/images/ebg.jpg', '#', 9, 1, '_self', 1689387864, 1689387883, 'en', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_category`;
CREATE TABLE `fa_ldcms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `ename` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '英文名称',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `mid` int(11) NOT NULL COMMENT '模型',
  `urlname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'url名称',
  `template_list` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '列表页模版',
  `template_detail` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '详情页模版',
  `outlink` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '跳转链接',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '栏目缩略图',
  `big_image` varchar(255) DEFAULT '' COMMENT '栏目大图',
  `seo_title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'SEO描述',
  `sort` int(10) DEFAULT '99' COMMENT '排序',
  `lang` varchar(255) NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `is_target` tinyint(1) DEFAULT '0' COMMENT '是否target',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0 模型 1链接',
  `gid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '浏览权限  0 公开  1 1级会员 2 2级会员 ...',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `is_nav` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否导航显示',
  `is_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页显示模块',
  `subname` varchar(255) DEFAULT NULL COMMENT '子名称',
  `model_table_name` varchar(255) DEFAULT '' COMMENT '模型名的表名称',
  `des1` varchar(255) DEFAULT '' COMMENT '描述1',
  `des2` varchar(255) DEFAULT '' COMMENT '描述2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `urlname` (`urlname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='栏目表';

-- ----------------------------
-- Records of fa_ldcms_category
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (125, '关于我们', 'about', 0, 1, 'guanyuwomen', '', 'detail_page.html', '', '', '', '', '', '', 1, 'zh-cn', 0, 0, '', 1, 1660810013, 1716934789, 1, 1, '专注做擅长的事情', 'page', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (127, '行业资讯', '', 128, 2, 'hangyezixun', 'list_news.html', 'detail_news.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1660899388, 1661605908, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (128, '新闻中心', '', 0, 2, 'xinwenzhongxin', 'list_news.html', 'detail_news.html', '', '', '', '测试新闻', '', '', 5, 'zh-cn', 0, 0, '', 1, 1660899406, 1716934833, 1, 1, '提供实时的资讯信息', 'news', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (141, '联系我们', '', 0, 1, 'lianxiwomen', '', 'detail_page.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1661005544, 1662162333, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (143, '公司新闻', '', 128, 2, 'gongsixinwen', 'list_news.html', 'detail_news.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1661009757, 1673232822, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (144, '产品中心', '', 0, 6, 'chanpinzhongxin', 'list_product.html', 'detail_product.html', '', '', '', '', '', '产品的描述', 3, 'zh-cn', 0, 0, '', 1, 1661071377, 1716934824, 1, 1, '凡是别人做不了的我们都擅长', 'product', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (145, '案例展示', '', 0, 7, 'anlizhanshi', 'list_case.html', 'detail_case.html', '', '', '', '', '', '', 4, 'zh-cn', 0, 0, '', 1, 1662162227, 1716934801, 1, 1, '精益求精，精雕细琢', 'case', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (146, '品牌设计', '', 145, 7, 'pinpaisheji', 'list_case.html', 'detail_case.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1662162275, 1662162275, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (147, '画册设计', '', 145, 7, 'huacesheji', 'list_case.html', 'detail_case.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1662162301, 1662162301, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (148, '服务团队', '', 0, 8, 'fuwutuandui', 'list_team.html', 'detail_team.html', '', '', '', '', '', '', 6, 'zh-cn', 0, 0, '', 1, 1662162493, 1716934812, 1, 1, '打造专业的技术团队', 'team', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (149, '在线留言', '', 0, 1, 'zaixianliuyan', '', 'detail_message.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1664787637, 1664800087, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (151, '产品系列1', '', 144, 6, 'chanpinxilie1', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 1, 'zh-cn', 0, 0, '', 1, 1665539057, 1673232855, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (154, 'product', 'product', 0, 6, 'product', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 5, 'en', 0, 0, '', 1, 1671204463, 1716934927, 1, 1, 'We are good at what others can\'t do', 'product', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (155, 'case', 'case', 0, 7, 'case', 'list_case.html', 'detail_case.html', '', '', '', '', '', '', 15, 'en', 0, 0, '', 1, 1671204647, 1716934881, 1, 1, 'Strive for perfection', 'case', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (156, 'news', 'news', 0, 2, 'news', 'list_news.html', 'detail_news.html', '', '', '', '', '', '', 10, 'en', 0, 0, '', 1, 1671204664, 1716934913, 1, 1, 'We are good at what others can\'t do', 'news', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (157, 'team', 'team', 0, 8, 'team', 'list_team.html', 'detail_team.html', '', '', '', '', '', '', 20, 'en', 0, 0, '', 1, 1671204678, 1716934897, 1, 1, 'Build a professional technical team', 'team', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (158, 'about', 'about', 0, 1, 'about', '', 'detail_page.html', '', '', '', '', '', '', 1, 'en', 0, 0, '', 1, 1671204759, 1716934870, 1, 1, 'Focus on what you are good at', 'page', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (159, 'contact', 'contact', 0, 1, 'contact', '', 'detail_page.html', '', '', '', '', '', '', 99, 'en', 0, 0, '', 1, 1671204817, 1671204817, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (160, 'message', '', 0, 1, 'message', '', 'detail_message.html', '', '', '', '', '', '', 99, 'en', 0, 0, '', 1, 1672922337, 1672922337, 1, 0, NULL, '', '', '');
INSERT INTO `fa_ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES (161, '产品系列2', '', 144, 6, 'chanpinxilie2', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 2, 'zh-cn', 0, 0, '', 1, 1673232846, 1673232857, 1, 0, NULL, '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_category_fields
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_category_fields`;
CREATE TABLE `fa_ldcms_category_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `field` char(30) DEFAULT NULL COMMENT '名称',
  `type` varchar(30) DEFAULT NULL COMMENT '类型',
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `filterlist` text COMMENT '筛选列表',
  `default` varchar(100) DEFAULT NULL COMMENT '默认值',
  `rule` varchar(100) DEFAULT NULL COMMENT '验证规则',
  `tip` varchar(100) DEFAULT NULL COMMENT '提示消息',
  `decimals` tinyint(4) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(9) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) DEFAULT '0' COMMENT '最大数量',
  `extend_html` varchar(255) DEFAULT NULL COMMENT '扩展信息',
  `setting` varchar(1500) DEFAULT NULL COMMENT '配置信息',
  `sort` int(11) DEFAULT '9' COMMENT '排序',
  `create_time` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='栏目自定义字段表';

-- ----------------------------
-- Records of fa_ldcms_category_fields
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_content_url
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_content_url`;
CREATE TABLE `fa_ldcms_content_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '链接',
  `lang` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='文章内容内链';

-- ----------------------------
-- Records of fa_ldcms_content_url
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_content_url` (`id`, `name`, `url`, `lang`, `create_time`, `update_time`) VALUES (1, '测试', 'http://www.example.com', 'zh-cn', 1665709509, 1673232306);
INSERT INTO `fa_ldcms_content_url` (`id`, `name`, `url`, `lang`, `create_time`, `update_time`) VALUES (3, '测试1', 'www.example.com', 'zh-cn', 1673488459, 1673488532);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_diyform
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_diyform`;
CREATE TABLE `fa_ldcms_diyform` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '' COMMENT '表单名称',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `table` varchar(50) DEFAULT '' COMMENT '表名',
  `needlogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录发布',
  `iscaptcha` tinyint(1) unsigned DEFAULT '0' COMMENT '是否启用验证码',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `setting` varchar(1500) DEFAULT '' COMMENT '表单配置',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='自定义表单表';

-- ----------------------------
-- Records of fa_ldcms_diyform
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_diyform` (`id`, `name`, `title`, `table`, `needlogin`, `iscaptcha`, `create_time`, `update_time`, `setting`, `status`) VALUES (16, 'message', '在线留言', 'ldcms_message', 0, 1, 1672923154, 1673275104, '', 1);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_diyform_fields
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_diyform_fields`;
CREATE TABLE `fa_ldcms_diyform_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `diyform_id` int(10) NOT NULL DEFAULT '0' COMMENT '表单ID',
  `field` char(30) DEFAULT '' COMMENT '名称',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `title` varchar(30) DEFAULT '' COMMENT '标题',
  `filterlist` text COMMENT '筛选列表',
  `default` varchar(100) DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `tip` varchar(100) DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend_html` varchar(255) DEFAULT '' COMMENT '扩展信息',
  `setting` varchar(1500) DEFAULT '' COMMENT '配置信息',
  `sort` int(10) NOT NULL DEFAULT '9' COMMENT '排序',
  `create_time` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `issort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可排序',
  `isfilter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '筛选',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id` (`diyform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='自定义字段表';

-- ----------------------------
-- Records of fa_ldcms_diyform_fields
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_diyform_fields` (`id`, `diyform_id`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`) VALUES (11, 16, 'uname', 'string', '姓名', NULL, '', 'require', '', NULL, 100, NULL, 0, '', '', 9, 1672923431, 1672923598, 0, 0, 1);
INSERT INTO `fa_ldcms_diyform_fields` (`id`, `diyform_id`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`) VALUES (12, 16, 'mobile', 'string', '手机号', NULL, '', 'require', '', NULL, 100, NULL, 0, '', '', 9, 1672923652, 1672923652, 0, 0, 1);
INSERT INTO `fa_ldcms_diyform_fields` (`id`, `diyform_id`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`) VALUES (13, 16, 'remark', 'string', '内容', NULL, '', 'require', '', NULL, 100, NULL, 0, '', '', 9, 1672923681, 1672923681, 0, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_document
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_document`;
CREATE TABLE `fa_ldcms_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '模型',
  `cid` int(11) DEFAULT NULL COMMENT '栏目',
  `sub_cid` varchar(255) DEFAULT '' COMMENT '副栏目',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '标题',
  `image` text CHARACTER SET utf8 COMMENT '缩略图',
  `pics` text CHARACTER SET utf8 COMMENT '多图',
  `show_time` bigint(16) DEFAULT NULL COMMENT '显示时间',
  `seo_keywords` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'seo关键词',
  `seo_description` varchar(500) DEFAULT '' COMMENT 'SEO描述',
  `visits` int(255) DEFAULT '0' COMMENT '浏览次数',
  `likes` int(255) DEFAULT '0' COMMENT '点赞次数',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `sort` int(11) NOT NULL DEFAULT '99' COMMENT '排序',
  `lang` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `flag` varchar(255) DEFAULT '' COMMENT '标识',
  `tag` varchar(255) DEFAULT '' COMMENT '标签',
  `outlink` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `gid` varchar(255) DEFAULT '' COMMENT '浏览权限',
  `custom_tpl` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '详情页模版',
  `custom_urlname` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '自定义url',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  `delete_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`mid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb4 COMMENT='文章基础表';

-- ----------------------------
-- Records of fa_ldcms_document
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (17, 1, 141, '', '联系我们', '/assets/addons/ldcms/default/images/contact.png', '', 1661009533, '', '企业品牌信息技术（北京）有限公司&nbsp;集产品销售、技术服务、软件开发于一身的高科技企业。服务范围涵盖了软件销售、私有云、IT基础架构系统规划、IT咨询、系统实施、信息安全构建、业务系统开发等全方位业务。地址：北京市朝阳区北苑路40号院彩一办公楼一层业务部：010 - 88888888 12345678890技术部：010 - 88888888邮箱：example@example.com网址：www....', 38, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1661009533, 1673536834, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (53, 1, 125, '', '关于我们', '/assets/addons/ldcms/default/images/about.jpeg', '', 1661740673, '', '企业品牌信息技术（北京）有限公司是一家集产品销售、技术服务、软件开发于一身的高科技企业。服务范围涵盖了软件销售、私有云、IT基础架构系统规划、IT咨询、系统实施、信息安全构建、业务系统开发等全方位业务。网易通正在向着一流的信息化解决方案提供商而努力着。', 1823, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1661740673, 1673531300, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (178, 7, 146, '', '桌面设计', '/assets/addons/ldcms/default/images/b4.jpeg', '', 1662164485, '', 'logo设计', 21, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1662166443, 1673529455, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (179, 7, 147, '', 'logo设计_copy', '/assets/addons/ldcms/default/images/b3.jpeg', '', 1662164485, '', 'logo设计', 21, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1662166451, 1673529436, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (188, 1, 149, '', '在线留言', '/assets/addons/ldcms/default/images/about.jpeg', NULL, 1664787637, '', NULL, 110, 0, NULL, NULL, 99, 'zh-cn', '', '', NULL, 1, '', '', '', 1664787637, 1664787637, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (191, 1, 158, '', 'about', '/assets/addons/ldcms/default/images/about.jpeg', '', 1671204759, '', 'this is about content', 133, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671204759, 1673566729, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (192, 1, 159, '', 'contact', '/assets/addons/ldcms/default/images/contact.png', '', 1671204817, '', 'Enterprise Brand Information Technology (Beijing) Co., Ltd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A high-tech enterprise integrating product sales, technical services and software development. The service scope...', 14, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671204817, 1673573319, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (193, 8, 157, '', 'Test team content', '/assets/addons/ldcms/default/images/teams1.jpeg', '', 1671204916, '', 'test team content', 0, 0, 0, 'Admin', 99, 'en', 'top', '', '', 1, '', '', '', 1671204978, 1673573607, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (194, 2, 156, '', '热烈祝贺xx公司，官方网站正式上线', '', '', 1671205200, '', '热烈祝贺xx公司，官方网站正式上线', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205276, 1673571511, 1673571511);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (195, 2, 156, '', '热烈祝贺xx公司，官方网站正式上线_copy', '', '', 1671205200, '', '热烈祝贺xx公司，官方网站正式上线', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205281, 1673571511, 1673571511);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (196, 2, 156, '', '热烈祝贺xx公司，官方网站正式上线_copy', '', '', 1671205200, '', '热烈祝贺xx公司，官方网站正式上线', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205286, 1673571511, 1673571511);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (197, 2, 156, '', '热烈祝贺xx公司，官方网站正式上线_copy_copy', '', '', 1671205200, '', '热烈祝贺xx公司，官方网站正式上线', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205286, 1673571511, 1673571511);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (198, 2, 156, '', '热烈祝贺xx公司，官方网站正式上线_copy', '', '', 1671205200, '', '热烈祝贺xx公司，官方网站正式上线', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205290, 1673571511, 1673571511);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (199, 2, 156, '', '热烈祝贺xx公司，官方网站正式上线_copy_copy', '', '', 1671205200, '', '热烈祝贺xx公司，官方网站正式上线', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205290, 1673571511, 1673571511);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (200, 2, 156, '', '热烈祝贺xx公司，官方网站正式上线_copy_copy', '', '', 1671205200, '', '热烈祝贺xx公司，官方网站正式上线', 4, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205290, 1673571511, 1673571511);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (201, 2, 156, '', 'Group leaders visited the factory and the factory technicians explained', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1671205200, '', 'Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained', 4, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205290, 1673571454, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (202, 6, 154, '', '新产品上线', '', '', 1671205315, '', '', 1, 0, NULL, NULL, 99, 'en', '', '', '', 1, '', '', '', 1671205364, 1673566416, 1673566416);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (203, 6, 154, '', 'Construction industry solutions', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205368, 1673566408, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (204, 6, 154, '', 'Solutions for steel industry', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205371, 1673566313, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (205, 6, 154, '', 'Transportation industry solutions', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1671205371, 1673566150, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (206, 1, 160, '', 'message', '/assets/addons/ldcms/default/images/about.jpeg', NULL, 1672922337, '', NULL, 28, 0, NULL, NULL, 99, 'en', '', '', NULL, 1, '', '', '', 1672922337, 1672922337, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (211, 7, 146, '', '桌面设计_copy', '/assets/addons/ldcms/default/images/b2.jpeg', '', 1662164485, '', 'logo设计', 21, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673247618, 1673529412, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (212, 7, 147, '', 'logo设计_copy_copy', '/assets/addons/ldcms/default/images/b1.jpeg', '', 1662164485, '', 'logo设计', 21, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673247618, 1673529345, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (213, 8, 148, '', '业务经理', '/assets/addons/ldcms/default/images/teams1.jpeg', '', 1673247755, '', '业务经理的测试内容业务经理的测试内容', 13, 0, 0, 'Admin', 99, 'zh-cn', 'top', '', '', 1, '', '', '', 1673247820, 1673530598, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (214, 8, 148, '', '技术总监', '/assets/addons/ldcms/default/images/teams2.jpeg', '/assets/addons/ldcms/default/images/teams2.jpeg', 1673247925, '', '模特的描述内容模特的描述内容模特的描述内容模特的描述内容模特的描述内容模特的描述内容', 15, 0, 0, 'Admin', 99, 'zh-cn', 'top', '', '', 1, '', '', '', 1673247984, 1673530694, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (216, 2, 143, '', '展会策划之超维震撼亮相深圳礼品展_copy', '', '', 1662090058, '', 'te', 55, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673249003, 1673532119, 1673532119);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (217, 2, 143, '', '展会策划之超维震撼亮相深圳礼品展_copy', '', '', 1662090058, '', 'te', 56, 0, NULL, 'Admin', 99, 'zh-cn', NULL, '', '', 1, '', '', '', 1673249006, 1673532119, 1673532119);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (218, 2, 143, '', '展会策划之超维震撼亮相深圳礼品展_copy_copy', '', '', 1662090058, '', 'te', 55, 0, NULL, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673249006, 1673532119, 1673532119);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (219, 2, 127, '', '集团领导到工厂视察，工厂技术人员讲解', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1662090058, '', 'te', 60, 0, 0, 'Admin', 999, 'zh-cn', '', '', '', 1, '', '', '', 1673249013, 1673532160, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (220, 2, 127, '', '从长岛一直延伸到Plane Land的新隧道', '/assets/addons/ldcms/default/images/b7.jpeg', '', 1662090058, '', '从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道', 63, 0, 0, 'abc', 2, 'zh-cn', '', '', '', 1, '', '', '', 1673249013, 1673532432, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (221, 2, 143, '', '在钢铁生产过程中需要注意的10件小事。', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1662090058, '', 'te', 57, 0, 0, 'Admin', 999, 'zh-cn', '', '', '', 1, '', '', '', 1673249013, 1673532162, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (222, 2, 143, '', '我们为陆上和海上平台提供钢材', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1662090058, '', '他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿', 57, 0, 0, 'abc', 4999, 'zh-cn', '', '', '', 1, '', '', '', 1673249013, 1673532343, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (253, 8, 148, '', '项目经理', '/assets/addons/ldcms/default/images/teams3.jpeg', '/assets/addons/ldcms/default/images/teams3.jpeg', 1673247925, '', '模特的描述内容模特的描述内容模特的描述内容模特的描述内容模特的描述内容模特的描述内容', 15, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673316748, 1673530679, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (262, 6, 151, '', '运输行业解决方案', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673525154, 1673534528, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (263, 6, 151, '', '钢铁行业解决方案', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673525292, 1673525292, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (264, 6, 161, '', '建筑行业解决方案', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 3, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673525309, 1673525395, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (265, 6, 151, '', '运输行业解决方案_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 3, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673525421, 1673534521, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (266, 6, 151, '', '钢铁行业解决方案_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 2, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673525421, 1673525421, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (267, 6, 161, '', '建筑行业解决方案_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 3, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673525421, 1673525421, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (268, 8, 148, '', '技术顾问', '/assets/addons/ldcms/default/images/teams4.jpeg', '/assets/addons/ldcms/default/images/teams4.jpeg', 1673247925, '', '模特的描述内容模特的描述内容模特的描述内容模特的描述内容模特的描述内容模特的描述内容', 14, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673530848, 1673530877, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (269, 2, 127, '', '集团领导到工厂视察，工厂技术人员讲解_copy', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1662090058, '', '集团领导到工厂视察，工厂技术人员讲解\r\n\r\n集团领导到工厂视察，工厂技术人员讲解\r\n集团领导到工厂视察，工厂技术人员讲解\r\n\r\n集团领导到工厂视察，工厂技术人员讲解\r\n集团领导到工厂视察，工厂技术人员讲解\r\n\r\n集团领导到工厂视察，工厂技术人员讲解', 61, 0, 0, 'Admin', 99999, 'zh-cn', '', '', '', 1, '', '', '', 1673532123, 1673532321, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (270, 2, 127, '', '从长岛一直延伸到Plane Land的新隧道_copy', '/assets/addons/ldcms/default/images/b7.jpeg', '', 1662090058, '', '从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道', 63, 0, 0, 'abc', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673532123, 1673532451, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (271, 2, 143, '', '在钢铁生产过程中需要注意的10件小事。_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1662090058, '', 'te', 57, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673532123, 1673532123, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (272, 2, 143, '', '我们为陆上和海上平台提供钢材_copy', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1662090058, '', 'te', 56, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1673532123, 1673532144, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (273, 6, 151, '', '运输行业解决方案_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534399, 1673534485, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (274, 6, 151, '', '钢铁行业解决方案_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534399, 1673534399, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (275, 6, 161, '', '建筑行业解决方案_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 2, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534399, 1673534399, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (276, 6, 151, '', '运输行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 2, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534399, 1673534478, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (277, 6, 151, '', '钢铁行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534399, 1673534399, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (278, 6, 161, '', '建筑行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 2, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534399, 1673534399, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (279, 6, 151, '', '运输行业解决方案_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534472, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (280, 6, 151, '', '钢铁行业解决方案_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534403, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (281, 6, 161, '', '建筑行业解决方案_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 2, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534403, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (282, 6, 151, '', '运输行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 2, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534468, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (283, 6, 151, '', '钢铁行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534403, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (284, 6, 161, '', '建筑行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 2, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534403, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (285, 6, 151, '', '运输行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534463, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (286, 6, 151, '', '钢铁行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534403, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (287, 6, 161, '', '建筑行业解决方案_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 3, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534403, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (288, 6, 151, '', '运输行业解决方案_copy_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1673524815, '', '运输行业解决方案,为运输行业提供了非常完善的解决方案这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案', 10, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534459, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (289, 6, 151, '', '钢铁行业解决方案_copy_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 9, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673534403, 1673534403, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (290, 6, 161, '', '建筑行业解决方案_copy_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 3, 0, 1, 'Admin', 99, 'zh-cn', '', 'tag1', '', 1, '', '', '', 1673534403, 1673574195, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (291, 2, 127, '', '集团领导到工厂视察，工厂技术人员讲解_copy', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1662090058, '', 'te', 60, 0, 0, 'Admin', 999, 'zh-cn', '', '', '', 1, '', '', '', 1673536947, 1673536947, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (292, 2, 127, '', '从长岛一直延伸到Plane Land的新隧道_copy', '/assets/addons/ldcms/default/images/b7.jpeg', '', 1662090058, '', '从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道', 63, 0, 0, 'abc', 2, 'zh-cn', '', '', '', 1, '', '', '', 1673536948, 1673536948, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (293, 2, 143, '', '在钢铁生产过程中需要注意的10件小事。_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1662090058, '', 'te', 57, 0, 0, 'Admin', 999, 'zh-cn', '', '', '', 1, '', '', '', 1673536948, 1673536948, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (294, 2, 143, '', '我们为陆上和海上平台提供钢材_copy', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1662090058, '', '他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿', 57, 0, 0, 'abc', 4999, 'zh-cn', '', '', '', 1, '', '', '', 1673536948, 1673536948, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (295, 2, 127, '', '集团领导到工厂视察，工厂技术人员讲解_copy_copy', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1662090058, '', '集团领导到工厂视察，工厂技术人员讲解\r\n\r\n集团领导到工厂视察，工厂技术人员讲解\r\n集团领导到工厂视察，工厂技术人员讲解\r\n\r\n集团领导到工厂视察，工厂技术人员讲解\r\n集团领导到工厂视察，工厂技术人员讲解\r\n\r\n集团领导到工厂视察，工厂技术人员讲解', 61, 0, 0, 'Admin', 99999, 'zh-cn', '', '', '', 1, '', '', '', 1673536948, 1673536948, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (296, 2, 127, '', '从长岛一直延伸到Plane Land的新隧道_copy_copy', '/assets/addons/ldcms/default/images/b7.jpeg', '', 1662090058, '', '从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道从长岛一直延伸到Plane Land的新隧道', 63, 0, 0, 'abc', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673536948, 1673536948, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (297, 2, 143, '', '在钢铁生产过程中需要注意的10件小事。_copy_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1662090058, '', 'te', 57, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1673536948, 1673536948, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (298, 2, 143, '', '我们为陆上和海上平台提供钢材_copy_copy', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1662090058, '', 'te', 56, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1673536948, 1673536948, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (299, 2, 143, '', '在钢铁生产过程中需要注意的10件小事。_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1662090058, '', 'te', 58, 0, 0, 'Admin', 999, 'zh-cn', '', '', '', 1, '', '', '', 1673537002, 1673537002, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (300, 2, 143, '', '我们为陆上和海上平台提供钢材_copy', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1662090058, '', '他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿', 57, 0, 0, 'abc', 4999, 'zh-cn', '', '', '', 1, '', '', '', 1673537002, 1673537002, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (301, 2, 127, '', '集团领导到工厂视察，工厂技术人员讲解_copy_copy', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1662090058, '', 'te', 60, 0, 0, 'Admin', 999, 'zh-cn', '', '', '', 1, '', '', '', 1673537002, 1673537002, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (302, 2, 143, '', '在钢铁生产过程中需要注意的10件小事。_copy_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1662090058, '', 'te', 58, 0, 0, 'Admin', 999, 'zh-cn', '', '', '', 1, '', '', '', 1673537002, 1673537002, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (303, 6, 154, '', 'Construction industry solutions_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566420, 1673566420, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (304, 6, 154, '', 'Solutions for steel industry_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566420, 1673566420, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (305, 6, 154, '', 'Transportation industry solutions_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566420, 1673566420, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (306, 6, 154, '', 'Construction industry solutions_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566424, 1673566424, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (307, 6, 154, '', 'Solutions for steel industry_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566424, 1673566424, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (308, 6, 154, '', 'Transportation industry solutions_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566424, 1673566424, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (309, 6, 154, '', 'Construction industry solutions_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566424, 1673566424, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (310, 6, 154, '', 'Solutions for steel industry_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566424, 1673566424, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (311, 6, 154, '', 'Transportation industry solutions_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566424, 1673566424, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (312, 6, 154, '', 'Construction industry solutions_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (313, 6, 154, '', 'Solutions for steel industry_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (314, 6, 154, '', 'Transportation industry solutions_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (315, 6, 154, '', 'Construction industry solutions_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (316, 6, 154, '', 'Solutions for steel industry_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (317, 6, 154, '', 'Transportation industry solutions_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 0, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (318, 6, 154, '', 'Construction industry solutions_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (319, 6, 154, '', 'Solutions for steel industry_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (320, 6, 154, '', 'Transportation industry solutions_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 1, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (321, 6, 154, '', 'Construction industry solutions_copy_copy_copy', '/assets/addons/ldcms/default/images/pro3.jpeg', '', 1671205315, '', 'Construction industry solutionssed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod t...', 4, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (322, 6, 154, '', 'Solutions for steel industry_copy_copy_copy', '/assets/addons/ldcms/default/images/pro2.jpeg', '', 1671205315, '', 'Solutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industry', 5, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (323, 6, 154, '', 'Transportation industry solutions_copy_copy_copy', '/assets/addons/ldcms/default/images/pro1.jpeg', '', 1671205315, '', 'Transportation industry solutionsWe are good at what others can\'t doWe are good at what others can\'t doWe are good at what others can\'t do', 3, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673566437, 1673566437, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (324, 2, 156, '', 'We provide steel for onshore and offshore platforms', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1673571514, '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, ...', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571585, 1673571585, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (325, 2, 156, '', '10 small things to pay attention to in the process of steel production', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1673571613, '', '10 small things to pay attention to in the process of steel production', 2, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571641, 1673571641, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (326, 2, 156, '', 'Group leaders visited the factory and the factory technicians explained_copy', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1671205200, '', 'Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained', 7, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571645, 1673571645, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (327, 2, 156, '', 'We provide steel for onshore and offshore platforms_copy', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1673571514, '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, ...', 2, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571645, 1673571645, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (328, 2, 156, '', '10 small things to pay attention to in the process of steel production_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1673571613, '', '10 small things to pay attention to in the process of steel production', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571645, 1673571645, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (329, 2, 156, '', 'Group leaders visited the factory and the factory technicians explained_copy', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1671205200, '', 'Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained', 4, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571648, 1673571648, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (330, 2, 156, '', 'We provide steel for onshore and offshore platforms_copy', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1673571514, '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, ...', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571648, 1673571648, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (331, 2, 156, '', '10 small things to pay attention to in the process of steel production_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1673571613, '', '10 small things to pay attention to in the process of steel production', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571648, 1673571648, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (332, 2, 156, '', 'Group leaders visited the factory and the factory technicians explained_copy_copy', '/assets/addons/ldcms/default/images/b8.jpeg', '', 1671205200, '', 'Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained', 5, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571648, 1673571648, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (333, 2, 156, '', 'We provide steel for onshore and offshore platforms_copy_copy', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1673571514, '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, ...', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571648, 1673571648, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (334, 2, 156, '', '10 small things to pay attention to in the process of steel production_copy_copy', '/assets/addons/ldcms/default/images/b6.jpeg', '', 1673571613, '', '10 small things to pay attention to in the process of steel production', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571648, 1673571648, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (335, 7, 155, '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr', '/assets/addons/ldcms/default/images/b1.jpeg', '', 1673571700, '', '&nbsp;&nbsp;&nbsp;Lorem ipsum dolor sit amet, consetetur sadipscing elitrLorem ipsum dolor sit amet, consetetur sadipscing elitr', 2, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673571765, 1673571765, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (336, 7, 155, '', 'Desktop design', '/assets/addons/ldcms/default/images/b2.jpeg', '', 1673572389, '', 'sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.&nbsp;sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptu...', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673572456, 1673572456, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (337, 7, 155, '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr_copy', '/assets/addons/ldcms/default/images/b3.jpeg', '', 1673571700, '', '&nbsp;&nbsp;&nbsp;Lorem ipsum dolor sit amet, consetetur sadipscing elitrLorem ipsum dolor sit amet, consetetur sadipscing elitr', 2, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673572486, 1673572520, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (338, 7, 155, '', 'Desktop design_copy', '/assets/addons/ldcms/default/images/b4.jpeg', '', 1673572389, '', 'sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.&nbsp;sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptu...', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1673572486, 1673572503, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (339, 8, 157, '', 'Technical consultant', '/assets/addons/ldcms/default/images/teams4.jpeg', '', 1673572615, '', '', 1, 0, 1, 'Admin', 99, 'en', 'new', '', '', 1, '', '', '', 1673572681, 1673573601, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (340, 8, 157, '', 'Technical Director', '/assets/addons/ldcms/default/images/teams2.jpeg', '', 1673572696, '', '', 3, 0, 1, 'Admin', 99, 'en', 'top', '', '', 1, '', '', '', 1673572733, 1673573422, NULL);
INSERT INTO `fa_ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES (341, 8, 157, '', 'Project manager', '/assets/addons/ldcms/default/images/teams3.jpeg', '', 1673572739, '', '', 3, 0, 1, 'Admin', 99, 'en', 'top', 'tag1', '', 1, '', '', '', 1673572780, 1673574454, NULL);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_document_case
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_document_case`;
CREATE TABLE `fa_ldcms_document_case` (
  `document_id` int(10) NOT NULL,
  `xmbj` text COMMENT '项目背景',
  `test1` varchar(255) DEFAULT '' COMMENT '测试关联表',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='案例';

-- ----------------------------
-- Records of fa_ldcms_document_case
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (175, '', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (176, '', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (177, '', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (178, '简约风格', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (179, '测试项目背景', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (180, '项目背景logo设计', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (181, '项目背景logo设计', '143');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (211, '简约风格', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (212, '测试项目背景', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (335, '', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (336, '', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (337, '', '');
INSERT INTO `fa_ldcms_document_case` (`document_id`, `xmbj`, `test1`) VALUES (338, '', '');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_document_content
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_document_content`;
CREATE TABLE `fa_ldcms_document_content` (
  `document_id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8 COMMENT '正文内容',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章内容表';

-- ----------------------------
-- Records of fa_ldcms_document_content
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (17, '<p><strong>企业品牌信息技术（北京）有限公司</strong></p>\r\n<p>&nbsp;</p>\r\n<p>集产品销售、技术服务、软件开发于一身的高科技企业。服务范围涵盖了软件销售、私有云、IT基础架构系统规划、IT咨询、系统实施、信息安全构建、业务系统开发等全方位业务。<br />地址：北京市朝阳区北苑路40号院彩一办公楼一层<br />业务部：010 - 88888888 12345678890<br />技术部：010 - 88888888<br />邮箱：example@example.com</p>\r\n<p>网址：www.example.com</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/contact.png\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (53, '<p>xx企业品牌信息技术（北京）有限公司是一家集产品销售、技术服务、软件开发于一身的高科技企业。服务范围涵盖了软件销售、私有云、IT基础架构系统规划、IT咨询、系统实施、信息安全构建、业务系统开发等全方位业务。我们正在向着一流的信息化解决方案提供商而努力着。</p>\r\n<p><img class=\"img-responsive\" src=\"/assets/addons/ldcms/default/images/about.jpeg\" alt=\" \" width=\"100%\" /></p>\r\n<p>xx企业品牌信息技术（北京）有限公司是一家集产品销售、技术服务、软件开发于一身的高科技企业。服务范围涵盖了软件销售、私有云、IT基础架构系统规划、IT咨询、系统实施、信息安全构建、业务系统开发等全方位业务</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (178, '<p><img src=\"/assets/addons/ldcms/default/images/b4.jpeg\" alt=\"\" width=\"340\" height=\"280\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (179, '<p><img src=\"/assets/addons/ldcms/default/images/b3.jpeg\" alt=\"\" width=\"340\" height=\"280\" /></p>\r\n<p>图片展示</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (188, '');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (191, '<p>Xx Enterprise Brand Information Technology (Beijing) Co., Ltd. is a high-tech enterprise integrating product sales, technical services and software development. The service scope covers software sales, private cloud, IT infrastructure system planning, IT consulting, system implementation, information security construction, business system development and other comprehensive businesses. We are working towards a first-class information solution provider.</p>\r\n<p><img class=\"img-responsive\" src=\"/assets/addons/ldcms/default/images/about.jpeg\" alt=\" \" width=\"100%\" /></p>\r\n<p>Xx Enterprise Brand Information Technology (Beijing) Co., Ltd. is a high-tech enterprise integrating product sales, technical services and software development. The service scope covers software sales, private cloud, IT infrastructure system planning, IT consulting, system implementation, information security construction, business system development and other comprehensive businesses. We are working towards a first-class information solution provider.</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (192, '<p>Enterprise Brand Information Technology (Beijing) Co., Ltd</p>\r\n<p>A high-tech enterprise integrating product sales, technical services and software development. The service scope covers software sales, private cloud, IT infrastructure system planning, IT consulting, system implementation, information security construction, business system development and other comprehensive businesses.</p>\r\n<p>Address: Floor 1, Caiyi Office Building, No. 40, Beiyuan Road, Chaoyang District, Beijing</p>\r\n<p>Business Department: 010 - 8888888 12345678890</p>\r\n<p>Technical Department: 010 - 88888888</p>\r\n<p>Email: example@example.com</p>\r\n<p>Enterprise Brand Information Technology (Beijing) Co., Ltd</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/contact.png\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (193, '<p>test team content</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/teams1.jpeg\" alt=\"\" width=\"1024\" height=\"1009\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (194, '热烈祝贺xx公司，官方网站正式上线');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (195, '热烈祝贺xx公司，官方网站正式上线');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (196, '热烈祝贺xx公司，官方网站正式上线');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (197, '热烈祝贺xx公司，官方网站正式上线');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (198, '热烈祝贺xx公司，官方网站正式上线');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (199, '热烈祝贺xx公司，官方网站正式上线');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (200, '热烈祝贺xx公司，官方网站正式上线');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (201, '<p>Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained<img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (202, '');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (203, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (204, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (205, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (206, '');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (211, '<p><img src=\"/assets/addons/ldcms/default/images/b2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (212, '<p><img src=\"/assets/addons/ldcms/default/images/b1.jpeg\" alt=\"\" /></p>\r\n<p>图片展示</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (213, '<p>业务经理的测试内容</p>\r\n<p>业务经理的测试内容</p>\r\n<p><img src=\"teams1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (214, '<p><img src=\"/assets/addons/ldcms/default/images/teams2.jpeg\" alt=\"\" width=\"1024\" height=\"1009\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (216, '<p>\r\n	展会策划之超维震撼亮相深圳礼品展\r\n</p>\r\n<p>\r\n	<span style=\"color:#202124;font-family:menlo, monospace;font-size:11px;background-color:#FFFFFF;\">超维携带着新品“宇宙骑士”震撼亮相深圳展会中心举行的大型礼品展</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	\r\n</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (217, '<p>\r\n	展会策划之超维震撼亮相深圳礼品展\r\n</p>\r\n<p>\r\n	<span style=\"color:#202124;font-family:menlo, monospace;font-size:11px;background-color:#FFFFFF;\">超维携带着新品“宇宙骑士”震撼亮相深圳展会中心举行的大型礼品展</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	\r\n</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (218, '<p>\r\n	展会策划之超维震撼亮相深圳礼品展\r\n</p>\r\n<p>\r\n	<span style=\"color:#202124;font-family:menlo, monospace;font-size:11px;background-color:#FFFFFF;\">超维携带着新品“宇宙骑士”震撼亮相深圳展会中心举行的大型礼品展</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	\r\n</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (219, '<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (220, '<p>从长岛一直延伸到Plane Land的新隧道</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b7.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (221, '<p>展会策划之超维震撼亮相深圳礼品展</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (222, '<p>我们为陆上和海上平台提供钢材</p>\r\n<p>他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿，你应该承受更多的痛苦，逃离世界末日。某物</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (253, '<p><img src=\"/assets/addons/ldcms/default/images/teams3.jpeg\" alt=\"\" width=\"1024\" height=\"1009\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (262, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (263, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (264, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (265, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (266, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (267, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (268, '<p><img src=\"/assets/addons/ldcms/default/images/teams4.jpeg\" alt=\"\" width=\"1024\" height=\"1009\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (269, '<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (270, '<p>从长岛一直延伸到Plane Land的新隧道</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b7.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (271, '<p>展会策划之超维震撼亮相深圳礼品展</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (272, '<p>我们为陆上和海上平台提供钢材</p>\r\n<p>他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿，你应该承受更多的痛苦，逃离世界末日。某物</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (273, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (274, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (275, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (276, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (277, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (278, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (279, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (280, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (281, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (282, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (283, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (284, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (285, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (286, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (287, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (288, '<h5>运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5>这些内容是测试的数据，运输行业解决方案,为运输行业提供了非常完善的解决方案</h5>\r\n<h5><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" width=\"100%\" /></h5>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (289, '<p>钢铁行业解决方案</p>\r\n<p>让我们花费很很大的心血才研制出来</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (290, '<p>建筑行业解决方案</p>\r\n<p>相对而言要简单些</p>\r\n<p>因为这个行业比较的成熟</p>\r\n<p>这些内容专为测试时使用</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (291, '<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (292, '<p>从长岛一直延伸到Plane Land的新隧道</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b7.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (293, '<p>展会策划之超维震撼亮相深圳礼品展</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (294, '<p>我们为陆上和海上平台提供钢材</p>\r\n<p>他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿，你应该承受更多的痛苦，逃离世界末日。某物</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (295, '<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (296, '<p>从长岛一直延伸到Plane Land的新隧道</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b7.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (297, '<p>展会策划之超维震撼亮相深圳礼品展</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (298, '<p>我们为陆上和海上平台提供钢材</p>\r\n<p>他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿，你应该承受更多的痛苦，逃离世界末日。某物</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (299, '<p>展会策划之超维震撼亮相深圳礼品展</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (300, '<p>我们为陆上和海上平台提供钢材</p>\r\n<p>他意识到自己喜欢它。他们说他们被开除了。我们应该尽最大努力，但没有人会高兴，因为这个意愿，你应该承受更多的痛苦，逃离世界末日。某物</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (301, '<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>集团领导到工厂视察，工厂技术人员讲解</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (302, '<p>展会策划之超维震撼亮相深圳礼品展</p>\r\n<p><span style=\"color: #202124; font-family: menlo, monospace; font-size: 11px; background-color: #ffffff;\">超维携带着新品&ldquo;宇宙骑士&rdquo;震撼亮相深圳展会中心举行的大型礼品展</span></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (303, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (304, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (305, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (306, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (307, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (308, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (309, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (310, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (311, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (312, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (313, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (314, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (315, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (316, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (317, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (318, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (319, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (320, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (321, '<h4 class=\"mb-lg-3 mb-2\">Construction industry solutions</h4>\r\n<p>sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing sed do eiusmod tempor incididunt ut Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, eiusmod tempor incididunt ut labore et consectetur adipiscing</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (322, '<p>Solutions for steel industry</p>\r\n<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit ametSolutions for steel industryLorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p>\r\n<p>Solutions for steel industry</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro2.jpeg\" alt=\"\" width=\"1024\" height=\"683\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (323, '<p>Transportation industry solutions</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p>We are good at what others can\'t do</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/pro1.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (324, '<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, pellentesque ullamcorper lectus ut labore et. Suspendisse aliquam, libero non posuere hendrerit, libero ligula interdum tortor</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (325, '<p>10 small things to pay attention to in the process of steel production</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (326, '<p>Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained<img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (327, '<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, pellentesque ullamcorper lectus ut labore et. Suspendisse aliquam, libero non posuere hendrerit, libero ligula interdum tortor</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (328, '<p>10 small things to pay attention to in the process of steel production</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (329, '<p>Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained<img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (330, '<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, pellentesque ullamcorper lectus ut labore et. Suspendisse aliquam, libero non posuere hendrerit, libero ligula interdum tortor</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (331, '<p>10 small things to pay attention to in the process of steel production</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (332, '<p>Group leaders visited the factory and the factory technicians explainedGroup leaders visited the factory and the factory technicians explained<img src=\"/assets/addons/ldcms/default/images/b8.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (333, '<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliqu yam erat, sed diam voluptua. Fusce sapien velit, pretium at sapien sed, pellentesque ullamcorper lectus ut labore et. Suspendisse aliquam, libero non posuere hendrerit, libero ligula interdum tortor</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b5.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (334, '<p>10 small things to pay attention to in the process of steel production</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b6.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (335, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr</p>\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b1.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (336, '<p>sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n<p>&nbsp;</p>\r\n<p>sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n<p>sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b2.jpeg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (337, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr</p>\r\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b3.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (338, '<p>sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n<p>&nbsp;</p>\r\n<p>sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n<p>sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n<p><img src=\"/assets/addons/ldcms/default/images/b4.jpeg\" alt=\"\" width=\"340\" height=\"280\" /></p>\r\n<p>&nbsp;</p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (339, '<p><img src=\"/assets/addons/ldcms/default/images/teams4.jpeg\" alt=\"\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (340, '<p><img src=\"/assets/addons/ldcms/default/images/teams2.jpeg\" alt=\"\" width=\"100%\" /></p>');
INSERT INTO `fa_ldcms_document_content` (`document_id`, `content`) VALUES (341, '<p><img src=\"/assets/addons/ldcms/default/images/teams3.jpeg\" alt=\"\" width=\"100%\" /></p>');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_document_news
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_document_news`;
CREATE TABLE `fa_ldcms_document_news` (
  `document_id` int(10) NOT NULL,
  `test` varchar(255) DEFAULT '' COMMENT '测试',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新闻';

-- ----------------------------
-- Records of fa_ldcms_document_news
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (11, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (42, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (44, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (46, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (48, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (50, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (51, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (108, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (110, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (111, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (194, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (195, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (196, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (197, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (198, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (199, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (200, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (201, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (215, '测试字段');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (216, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (217, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (218, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (219, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (220, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (221, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (222, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (223, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (224, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (269, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (270, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (271, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (272, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (291, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (292, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (293, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (294, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (295, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (296, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (297, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (298, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (299, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (300, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (301, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (302, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (324, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (325, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (326, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (327, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (328, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (329, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (330, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (331, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (332, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (333, '');
INSERT INTO `fa_ldcms_document_news` (`document_id`, `test`) VALUES (334, '');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_document_page
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_document_page`;
CREATE TABLE `fa_ldcms_document_page` (
  `document_id` int(10) NOT NULL,
  `test` varchar(255) DEFAULT '' COMMENT 'test',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单页';

-- ----------------------------
-- Records of fa_ldcms_document_page
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (13, '');
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (16, '');
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (17, '');
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (53, '');
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (188, '');
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (191, '');
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (192, '');
INSERT INTO `fa_ldcms_document_page` (`document_id`, `test`) VALUES (206, '');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_document_product
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_document_product`;
CREATE TABLE `fa_ldcms_document_product` (
  `document_id` int(10) NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `zhekou` varchar(255) DEFAULT '' COMMENT '折扣',
  `types` varchar(255) DEFAULT '' COMMENT '类型',
  `test` varchar(255) DEFAULT '' COMMENT '测试',
  `color` varchar(50) DEFAULT '' COMMENT '颜色',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品';

-- ----------------------------
-- Records of fa_ldcms_document_product
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (52, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (54, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (55, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (56, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (57, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (58, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (59, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (60, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (61, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (62, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (63, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (64, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (65, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (66, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (67, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (68, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (69, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (70, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (71, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (72, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (73, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (74, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (75, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (76, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (77, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (78, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (79, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (80, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (81, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (82, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (83, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (84, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (85, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (86, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (87, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (88, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (89, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (90, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (91, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (92, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (93, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (94, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (95, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (96, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (97, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (98, 0.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (112, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (113, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (114, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (115, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (116, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (117, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (118, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (119, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (120, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (121, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (122, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (123, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (124, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (125, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (126, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (127, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (128, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (129, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (130, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (131, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (132, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (133, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (134, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (135, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (136, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (137, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (138, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (139, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (140, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (141, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (142, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (143, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (144, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (145, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (146, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (147, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (148, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (149, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (150, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (151, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (152, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (153, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (154, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (155, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (156, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (157, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (158, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (159, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (160, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (161, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (162, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (163, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (164, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (165, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (166, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (167, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (168, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (169, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (170, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (171, 1999.00, '', '0', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (172, 1999.00, NULL, '', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (173, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (174, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (202, 0.00, '', '0', '', '');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (203, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (204, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (205, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (209, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (210, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (225, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (226, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (227, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (228, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (229, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (230, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (231, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (232, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (233, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (234, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (235, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (236, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (237, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (238, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (239, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (240, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (241, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (242, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (243, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (244, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (245, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (246, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (247, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (248, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (249, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (250, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (251, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (252, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (255, 1999.00, '', '0,1', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (256, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (257, 1999.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (262, 0.00, '', '0,1,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (263, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (264, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (265, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (266, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (267, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (273, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (274, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (275, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (276, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (277, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (278, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (279, 0.00, '', '0', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (280, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (281, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (282, 0.00, '', '0', '', '4');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (283, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (284, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (285, 0.00, '', '0', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (286, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (287, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (288, 0.00, '', '0', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (289, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (290, 0.00, '', '0', '', '1');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (303, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (304, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (305, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (306, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (307, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (308, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (309, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (310, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (311, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (312, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (313, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (314, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (315, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (316, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (317, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (318, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (319, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (320, 0.00, '', '0,1', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (321, 0.00, '', '0,1,2', '', '3');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (322, 0.00, '', '0,2', '', '2');
INSERT INTO `fa_ldcms_document_product` (`document_id`, `price`, `zhekou`, `types`, `test`, `color`) VALUES (323, 0.00, '', '0,1', '', '2');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_document_team
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_document_team`;
CREATE TABLE `fa_ldcms_document_team` (
  `document_id` int(10) NOT NULL,
  `zhiwei` varchar(255) DEFAULT '' COMMENT '职位',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团队';

-- ----------------------------
-- Records of fa_ldcms_document_team
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (193, '');
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (213, '业务经理');
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (214, '');
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (253, '交互设计师');
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (268, '交互设计师');
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (339, '');
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (340, '');
INSERT INTO `fa_ldcms_document_team` (`document_id`, `zhiwei`) VALUES (341, '');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_fields
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_fields`;
CREATE TABLE `fa_ldcms_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) NOT NULL DEFAULT '0' COMMENT '模型',
  `field` char(30) DEFAULT '' COMMENT '名称',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `title` varchar(30) DEFAULT '' COMMENT '标题',
  `filterlist` text COMMENT '筛选列表',
  `default` varchar(100) DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `tip` varchar(100) DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend_html` varchar(255) DEFAULT '' COMMENT '扩展信息',
  `setting` varchar(1500) DEFAULT '' COMMENT '配置信息',
  `sort` int(10) NOT NULL DEFAULT '9' COMMENT '排序',
  `create_time` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `issort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可排序',
  `isfilter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '筛选',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `content_list` text COMMENT '数据列表',
  `visible` varchar(255) DEFAULT '' COMMENT '动态显示',
  `islist` tinyint(1) DEFAULT '1' COMMENT '数据列表显示',
  PRIMARY KEY (`id`),
  KEY `id` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='自定义字段表';

-- ----------------------------
-- Records of fa_ldcms_fields
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (6, 2, 'test', 'string', '测试', NULL, '', '', '', 0, 255, NULL, 0, '', '', 9, 1660653275, 1662467472, 0, 0, 1, NULL, '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (7, 1, 'test', 'string', 'test', NULL, '', '', '', 0, 255, NULL, 0, '', '', 9, 1660977429, 1662467477, 0, 0, 1, NULL, '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (8, 6, 'price', 'number', '价格', NULL, '0', '', '', 2, 10, NULL, 0, '', '', 9, 1661073285, 1665134619, 0, 1, 1, NULL, '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (9, 7, 'xmbj', 'text', '项目背景', NULL, '', '', '', 0, 0, NULL, 0, '', '', 9, 1662162624, 1662467464, 0, 0, 1, NULL, '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (10, 8, 'zhiwei', 'string', '职位', NULL, '', '', '', 0, 255, NULL, 0, '', '', 9, 1662167625, 1662467454, 0, 0, 1, NULL, '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (11, 6, 'zhekou', 'string', '折扣', NULL, '', '', '', 0, 255, NULL, 0, '', '', 9, 1662467517, 1665064065, 0, 0, 1, NULL, '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (12, 6, 'types', 'checkbox', '类型', NULL, '', '', '', 0, 255, 1, 0, '', '', 9, 1665145048, 1665151504, 0, 1, 1, '0:基础\r\n1:专业\r\n2:旗舰\r\n', '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (14, 6, 'test', 'selectpage', '测试', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"fa_ldcms_document\",\"primarykey\":\"id\",\"field\":\"title\",\"key\":\"\",\"value\":\"\",\"conditions\":\"{}\"}', 9, 1665458553, 1673140330, 0, 0, 1, '', '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (15, 7, 'test1', 'selectpage', '测试关联表', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"fa_ldcms_category\",\"primarykey\":\"id\",\"field\":\"name\",\"conditions\":\"{}\"}', 9, 1665469184, 1665475043, 0, 0, 1, '', '', 1);
INSERT INTO `fa_ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES (18, 6, 'color', 'radio', '颜色', NULL, '', '', '', 0, 50, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"null \",\"key\":\"\",\"value\":\"\"}', 9, 1673234711, 1673234716, 0, 1, 1, '1:红色\r\n2:绿色\r\n3:黄色\r\n4:黑色', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_langs
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_langs`;
CREATE TABLE `fa_ldcms_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '名称',
  `sub_title` varchar(255) DEFAULT '' COMMENT '简称',
  `code` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '编码',
  `domain` varchar(100) DEFAULT '' COMMENT '域名',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '默认语言',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='多语言表';

-- ----------------------------
-- Records of fa_ldcms_langs
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_langs` (`id`, `title`, `sub_title`, `code`, `domain`, `status`, `is_default`, `sort`, `create_time`, `update_time`) VALUES (1, '简体中文', '', 'zh-cn', '', 1, 1, 0, 1675334627, 1675334724);
INSERT INTO `fa_ldcms_langs` (`id`, `title`, `sub_title`, `code`, `domain`, `status`, `is_default`, `sort`, `create_time`, `update_time`) VALUES (2, 'English', '', 'en', '', 1, 0, 0, 1675334645, 1675334645);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_links
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_links`;
CREATE TABLE `fa_ldcms_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '类型',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'logo',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) NOT NULL DEFAULT '9' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 ',
  `target` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '跳转',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `lang` varchar(255) DEFAULT '' COMMENT '语言',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接';

-- ----------------------------
-- Records of fa_ldcms_links
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_links` (`id`, `type`, `title`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`) VALUES (1, 'link', '测试2', '', 'http://www.example.com', 10, 1, '_blank', 1662207821, 1673232336, 'zh-cn');
INSERT INTO `fa_ldcms_links` (`id`, `type`, `title`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`) VALUES (2, 'link', '测试1', '', 'http://www.example.com', 9, 1, '_blank', 1662208033, 1673326576, 'zh-cn');
INSERT INTO `fa_ldcms_links` (`id`, `type`, `title`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`) VALUES (4, 'link', 'en google', '', 'http://www.example.com', 9, 1, '_blank', 1672919587, 1672919614, 'en');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_message
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_message`;
CREATE TABLE `fa_ldcms_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `diyform_id` int(10) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `user_os` varchar(255) DEFAULT NULL,
  `user_bs` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `uname` varchar(100) DEFAULT '' COMMENT '姓名',
  `mobile` varchar(100) DEFAULT '' COMMENT '手机号',
  `remark` varchar(100) DEFAULT '' COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='在线留言';

-- ----------------------------
-- Records of fa_ldcms_message
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_message` (`id`, `diyform_id`, `lang`, `user_ip`, `user_os`, `user_bs`, `create_time`, `update_time`, `uname`, `mobile`, `remark`) VALUES (1, 16, 'zh-cn', '192.168.32.1', 'Mac', 'Chrome', 1672923706, 1672923706, 'root', '13112341234', 'sasdf');
INSERT INTO `fa_ldcms_message` (`id`, `diyform_id`, `lang`, `user_ip`, `user_os`, `user_bs`, `create_time`, `update_time`, `uname`, `mobile`, `remark`) VALUES (2, 16, 'en', '192.168.32.1', 'Mac', 'Chrome', 1672923742, 1672923742, 'test', '13112341231', 'testtesttesttest');
INSERT INTO `fa_ldcms_message` (`id`, `diyform_id`, `lang`, `user_ip`, `user_os`, `user_bs`, `create_time`, `update_time`, `uname`, `mobile`, `remark`) VALUES (6, 16, 'en', '192.168.32.1', 'Mac', 'Chrome', 1673573182, 1673573182, 'root', '13112341234', 'sdfsfsdf');
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_models
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_models`;
CREATE TABLE `fa_ldcms_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '模型名',
  `table_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '对应表',
  `template_list` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '列表模板',
  `template_detail` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容模板',
  `ismenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台菜单',
  `default_fields` text COMMENT '默认字段',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0 = 关闭  || 1= 正常',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='cms 模型表';

-- ----------------------------
-- Records of fa_ldcms_models
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES (2, '新闻', 'news', 'list_news.html', 'detail_news.html', 1, NULL, NULL, 1, 1660652121, 1673490730);
INSERT INTO `fa_ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES (1, '单页', 'page', '', 'detail_page.html', 1, NULL, NULL, 1, 1660729799, 1660953440);
INSERT INTO `fa_ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES (6, '产品', 'product', 'list_product.html', 'detail_product.html', 1, NULL, NULL, 1, 1661071323, 1673491797);
INSERT INTO `fa_ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES (7, '案例', 'case', 'list_case.html', 'detail_case.html', 1, NULL, NULL, 1, 1662162090, 1673490728);
INSERT INTO `fa_ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES (8, '团队', 'team', 'list_team.html', 'detail_team.html', 1, NULL, NULL, 1, 1662162420, 1673491744);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_siteinfo
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_siteinfo`;
CREATE TABLE `fa_ldcms_siteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(50) NOT NULL COMMENT '语言',
  `config` text COMMENT '配置',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang` (`lang`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='站点信息表';

-- ----------------------------
-- Records of fa_ldcms_siteinfo
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_siteinfo` (`id`, `lang`, `config`, `create_time`, `update_time`) VALUES (1, 'zh-cn', '[{\"name\":\"template\",\"title\":\"前台模板\",\"type\":\"select\",\"content\":\"[\\\"default\\\"]\",\"value\":\"default\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"请确保addons\\/ldcms\\/view有相应的目录\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitetitle\",\"title\":\"网站标题\",\"type\":\"string\",\"content\":[],\"value\":\"BiuBiu Star Culture Media CO.,LTD\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitesubtitle\",\"title\":\"网站副标题\",\"type\":\"string\",\"content\":[],\"value\":\"BiuBiu Star Culture Media CO.,LTD\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_keywords\",\"title\":\"网站关键词\",\"type\":\"text\",\"content\":[],\"value\":\"BiuBiu Star Culture Media CO.,LTD\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_description\",\"title\":\"网站描述\",\"type\":\"text\",\"content\":[],\"value\":\"BiuBiu Star Culture Media CO.,LTD\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo1\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo1.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo2\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo2.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"compony\",\"title\":\"公司名称\",\"type\":\"string\",\"content\":[],\"value\":\"BiuBiu Star Culture Media CO.,LTD\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"tel\",\"title\":\"联系电话\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"phone\",\"title\":\"手机号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"+84 924 469 582\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"address\",\"title\":\"地址\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"38 Nguyễn Văn Kỉnh, Phường Thạnh Mỹ Lợi, Thủ Đức, Hồ Chí Minh 008428, Vietnam\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"email\",\"title\":\"邮箱\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"123123@163.com\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"contacts\",\"title\":\"联系人\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"李经理\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"qq\",\"title\":\"在线咨询链接\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"http:\\/\\/wpa.qq.com\\/msgrd?v=3&uin=&site=qq&menu=yes\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"image\",\"name\":\"wechat\",\"title\":\"微信二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"image\",\"name\":\"wechat2\",\"title\":\"微信二维码2\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"icp\",\"title\":\"ICP备案号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"copyright\",\"title\":\"底部版权\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"BiuBiu Star Culture Media CO.,LTD\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"script\",\"title\":\"第三方代码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"rule\":\"\",\"extend\":\"\"}]', 1680791788, 1754508258);
INSERT INTO `fa_ldcms_siteinfo` (`id`, `lang`, `config`, `create_time`, `update_time`) VALUES (2, 'en', '[{\"name\":\"template\",\"title\":\"前台模板\",\"type\":\"select\",\"content\":\"[\\\"default\\\"]\",\"value\":\"en\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"请确保addons\\/ldcms\\/view有相应的目录\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitetitle\",\"title\":\"网站标题\",\"type\":\"string\",\"content\":[],\"value\":\"New Point Education啊1111\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"sitesubtitle\",\"title\":\"网站副标题\",\"type\":\"string\",\"content\":[],\"value\":\"苏州xx教育公司中文\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_keywords\",\"title\":\"网站关键词\",\"type\":\"text\",\"content\":[],\"value\":\"New Point Education\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"seo_description\",\"title\":\"网站描述\",\"type\":\"text\",\"content\":[],\"value\":\"New Point Education\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo1\",\"title\":\"网站logo\",\"type\":\"images\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo1.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"logo2\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo2.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"name\":\"compony\",\"title\":\"公司名称\",\"type\":\"string\",\"content\":[],\"value\":\"New Point Education\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"tel\",\"title\":\"联系电话\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"phone\",\"title\":\"手机号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"address\",\"title\":\"地址\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"Room 1301, Suzhou News Building, No. 118, Bada Street, Suzhou Industrial Park, Jiangsu Province\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"email\",\"title\":\"邮箱\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"hr-zhaopin@163.com\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"contacts\",\"title\":\"联系人\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"Manager Li\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"qq\",\"title\":\"在线咨询链接\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"http:\\/\\/wpa.qq.com\\/msgrd?v=3&uin=&site=qq&menu=yes\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"image\",\"name\":\"wechat\",\"title\":\"微信二维码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"image\",\"name\":\"wechat2\",\"title\":\"微信二维码2\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/qrcode.png\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"icp\",\"title\":\"ICP备案号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"苏ICP备88888888号\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"string\",\"name\":\"copyright\",\"title\":\"底部版权\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"xxxTechnology Co., Ltd\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},{\"type\":\"text\",\"name\":\"script\",\"title\":\"第三方代码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}]', 1680791969, 1689303456);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_tagaction
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_tagaction`;
CREATE TABLE `fa_ldcms_tagaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT '' COMMENT '方法名称',
  `type` enum('sql','func') DEFAULT 'sql' COMMENT '方法类型：sql=sql语句,func=函数名',
  `setting` text COMMENT '方法主体',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='自定义标签sql';

-- ----------------------------
-- Records of fa_ldcms_tagaction
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_tagaction` (`id`, `action`, `type`, `setting`, `create_time`, `update_time`) VALUES (1, 'product', 'sql', '{\"model\":\"\\\\addons\\\\ldcms\\\\model\\\\Document\",\"name\":\"ldcms_document\",\"db_type\":\"model\",\"alias\":\"document\",\"field\":\"document.*,extend.*,category.name cname,category.urlname curlname\",\"join\":[[\"ldcms_document_content content\",\"content.document_id=document.id\",\"LEFT\"],[\"ldcms_document_product extend\",\"extend.document_id=document.id\",\"LEFT\"],[\"ldcms_category category\",\"category.id=document.cid\",\"LEFT\"]],\"class\":\"\\\\addons\\\\ldcms\\\\model\\\\Document\",\"func\":\"getHomeList\",\"params\":[[\"mid\",\"=\",\"6\",\"AND\"],[\"lang\",\"=\",\":ld_get_home_lang\",\"AND\"],[\"status\",\"=\",\"1\",\"AND\"],{\"0\":\"filter_where\",\"1\":\"CUSTOM\",\"3\":\"AND\"},[\"show_time\",\"<=\",\":time\",\"AND\"],{\"0\":\"cid\",\"1\":\"IN\",\"3\":\"AND\"},{\"0\":\"sub_cid\",\"1\":\"FIND_IN_SET_AND\",\"3\":\"OR\"}]}', 1716512401, 1716730332);
INSERT INTO `fa_ldcms_tagaction` (`id`, `action`, `type`, `setting`, `create_time`, `update_time`) VALUES (2, 'home_block', 'sql', '{\"model\":\"\\\\addons\\\\ldcms\\\\model\\\\Category\",\"name\":\"\",\"db_type\":\"model\",\"alias\":\"category\",\"field\":\"id,is_home,name,urlname,model_table_name,subname,pid\",\"class\":\"\",\"func\":\"\",\"params\":[[\"lang\",\"=\",\":ld_get_home_lang\",\"AND\"],[\"status\",\"=\",\"1\",\"AND\"],[\"pid\",\"=\",\"0\",\"AND\"],[\"type\",\"=\",\"0\",\"AND\"],{\"0\":\"model_table_name\",\"1\":\"=\",\"3\":\"AND\"},[\"is_home\",\"=\",\"1\",\"AND\"]],\"join\":null}', 1716732521, 1716733942);
COMMIT;

-- ----------------------------
-- Table structure for fa_ldcms_tags
-- ----------------------------
DROP TABLE IF EXISTS `fa_ldcms_tags`;
CREATE TABLE `fa_ldcms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `use_num` int(11) DEFAULT '0' COMMENT '使用次数',
  `lang` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='文章tags\n';

-- ----------------------------
-- Records of fa_ldcms_tags
-- ----------------------------
BEGIN;
INSERT INTO `fa_ldcms_tags` (`id`, `name`, `title`, `use_num`, `lang`, `create_time`, `update_time`) VALUES (5, 'tag1', 'tag1', 2, 'zh-cn', 1673574196, 1673574196);
COMMIT;

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信验证码表';

-- ----------------------------
-- Records of fa_sms
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) DEFAULT '0' COMMENT '会员ID',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) DEFAULT NULL COMMENT '分类ID(多选)',
  `tags` varchar(255) DEFAULT '' COMMENT '标签',
  `week` enum('monday','tuesday','wednesday') DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `images` varchar(1500) DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `city` varchar(100) DEFAULT '' COMMENT '省市',
  `array` varchar(255) DEFAULT '' COMMENT '数组:value=值',
  `json` varchar(255) DEFAULT '' COMMENT '配置:key=名称,value=值',
  `multiplejson` varchar(1500) DEFAULT '' COMMENT '二维数组:title=标题,intro=介绍,author=作者,age=年龄',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned DEFAULT '0' COMMENT '点击',
  `workrange` varchar(100) DEFAULT '' COMMENT '时间区间',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` bigint(16) DEFAULT NULL COMMENT '刷新时间',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(16) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='测试表';

-- ----------------------------
-- Records of fa_test
-- ----------------------------
BEGIN;
INSERT INTO `fa_test` (`id`, `user_id`, `admin_id`, `category_id`, `category_ids`, `tags`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `array`, `json`, `multiplejson`, `price`, `views`, `workrange`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`) VALUES (1, 1, 1, 12, '12,13', '互联网,计算机', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '我是一篇测试文章描述，内容过多时将自动隐藏', '广西壮族自治区/百色市/平果县', '[\"a\",\"b\"]', '{\"a\":\"1\",\"b\":\"2\"}', '[{\"title\":\"标题一\",\"intro\":\"介绍一\",\"author\":\"小明\",\"age\":\"21\"}]', 0.00, 0, '2020-10-01 00:00:00 - 2021-10-31 23:59:59', '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');
COMMIT;

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` bigint(16) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` bigint(16) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `loginfailuretime` bigint(16) DEFAULT NULL COMMENT '最后登录失败时间',
  `joinip` varchar(50) DEFAULT '' COMMENT '加入IP',
  `jointime` bigint(16) DEFAULT NULL COMMENT '加入时间',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) DEFAULT '' COMMENT 'Token',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  `verification` varchar(255) DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
BEGIN;
INSERT INTO `fa_user` (`id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `loginfailuretime`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES (1, 1, 'admin', 'admin', 'bf991b47626d969f002bd17eed8d56b0', '2f4455', 'admin@163.com', '13000000000', '/assets/img/avatar.png', 0, 0, '2017-04-08', '', 0.00, 0, 1, 1, 1491635035, 1491635035, '127.0.0.1', 0, 1491635035, '127.0.0.1', 1491635035, 0, 1491635035, '', 'normal', '');
COMMIT;

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员组表';

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
BEGIN;
INSERT INTO `fa_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员余额变动表';

-- ----------------------------
-- Records of fa_user_money_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='会员规则表';

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
BEGIN;
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal');
INSERT INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员积分变动表';

-- ----------------------------
-- Records of fa_user_score_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `expiretime` bigint(16) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) DEFAULT '' COMMENT '包大小',
  `content` varchar(500) DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版本表';

-- ----------------------------
-- Records of fa_version
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
