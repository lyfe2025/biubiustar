-- SQL Dump by Erik Edgren
-- version 1.0
--
-- SQL Dump created: August 9th, 2025 @ 4:45 am

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";



-- --------------------------------------------------------



--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_ad`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_ad` (
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
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='广告表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_ad` (`id`, `type`, `title`, `content`, `description`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`, `is_video`, `video`) VALUES
(96, 'banner', '企业数字化门户系统', '', '助力从业者更好地定制策略和实现数字化转型升级，迎接时代浪潮！', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '#', 1, 1, '_self', 1661085982, 1748006743, 'zh-cn', 0, ''),
(98, 'banner', 'AI人工智能', '', '助力从业者更好地定制策略和实现数字化转型升级，迎接时代浪潮！', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '#', 5, 1, '_self', 1661092145, 1742912719, 'zh-cn', 0, NULL),
(102, 'api_about', 'api关于我们背景', '', '', '/assets/addons/ldcms/default/images/ebg.jpg', '#', 9, 1, '_self', 1671413071, 1689385114, 'zh-cn', 0, NULL),
(139, 'qrcode', 'Douyin QR Code', '', '', '/assets/addons/ldcms/ldcms2025/images/qrcode.png', '#', 9, 1, '_self', 1742211544, 1742211544, 'en', 0, NULL),
(140, 'qrcode', 'WeChat QR Code', '', '', '/assets/addons/ldcms/ldcms2025/images/qrcode.png', '#', 9, 1, '_self', 1742211517, 1742211517, 'en', 0, NULL),
(141, 'banner', 'Carousel Images Support Video', '', 'Smart VR Glasses, Technology Changes Life', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '#', 3, 1, '_self', 1742911833, 1742960932, 'en', 1, '/assets/addons/ldcms/ldcms2025/images/video.mp4'),
(115, 'about', '首页关于我们背景', '', '', '/assets/addons/ldcms/default/images/about.jpeg', '#', 9, 1, '_self', 1689385792, 1742969842, 'zh-cn', 0, ''),
(137, 'api_about', 'API About Us Background', '', '', '/assets/addons/ldcms/default/images/ebg.jpg', '#', 9, 1, '_self', 1671413071, 1689385114, 'en', 0, NULL),
(138, 'about', 'Homepage About Us Background', '', '', '/assets/addons/ldcms/default/images/about.jpeg', '#', 9, 1, '_self', 1689385792, 1742969842, 'en', 0, ''),
(136, 'banner', 'AI Artificial Intelligence', '', 'Help practitioners better formulate strategies and achieve digital transformation and upgrading to meet the tide of the times!', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '#', 5, 1, '_self', 1661092145, 1742912719, 'en', 0, NULL),
(135, 'banner', 'Enterprise Digital Portal System', '', 'Help practitioners better formulate strategies and achieve digital transformation and upgrading to meet the tide of the times!', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '#', 1, 1, '_self', 1661085982, 1742912704, 'en', 0, ''),
(126, 'qrcode', '抖音二维码', '', '', '/assets/addons/ldcms/ldcms2025/images/qrcode.png', '#', 9, 1, '_self', 1742211544, 1742211544, 'zh-cn', 0, NULL),
(125, 'qrcode', '微信二维码', '', '', '/assets/addons/ldcms/ldcms2025/images/qrcode.png', '#', 9, 1, '_self', 1742211517, 1742211517, 'zh-cn', 0, NULL),
(127, 'banner', '轮播图片支持使用视频', '', '智能VR眼镜，科技改变生活', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '#', 3, 1, '_self', 1742911833, 1742960932, 'zh-cn', 1, '/assets/addons/ldcms/ldcms2025/images/video.mp4');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_category`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_category` (
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


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_category` (`id`, `name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `outlink`, `image`, `big_image`, `seo_title`, `seo_keywords`, `seo_description`, `sort`, `lang`, `is_target`, `type`, `gid`, `status`, `create_time`, `update_time`, `is_nav`, `is_home`, `subname`, `model_table_name`, `des1`, `des2`) VALUES
(125, '关于我们', 'about us', 0, 1, 'guanyuwomen', '', 'detail_about.html', '@/gongsijianjie.html', '', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '', '', '', 1, 'zh-cn', 0, 1, '', 1, 1660810013, 1747997926, 1, 0, '', 'page', '全套供热系统集成商、清洁智能锅炉提供商及国内供热服务商', '\"智慧 低碳 多元化”'),
(127, '行业资讯', '', 128, 2, 'hangyezixun', 'list_news.html', 'detail_news.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1660899388, 1661605908, 1, 0, NULL, '', '', ''),
(128, '新闻中心', 'News', 0, 2, 'xinwenzhongxin', 'list_news.html', 'detail_news.html', '@/gongsixinwen.html', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '测试新闻', '', '', 5, 'zh-cn', 0, 1, '', 1, 1660899406, 1742961071, 1, 1, '', 'news', '全套供热系统集成商、清洁智能锅炉提供商及国内供热服务商', '\"智慧 低碳 多元化”'),
(141, '联系我们', 'Contact Our Team', 0, 1, 'lianxiwomen', '', 'detail_contact.html', '', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1661005544, 1742968622, 1, 0, '', 'page', '联系我们的团队', '您可以在这里向我们发送一般问题查询'),
(143, '公司新闻', '', 128, 2, 'gongsixinwen', 'list_news.html', 'detail_news.html', '', '', '', '', '', '', 99, 'zh-cn', 0, 0, '', 1, 1661009757, 1673232822, 1, 0, NULL, '', '', ''),
(144, '产品中心', 'Products', 0, 6, 'chanpinzhongxin', 'list_product.html', 'detail_product.html', '@/chanpinxilie1.html', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '', '', '', 3, 'zh-cn', 0, 1, '', 1, 1661071377, 1743000641, 1, 1, '', 'product', '全套供热系统集成商、清洁智能锅炉提供商及国内供热服务商', '\"智慧 低碳 多元化”'),
(146, '合作客户', '', 125, 12, 'pinpaisheji', 'list_customer.html', 'detail_about.html', '@/gongsijianjie.html#abhzkh', '', '', '', '', '', 199, 'zh-cn', 0, 0, '', 1, 1662162275, 1745278445, 1, 1, '', 'wordlist', '', ''),
(147, '服务案例', 'service case', 0, 7, 'fuwuanli', 'list_case.html', 'detail_case.html', '', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '', '', '', 4, 'zh-cn', 0, 0, '', 1, 1662162301, 1743000644, 1, 1, '', 'case', '', ''),
(151, '产品系列1', '', 144, 6, 'chanpinxilie1', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 1, 'zh-cn', 0, 0, '', 1, 1665539057, 1745278887, 1, 0, '', 'product', '', ''),
(161, '产品系列2', '', 144, 6, 'chanpinxilie2', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 2, 'zh-cn', 0, 0, '', 1, 1673232846, 1742647163, 1, 0, '', 'product', '', ''),
(166, '下载中心', 'download', 0, 13, 'xiazaizhongxin', 'list_down.html', 'detail_news.html', '', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '', '', '', 6, 'zh-cn', 0, 0, '', 1, 1708487485, 1742961127, 1, 0, '', 'download', '', ''),
(239, '公司简介', 'company profile', 125, 1, 'gongsijianjie', '', 'detail_about.html', '', '', '', '', '', '', 1, 'zh-cn', 0, 0, '', 1, 1742260533, 1748006462, 1, 0, '', 'page', '', ''),
(240, '智能手机', '', 144, 6, 'mobile', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 240, 'zh-cn', 0, 0, '', 1, 1742971699, 1742974817, 1, 0, '', 'product', '', ''),
(241, 'AI机器人', '', 144, 6, 'robot', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 241, 'zh-cn', 0, 0, '', 1, 1742971699, 1742974824, 1, 0, '', 'product', '', ''),
(248, 'About us', 'about us', 0, 1, 'guanyuwomen_en', '', 'detail_about.html', '@/gongsijianjie_en.html', '', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '', '', '', 1, 'en', 0, 1, '', 1, 1742977031, 1742978314, 1, 0, '', 'page', 'A full set of heating system integrators, clean intelligent boiler providers and domestic heating service providers', '\"Smart Low-carbon Diversification\"'),
(249, 'Industry information', '', 250, 2, 'hangyezixun_en', 'list_news.html', 'detail_news.html', '', '', '', '', '', '', 99, 'en', 0, 0, '', 1, 1742977031, 1742977276, 1, 0, NULL, '', '', ''),
(250, 'News center', 'News', 0, 2, 'xinwenzhongxin_en', 'list_news.html', 'detail_news.html', '@/gongsixinwen_en.html', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', 'Test news', '', '', 5, 'en', 0, 1, '', 1, 1742977031, 1742983249, 1, 1, '', 'news', 'A full set of heating system integrators, clean intelligent boiler providers and domestic heating service providers', '\"Smart Low-carbon Diversification\"'),
(251, 'Contact us', 'Contact Our Team', 0, 1, 'lianxiwomen_en', '', 'detail_contact.html', '', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '', '', '', 99, 'en', 0, 0, '', 1, 1742977031, 1742977276, 1, 0, '', 'page', 'Contact our team', 'You can send us general question queries here'),
(252, 'Company news', '', 250, 2, 'gongsixinwen_en', 'list_news.html', 'detail_news.html', '', '', '', '', '', '', 99, 'en', 0, 0, '', 1, 1742977031, 1742977276, 1, 0, NULL, '', '', ''),
(253, 'Product center', 'Products', 0, 6, 'chanpinzhongxin_en', 'list_product.html', 'detail_product.html', '@/chanpinxilie1_en.html', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '', '', '', 3, 'en', 0, 1, '', 1, 1742977031, 1743000456, 1, 1, '', 'product', 'A full set of heating system integrators, clean intelligent boiler providers and domestic heating service providers', '\"Smart Low-carbon Diversification\"'),
(254, 'Cooperative customer', '', 248, 12, 'pinpaisheji_en', 'list_customer.html', 'detail_about.html', '@/gongsijianjie.html#abhzkh', '', '', '', '', '', 199, 'en', 0, 0, '', 1, 1742977031, 1743000500, 1, 1, '', 'wordlist', '', ''),
(255, 'Service case', 'service case', 0, 7, 'fuwuanli_en', 'list_case.html', 'detail_case.html', '', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '/assets/addons/ldcms/ldcms2025/images/banner2.jpg', '', '', '', 4, 'en', 0, 0, '', 1, 1742977031, 1743000462, 1, 1, '', 'case', '', ''),
(256, 'Product Series 1', '', 253, 6, 'chanpinxilie1_en', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 1, 'en', 0, 0, '', 1, 1742977031, 1742977255, 1, 0, NULL, '', '', ''),
(257, 'Product Series 2', '', 253, 6, 'chanpinxilie2_en', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 2, 'en', 0, 0, '', 1, 1742977031, 1742977255, 1, 0, '', 'product', '', ''),
(259, 'Download', 'download', 0, 13, 'xiazaizhongxin_en', 'list_down.html', 'detail_news.html', '', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '/assets/addons/ldcms/ldcms2025/images/banner1.jpg', '', '', '', 6, 'en', 0, 0, '', 1, 1742977031, 1742977381, 1, 0, '', 'download', '', ''),
(262, 'Company profile', '', 248, 1, 'gongsijianjie_en', '', 'detail_about.html', '', '', '', '', '', '', 1, 'en', 0, 0, '', 1, 1742977031, 1743000459, 1, 1, '', 'page', '', ''),
(263, 'Smart phone', '', 253, 6, 'mobile_en', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 240, 'en', 0, 0, '', 1, 1742977031, 1742977255, 1, 0, '', 'product', '', ''),
(264, 'AI robot', '', 253, 6, 'robot_en', 'list_product.html', 'detail_product.html', '', '', '', '', '', '', 241, 'en', 0, 0, '', 1, 1742977031, 1742977255, 1, 0, '', 'product', '', '');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_category_fields`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_category_fields` (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='栏目自定义字段表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_category_fields` (`id`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `status`) VALUES
(1, 'des1', 'string', '描述1', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', 9, 1708261628, 1748006592, 1),
(2, 'des2', 'string', '描述2', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 9, 1708261644, 1748006616, 1);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_content_url`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_content_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '链接',
  `lang` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章内容内链';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_content_url` (`id`, `name`, `url`, `lang`, `create_time`, `update_time`) VALUES
(1, '测试', 'http://www.example.com', 'zh-cn', 1665709509, 1673232306),
(3, '测试1', 'www.example.com', 'zh-cn', 1673488459, 1673488532);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_diyform`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_diyform` (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义表单表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_diyform` (`id`, `name`, `title`, `table`, `needlogin`, `iscaptcha`, `create_time`, `update_time`, `setting`, `status`) VALUES
(16, 'message', '在线留言', 'ldcms_message', 0, 0, 1672923154, 1748006872, '', 1);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_diyform_fields`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_diyform_fields` (
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`diyform_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_diyform_fields` (`id`, `diyform_id`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`) VALUES
(11, 16, 'uname', 'string', '姓名', NULL, '', 'require', '', NULL, 100, NULL, 0, '', '', 9, 1672923431, 1672923598, 0, 0, 1),
(12, 16, 'mobile', 'string', '手机号', NULL, '', 'require', '', NULL, 100, NULL, 0, '', '', 9, 1672923652, 1672923652, 0, 0, 1),
(13, 16, 'remark', 'string', '内容', NULL, '', 'require', '', NULL, 100, NULL, 0, '', '', 9, 1672923681, 1672923681, 0, 0, 1),
(14, 16, 'emails', 'string', '邮箱', NULL, '', '', '', NULL, 1000, NULL, 0, '', '', 9, 1708574006, 1708574006, 0, 0, 1),
(15, 16, 'companys', 'string', '公司', NULL, '', '', '', NULL, 100, NULL, 0, '', '', 9, 1708574019, 1748006845, 0, 0, 1);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '模型',
  `cid` int(11) DEFAULT NULL COMMENT '栏目',
  `sub_cid` varchar(255) DEFAULT '' COMMENT '副栏目',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '标题',
  `image` text CHARACTER SET utf8 COMMENT '缩略图',
  `pics` text CHARACTER SET utf8 COMMENT '多图',
  `show_time` bigint(16) DEFAULT NULL COMMENT '显示时间',
  `seo_keywords` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'seo关键词',
  `seo_description` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'seo描述',
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
  `custom_tpl` varchar(255) DEFAULT '' COMMENT '详情页模版',
  `custom_urlname` varchar(255) DEFAULT '' COMMENT '自定义url',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  `delete_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`mid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=766 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章基础表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document` (`id`, `mid`, `cid`, `sub_cid`, `title`, `image`, `pics`, `show_time`, `seo_keywords`, `seo_description`, `visits`, `likes`, `admin_id`, `author`, `sort`, `lang`, `flag`, `tag`, `outlink`, `status`, `gid`, `custom_tpl`, `custom_urlname`, `create_time`, `update_time`, `delete_time`) VALUES
(17, 1, 141, '', '联系我们', '/assets/addons/ldcms/default/images/contact.png', '', 1661009533, '', '企业品牌信息技术（北京）有限公司&nbsp;集产品销售、技术服务、软件开发于一身的高科技企业。服务范围涵盖了软件销售、私有云、IT基础架构系统规划、IT咨询、系统实施、信息安全构建、业务系统开发等全方位业务。地址：北京市朝阳区北苑路40号院彩一办公楼一层业务部：010 - 88888888 12345678890技术部：010 - 88888888邮箱：example@example.com网址：www....', 234, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1661009533, 1748006731, NULL),
(355, 2, 143, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy_copy', '/assets/addons/ldcms/default/images/b1.jpeg', '', 1662090058, '', '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。', 57, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1708485461, 1716894567, NULL),
(356, 2, 143, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy_copy', '/assets/addons/ldcms/default/images/b2.jpeg', '', 1662090058, '', '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。', 59, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1708485461, 1716894562, NULL),
(357, 2, 143, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy', '/assets/addons/ldcms/default/images/b3.jpeg', '', 1662090058, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚', 78, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1708485462, 1716894556, NULL),
(358, 2, 143, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy_copy', '/assets/addons/ldcms/default/images/b4.jpeg', '', 1662090058, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚', 115, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1708485462, 1716894546, NULL),
(359, 2, 143, '', '复制文档到网站后台，怎么样才能清除格式', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1662090058, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚', 203, 0, 0, 'abc', 0, 'zh-cn', '', '复制,文档,网站建设', '', 1, '', '', '', 1708485462, 1716894541, NULL),
(360, 12, 146, '', '合作客户', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708485820, 1742556063, NULL),
(402, 7, 147, '', '重庆某某汽车有限公司_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', '重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽...', 37, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708524420, 1716796874, NULL),
(403, 7, 147, '', '上海某某汽车有限公司_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', '上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy', 28, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708524420, 1716796867, NULL),
(404, 7, 147, '', '北京某某汽车有限公司_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', '北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy...', 49, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708524420, 1716853352, NULL),
(405, 7, 147, '', '重庆某某汽车有限公司_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', '重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy...', 116, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708524420, 1716853347, NULL),
(406, 7, 147, '', '上海某某汽车有限公司_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', '上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy...', 59, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708524420, 1716853319, NULL),
(415, 13, 166, '', 'DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609785, 1716604578, NULL),
(416, 13, 166, '', '333DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609908, 1708661938, NULL),
(417, 13, 166, '', 'DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609909, 1716604533, NULL),
(418, 13, 166, '', 'DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609909, 1708609909, NULL),
(419, 13, 166, '', 'DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609909, 1716604571, NULL),
(420, 13, 166, '', '22DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609909, 1708661930, NULL),
(421, 13, 166, '', 'DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609909, 1708659387, NULL),
(422, 13, 166, '', 'DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609910, 1716604565, NULL),
(423, 13, 166, '', 'DobotStudio Pro 用户手册 · Sep 5, 2022DobotStudio Pro用户手册 · Sep 5, 2022DobotStudio Pro 用户手册_copy', '', '', 1708609772, '', '', 1, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1708609910, 1716605334, NULL),
(588, 7, 147, '', '重庆某某汽车有限公司_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', '重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽...', 36, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(589, 7, 147, '', '上海某某汽车有限公司_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', '上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy', 27, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(590, 7, 147, '', '北京某某汽车有限公司_copy_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', '北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy...', 48, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(591, 7, 147, '', '重庆某某汽车有限公司_copy_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', '重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy...', 116, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(592, 7, 147, '', '上海某某汽车有限公司_copy_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', '上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy...', 59, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(593, 7, 147, '', '重庆某某汽车有限公司_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', '重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽...', 36, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(594, 7, 147, '', '上海某某汽车有限公司_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', '上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy', 27, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(595, 7, 147, '', '北京某某汽车有限公司_copy_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', '北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy...', 55, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716867229, NULL),
(596, 7, 147, '', '重庆某某汽车有限公司_copy_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', '重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy...', 137, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716905532, NULL),
(597, 7, 147, '', '上海某某汽车有限公司_copy_copy_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', '上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy...', 81, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1716867229, 1716905514, NULL),
(622, 2, 127, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy_copy_copy', '/assets/addons/ldcms/default/images/b1.jpeg', '', 1662090058, '', '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。', 57, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1716894585, 1716894585, NULL),
(623, 2, 127, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy_copy_copy', '/assets/addons/ldcms/default/images/b2.jpeg', '', 1662090058, '', '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。', 57, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', '', 1716894585, 1716894585, NULL),
(624, 2, 127, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy_copy', '/assets/addons/ldcms/default/images/b3.jpeg', '', 1662090058, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚', 67, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', 'test2', 1716894585, 1745283070, NULL),
(625, 2, 127, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚_copy_copy_copy', '/assets/addons/ldcms/default/images/b4.jpeg', '', 1662090058, '', 'WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚WBE世界电池展圆满落幕 | 感恩遇见，期待再聚', 66, 0, 0, 'abc', 0, 'zh-cn', '', '', '', 1, '', '', 'test2', 1716894585, 1745283086, NULL),
(627, 1, 239, '', '公司简介', '', '', 1742260533, '', '某某科技，是一家以自有知识产权数字化产品研发、销售和服务为核心的技术企业。秉承“立足xx，服务全国”的业务理念，致力于为政府机关、科研院所、企事业单位以及中小企业实现“互联网+\"和“数字化”转型升级，提供全面、成熟、易用的解决方案和应用服务。通过发挥互联网思维的优势深入洞察用户需求与使用场景，依托资深的技术能力和行业理解，提供“低投入，高回报”一体化云平台建设和定制服务，助力从业者更好地定制策略和实现数字化转型升级，迎接时代浪潮！\r\n\r\n某某科技是在中国消费升级的大背景下，顺应新时代消费者需求诞生的全案型公司，打破传统企服公司的角色定位，以“事业伙伴\"的理念与客户共生共荣，共同对结果负责。解决从业者的业务在线化、业务数据化、数据业务化问题，是企业数字化营销终身战略顾问。创立至今，始终秉承责任、价值、共生和长期主义的价值观，致力成为企业的超长期合伙人，持续为企业升级赋能。', 1184, 0, 0, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742260533, 1742968488, NULL),
(628, 12, 146, '', '合作客户_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742556091, 1742556377, NULL),
(629, 12, 146, '', '合作客户_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742556098, 1742556098, NULL),
(630, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 9, 'zh-cn', '', '', '', 1, '', '', '', 1742556098, 1742557209, NULL),
(631, 12, 146, '', '合作客户_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742556110, 1742556110, NULL),
(632, 12, 146, '', '合作客户_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 7, 'zh-cn', '', '', '', 1, '', '', '', 1742556119, 1742557107, NULL),
(633, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 5, 'zh-cn', '', '', '', 1, '', '', '', 1742556119, 1742556545, NULL),
(634, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 3, 'zh-cn', '', '', '', 1, '', '', '', 1742556119, 1742556535, NULL),
(635, 12, 146, '', '合作客户端_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 1, 'zh-cn', '', '', '', 1, '', '', '', 1742556152, 1748006721, NULL),
(636, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742556478, 1742556478, NULL),
(637, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 4, 'zh-cn', '', '', '', 1, '', '', '', 1742556480, 1742556549, NULL),
(638, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 2, 'zh-cn', '', '', '', 1, '', '', '', 1742556481, 1742556540, NULL),
(639, 12, 146, '', '合作客户_copy_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 8, 'zh-cn', '', '', '', 1, '', '', '', 1742557093, 1742557197, NULL),
(640, 12, 146, '', '合作客户_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742557230, 1742557230, NULL),
(641, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742557230, 1742557230, NULL),
(642, 12, 146, '', '合作客户_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742557232, 1742557232, NULL),
(643, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742557232, 1742557232, NULL),
(644, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742557248, 1742557248, NULL),
(684, 6, 151, '', 'xx手机16系列', '/assets/addons/ldcms/ldcms2025/images/pro1.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 325, 0, 1, 'Admin', 299, 'zh-cn', '', '', '', 1, '', '', '', 1742650989, 1742974377, NULL),
(685, 6, 151, '', 'xx手机16系列_copy', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 333, 0, 1, 'Admin', 96, 'zh-cn', '', '', '', 1, '', '', '', 1742958067, 1742974538, NULL),
(686, 6, 151, '', 'xx手机16系列_copy', '/assets/addons/ldcms/ldcms2025/images/pro4.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 327, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742958612, 1742974616, NULL),
(687, 6, 151, '', 'xx手机16系列_copy_copy', '/assets/addons/ldcms/ldcms2025/images/pro5.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 329, 0, 1, 'Admin', 97, 'zh-cn', '', '', '', 1, '', '', '', 1742958612, 1742960679, NULL),
(688, 6, 151, '', 'xx手机16系列_copy_copy', '/assets/addons/ldcms/ldcms2025/images/395x400.png', '/assets/addons/ldcms/ldcms2025/images/395x400.png,/assets/addons/ldcms/ldcms2025/images/pro2.jpg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 332, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742959694, 1742959797, NULL),
(689, 6, 161, '', 'xx手机16系列_copy', '/assets/addons/ldcms/ldcms2025/images/395x400.png', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 325, 0, 1, 'Admin', 291, 'zh-cn', '', '', '', 1, '', '', '', 1742959844, 1742974253, NULL),
(690, 6, 161, '', 'xx手机16系列_copy', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2025/images/iphone_16.png', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 326, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742959846, 1742974274, NULL),
(691, 6, 161, '', 'xx手机16系列_copy', '/assets/addons/ldcms/ldcms2025/images/pro3.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 325, 0, 1, 'Admin', 199, 'zh-cn', '', '', '', 1, '', '', '', 1742959847, 1742960055, NULL),
(692, 6, 151, '', 'xx手机16系列_copy_copy_copy', '/assets/addons/ldcms/ldcms2025/images/pro5.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 347, 0, 1, 'Admin', 9, 'zh-cn', '', '', '', 1, '', '', '', 1742960669, 1742960669, NULL),
(693, 6, 151, '', 'xx手机16系列_copy_copy', '/assets/addons/ldcms/ldcms2025/images/395x400.png', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 326, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', '', '', 1742971078, 1742974415, NULL),
(694, 6, 151, '', 'xx手机16系列_copy_copy', '/assets/addons/ldcms/ldcms2025/images/pro3.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png', 1673525193, '', '钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用钢铁行业解决方案让我们花费很很大的心血才研制出来这些内容专为测试时使用', 325, 0, 1, 'Admin', 98, 'zh-cn', '', '', '', 1, '', '', '', 1742971078, 1742974595, NULL),
(695, 2, 249, '', 'WBE World Battery Show ended successfully | Thank you for meeting me and look forward to regathering _copy_copy_copy', '/assets/addons/ldcms/default/images/b1.jpeg', '', 1662090058, '', 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibi', 57, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742978812, NULL),
(696, 2, 249, '', 'WBE World Battery Show ended successfully | Thank you for meeting me and look forward to regathering _copy_copy_copy', '/assets/addons/ldcms/default/images/b2.jpeg', '', 1662090058, '', 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibi', 57, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742978812, NULL),
(697, 2, 249, '', 'WBE World Battery show ended successfully | Thank you for meeting, looking forward to gathering again', '/assets/addons/ldcms/default/images/b3.jpeg', '', 1662090058, '', 'The WBE World Battery Show has come to a successful conclusion | Grateful meet, looking forward to a successful conclusion of the WBE World Battery show | Grateful meet, looking forward to a successful conclusion of the WBE World battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, Look forward to meeting again WBE World Battery show success', 67, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981650, NULL),
(698, 2, 249, '', 'WBE World Battery Show ended successfully | Thank you for meeting me and look forward to regathering _copy_copy_copy', '/assets/addons/ldcms/default/images/b4.jpeg', '', 1662090058, '', 'The WBE World Battery Show has come to a successful conclusion | Grateful meet, looking forward to a successful conclusion of the WBE World Battery show | Grateful meet, looking forward to a successful conclusion of the WBE World battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, Look forward to meeting again WBE World Battery show success', 66, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981644, NULL),
(699, 1, 251, '', 'Contact us', '/assets/addons/ldcms/default/images/contact.png', '', 1661009533, '', 'Enterprise Brand Information Technology (Beijing) Co., LTD. Set product sales, technical services, software development in a high-tech enterprise. The scope of services covers software sales, private cloud, IT infrastructure system planning, IT consulting, system implementation, information security construction, business system development and other comprehensive businesses. Address: 1 / F, Yuancai 1 Office Building, 40 Beiyuan Road, Chaoyang District, Beijing Business Department: 010-88888888 ', 231, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981066, NULL),
(700, 2, 252, '', 'WBE World Battery show ended successfully | Thank you for meeting, looking forward to gathering again', '/assets/addons/ldcms/default/images/b1.jpeg', '', 1662090058, '', 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibi', 58, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981090, NULL),
(701, 2, 252, '', 'WBE World Battery show ended successfully | Thank you for meeting, looking forward to gathering again', '/assets/addons/ldcms/default/images/b2.jpeg', '', 1662090058, '', 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibi', 61, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981090, NULL),
(702, 2, 252, '', 'The WBE World Battery Show has come to a successful conclusion | Thank you for meeting me and look forward to gathering again', '/assets/addons/ldcms/default/images/b3.jpeg', '', 1662090058, '', 'The WBE World Battery Show has come to a successful conclusion | Grateful meet, looking forward to a successful conclusion of the WBE World Battery show | Grateful meet, looking forward to a successful conclusion of the WBE World battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, Look forward to meeting again WBE World Battery show success', 79, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981638, NULL),
(703, 2, 252, '', 'WBE World Battery show ended successfully | Thank you for meeting, looking forward to gathering again', '/assets/addons/ldcms/default/images/b4.jpeg', '', 1662090058, '', 'The WBE World Battery Show has come to a successful conclusion | Grateful meet, looking forward to a successful conclusion of the WBE World Battery show | Grateful meet, looking forward to a successful conclusion of the WBE World battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, Look forward to meeting again WBE World Battery show success', 113, 0, 0, 'abc', 0, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981633, NULL),
(704, 2, 252, '', 'Copy the document to the site background, how can I clear the format', '/assets/addons/ldcms/default/images/b5.jpeg', '', 1662090058, '', 'The WBE World Battery Show has come to a successful conclusion | Grateful meet, looking forward to a successful conclusion of the WBE World Battery show | Grateful meet, looking forward to a successful conclusion of the WBE World battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, looking forward to a successful conclusion of the WBE world battery show | Grateful meet, Look forward to meeting again WBE World Battery show success', 200, 0, 0, 'abc', 0, 'en', '', '复制,文档,网站建设', '', 1, '', '', '', 1742977031, 1742981628, NULL),
(705, 12, 254, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 1, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981671, NULL),
(706, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 2, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981671, NULL),
(707, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 3, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981671, NULL),
(708, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 4, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981678, NULL),
(709, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 5, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981678, NULL),
(710, 12, 254, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 7, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981678, NULL),
(711, 12, 254, '', 'Customer partner _copy_copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 8, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981687, NULL),
(712, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 9, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981687, NULL),
(713, 12, 254, '', 'Cooperative customer', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981698, NULL),
(714, 12, 254, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981698, NULL),
(715, 12, 254, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981698, NULL),
(716, 12, 254, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981698, NULL),
(717, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981698, NULL),
(718, 12, 254, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981708, NULL),
(719, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981714, NULL),
(720, 12, 254, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981714, NULL),
(721, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981687, NULL),
(722, 12, 254, '', 'Partner customer _copy_copy', '/assets/addons/ldcms/ldcms2025/images/logo.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981687, NULL),
(723, 7, 255, '', 'Chongqing certain automobile Co., Ltd._COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', 'Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTD.', 37, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981613, NULL),
(724, 7, 255, '', 'Shanghai certain Automobile Co., Ltd._COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', 'Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTD Shanghai certain Automobile Co., LTd._COPY Shanghai certain Automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY', 28, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981608, NULL),
(725, 7, 255, '', 'Beijing certain Automobile Co., Ltd._COPY_COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', 'Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain Automobile Co., Ltd._COPY_COPY Beijing certain Automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY...', 49, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981602, NULL),
(726, 7, 255, '', 'Chongqing certain automobile Co., Ltd._COPY_COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', 'Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain Automobile Co., Ltd._COPY_COPY Chongqing certain Automobile Co., LTd._COPY_COPY Chongqing certain automobile Co., LTd._COPY_COPY...', 119, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981598, NULL),
(727, 7, 255, '', 'Shanghai certain Automobile Co., Ltd._COPY_COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', 'Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY...', 62, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981593, NULL),
(728, 7, 255, '', 'Chongqing certain automobile Co., Ltd._COPY_COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', 'Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTD.', 39, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981585, NULL),
(729, 7, 255, '', 'Shanghai certain Automobile Co., Ltd._COPY_COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', 'Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTD Shanghai certain Automobile Co., LTd._COPY Shanghai certain Automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY', 27, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981580, NULL),
(730, 7, 255, '', 'Beijing certain Automobile Co., Ltd._COPY_COPY_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', 'Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain Automobile Co., Ltd._COPY_COPY Beijing certain Automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY...', 48, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981574, NULL),
(731, 7, 255, '', 'Chongqing certain Automobile Co., Ltd._COPY_COPY_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', 'Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain Automobile Co., Ltd._COPY_COPY Chongqing certain Automobile Co., LTd._COPY_COPY Chongqing certain automobile Co., LTd._COPY_COPY...', 116, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981569, NULL),
(732, 7, 255, '', 'Shanghai certain Automobile Co., Ltd._COPY_COPY_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', 'Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY...', 59, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981564, NULL),
(733, 7, 255, '', 'Chongqing certain automobile Co., Ltd._COPY_COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase2.jpg', '', 1662164485, '', 'Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTD.', 36, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981560, NULL),
(734, 7, 255, '', 'Shanghai certain Automobile Co., Ltd._COPY_COPY', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', 'Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTD Shanghai certain Automobile Co., LTd._COPY Shanghai certain Automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY', 28, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981555, NULL),
(735, 7, 255, '', 'Beijing certain Automobile Co., Ltd._COPY_COPY_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', 'Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain Automobile Co., Ltd._COPY_COPY Beijing certain Automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY...', 54, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981517, NULL),
(736, 7, 255, '', 'Chongqing certain Automobile Co., Ltd._COPY_COPY_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase1.jpg', '', 1662164485, '', 'Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain Automobile Co., Ltd._COPY_COPY Chongqing certain Automobile Co., LTd._COPY_COPY Chongqing certain automobile Co., LTd._COPY_COPY...', 141, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981510, NULL),
(737, 7, 255, '', 'Shanghai certain Automobile Co., Ltd._COPY_COPY_copy', '/assets/addons/ldcms/ldcms2024/images/idxcase3.jpg', '', 1662164485, '', 'Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY...', 84, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981505, NULL),
(738, 6, 256, '', 'xx mobile phone 16 series _copy_copy_copy', '/assets/addons/ldcms/ldcms2025/images/pro5.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 331, 0, 1, 'Admin', 9, 'en', '', '', '', 1, '', '', '', 1742977031, 1742977901, NULL),
(739, 6, 256, '', 'xx mobile phone 16 series _copy', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 330, 0, 1, 'Admin', 96, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981391, NULL),
(740, 6, 256, '', 'xx mobile phone 16 series _copy_copy', '/assets/addons/ldcms/ldcms2025/images/pro5.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 330, 0, 1, 'Admin', 97, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981405, NULL),
(741, 6, 256, '', 'xx mobile phone 16 series _copy_copy', '/assets/addons/ldcms/ldcms2025/images/pro3.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 325, 0, 1, 'Admin', 98, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981412, NULL),
(742, 6, 256, '', 'xx mobile phone 16 series _copy', '/assets/addons/ldcms/ldcms2025/images/pro4.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 327, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981441, NULL),
(743, 6, 256, '', 'xx mobile phone 16 series _copy_copy', '/assets/addons/ldcms/ldcms2025/images/395x400.png', '/assets/addons/ldcms/ldcms2025/images/395x400.png,/assets/addons/ldcms/ldcms2025/images/pro2.jpg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 335, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981435, NULL),
(744, 6, 256, '', 'xx mobile phone 16 series _copy_copy', '/assets/addons/ldcms/ldcms2025/images/395x400.png', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 325, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981427, NULL),
(745, 6, 256, '', 'xx mobile phone 16 series', '/assets/addons/ldcms/ldcms2025/images/pro1.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 325, 0, 1, 'Admin', 299, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981461, NULL),
(746, 6, 257, '', 'xx mobile phone 16 series _copy', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg', '/assets/addons/ldcms/ldcms2025/images/pro2.jpg,/assets/addons/ldcms/ldcms2025/images/iphone_16.png', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 325, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981420, NULL),
(747, 6, 257, '', 'xx mobile phone 16 series _copy', '/assets/addons/ldcms/ldcms2025/images/pro3.jpg', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 325, 0, 1, 'Admin', 199, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981448, NULL),
(748, 6, 257, '', 'xx mobile phone 16 series _copy', '/assets/addons/ldcms/ldcms2025/images/395x400.png', '/assets/addons/ldcms/ldcms2025/images/iphone_16.png,/assets/addons/ldcms/ldcms2024/images/banner.jpg,/assets/addons/ldcms/default/images/pro1.jpeg', 1673525193, '', 'It took a lot of effort for us to come up with a steel industry solution that was designed specifically for testing It took a lot of effort to develop this content specifically for testing with steel industry solutions', 325, 0, 1, 'Admin', 291, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981454, NULL),
(750, 13, 259, '', 'DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983860, NULL),
(751, 13, 259, '', '333DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983860, NULL),
(752, 13, 259, '', 'DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983861, NULL),
(753, 13, 259, '', 'DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983861, NULL),
(754, 13, 259, '', 'DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983861, NULL),
(755, 13, 259, '', '22DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 0, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983850, NULL),
(756, 13, 259, '', 'DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983851, NULL),
(757, 13, 259, '', 'DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983851, NULL),
(758, 13, 259, '', 'DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual · Sep 5, 2022DobotStudio Pro User Manual _copy', '', '', 1708609772, '', '', 1, 0, 1, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742983851, NULL),
(761, 1, 262, '', 'Company profile', '', '', 1742260533, '', 'XXX Technology is a technology enterprise with its own intellectual property rights digital product development, sales and service as the core. Adhering to the business philosophy of \"based on xx, serving the whole country\", we are committed to achieving \"Internet +\" and\" digital \"transformation and upgrading for government agencies, research institutes, enterprises and institutions as well as small and medium-sized enterprises, providing comprehensive, mature and easy-to-use solutions and appli', 825, 0, 0, 'Admin', 99, 'en', '', '', '', 1, '', '', '', 1742977031, 1742981067, NULL),
(763, 12, 146, '', 'aaad12', '', '', 1748006631, '', 'asd', 0, 0, 1, 'Admin', 99, 'zh-cn', '', '', '', 1, '', 'detail_about.html', 'abc', 1748006637, 1748006657, 1748006657),
(764, 12, 146, '', '合作客户_copy_copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 1, 'zh-cn', '', '', '', 1, '', '', '', 1748006671, 1748006676, 1748006676),
(765, 12, 146, '', 'Partner customer _copy', '/assets/addons/ldcms/ldcms2025/images/240-120.png', '', 1708485804, '', '', 0, 0, 1, 'Admin', 1, 'zh-cn', '', '', '', 1, '', '', '', 1748006698, 1748006702, 1748006702);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_aaa`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_aaa` (
  `document_id` int(10) NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='下载_复制';


--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_case`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_case` (
  `document_id` int(10) NOT NULL,
  `xmbj` varchar(255) DEFAULT '' COMMENT '副标题',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='案例';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document_case` (`document_id`, `xmbj`) VALUES
(175, ''),
(176, ''),
(177, ''),
(178, '简约风格'),
(179, '测试项目背景'),
(180, '项目背景logo设计'),
(181, '项目背景logo设计'),
(211, '简约风格'),
(212, '测试项目背景'),
(347, '测试项目背景'),
(348, '测试项目背景'),
(349, '测试项目背景'),
(350, '测试项目背景'),
(351, '测试项目背景'),
(401, '测试项目背景'),
(402, '测试项目背景'),
(403, '测试项目背景'),
(404, '测试项目背景'),
(405, '测试项目背景'),
(406, '测试项目背景'),
(510, 'Shanghai XX Automobile Co., Ltd'),
(511, 'Chongqing Automobile Co., Ltd'),
(512, 'Background of testing project'),
(588, '测试项目背景'),
(589, '测试项目背景'),
(590, '测试项目背景'),
(591, '测试项目背景'),
(592, '测试项目背景'),
(593, '测试项目背景'),
(594, '测试项目背景'),
(595, '测试项目背景'),
(596, '测试项目背景'),
(597, '测试项目背景'),
(723, 'Test project background'),
(724, 'Test project background'),
(725, 'Test project background'),
(726, 'Test project background'),
(727, 'Test project background'),
(728, 'Test project background'),
(729, 'Test project background'),
(730, 'Test project background'),
(731, 'Test project background'),
(732, 'Test project background'),
(733, 'Test project background'),
(734, 'Test project background'),
(735, 'Test project background'),
(736, 'Test project background'),
(737, 'Test project background');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_content`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_content` (
  `document_id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8 COMMENT '正文内容',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章内容表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document_content` (`document_id`, `content`) VALUES
(17, '<p>\r\n	<strong>企业品牌信息技术（北京）有限公司</strong> \r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	集产品销售、技术服务、软件开发于一身的高科技企业。服务范围涵盖了软件销售、私有云、IT基础架构系统规划、IT咨询、系统实施、信息安全构建、业务系统开发等全方位业务。<br />\r\n地址：北京市朝阳区北苑路40号院彩一办公楼一层<br />\r\n业务部：010 - 88888888 12345678890<br />\r\n技术部：010 - 88888888<br />\r\n邮箱：example@example.com\r\n</p>\r\n<p>\r\n	网址：www.example.com\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/contact.png\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(355, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(356, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(357, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(358, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(359, '增加体验优感，服务中小型团队<br />\r\n我们知道现在的主流CMS既贵且功能复杂难以使用，为此我们专门设计了面向中小企业的轻量CMS， 使用LDCMS可以让搭建网站制作后台变得极为简单：<br />\r\n<br />\r\n&nbsp;新建一个「网站站点」<br />\r\n&nbsp;数据库、后台、前端<br />\r\n<p>\r\n	&nbsp;添加资料「完成站点」！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n我们只保留了网站制作最关心的功能模块，舍弃了那些制作网站中并不真正能经常使用的（其它CMS提供的）复杂功能。因为简单才可以专注网站搭建本身，提高效率，赢得更多的时间成本。<br />'),
(360, ''),
(402, '重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy<br />'),
(403, '上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy'),
(404, '北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy'),
(405, '重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy'),
(406, '上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy'),
(415, ''),
(416, ''),
(417, ''),
(418, ''),
(419, ''),
(420, ''),
(421, ''),
(422, ''),
(423, ''),
(588, '重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy<br />'),
(589, '上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy'),
(590, '北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy'),
(591, '重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy'),
(592, '上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy'),
(593, '重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy重庆某某汽车有限公司_copy<br />'),
(594, '上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy上海某某汽车有限公司_copy'),
(595, '北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy北京某某汽车有限公司_copy_copy'),
(596, '重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy重庆某某汽车有限公司_copy_copy'),
(597, '上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy上海某某汽车有限公司_copy_copy'),
(622, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(623, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(624, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(625, '8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。\r\n                    8月10日，为期三天的WBE世界电池展会在广交会展馆圆满落幕！展会虽已落幕，但精彩永不止步。'),
(627, '<p style=\"font-size:18px;text-indent:2em;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\">\r\n	某某科技，是一家以自有知识产权数字化产品研发、销售和服务为核心的技术企业。秉承“立足xx，服务全国”的业务理念，致力于为政府机关、科研院所、企事业单位以及中小企业实现“互联网+\"和“数字化”转型升级，提供全面、成熟、易用的解决方案和应用服务。通过发挥互联网思维的优势深入洞察用户需求与使用场景，依托资深的技术能力和行业理解，提供“低投入，高回报”一体化云平台建设和定制服务，助力从业者更好地定制策略和实现数字化转型升级，迎接时代浪潮！\r\n</p>\r\n<p style=\"font-size:18px;text-indent:2em;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\">\r\n	某某科技是在中国消费升级的大背景下，顺应新时代消费者需求诞生的全案型公司，打破传统企服公司的角色定位，以“事业伙伴\"的理念与客户共生共荣，共同对结果负责。解决从业者的业务在线化、业务数据化、数据业务化问题，是企业数字化营销终身战略顾问。创立至今，始终秉承责任、价值、共生和长期主义的价值观，致力成为企业的超长期合伙人，持续为企业升级赋能。\r\n</p>\r\n<p style=\"font-size:18px;text-indent:2em;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:18px;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\">\r\n	<img src=\"/assets/addons/ldcms/ldcms2025/images/pro1.jpg\" alt=\"\" width=\"\" height=\"\" title=\"\" align=\"\" /><span>&nbsp;&nbsp;</span><img src=\"http://zhuzi.test/assets/addons/ldcms/ldcms2025/images/pro2.jpg\" alt=\"\" width=\"\" height=\"\" title=\"\" align=\"\" /><span>&nbsp;&nbsp;</span><img src=\"http://zhuzi.test/assets/addons/ldcms/ldcms2025/images/pro3.jpg\" alt=\"\" width=\"\" height=\"\" title=\"\" align=\"\" /><span>&nbsp;&nbsp;</span> \r\n</p>\r\n<p style=\"font-size:18px;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\">\r\n	<span><br />\r\n</span>\r\n</p>\r\n<p style=\"font-size:18px;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\">\r\n	<span><span style=\"font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;font-size:18px;background-color:#FFFFFF;\">某某科技是在中国消费升级的大背景下，顺应新时代消费者需求诞生的全案型公司，打破传统企服公司的角色定位，以“事业伙伴\"的理念与客户共生共荣，共同对结果负责。解决从业者的业务在线化、业务数据化、数据业务化问题，是企业数字化营销终身战略顾问。创立至今，始终秉承责任、价值、共生和长期主义的价值观，致力成为企业的超长期合伙人，持续为企业升级赋能。</span><br />\r\n</span>\r\n</p>\r\n&nbsp;<br />'),
(628, ''),
(629, ''),
(630, ''),
(631, ''),
(632, ''),
(633, ''),
(634, ''),
(635, NULL),
(636, ''),
(637, ''),
(638, ''),
(639, ''),
(640, ''),
(641, ''),
(642, ''),
(643, ''),
(644, ''),
(684, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(685, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(686, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(687, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(688, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(689, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(690, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(691, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(692, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(693, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(694, '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\" /> \r\n</p>'),
(695, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(696, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(697, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(698, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(699, '<p> <strong>Enterprise brand information Technology (Beijing) Co., LTD</strong> </p> \n<p> &nbsp; </p> \n<p> Set product sales, technical services, software development in a high-tech enterprise. The scope of services covers software sales, private cloud, IT infrastructure system planning, IT consulting, system implementation, information security construction, business system development and other comprehensive businesses.<br> Address: 1st Floor, Office Building, Courtyard Cai1, No. 40, Beiyuan Road, Chaoyang District, Beijing<br> Business Department: 010-88888888 12345678890<br> Technical Department: 010-88888888<br> Email: example@example.com </p> \n<p> Website: www.example.com </p> \n<p> &nbsp; </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/contact.png\" alt=\"\" width=\"100%\"> </p>'),
(700, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(701, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(702, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(703, 'On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops. On August 10th, the three-day WBE World Battery Exhibition came to a successful end in the Canton Fair Pavilion! Although the exhibition has come to an end, the wonderful never stops.'),
(704, 'Increase the sense of experience, service small and medium-sized teams\n<br> We know that the current mainstream CMS is expensive, complex and difficult to use, so we specially designed a lightweight CMS for small and medium-sized enterprises, using LDCMS can make it extremely simple to build a website production background:\n<br> \n<br> Create a \"Website Site\"\n<br> Database, background, front end\n<br> \n<p> Add material \"Complete site\"! </p> \n<p> <br> </p> We have only kept the most important functional modules of the website production, and left out the complex features of the production website that are not really used often (provided by other CMS). Because it is simple, you can focus on the website itself, improve efficiency, and win more time costs.\n<br>'),
(705, NULL),
(706, NULL),
(707, NULL),
(708, NULL),
(709, NULL),
(710, NULL),
(711, NULL),
(712, NULL),
(713, NULL),
(714, NULL),
(715, NULL),
(716, NULL),
(717, NULL),
(718, NULL),
(719, NULL),
(720, NULL),
(721, NULL),
(722, NULL),
(723, 'Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing certain Automobile Co., Ltd._COPY Chongqing certain automobile Co., LTd._COPY\n<br>'),
(724, 'Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTD Shanghai certain Automobile Co., LTd._COPY Shanghai certain Automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY'),
(725, 'Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing so-and-so Automobile Co., Ltd._COPY_COPY Beijing so-and-so Automobile Co., LTd._COPY_COPY'),
(726, 'Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., Ltd._COPY_COPY Chongqing certain automobile Co., LTd._COPY_COPY'),
(727, 'Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain Automobile Co., Ltd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY'),
(728, 'Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing certain Automobile Co., Ltd._COPY Chongqing certain automobile Co., LTd._COPY\n<br>'),
(729, 'Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTD Shanghai certain Automobile Co., LTd._COPY Shanghai certain Automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY'),
(730, 'Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing so-and-so Automobile Co., Ltd._COPY_COPY Beijing so-and-so Automobile Co., LTd._COPY_COPY'),
(731, 'Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., Ltd._COPY_COPY Chongqing certain automobile Co., LTd._COPY_COPY'),
(732, 'Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain Automobile Co., Ltd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY'),
(733, 'Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing so-and-so Automobile Co., Ltd._COPY Chongqing so-and-so Automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co., LTd._COPY Chongqing so-and-so automobile Co Chongqing certain Automobile Co., Ltd._COPY Chongqing certain automobile Co., LTd._COPY\n<br>'),
(734, 'Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so Automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTd._COPY Shanghai so-and-so automobile Co., LTD Shanghai certain Automobile Co., LTd._COPY Shanghai certain Automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY Shanghai certain automobile Co., LTd._COPY'),
(735, 'Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., Ltd._COPY_COPY Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_copy Beijing certain automobile Co., LTd._COPY_COPY Beijing certain automobile Co., LTd._COPY_COPY Beijing so-and-so Automobile Co., Ltd._COPY_COPY Beijing so-and-so Automobile Co., LTd._COPY_COPY'),
(736, 'Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., Ltd._COPY_copy Chongqing certain Automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., LTd._COPY_copy Chongqing certain automobile Co., Ltd._COPY_COPY Chongqing certain automobile Co., LTd._COPY_COPY'),
(737, 'Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., Ltd._COPY_copy Shanghai certain Automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain automobile Co., LTd._COPY_copy Shanghai certain Automobile Co., Ltd._COPY_COPY Shanghai certain Automobile Co., LTd._COPY_COPY'),
(738, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(739, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(740, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(741, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(742, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(743, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(744, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(745, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(746, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(747, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(748, '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" width=\"100%\"> </p>'),
(750, NULL),
(751, NULL),
(752, NULL),
(753, NULL),
(754, NULL),
(755, NULL),
(756, NULL),
(757, NULL),
(758, NULL),
(761, '<p style=\"font-size:18px;text-indent:2em;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\"> XXX Technology is a technology enterprise with its own intellectual property rights digital product development, sales and service as the core. Adhering to the business philosophy of \"based on xx, serving the whole country\", we are committed to achieving \"Internet +\" and\" digital \"transformation and upgrading for government agencies, research institutes, enterprises and institutions as well as small and medium-sized enterprises, providing comprehensive, mature and easy-to-use solutions and application services. By giving full play to the advantages of Internet thinking, in-depth insight into user needs and use scenarios, relying on senior technical capabilities and industry understanding, to provide \"low investment, high return\" integrated cloud platform construction and customization services, help practitioners better customize strategies and achieve digital transformation and upgrading, and meet the tide of The Times! </p> \n<p style=\"font-size:18px;text-indent:2em;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\"> Under the background of China\'s consumption upgrading, a whole-case company was born in line with the needs of consumers in the new era, breaking the role of traditional enterprise service companies, co-existing and co-prosperity with customers with the concept of \"business partner\", and jointly responsible for the results. To solve the problems of online business, business data and data business of practitioners, he is a lifelong strategic consultant of enterprise digital marketing. Since its establishment, it has always adhered to the values of responsibility, value, symbiosis and long-term doctrine, and is committed to becoming an ultra-long-term partner of the enterprise, and continues to empower the enterprise to upgrade. </p> \n<p style=\"font-size:18px;text-indent:2em;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\"> <br> </p> \n<p style=\"font-size:18px;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\"> <img src=\"/assets/addons/ldcms/ldcms2025/images/pro1.jpg\" alt=\"\" width=\"\" height=\"\" title=\"\" align=\"\"><span>&nbsp;&nbsp;</span><img src=\"http://zhuzi.test/assets/addons/ldcms/ldcms2025/images/pro2.jpg\" alt=\"\" width=\"\" height=\"\" title=\"\" align=\"\"><span>&nbsp;&nbsp;</span><img src=\"http://zhuzi.test/assets/addons/ldcms/ldcms2025/images/pro3.jpg\" alt=\"\" width=\"\" height=\"\" title=\"\" align=\"\"><span>&nbsp;&nbsp;</span> </p> \n<p style=\"font-size:18px;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\"> <span><br> </span> </p> \n<p style=\"font-size:18px;font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;text-align:justify;background-color:#FFFFFF;\"> <span><span style=\"font-family:Barlow, Arial, sans-serif, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑;font-size:18px;background-color:#FFFFFF;\">Under the background of China\'s consumption upgrading, a whole-case company was born in line with the needs of consumers in the new era, breaking the role of traditional enterprise service companies, co-existing and co-prosperity with customers with the concept of \"business partner\", and jointly responsible for the results. To solve the problems of online business, business data and data business of practitioners, he is a lifelong strategic consultant of enterprise digital marketing. Since its establishment, it has always adhered to the values of responsibility, value, symbiosis and long-term doctrine, and is committed to becoming an ultra-long-term partner of the enterprise, and continues to empower the enterprise to upgrade.</span><br> </span> </p> &nbsp;\n<br>'),
(763, 'asd'),
(764, ''),
(765, NULL);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_download`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_download` (
  `document_id` int(10) NOT NULL,
  `downlinks` varchar(2555) DEFAULT '' COMMENT '下载文件',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='下载';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document_download` (`document_id`, `downlinks`) VALUES
(415, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(416, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(417, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(418, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(419, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(420, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(421, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(422, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(423, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(750, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(751, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(752, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(753, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(754, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(755, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(756, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(757, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip'),
(758, '/uploads/20240222/5704186a0465531886ae1aa266b929cc.zip');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_news`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_news` (
  `document_id` int(10) NOT NULL,
  `test` varchar(255) DEFAULT '' COMMENT '副标题',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='新闻';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document_news` (`document_id`, `test`) VALUES
(355, ''),
(356, ''),
(357, ''),
(358, ''),
(359, ''),
(622, ''),
(623, ''),
(624, ''),
(625, ''),
(695, ''),
(696, ''),
(697, ''),
(698, ''),
(700, ''),
(701, ''),
(702, ''),
(703, ''),
(704, '');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_page`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_page` (
  `document_id` int(10) NOT NULL,
  `test` varchar(255) DEFAULT '' COMMENT '副标题',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='单页';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document_page` (`document_id`, `test`) VALUES
(13, ''),
(16, ''),
(17, ''),
(188, ''),
(386, ''),
(387, ''),
(440, ''),
(486, ''),
(533, ''),
(534, ''),
(627, ''),
(699, ''),
(761, '');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_product`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_product` (
  `document_id` int(10) NOT NULL,
  `types` varchar(255) DEFAULT '' COMMENT '类型',
  `color` varchar(255) DEFAULT '' COMMENT '颜色',
  `subtitle` varchar(255) DEFAULT '' COMMENT '副标题',
  `cpcs` text COMMENT '产品参数',
  `gzfw` text COMMENT '工作范围',
  `procz` varchar(255) DEFAULT '' COMMENT '材质',
  `procc` varchar(255) DEFAULT '' COMMENT '尺寸',
  `price` decimal(11,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='产品';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document_product` (`document_id`, `types`, `color`, `subtitle`, `cpcs`, `gzfw`, `procz`, `procc`, `price`) VALUES
(684, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(685, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(686, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(687, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(688, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(689, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(690, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(691, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(692, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(693, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(694, '0', '1', '承袭经典 风采自若', '<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				规格\r\n			</td>\r\n			<td>\r\n				长度：253.95mm；宽度：165.18mm；厚度：6.51mm<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			</td>\r\n			<td>\r\n				支持 IEEE 802.11b/g/n/ax/be 2 × 2，MIMO\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				无线速率<br />\r\n			</td>\r\n			<td>\r\n				2.4 GHz 理论协商速率为 688 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				5 GHz 理论协商速率为 2882 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				理论协商速率总和 3570 Mbps\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				防火墙安全管理<br />\r\n			</td>\r\n			<td>\r\n				HUAWEI HomeSec&reg; 安全防护：支持 Wi-Fi 防暴力破解、防蹭网、防摄像头劫持、WPA3。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				儿童上网关怀<br />\r\n			</td>\r\n			<td>\r\n				支持时长限制、支付限制、游戏限制、视频限制、社交限制、不良网站拦截等，保护孩子健康上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				网口<br />\r\n			</td>\r\n			<td>\r\n				WAN 和 LAN 接口自适应：入户网线可以插任意一个网口，均可以上网。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				提供 3 个 10/100/1000 M 和 1 个 10/100/1000/2500 M 自适应速率的以太网接口。\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '<p>\r\n	建筑行业解决方案\r\n</p>\r\n<p>\r\n	相对而言要简单些\r\n</p>\r\n<p>\r\n	因为这个行业比较的成熟\r\n</p>\r\n<p>\r\n	这些内容专为测试时使用\r\n</p>\r\n<p>\r\n	<img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\" /> \r\n</p>', '皮制；木制；', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(738, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(739, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(740, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(741, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(742, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(743, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(744, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(745, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(746, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(747, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00),
(748, '0', '1', 'The classic style and composure', '<table class=\"table table-bordered table-striped\"> \n <tbody> \n  <tr> \n   <td> specification </td> \n   <td> Length: 253.95mm; Width: 165.18mm; Thickness: 6.51mm<br> </td> \n  </tr> \n  <tr> \n   <td> </td> \n   <td> Support IEEE 802.11b/g/n/ax/be 2 × 2, MIMO </td> \n  </tr> \n  <tr> \n   <td> Wireless rate<br> </td> \n   <td> The 2.4GHz theoretical negotiated rate is 688 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The 5 GHz theoretical negotiated rate is 2882 Mbps </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> The total theoretical negotiated rate is 3570 Mbps </td> \n  </tr> \n  <tr> \n   <td> Firewall security management<br> </td> \n   <td> HUAWEI HomeSec® Security protection: Supports Wi-Fi protection against brute force cracking, network skimming, camera hijacking, and WPA3. </td> \n  </tr> \n  <tr> \n   <td> Internet care for children<br> </td> \n   <td> Support time restrictions, payment restrictions, game restrictions, video restrictions, social restrictions, bad website blocking, etc., to protect children\'s health online. </td> \n  </tr> \n  <tr> \n   <td> Net interface<br> </td> \n   <td> WAN and LAN interface adaptive: The network cable can be inserted into any network port to access the Internet. </td> \n  </tr> \n  <tr> \n   <td> <br> </td> \n   <td> Three 10/100/1000 M and one 10/100/1000/2500 M adaptive Ethernet interfaces are provided. </td> \n  </tr> \n </tbody> \n</table>', '<p> Solutions for the construction industry </p> \n<p> It\'s relatively simple </p> \n<p> Because the industry is relatively mature </p> \n<p> This content is designed for use during testing </p> \n<p> <img src=\"/assets/addons/ldcms/default/images/pro3.jpeg\" alt=\"\"> </p>', 'It is made of leather; Wooden;', 'W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);W1600*D1950*H760(mm);', 5999.00);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_team`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_team` (
  `document_id` int(10) NOT NULL,
  `zhiwei` varchar(255) DEFAULT '' COMMENT '副标题',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='团队';


--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_test`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_test` (
  `document_id` int(10) NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='test';


--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_test1`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_test1` (
  `document_id` int(10) NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='test1';


--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_document_wordlist`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_document_wordlist` (
  `document_id` int(10) NOT NULL,
  `subtitle` varchar(255) DEFAULT '' COMMENT '副标题',
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文档';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_document_wordlist` (`document_id`, `subtitle`) VALUES
(360, ''),
(415, ''),
(628, ''),
(629, ''),
(630, ''),
(631, ''),
(632, ''),
(633, ''),
(634, ''),
(635, ''),
(636, ''),
(637, ''),
(638, ''),
(639, ''),
(640, ''),
(641, ''),
(642, ''),
(643, ''),
(644, ''),
(705, ''),
(706, ''),
(707, ''),
(708, ''),
(709, ''),
(710, ''),
(711, ''),
(712, ''),
(713, ''),
(714, ''),
(715, ''),
(716, ''),
(717, ''),
(718, ''),
(719, ''),
(720, ''),
(721, ''),
(722, ''),
(763, ''),
(764, ''),
(765, '');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_fields`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_fields` (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_fields` (`id`, `mid`, `field`, `type`, `title`, `filterlist`, `default`, `rule`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend_html`, `setting`, `sort`, `create_time`, `update_time`, `issort`, `isfilter`, `status`, `content_list`, `visible`, `islist`) VALUES
(6, 2, 'test', 'string', '副标题', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 9, 1660653275, 1708485438, 0, 0, 1, '', '', 1),
(7, 1, 'test', 'string', '副标题', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 9, 1660977429, 1716815916, 0, 0, 1, '', '', 0),
(9, 7, 'xmbj', 'string', '副标题', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 9, 1662162624, 1716817974, 0, 0, 1, '', '', 0),
(12, 6, 'types', 'checkbox', '类型', NULL, '', '', '', 0, 255, 1, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 9, 1665145048, 1716817542, 0, 1, 1, '0:基础\r\n1:专业\r\n2:旗舰\r\n\r\n', '', 1),
(18, 6, 'color', 'checkbox', '颜色', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 9, 1673234711, 1716817370, 0, 1, 1, '1:红色\r\n2:绿色\r\n3:黄色\r\n4:黑色', '', 1),
(19, 12, 'subtitle', 'string', '副标题', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', 9, 1708483399, 1708662627, 0, 1, 1, '', '', 1),
(20, 6, 'subtitle', 'string', '副标题', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', 9, 1708581945, 1708659327, 0, 0, 1, '', '', 0),
(21, 6, 'cpcs', 'editor', '产品参数', NULL, '', '', '', 0, 1500, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 9, 1708581980, 1742688289, 0, 0, 1, '', '', 0),
(22, 6, 'gzfw', 'editor', '工作范围', NULL, '', '', '', 0, 11110, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', 9, 1708609388, 1708659325, 0, 0, 1, '', '', 0),
(23, 13, 'downlinks', 'file', '下载文件', NULL, '', '', '', 0, 2555, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"key\":\"\",\"value\":\"\",\"conditions\":\"\"}', 10, 1708609843, 1748006085, 0, 1, 1, NULL, '', 1),
(27, 6, 'procz', 'string', '材质', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', 9, 1709528391, 1716605096, 0, 0, 1, '', '', 0),
(28, 6, 'procc', 'string', '尺寸', NULL, '', '', '', 0, 255, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', 9, 1709528425, 1716605097, 0, 0, 1, '', '', 0),
(30, 6, 'price', 'number', '价格', NULL, '', '', '', 2, 11, 0, 0, '', '{\"table\":\"\",\"primarykey\":\"\",\"field\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}', 9, 1742179945, 1742179945, 0, 0, 1, '', '', 1);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_langs`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_langs` (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='多语言表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_langs` (`id`, `title`, `sub_title`, `code`, `domain`, `status`, `is_default`, `sort`, `create_time`, `update_time`) VALUES
(1, '简体中文', 'CN', 'zh-cn', '', 1, 0, 0, 1675334627, 1748006962),
(2, 'English', 'EN', 'en', '', 1, 0, 1, 1675334645, 1748006928),
(3, 'Tiếng Việt', 'VN', 'vi-vn', '', 1, 1, 2, 1735513200, 1735513200);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_ldcms_contact_cooperation`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_ldcms_contact_cooperation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `diyform_id` int(10) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `user_os` varchar(255) DEFAULT NULL,
  `user_bs` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `category` varchar(100) DEFAULT '' COMMENT '合作类目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='联系合作表单';


--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_links`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_links` (
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='友情链接';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_links` (`id`, `type`, `title`, `image`, `url`, `sort`, `status`, `target`, `create_time`, `update_time`, `lang`) VALUES
(1, 'link', '苏州网站模板', '', 'http://www.example.com', 10, 1, '_blank', 1662207821, 1716855954, 'zh-cn'),
(2, 'link', '苏州网站建设', '', 'http://www.example.com', 9, 1, '_blank', 1662208033, 1716855960, 'zh-cn'),
(4, 'link', 'en google', '', 'http://www.example.com', 9, 1, '_blank', 1672919587, 1672919614, 'en'),
(5, 'link', 'LDcms网站系统', '', 'http://www.example.com', 9, 1, '_blank', 1708487885, 1716855964, 'zh-cn');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_message`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_message` (
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
  `emails` varchar(1000) DEFAULT '' COMMENT '邮箱',
  `companys` varchar(100) DEFAULT '' COMMENT '公司',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='在线留言';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_message` (`id`, `diyform_id`, `lang`, `user_ip`, `user_os`, `user_bs`, `create_time`, `update_time`, `uname`, `mobile`, `remark`, `emails`, `companys`) VALUES
(2, 16, 'en', '192.168.32.1', 'Mac', 'Chrome', 1672923742, 1672923742, 'test', '13112341231', 'testtesttesttest', '', ''),
(6, 16, 'en', '192.168.32.1', 'Mac', 'Chrome', 1673573182, 1673573182, 'root', '13112341234', 'sdfsfsdf', '', '');
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_models`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_models` (
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='cms 模型表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_models` (`id`, `name`, `table_name`, `template_list`, `template_detail`, `ismenu`, `default_fields`, `sort`, `status`, `create_time`, `update_time`) VALUES
(2, '新闻', 'news', 'list_news.html', 'detail_news.html', 1, NULL, NULL, 1, 1660652121, 1673490730),
(1, '单页', 'page', '', 'detail_page.html', 1, NULL, NULL, 1, 1660729799, 1660953440),
(6, '产品', 'product', 'list_product.html', 'detail_product.html', 1, NULL, NULL, 1, 1661071323, 1673491797),
(7, '案例', 'case', 'list_case.html', 'detail_case.html', 1, NULL, NULL, 1, 1662162090, 1673490728),
(13, '下载', 'download', 'list_down.html', 'detail_news.html', 1, '[{\"id\":\"\",\"mid\":\"13\",\"field\":\"content\",\"type\":\"text\",\"title\":\"文章内容\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":\"1\",\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"id\",\"type\":\"int\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"mid\",\"type\":\"int\",\"title\":\"模型\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"cid\",\"type\":\"int\",\"title\":\"栏目\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"sub_cid\",\"type\":\"varchar\",\"title\":\"副栏目\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":\"1\",\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"title\",\"type\":\"varchar\",\"title\":\"标题\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"image\",\"type\":\"text\",\"title\":\"缩略图\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"pics\",\"type\":\"text\",\"title\":\"多图\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"show_time\",\"type\":\"bigint\",\"title\":\"显示时间\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"seo_keywords\",\"type\":\"varchar\",\"title\":\"seo关键词\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"seo_description\",\"type\":\"varchar\",\"title\":\"seo描述\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"visits\",\"type\":\"int\",\"title\":\"浏览次数\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"likes\",\"type\":\"int\",\"title\":\"点赞次数\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"admin_id\",\"type\":\"int\",\"title\":\"管理员ID\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"author\",\"type\":\"varchar\",\"title\":\"作者\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"sort\",\"type\":\"int\",\"title\":\"排序\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"lang\",\"type\":\"varchar\",\"title\":\"语言\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"flag\",\"type\":\"varchar\",\"title\":\"标识\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"tag\",\"type\":\"varchar\",\"title\":\"标签\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"outlink\",\"type\":\"varchar\",\"title\":\"跳转链接\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"status\",\"type\":\"tinyint\",\"title\":\"状态\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"gid\",\"type\":\"varchar\",\"title\":\"浏览权限\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"custom_tpl\",\"type\":\"varchar\",\"title\":\"详情页模版\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"custom_urlname\",\"type\":\"varchar\",\"title\":\"自定义url\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"create_time\",\"type\":\"bigint\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"update_time\",\"type\":\"bigint\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1},{\"id\":\"\",\"mid\":\"13\",\"field\":\"delete_time\",\"type\":\"bigint\",\"title\":\"\",\"create_time\":0,\"update_time\":0,\"isfilter\":0,\"islist\":0,\"status\":1,\"mid_text\":\"下载\",\"isdefault\":1}]', NULL, 1, 1708609812, 1748006191),
(12, '文档', 'wordlist', 'list_news.html', 'detail_news.html', 1, NULL, NULL, 1, 1708483289, 1716796722);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_siteinfo`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_siteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(50) NOT NULL COMMENT '语言',
  `config` text COMMENT '配置',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `lang` (`lang`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='站点信息表';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_siteinfo` (`id`, `lang`, `config`, `create_time`, `update_time`) VALUES
(1, 'zh-cn', '{\"0\":{\"name\":\"template\",\"title\":\"前台模板\",\"type\":\"select\",\"content\":\"[\\\"default\\\"]\",\"value\":\"ldcms2025\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"请确保addons\\/ldcms\\/view有相应的目录\",\"ok\":\"\",\"extend\":\"\"},\"1\":{\"name\":\"sitetitle\",\"title\":\"网站标题\",\"type\":\"string\",\"content\":[],\"value\":\"苏州xx教育公司中文\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"2\":{\"name\":\"sitesubtitle\",\"title\":\"网站副标题\",\"type\":\"string\",\"content\":[],\"value\":\"苏州xx教育公司中文\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"3\":{\"name\":\"seo_keywords\",\"title\":\"网站关键词\",\"type\":\"text\",\"content\":[],\"value\":\"苏州xx教育公司\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"4\":{\"name\":\"seo_description\",\"title\":\"网站描述\",\"type\":\"text\",\"content\":[],\"value\":\"苏州xx教育公司\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"5\":{\"name\":\"logo1\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo1.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"6\":{\"name\":\"logo2\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo2.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"7\":{\"name\":\"compony\",\"title\":\"公司名称\",\"type\":\"string\",\"content\":[],\"value\":\"苏州xx教育公司\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"8\":{\"type\":\"string\",\"name\":\"tel\",\"title\":\"联系电话\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"9\":{\"type\":\"string\",\"name\":\"phone\",\"title\":\"手机号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"10\":{\"type\":\"text\",\"name\":\"address\",\"title\":\"地址\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"江苏省苏州市xxx街xx号\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"11\":{\"type\":\"string\",\"name\":\"email\",\"title\":\"邮箱\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"123123@163.com\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"12\":{\"type\":\"string\",\"name\":\"contacts\",\"title\":\"联系人\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"李经理\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"13\":{\"type\":\"string\",\"name\":\"qq\",\"title\":\"在线咨询链接\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"http:\\/\\/wpa.qq.com\\/msgrd?v=3&uin=&site=qq&menu=yes\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"16\":{\"type\":\"string\",\"name\":\"icp\",\"title\":\"ICP备案号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"苏ICP备88888888号\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"17\":{\"type\":\"string\",\"name\":\"copyright\",\"title\":\"底部版权\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"Copyright © 2011-2024 苏州竹子网络科技有限公司 版权所有\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"18\":{\"type\":\"text\",\"name\":\"script\",\"title\":\"第三方代码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"rule\":\"\",\"extend\":\"\"},\"19\":{\"rule\":\"\",\"group\":\"基础\",\"type\":\"array3\",\"name\":\"about_count\",\"title\":\"关于我们统计\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":[{\"value1\":\"10\",\"value2\":\"年\",\"value3\":\"10年核心团队经验\"},{\"value1\":\"20\",\"value2\":\"+\",\"value3\":\"超20项知识产权\"}],\"content\":\"{\\\"value1\\\":\\\"title1\\\",\\\"value2\\\":\\\"title2\\\"}\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},\"20\":{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"bdak\",\"title\":\"百度地图ak密钥\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},\"21\":{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"mpdw\",\"title\":\"百度地图定位经纬度\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"}}', 1680791788, 1748006984),
(2, 'en', '{\"0\":{\"name\":\"template\",\"title\":\"前台模板\",\"type\":\"select\",\"content\":\"[\\\"default\\\"]\",\"value\":\"ldcms2025en\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"请确保addons\\/ldcms\\/view有相应的目录\",\"ok\":\"\",\"extend\":\"\"},\"1\":{\"name\":\"sitetitle\",\"title\":\"网站标题\",\"type\":\"string\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"2\":{\"name\":\"sitesubtitle\",\"title\":\"网站副标题\",\"type\":\"string\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"3\":{\"name\":\"seo_keywords\",\"title\":\"网站关键词\",\"type\":\"text\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"4\":{\"name\":\"seo_description\",\"title\":\"网站描述\",\"type\":\"text\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"5\":{\"name\":\"logo1\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo1.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"6\":{\"name\":\"logo2\",\"title\":\"网站logo\",\"type\":\"image\",\"content\":[],\"maximum\":1,\"value\":\"\\/assets\\/addons\\/ldcms\\/default\\/images\\/logo2.png\",\"rule\":\"\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"7\":{\"name\":\"compony\",\"title\":\"公司名称\",\"type\":\"string\",\"content\":[],\"value\":\"Suzhou xx Education Company Chinese\",\"rule\":\"required\",\"msg\":\"\",\"tip\":\"\",\"ok\":\"\",\"extend\":\"\"},\"8\":{\"type\":\"string\",\"name\":\"tel\",\"title\":\"联系电话\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"9\":{\"type\":\"string\",\"name\":\"phone\",\"title\":\"手机号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"400-000-0000\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"10\":{\"type\":\"text\",\"name\":\"address\",\"title\":\"地址\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"No. xx, xxx Street, Suzhou City, Jiangsu Province\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"11\":{\"type\":\"string\",\"name\":\"email\",\"title\":\"邮箱\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"123123@163.com\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"12\":{\"type\":\"string\",\"name\":\"contacts\",\"title\":\"联系人\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"李经理\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"13\":{\"type\":\"string\",\"name\":\"qq\",\"title\":\"在线咨询链接\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"http:\\/\\/wpa.qq.com\\/msgrd?v=3&uin=&site=qq&menu=yes\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"16\":{\"type\":\"string\",\"name\":\"icp\",\"title\":\"ICP备案号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"苏ICP备88888888号\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"17\":{\"type\":\"string\",\"name\":\"copyright\",\"title\":\"底部版权\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"Copyright © 2011-2024 苏州竹子网络科技有限公司 版权所有\",\"content\":\"\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"},\"18\":{\"type\":\"text\",\"name\":\"script\",\"title\":\"第三方代码\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"rule\":\"\",\"extend\":\"\"},\"19\":{\"rule\":\"\",\"group\":\"基础\",\"type\":\"array3\",\"name\":\"about_count\",\"title\":\"关于我们统计\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":[{\"value1\":\"10\",\"value2\":\"Year\",\"value3\":\"10 years of core team experience\"},{\"value1\":\"20\",\"value2\":\"+\",\"value3\":\"More than 20 intellectual property rights\"}],\"content\":\"{\\\"value1\\\":\\\"title1\\\",\\\"value2\\\":\\\"title2\\\"}\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},\"20\":{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"bdak\",\"title\":\"百度地图ak密钥\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"},\"21\":{\"rule\":\"\",\"group\":\"基础\",\"type\":\"string\",\"name\":\"mpdw\",\"title\":\"百度地图定位经纬度\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\",\"value1\":\"\",\"value2\":\"\",\"value3\":\"\",\"value4\":\"\"},\"value\":\"\",\"content\":\"\",\"tip\":\"\",\"visible\":\"\",\"extend\":\"\"}}', 1680791969, 1743041859);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_tagaction`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_tagaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT '' COMMENT '方法名称',
  `type` enum('sql','func') DEFAULT 'sql' COMMENT '方法类型：sql=sql语句,func=函数名',
  `setting` text COMMENT '方法主体',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='自定义标签sql';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_tagaction` (`id`, `action`, `type`, `setting`, `create_time`, `update_time`) VALUES
(1, 'product', 'sql', '{\"model\":\"\\\\addons\\\\ldcms\\\\model\\\\Document\",\"name\":\"ldcms_document\",\"db_type\":\"model\",\"alias\":\"document\",\"field\":\"document.*,extend.*,category.name cname,category.urlname curlname\",\"join\":[[\"ldcms_document_content content\",\"content.document_id=document.id\",\"LEFT\"],[\"ldcms_document_product extend\",\"extend.document_id=document.id\",\"LEFT\"],[\"ldcms_category category\",\"category.id=document.cid\",\"LEFT\"]],\"class\":\"\\\\addons\\\\ldcms\\\\model\\\\Document\",\"func\":\"getHomeList\",\"params\":[[\"mid\",\"=\",\"6\",\"AND\"],[\"lang\",\"=\",\":ld_get_home_lang\",\"AND\"],[\"status\",\"=\",\"1\",\"AND\"],{\"0\":\"filter_where\",\"1\":\"CUSTOM\",\"3\":\"AND\"},[\"show_time\",\"<=\",\":time\",\"AND\"],{\"0\":\"cid\",\"1\":\"IN\",\"3\":\"AND\"},{\"0\":\"sub_cid\",\"1\":\"FIND_IN_SET_AND\",\"3\":\"OR\"}]}', 1716512401, 1716730332),
(2, 'home_block', 'sql', '{\"model\":\"\\\\addons\\\\ldcms\\\\model\\\\Category\",\"name\":\"\",\"db_type\":\"model\",\"alias\":\"category\",\"field\":\"id,is_home,name,urlname,model_table_name,subname,pid,ename\",\"class\":\"\",\"func\":\"\",\"params\":[[\"lang\",\"=\",\":ld_get_home_lang\",\"AND\"],[\"status\",\"=\",\"1\",\"AND\"],{\"0\":\"model_table_name\",\"1\":\"=\",\"3\":\"AND\"},[\"is_home\",\"=\",\"1\",\"AND\"]],\"join\":\"\"}', 1716732521, 1748007003);
--
-- Remove the table if it exists
--

DROP TABLE IF EXISTS `__PREFIX__ldcms_tags`;


--
-- Create the table if it not exists
--

CREATE TABLE IF NOT EXISTS `__PREFIX__ldcms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `use_num` int(11) DEFAULT '0' COMMENT '使用次数',
  `lang` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(16) DEFAULT NULL,
  `update_time` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章tags\n';


--
-- List the data for the table
--

INSERT INTO `__PREFIX__ldcms_tags` (`id`, `name`, `title`, `use_num`, `lang`, `create_time`, `update_time`) VALUES
(5, 'tag1', 'tag1', 0, 'zh-cn', 1673574196, 1673574196),
(6, 'fuzhi', '复制', 0, 'zh-cn', 1709698530, 1709698530),
(7, 'wendang', '文档', 0, 'zh-cn', 1709698530, 1709698530),
(8, 'wangzhanjianshe', '网站建设', 0, 'zh-cn', 1709698530, 1709698530),
(9, 'bews', 'bews', -7, 'en', 1716709862, 1716709862),
(10, 'tags', 'tags', -7, 'en', 1716709862, 1716709862);



