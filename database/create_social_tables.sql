-- ==========================================
-- 社交媒体平台数据库创建脚本（简化版）
-- ==========================================

SET NAMES utf8mb4;
USE biubiustar;

-- 添加缺失的用户表字段
ALTER TABLE `fa_user` ADD COLUMN IF NOT EXISTS `social_links` text COMMENT '社交链接JSON格式存储';

-- 为新增字段创建索引
ALTER TABLE `fa_user` ADD INDEX IF NOT EXISTS `idx_followers_count` (`followers_count`);
ALTER TABLE `fa_user` ADD INDEX IF NOT EXISTS `idx_is_verified` (`is_verified`);

-- 扩展LDCMS模型表
INSERT IGNORE INTO `fa_ldcms_models` (`name`, `table_name`, `description`, `status`, `ismenu`, `create_time`, `update_time`) VALUES
('社交帖子', 'social_posts', '用户发布的社交媒体帖子内容管理', 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('活动信息', 'activities', '平台活动信息发布和管理', 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('热门话题', 'topics', '热门话题标签管理和统计', 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 创建用户关注关系表
CREATE TABLE IF NOT EXISTS `fa_social_follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系ID，主键',
  `follower_id` int(10) unsigned NOT NULL COMMENT '关注者用户ID',
  `following_id` int(10) unsigned NOT NULL COMMENT '被关注用户ID',
  `create_time` bigint(16) DEFAULT NULL COMMENT '关注时间戳',
  `update_time` bigint(16) DEFAULT NULL COMMENT '更新时间戳',
  `status` tinyint(1) unsigned DEFAULT 1 COMMENT '关注状态：1正常关注，0已取消关注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_follow` (`follower_id`,`following_id`),
  KEY `idx_follower` (`follower_id`,`status`),
  KEY `idx_following` (`following_id`,`status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户关注关系表';

-- 创建内容点赞表
CREATE TABLE IF NOT EXISTS `fa_social_post_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID，主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '点赞用户ID',
  `post_id` int(10) unsigned NOT NULL COMMENT '被点赞内容ID',
  `post_type` varchar(20) DEFAULT 'post' COMMENT '内容类型：post帖子，comment评论，activity活动',
  `create_time` bigint(16) DEFAULT NULL COMMENT '点赞时间戳',
  `ip` varchar(50) DEFAULT '' COMMENT '点赞用户IP地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_like` (`user_id`,`post_id`,`post_type`),
  KEY `idx_post` (`post_id`,`post_type`),
  KEY `idx_user` (`user_id`),
  KEY `idx_post_time` (`post_id`,`post_type`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容点赞表';

-- 创建评论系统表
CREATE TABLE IF NOT EXISTS `fa_social_comments` (
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
  KEY `idx_post` (`post_id`,`post_type`,`status`),
  KEY `idx_user` (`user_id`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_post_time` (`post_id`,`post_type`,`create_time`),
  KEY `idx_status_time` (`status`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论系统表';

-- 创建通知系统表
CREATE TABLE IF NOT EXISTS `fa_social_notifications` (
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
  KEY `idx_user_read` (`user_id`,`is_read`,`is_deleted`),
  KEY `idx_type` (`type`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_from_user` (`from_user_id`),
  KEY `idx_expire` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知系统表';

-- 创建活动参与表
CREATE TABLE IF NOT EXISTS `fa_social_activity_participants` (
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
  UNIQUE KEY `unique_participant` (`activity_id`,`user_id`),
  KEY `idx_activity` (`activity_id`,`status`),
  KEY `idx_user` (`user_id`),
  KEY `idx_status_time` (`status`,`register_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动参与记录表';

-- 创建社交帖子扩展表
CREATE TABLE IF NOT EXISTS `fa_ldcms_document_social_posts` (
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
  UNIQUE KEY `idx_document` (`document_id`),
  KEY `idx_post_type` (`post_type`),
  KEY `idx_privacy` (`privacy_level`),
  KEY `idx_featured` (`is_featured`),
  KEY `idx_hashtags` (`hashtags`(191)),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交帖子扩展信息表';

-- 创建活动信息扩展表
CREATE TABLE IF NOT EXISTS `fa_ldcms_document_activities` (
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
  UNIQUE KEY `idx_document` (`document_id`),
  KEY `idx_activity_type` (`activity_type`),
  KEY `idx_activity_status` (`activity_status`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_register_time` (`register_start`,`register_end`),
  KEY `idx_location` (`location`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动信息扩展表';

-- 创建热门话题扩展表
CREATE TABLE IF NOT EXISTS `fa_ldcms_document_topics` (
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
  UNIQUE KEY `idx_document` (`document_id`),
  UNIQUE KEY `idx_topic_name` (`topic_name`),
  KEY `idx_trending` (`is_trending`,`trending_score`),
  KEY `idx_official` (`is_official`),
  KEY `idx_post_count` (`post_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='热门话题扩展表';

-- 显示创建结果
SELECT '✅ 社交媒体平台数据库表创建完成！' as '执行结果';