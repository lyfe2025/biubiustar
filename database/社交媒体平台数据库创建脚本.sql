-- ==========================================
-- Biubiustar社交媒体平台数据库创建脚本
-- 创建时间: 2025年1月25日
-- 功能描述: 社交媒体平台数据库表结构创建和扩展
-- 技术栈: FastAdmin + LDCMS + ThinkPHP 5.1
-- ==========================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ==========================================
-- 第一部分: 扩展现有表结构
-- ==========================================

-- ------------------------------------------
-- 1.1 扩展用户表 fa_user
-- 功能: 为现有用户表添加社交媒体相关字段
-- ------------------------------------------

-- 检查字段是否已存在，避免重复添加
-- 粉丝数量字段
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'fa_user' 
     AND column_name = 'followers_count' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "followers_count field already exists"',
    'ALTER TABLE `fa_user` ADD COLUMN `followers_count` int(10) unsigned DEFAULT 0 COMMENT "粉丝数量"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 关注数量字段
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'fa_user' 
     AND column_name = 'following_count' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "following_count field already exists"',
    'ALTER TABLE `fa_user` ADD COLUMN `following_count` int(10) unsigned DEFAULT 0 COMMENT "关注数量"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 发帖数量字段
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'fa_user' 
     AND column_name = 'posts_count' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "posts_count field already exists"',
    'ALTER TABLE `fa_user` ADD COLUMN `posts_count` int(10) unsigned DEFAULT 0 COMMENT "发帖数量"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 获赞总数字段
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'fa_user' 
     AND column_name = 'likes_received' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "likes_received field already exists"',
    'ALTER TABLE `fa_user` ADD COLUMN `likes_received` int(10) unsigned DEFAULT 0 COMMENT "获赞总数"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 是否认证用户字段
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'fa_user' 
     AND column_name = 'is_verified' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "is_verified field already exists"',
    'ALTER TABLE `fa_user` ADD COLUMN `is_verified` tinyint(1) unsigned DEFAULT 0 COMMENT "是否认证用户：0未认证，1已认证"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 个人主页封面图字段
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'fa_user' 
     AND column_name = 'cover_image' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "cover_image field already exists"',
    'ALTER TABLE `fa_user` ADD COLUMN `cover_image` varchar(255) DEFAULT "" COMMENT "个人主页封面图路径"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 社交链接JSON字段
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE table_name = 'fa_user' 
     AND column_name = 'social_links' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "social_links field already exists"',
    'ALTER TABLE `fa_user` ADD COLUMN `social_links` text COMMENT "社交链接JSON格式存储"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 为新增字段创建索引
-- 粉丝数量索引（用于粉丝排行榜）
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS 
     WHERE table_name = 'fa_user' 
     AND index_name = 'idx_followers_count' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "idx_followers_count index already exists"',
    'ALTER TABLE `fa_user` ADD INDEX `idx_followers_count` (`followers_count`)'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 认证用户索引
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS 
     WHERE table_name = 'fa_user' 
     AND index_name = 'idx_is_verified' 
     AND table_schema = DATABASE()) > 0,
    'SELECT "idx_is_verified index already exists"',
    'ALTER TABLE `fa_user` ADD INDEX `idx_is_verified` (`is_verified`)'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ------------------------------------------
-- 1.2 扩展LDCMS模型表
-- 功能: 添加社交媒体相关内容模型
-- ------------------------------------------

-- 检查并插入社交帖子模型
INSERT IGNORE INTO `fa_ldcms_models` (
    `name`, 
    `table_name`, 
    `description`, 
    `status`, 
    `ismenu`,
    `create_time`,
    `update_time`
) VALUES (
    '社交帖子', 
    'social_posts', 
    '用户发布的社交媒体帖子内容管理', 
    1, 
    1,
    UNIX_TIMESTAMP(),
    UNIX_TIMESTAMP()
);

-- 检查并插入活动信息模型
INSERT IGNORE INTO `fa_ldcms_models` (
    `name`, 
    `table_name`, 
    `description`, 
    `status`, 
    `ismenu`,
    `create_time`,
    `update_time`
) VALUES (
    '活动信息', 
    'activities', 
    '平台活动信息发布和管理', 
    1, 
    1,
    UNIX_TIMESTAMP(),
    UNIX_TIMESTAMP()
);

-- 检查并插入热门话题模型
INSERT IGNORE INTO `fa_ldcms_models` (
    `name`, 
    `table_name`, 
    `description`, 
    `status`, 
    `ismenu`,
    `create_time`,
    `update_time`
) VALUES (
    '热门话题', 
    'topics', 
    '热门话题标签管理和统计', 
    1, 
    1,
    UNIX_TIMESTAMP(),
    UNIX_TIMESTAMP()
);

-- ==========================================
-- 第二部分: 创建新增表结构
-- ==========================================

-- ------------------------------------------
-- 2.1 用户关注关系表
-- 功能: 管理用户之间的关注关系
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_social_follows`;
CREATE TABLE `fa_social_follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系ID，主键',
  `follower_id` int(10) unsigned NOT NULL COMMENT '关注者用户ID',
  `following_id` int(10) unsigned NOT NULL COMMENT '被关注用户ID',
  `create_time` bigint(16) DEFAULT NULL COMMENT '关注时间戳',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间戳',
  `status` tinyint(1) unsigned DEFAULT 1 COMMENT '关注状态：1正常关注，0已取消关注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_follow` (`follower_id`,`following_id`) COMMENT '防止重复关注的唯一索引',
  KEY `idx_follower` (`follower_id`,`status`) COMMENT '查询某用户关注的所有人',
  KEY `idx_following` (`following_id`,`status`) COMMENT '查询关注某用户的所有粉丝',
  KEY `idx_create_time` (`create_time`) COMMENT '按关注时间排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户关注关系表';

-- ------------------------------------------
-- 2.2 内容点赞表
-- 功能: 记录用户对内容的点赞行为
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_social_post_likes`;
CREATE TABLE `fa_social_post_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID，主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '点赞用户ID',
  `post_id` int(10) unsigned NOT NULL COMMENT '被点赞内容ID',
  `post_type` varchar(20) DEFAULT 'post' COMMENT '内容类型：post帖子，comment评论，activity活动',
  `create_time` bigint(16) DEFAULT NULL COMMENT '点赞时间戳',
  `ip` varchar(50) DEFAULT '' COMMENT '点赞用户IP地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_like` (`user_id`,`post_id`,`post_type`) COMMENT '防止重复点赞的唯一索引',
  KEY `idx_post` (`post_id`,`post_type`) COMMENT '查询某内容的所有点赞',
  KEY `idx_user` (`user_id`) COMMENT '查询某用户的所有点赞',
  KEY `idx_post_time` (`post_id`,`post_type`,`create_time`) COMMENT '按时间排序的内容点赞'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容点赞表';

-- ------------------------------------------
-- 2.3 评论系统表
-- 功能: 管理用户评论和回复
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_social_comments`;
CREATE TABLE `fa_social_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID，主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '评论用户ID',
  `post_id` int(10) unsigned NOT NULL COMMENT '被评论内容ID',
  `post_type` varchar(20) DEFAULT 'post' COMMENT '内容类型：post帖子，activity活动',
  `parent_id` int(10) unsigned DEFAULT 0 COMMENT '父评论ID，0表示顶级评论',
  `reply_to_user_id` int(10) unsigned DEFAULT 0 COMMENT '回复目标用户ID，0表示非针对性回复',
  `content` text NOT NULL COMMENT '评论内容文本',
  `ip` varchar(50) DEFAULT '' COMMENT '评论用户IP地址',
  `likes_count` int(10) unsigned DEFAULT 0 COMMENT '评论获得的点赞数量',
  `replies_count` int(10) unsigned DEFAULT 0 COMMENT '评论获得的回复数量',
  `status` tinyint(1) unsigned DEFAULT 1 COMMENT '评论状态：1正常显示，0已删除，2审核中',
  `create_time` bigint(16) DEFAULT NULL COMMENT '评论创建时间戳',
  `update_time` bigint(16) DEFAULT NULL COMMENT '评论更新时间戳',
  `delete_time` bigint(16) DEFAULT NULL COMMENT '评论删除时间戳',
  PRIMARY KEY (`id`),
  KEY `idx_post` (`post_id`,`post_type`,`status`) COMMENT '查询某内容的所有评论',
  KEY `idx_user` (`user_id`) COMMENT '查询某用户的所有评论',
  KEY `idx_parent` (`parent_id`) COMMENT '查询某评论的所有回复',
  KEY `idx_post_time` (`post_id`,`post_type`,`create_time`) COMMENT '按时间排序的内容评论',
  KEY `idx_status_time` (`status`,`create_time`) COMMENT '按状态和时间查询评论'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论系统表';

-- ------------------------------------------
-- 2.4 通知系统表
-- 功能: 管理用户接收的各类通知
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_social_notifications`;
CREATE TABLE `fa_social_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知ID，主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '接收通知的用户ID',
  `from_user_id` int(10) unsigned DEFAULT 0 COMMENT '触发通知的用户ID，0表示系统通知',
  `type` varchar(50) NOT NULL COMMENT '通知类型：follow关注，like点赞，comment评论，reply回复，mention提及，system系统，activity活动',
  `title` varchar(255) NOT NULL COMMENT '通知标题',
  `content` text COMMENT '通知详细内容',
  `data` text COMMENT '通知附加数据，JSON格式存储',
  `url` varchar(255) DEFAULT '' COMMENT '通知关联的URL链接',
  `is_read` tinyint(1) unsigned DEFAULT 0 COMMENT '是否已读：0未读，1已读',
  `is_deleted` tinyint(1) unsigned DEFAULT 0 COMMENT '是否删除：0正常，1已删除',
  `create_time` bigint(16) DEFAULT NULL COMMENT '通知创建时间戳',
  `read_time` bigint(16) DEFAULT NULL COMMENT '通知阅读时间戳',
  `expire_time` bigint(16) DEFAULT NULL COMMENT '通知过期时间戳',
  PRIMARY KEY (`id`),
  KEY `idx_user_read` (`user_id`,`is_read`,`is_deleted`) COMMENT '查询用户的未读通知',
  KEY `idx_type` (`type`) COMMENT '按通知类型查询',
  KEY `idx_create_time` (`create_time`) COMMENT '按创建时间排序',
  KEY `idx_from_user` (`from_user_id`) COMMENT '查询某用户触发的通知',
  KEY `idx_expire` (`expire_time`) COMMENT '查询过期通知用于清理'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知系统表';

-- ------------------------------------------
-- 2.5 活动参与表
-- 功能: 记录用户参与活动的信息
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_social_activity_participants`;
CREATE TABLE `fa_social_activity_participants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '参与记录ID，主键',
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动ID，关联fa_ldcms_document表',
  `user_id` int(10) unsigned NOT NULL COMMENT '参与用户ID',
  `status` varchar(20) DEFAULT 'registered' COMMENT '参与状态：registered已报名，attended已参加，cancelled已取消',
  `remark` text COMMENT '参与备注信息',
  `register_time` bigint(16) DEFAULT NULL COMMENT '报名时间戳',
  `attend_time` bigint(16) DEFAULT NULL COMMENT '签到时间戳',
  `create_time` bigint(16) DEFAULT NULL COMMENT '记录创建时间戳',
  `update_time` bigint(16) DEFAULT NULL COMMENT '记录更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_participant` (`activity_id`,`user_id`) COMMENT '防止重复参与的唯一索引',
  KEY `idx_activity` (`activity_id`,`status`) COMMENT '查询某活动的参与者',
  KEY `idx_user` (`user_id`) COMMENT '查询某用户参与的活动',
  KEY `idx_status_time` (`status`,`register_time`) COMMENT '按状态和报名时间查询'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动参与记录表';

-- ------------------------------------------
-- 2.6 社交帖子扩展表
-- 功能: 扩展LDCMS文档表，存储社交帖子特有属性
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_ldcms_document_social_posts`;
CREATE TABLE `fa_ldcms_document_social_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '扩展记录ID，主键',
  `document_id` int(10) unsigned NOT NULL COMMENT '关联的文档ID，对应fa_ldcms_document.id',
  `post_type` enum('text','image','video','mixed') DEFAULT 'text' COMMENT '帖子类型：text纯文字，image图片，video视频，mixed混合媒体',
  `media_files` text COMMENT '媒体文件信息，JSON格式存储',
  `hashtags` varchar(500) DEFAULT '' COMMENT '话题标签，逗号分隔，如：#旅行,#美食,#生活',
  `location` varchar(255) DEFAULT '' COMMENT '发布位置信息',
  `location_lat` varchar(20) DEFAULT '' COMMENT '位置纬度坐标',
  `location_lng` varchar(20) DEFAULT '' COMMENT '位置经度坐标',
  `privacy_level` enum('public','followers','private') DEFAULT 'public' COMMENT '隐私级别：public公开，followers仅粉丝可见，private私密',
  `is_featured` tinyint(1) unsigned DEFAULT 0 COMMENT '是否精选帖子：0否，1是',
  `allow_comment` tinyint(1) unsigned DEFAULT 1 COMMENT '是否允许评论：0不允许，1允许',
  `allow_share` tinyint(1) unsigned DEFAULT 1 COMMENT '是否允许分享：0不允许，1允许',
  `share_count` int(10) unsigned DEFAULT 0 COMMENT '分享次数统计',
  `comment_count` int(10) unsigned DEFAULT 0 COMMENT '评论数量统计',
  `mood` varchar(50) DEFAULT '' COMMENT '发布时的心情状态',
  `mention_users` text COMMENT '提及的用户ID列表，JSON格式存储',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间戳',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_document` (`document_id`) COMMENT '文档ID唯一索引',
  KEY `idx_post_type` (`post_type`) COMMENT '按帖子类型查询',
  KEY `idx_privacy` (`privacy_level`) COMMENT '按隐私级别查询',
  KEY `idx_featured` (`is_featured`) COMMENT '查询精选帖子',
  KEY `idx_hashtags` (`hashtags`(191)) COMMENT '话题标签索引',
  KEY `idx_create_time` (`create_time`) COMMENT '按创建时间排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交帖子扩展信息表';

-- ------------------------------------------
-- 2.7 活动信息扩展表
-- 功能: 扩展LDCMS文档表，存储活动特有属性
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_ldcms_document_activities`;
CREATE TABLE `fa_ldcms_document_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '扩展记录ID，主键',
  `document_id` int(10) unsigned NOT NULL COMMENT '关联的文档ID，对应fa_ldcms_document.id',
  `activity_type` varchar(50) DEFAULT 'event' COMMENT '活动类型：event活动，meetup聚会，workshop工作坊，competition竞赛',
  `activity_status` varchar(20) DEFAULT 'draft' COMMENT '活动状态：draft草稿，published已发布，ongoing进行中，completed已完成，cancelled已取消',
  `start_time` bigint(16) DEFAULT NULL COMMENT '活动开始时间戳',
  `end_time` bigint(16) DEFAULT NULL COMMENT '活动结束时间戳',
  `register_start` bigint(16) DEFAULT NULL COMMENT '报名开始时间戳',
  `register_end` bigint(16) DEFAULT NULL COMMENT '报名结束时间戳',
  `location` varchar(255) DEFAULT '' COMMENT '活动举办地点',
  `location_detail` text COMMENT '活动地点详细描述',
  `location_lat` varchar(20) DEFAULT '' COMMENT '活动地点纬度坐标',
  `location_lng` varchar(20) DEFAULT '' COMMENT '活动地点经度坐标',
  `max_participants` int(10) unsigned DEFAULT 0 COMMENT '最大参与人数，0表示无限制',
  `current_participants` int(10) unsigned DEFAULT 0 COMMENT '当前参与人数统计',
  `min_participants` int(10) unsigned DEFAULT 0 COMMENT '最少参与人数要求',
  `fee` decimal(10,2) unsigned DEFAULT 0.00 COMMENT '活动参与费用',
  `fee_type` varchar(10) DEFAULT 'free' COMMENT '费用类型：free免费，paid付费',
  `registration_required` tinyint(1) unsigned DEFAULT 0 COMMENT '是否需要报名：0不需要，1需要',
  `need_approval` tinyint(1) unsigned DEFAULT 0 COMMENT '是否需要审批：0不需要，1需要',
  `contact_info` text COMMENT '联系方式信息，JSON格式存储',
  `requirements` text COMMENT '参与要求和注意事项',
  `schedule` text COMMENT '活动日程安排，JSON格式存储',
  `organizer` varchar(255) DEFAULT '' COMMENT '活动主办方名称',
  `sponsor` varchar(255) DEFAULT '' COMMENT '活动赞助商名称',
  `extra_fields` text COMMENT '扩展字段，JSON格式存储其他自定义信息',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间戳',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_document` (`document_id`) COMMENT '文档ID唯一索引',
  KEY `idx_activity_type` (`activity_type`) COMMENT '按活动类型查询',
  KEY `idx_activity_status` (`activity_status`) COMMENT '按活动状态查询',
  KEY `idx_start_time` (`start_time`) COMMENT '按开始时间排序',
  KEY `idx_register_time` (`register_start`,`register_end`) COMMENT '报名时间段查询',
  KEY `idx_location` (`location`(191)) COMMENT '按地点查询活动'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动信息扩展表';

-- ------------------------------------------
-- 2.8 热门话题扩展表
-- 功能: 扩展LDCMS文档表，存储话题特有属性
-- ------------------------------------------

DROP TABLE IF EXISTS `fa_ldcms_document_topics`;
CREATE TABLE `fa_ldcms_document_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '扩展记录ID，主键',
  `document_id` int(10) unsigned NOT NULL COMMENT '关联的文档ID，对应fa_ldcms_document.id',
  `topic_name` varchar(100) NOT NULL COMMENT '话题名称，如：#旅行分享',
  `topic_desc` text COMMENT '话题详细描述',
  `topic_color` varchar(7) DEFAULT '#8B5CF6' COMMENT '话题标识颜色，十六进制格式',
  `topic_icon` varchar(255) DEFAULT '' COMMENT '话题图标URL',
  `post_count` int(10) unsigned DEFAULT 0 COMMENT '话题下的帖子数量统计',
  `follow_count` int(10) unsigned DEFAULT 0 COMMENT '关注该话题的用户数量',
  `is_official` tinyint(1) unsigned DEFAULT 0 COMMENT '是否官方话题：0非官方，1官方',
  `is_trending` tinyint(1) unsigned DEFAULT 0 COMMENT '是否当前热门：0否，1是',
  `trending_score` bigint(20) unsigned DEFAULT 0 COMMENT '热度分数，用于排序',
  `create_time` bigint(16) DEFAULT NULL COMMENT '创建时间戳',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_document` (`document_id`) COMMENT '文档ID唯一索引',
  UNIQUE KEY `idx_topic_name` (`topic_name`) COMMENT '话题名称唯一索引',
  KEY `idx_trending` (`is_trending`,`trending_score`) COMMENT '热门话题排序',
  KEY `idx_official` (`is_official`) COMMENT '查询官方话题',
  KEY `idx_post_count` (`post_count`) COMMENT '按帖子数量排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='热门话题扩展表';

-- ==========================================
-- 第三部分: 创建触发器和存储过程
-- ==========================================

-- ------------------------------------------
-- 3.1 用户统计字段更新触发器
-- 功能: 自动维护用户表中的统计字段
-- ------------------------------------------

-- 关注数量更新触发器
DROP TRIGGER IF EXISTS `update_user_follow_count_insert`;
DELIMITER ;;
CREATE TRIGGER `update_user_follow_count_insert` AFTER INSERT ON `fa_social_follows` FOR EACH ROW 
BEGIN
    IF NEW.status = 1 THEN
        -- 更新关注者的关注数量
        UPDATE `fa_user` SET `following_count` = `following_count` + 1 WHERE `id` = NEW.follower_id;
        -- 更新被关注者的粉丝数量
        UPDATE `fa_user` SET `followers_count` = `followers_count` + 1 WHERE `id` = NEW.following_id;
    END IF;
END;;
DELIMITER ;

DROP TRIGGER IF EXISTS `update_user_follow_count_update`;
DELIMITER ;;
CREATE TRIGGER `update_user_follow_count_update` AFTER UPDATE ON `fa_social_follows` FOR EACH ROW 
BEGIN
    -- 如果状态从关注变为取消关注
    IF OLD.status = 1 AND NEW.status = 0 THEN
        UPDATE `fa_user` SET `following_count` = `following_count` - 1 WHERE `id` = NEW.follower_id;
        UPDATE `fa_user` SET `followers_count` = `followers_count` - 1 WHERE `id` = NEW.following_id;
    -- 如果状态从取消关注变为关注
    ELSEIF OLD.status = 0 AND NEW.status = 1 THEN
        UPDATE `fa_user` SET `following_count` = `following_count` + 1 WHERE `id` = NEW.follower_id;
        UPDATE `fa_user` SET `followers_count` = `followers_count` + 1 WHERE `id` = NEW.following_id;
    END IF;
END;;
DELIMITER ;

-- 评论数量更新触发器
DROP TRIGGER IF EXISTS `update_comment_count_insert`;
DELIMITER ;;
CREATE TRIGGER `update_comment_count_insert` AFTER INSERT ON `fa_social_comments` FOR EACH ROW 
BEGIN
    IF NEW.status = 1 THEN
        -- 更新社交帖子的评论数量
        IF NEW.post_type = 'post' THEN
            UPDATE `fa_ldcms_document_social_posts` SET `comment_count` = `comment_count` + 1 
            WHERE `document_id` = NEW.post_id;
        END IF;
        -- 更新父评论的回复数量
        IF NEW.parent_id > 0 THEN
            UPDATE `fa_social_comments` SET `replies_count` = `replies_count` + 1 
            WHERE `id` = NEW.parent_id;
        END IF;
    END IF;
END;;
DELIMITER ;

-- ==========================================
-- 第四部分: 插入初始化数据
-- ==========================================

-- ------------------------------------------
-- 4.1 初始化通知类型数据
-- 功能: 预定义系统通知类型
-- ------------------------------------------

-- 这里可以根据需要插入一些初始化的系统通知模板等

-- ==========================================
-- 第五部分: 数据库完整性检查
-- ==========================================

-- 检查所有表是否创建成功
SELECT 
    TABLE_NAME as '表名',
    TABLE_COMMENT as '表注释',
    CREATE_TIME as '创建时间'
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = DATABASE() 
AND TABLE_NAME LIKE 'fa_social_%' 
OR TABLE_NAME LIKE 'fa_ldcms_document_%'
ORDER BY TABLE_NAME;

-- 检查fa_user表新增字段
SELECT 
    COLUMN_NAME as '字段名',
    COLUMN_TYPE as '字段类型',
    COLUMN_DEFAULT as '默认值',
    COLUMN_COMMENT as '字段注释'
FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA = DATABASE() 
AND TABLE_NAME = 'fa_user' 
AND COLUMN_NAME IN ('followers_count', 'following_count', 'posts_count', 'likes_received', 'is_verified', 'cover_image', 'social_links')
ORDER BY ORDINAL_POSITION;

SET FOREIGN_KEY_CHECKS = 1;

-- ==========================================
-- 脚本执行完成提示
-- ==========================================
SELECT '🎉 Biubiustar社交媒体平台数据库创建完成！' as '执行结果',
       '✅ 已完成用户表扩展、新增7个核心表、创建索引和触发器' as '详细说明',
       NOW() as '完成时间';