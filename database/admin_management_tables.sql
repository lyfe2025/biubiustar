-- ================================================================
-- 社交媒体平台管理员数据表设计
-- 生成时间: 2025-01-23
-- 说明: 为管理员提供有意义的聚合数据表，支持FastAdmin CRUD操作
-- 替代无意义的原始操作记录表直接管理
-- ================================================================

-- 1. 帖子统计管理表 (替代直接管理 fa_social_post_likes)
CREATE TABLE `fa_admin_posts_stats` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `post_id` int unsigned NOT NULL COMMENT '帖子ID',
    `document_id` int unsigned NOT NULL COMMENT '文档ID',
    `title` varchar(255) NOT NULL COMMENT '帖子标题',
    `author_id` int unsigned NOT NULL COMMENT '作者ID',
    `author_name` varchar(50) NOT NULL COMMENT '作者昵称',
    `post_type` enum('text','image','video','mixed') NOT NULL DEFAULT 'text' COMMENT '帖子类型:text=文本,image=图片,video=视频,mixed=混合',
    `privacy_level` enum('public','followers','private') NOT NULL DEFAULT 'public' COMMENT '隐私级别:public=公开,followers=仅粉丝,private=私密',
    `is_featured` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否精选:0=否,1=是',
    `location` varchar(255) DEFAULT '' COMMENT '位置信息',
    `hashtags` varchar(500) DEFAULT '' COMMENT '话题标签',
    
    -- 统计数据
    `like_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
    `comment_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
    `share_count` int unsigned NOT NULL DEFAULT '0' COMMENT '分享数',
    `view_count` int unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
    `popularity_score` int unsigned NOT NULL DEFAULT '0' COMMENT '热度评分',
    
    -- 管理字段
    `admin_action` enum('none','promote','demote','hide','delete') NOT NULL DEFAULT 'none' COMMENT '管理操作:none=无,promote=推广,demote=降级,hide=隐藏,delete=删除',
    `admin_notes` text COMMENT '管理员备注',
    `last_updated` bigint DEFAULT NULL COMMENT '最后统计更新时间',
    `post_time` bigint DEFAULT NULL COMMENT '发帖时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_post_id` (`post_id`),
    KEY `idx_popularity` (`popularity_score`),
    KEY `idx_featured` (`is_featured`),
    KEY `idx_author` (`author_id`),
    KEY `idx_post_time` (`post_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子统计管理表';

-- 2. 用户统计管理表 (替代直接管理 fa_social_follows)
CREATE TABLE `fa_admin_users_stats` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `user_id` int unsigned NOT NULL COMMENT '用户ID',
    `username` varchar(32) NOT NULL COMMENT '用户名',
    `nickname` varchar(50) NOT NULL COMMENT '昵称',
    `email` varchar(100) DEFAULT '' COMMENT '邮箱',
    `is_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否认证:0=否,1=是',
    `user_status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '用户状态:normal=正常,hidden=隐藏',
    
    -- 时间统计
    `register_time` bigint DEFAULT NULL COMMENT '注册时间',
    `last_login` bigint DEFAULT NULL COMMENT '最后登录',
    `days_since_register` int unsigned DEFAULT '0' COMMENT '注册天数',
    `days_since_login` int unsigned DEFAULT '0' COMMENT '最后登录天数',
    
    -- 社交统计
    `followers_count` int unsigned NOT NULL DEFAULT '0' COMMENT '粉丝数',
    `following_count` int unsigned NOT NULL DEFAULT '0' COMMENT '关注数',
    `posts_count` int unsigned NOT NULL DEFAULT '0' COMMENT '发帖数',
    `likes_received` int unsigned NOT NULL DEFAULT '0' COMMENT '获赞数',
    `comments_count` int unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
    
    -- 活跃度指标
    `posts_last_30days` int unsigned NOT NULL DEFAULT '0' COMMENT '近30天发帖',
    `comments_last_30days` int unsigned NOT NULL DEFAULT '0' COMMENT '近30天评论',
    `login_frequency` enum('daily','weekly','monthly','inactive') NOT NULL DEFAULT 'inactive' COMMENT '登录频率:daily=每日,weekly=每周,monthly=每月,inactive=不活跃',
    
    -- 影响力评分
    `influence_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '影响力评分',
    `activity_level` enum('high','medium','low','inactive') NOT NULL DEFAULT 'inactive' COMMENT '活跃等级:high=高,medium=中,low=低,inactive=不活跃',
    
    -- 管理字段
    `admin_action` enum('none','promote','demote','warn','restrict','ban') NOT NULL DEFAULT 'none' COMMENT '管理操作:none=无,promote=推荐,demote=降级,warn=警告,restrict=限制,ban=封禁',
    `admin_notes` text COMMENT '管理员备注',
    `risk_level` enum('low','medium','high') NOT NULL DEFAULT 'low' COMMENT '风险等级:low=低,medium=中,high=高',
    `last_updated` bigint DEFAULT NULL COMMENT '最后统计更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_id` (`user_id`),
    KEY `idx_influence` (`influence_score`),
    KEY `idx_activity` (`activity_level`),
    KEY `idx_risk` (`risk_level`),
    KEY `idx_last_login` (`last_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户统计管理表';

-- 3. 活动统计管理表 (替代直接管理 fa_social_activity_participants)
CREATE TABLE `fa_admin_activities_stats` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `activity_id` int unsigned NOT NULL COMMENT '活动ID',
    `document_id` int unsigned NOT NULL COMMENT '文档ID',
    `title` varchar(255) NOT NULL COMMENT '活动标题',
    `activity_type` enum('event','meetup','workshop','competition','conference','party') NOT NULL DEFAULT 'event' COMMENT '活动类型:event=活动,meetup=聚会,workshop=工作坊,competition=比赛,conference=会议,party=派对',
    `activity_status` enum('draft','published','ongoing','completed','cancelled','postponed') NOT NULL DEFAULT 'draft' COMMENT '活动状态:draft=草稿,published=已发布,ongoing=进行中,completed=已完成,cancelled=已取消,postponed=已延期',
    `start_time` bigint DEFAULT NULL COMMENT '开始时间',
    `end_time` bigint DEFAULT NULL COMMENT '结束时间',
    `location` varchar(255) DEFAULT '' COMMENT '活动地点',
    `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '活动费用',
    `fee_type` enum('free','paid','aa') NOT NULL DEFAULT 'free' COMMENT '费用类型:free=免费,paid=付费,aa=AA制',
    `max_participants` int unsigned NOT NULL DEFAULT '0' COMMENT '最大参与人数',
    
    -- 报名统计
    `total_registered` int unsigned NOT NULL DEFAULT '0' COMMENT '总报名数',
    `approved_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已通过数',
    `attended_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已出席数',
    `cancelled_count` int unsigned NOT NULL DEFAULT '0' COMMENT '已取消数',
    `waiting_count` int unsigned NOT NULL DEFAULT '0' COMMENT '等待审核数',
    
    -- 统计指标
    `registration_rate` decimal(5,2) DEFAULT NULL COMMENT '报名率(%)',
    `attendance_rate` decimal(5,2) DEFAULT NULL COMMENT '出席率(%)',
    `satisfaction_score` decimal(3,2) DEFAULT NULL COMMENT '满意度评分',
    `revenue` decimal(10,2) DEFAULT '0.00' COMMENT '活动收入',
    
    -- 管理字段
    `admin_action` enum('none','promote','feature','cancel','postpone') NOT NULL DEFAULT 'none' COMMENT '管理操作:none=无,promote=推广,feature=精选,cancel=取消,postpone=延期',
    `admin_notes` text COMMENT '管理员备注',
    `is_featured` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否精选:0=否,1=是',
    `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal' COMMENT '优先级:low=低,normal=普通,high=高,urgent=紧急',
    `last_updated` bigint DEFAULT NULL COMMENT '最后统计更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_activity_id` (`activity_id`),
    KEY `idx_registration_rate` (`registration_rate`),
    KEY `idx_featured` (`is_featured`),
    KEY `idx_start_time` (`start_time`),
    KEY `idx_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动统计管理表';

-- 4. 话题统计管理表
CREATE TABLE `fa_admin_topics_stats` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `topic_id` int unsigned NOT NULL COMMENT '话题ID',
    `topic_name` varchar(100) NOT NULL COMMENT '话题名称',
    `topic_desc` text COMMENT '话题描述',
    `topic_color` varchar(7) DEFAULT '#8B5CF6' COMMENT '话题颜色代码',
    `topic_icon` varchar(255) DEFAULT '' COMMENT '话题图标',
    `is_official` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否官方:0=否,1=是',
    `is_trending` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门:0=否,1=是',
    
    -- 统计数据
    `posts_count` int unsigned NOT NULL DEFAULT '0' COMMENT '帖子数量',
    `participants_count` int unsigned NOT NULL DEFAULT '0' COMMENT '参与者数量',
    `trending_score` int unsigned NOT NULL DEFAULT '0' COMMENT '热度评分',
    `recent_posts_30days` int unsigned NOT NULL DEFAULT '0' COMMENT '近30天帖子数',
    `growth_rate` decimal(5,2) DEFAULT '0.00' COMMENT '增长率(%)',
    
    -- 分类和等级
    `heat_level` enum('hot','warm','normal','cold') NOT NULL DEFAULT 'normal' COMMENT '热度等级:hot=超热门,warm=热门,normal=一般,cold=冷门',
    `category` varchar(50) DEFAULT '' COMMENT '话题分类',
    `quality_score` decimal(3,2) DEFAULT '0.00' COMMENT '内容质量评分',
    
    -- 管理字段
    `admin_action` enum('none','promote','feature','restrict','hide') NOT NULL DEFAULT 'none' COMMENT '管理操作:none=无,promote=推广,feature=精选,restrict=限制,hide=隐藏',
    `admin_notes` text COMMENT '管理员备注',
    `last_updated` bigint DEFAULT NULL COMMENT '最后统计更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_topic_id` (`topic_id`),
    KEY `idx_trending_score` (`trending_score`),
    KEY `idx_heat_level` (`heat_level`),
    KEY `idx_is_trending` (`is_trending`),
    KEY `idx_is_official` (`is_official`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话题统计管理表';

-- 5. 系统运营数据表
CREATE TABLE `fa_admin_system_stats` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `date` date NOT NULL COMMENT '统计日期',
    `period_type` enum('daily','weekly','monthly') NOT NULL DEFAULT 'daily' COMMENT '统计周期:daily=日,weekly=周,monthly=月',
    
    -- 用户统计
    `total_users` int unsigned NOT NULL DEFAULT '0' COMMENT '总用户数',
    `new_users` int unsigned NOT NULL DEFAULT '0' COMMENT '新增用户数',
    `active_users` int unsigned NOT NULL DEFAULT '0' COMMENT '活跃用户数',
    `verified_users` int unsigned NOT NULL DEFAULT '0' COMMENT '认证用户数',
    
    -- 内容统计
    `total_posts` int unsigned NOT NULL DEFAULT '0' COMMENT '总帖子数',
    `new_posts` int unsigned NOT NULL DEFAULT '0' COMMENT '新增帖子数',
    `total_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '总评论数',
    `new_comments` int unsigned NOT NULL DEFAULT '0' COMMENT '新增评论数',
    
    -- 社交统计
    `total_likes` int unsigned NOT NULL DEFAULT '0' COMMENT '总点赞数',
    `new_likes` int unsigned NOT NULL DEFAULT '0' COMMENT '新增点赞数',
    `total_follows` int unsigned NOT NULL DEFAULT '0' COMMENT '总关注数',
    `new_follows` int unsigned NOT NULL DEFAULT '0' COMMENT '新增关注数',
    
    -- 活动统计
    `total_activities` int unsigned NOT NULL DEFAULT '0' COMMENT '总活动数',
    `new_activities` int unsigned NOT NULL DEFAULT '0' COMMENT '新增活动数',
    `total_participants` int unsigned NOT NULL DEFAULT '0' COMMENT '总参与人数',
    `new_participants` int unsigned NOT NULL DEFAULT '0' COMMENT '新增参与人数',
    
    -- 运营指标
    `user_retention_rate` decimal(5,2) DEFAULT '0.00' COMMENT '用户留存率(%)',
    `content_engagement_rate` decimal(5,2) DEFAULT '0.00' COMMENT '内容互动率(%)',
    `activity_completion_rate` decimal(5,2) DEFAULT '0.00' COMMENT '活动完成率(%)',
    `platform_health_score` decimal(3,2) DEFAULT '0.00' COMMENT '平台健康度',
    
    -- 管理字段
    `admin_notes` text COMMENT '管理员备注',
    `last_updated` bigint DEFAULT NULL COMMENT '最后更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_date_period` (`date`, `period_type`),
    KEY `idx_date` (`date`),
    KEY `idx_period_type` (`period_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统运营数据表';

-- 6. 违规内容管理表
CREATE TABLE `fa_admin_content_moderation` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `content_type` enum('post','comment','user','activity') NOT NULL COMMENT '内容类型:post=帖子,comment=评论,user=用户,activity=活动',
    `content_id` int unsigned NOT NULL COMMENT '内容ID',
    `content_title` varchar(255) DEFAULT '' COMMENT '内容标题',
    `content_preview` text COMMENT '内容预览',
    `reporter_id` int unsigned DEFAULT NULL COMMENT '举报人ID',
    `reporter_name` varchar(50) DEFAULT '' COMMENT '举报人昵称',
    `admin_id` int unsigned DEFAULT NULL COMMENT '处理管理员ID',
    `admin_name` varchar(50) DEFAULT '' COMMENT '处理管理员',
    
    -- 违规信息
    `violation_type` enum('spam','inappropriate','harassment','copyright','violence','fraud','other') NOT NULL COMMENT '违规类型:spam=垃圾信息,inappropriate=不当内容,harassment=骚扰,copyright=版权,violence=暴力,fraud=诈骗,other=其他',
    `severity_level` enum('low','medium','high','critical') NOT NULL DEFAULT 'medium' COMMENT '严重程度:low=低,medium=中,high=高,critical=严重',
    `description` text COMMENT '违规描述',
    `evidence` text COMMENT '证据链接',
    
    -- 处理状态
    `status` enum('pending','processing','resolved','rejected','escalated') NOT NULL DEFAULT 'pending' COMMENT '处理状态:pending=待处理,processing=处理中,resolved=已解决,rejected=已驳回,escalated=已升级',
    `action_taken` enum('none','warning','hide','delete','ban_user','ban_ip') DEFAULT 'none' COMMENT '处理措施:none=无,warning=警告,hide=隐藏,delete=删除,ban_user=封禁用户,ban_ip=封禁IP',
    `admin_notes` text COMMENT '管理员备注',
    `auto_detected` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '自动检测:0=否,1=是',
    
    -- 时间记录
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `resolved_time` bigint DEFAULT NULL COMMENT '解决时间',
    `deadline` bigint DEFAULT NULL COMMENT '处理期限',
    
    PRIMARY KEY (`id`),
    KEY `idx_status` (`status`),
    KEY `idx_content` (`content_type`, `content_id`),
    KEY `idx_severity` (`severity_level`),
    KEY `idx_createtime` (`createtime`),
    KEY `idx_admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容审核管理表';

-- 7. 系统公告管理表
CREATE TABLE `fa_admin_announcements` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `title` varchar(255) NOT NULL COMMENT '公告标题',
    `content` text NOT NULL COMMENT '公告内容',
    `summary` varchar(500) DEFAULT '' COMMENT '公告摘要',
    `type` enum('system','event','maintenance','feature','promotion') NOT NULL DEFAULT 'system' COMMENT '公告类型:system=系统,event=活动,maintenance=维护,feature=功能,promotion=推广',
    `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal' COMMENT '优先级:low=低,normal=普通,high=高,urgent=紧急',
    `target_users` enum('all','verified','new','inactive','vip') NOT NULL DEFAULT 'all' COMMENT '目标用户:all=所有用户,verified=认证用户,new=新用户,inactive=不活跃用户,vip=VIP用户',
    
    -- 显示设置
    `is_popup` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否弹窗:0=否,1=是',
    `is_pinned` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶:0=否,1=是',
    `is_urgent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否紧急:0=否,1=是',
    `show_duration` int unsigned DEFAULT '0' COMMENT '显示时长(小时)',
    
    -- 时间设置
    `start_time` bigint DEFAULT NULL COMMENT '开始显示时间',
    `end_time` bigint DEFAULT NULL COMMENT '结束显示时间',
    `publish_time` bigint DEFAULT NULL COMMENT '发布时间',
    
    -- 统计数据
    `view_count` int unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
    `click_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
    `effective_rate` decimal(5,2) DEFAULT '0.00' COMMENT '有效率(%)',
    
    -- 管理字段
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=停用,1=启用',
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `created_by` int unsigned DEFAULT NULL COMMENT '创建人ID',
    `created_by_name` varchar(50) DEFAULT '' COMMENT '创建人',
    
    PRIMARY KEY (`id`),
    KEY `idx_status_time` (`status`, `start_time`, `end_time`),
    KEY `idx_type_priority` (`type`, `priority`),
    KEY `idx_createtime` (`createtime`),
    KEY `idx_target` (`target_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统公告管理表';

-- 8. 运营活动配置表
CREATE TABLE `fa_admin_operation_campaigns` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name` varchar(255) NOT NULL COMMENT '活动名称',
    `description` text COMMENT '活动描述',
    `campaign_code` varchar(50) NOT NULL COMMENT '活动代码',
    `type` enum('sign_bonus','invite_reward','content_contest','activity_promotion','user_growth','retention') NOT NULL COMMENT '活动类型:sign_bonus=签到奖励,invite_reward=邀请奖励,content_contest=内容比赛,activity_promotion=活动推广,user_growth=用户增长,retention=用户留存',
    `target_audience` enum('all','new','active','inactive','vip') NOT NULL DEFAULT 'all' COMMENT '目标用户:all=全部,new=新用户,active=活跃用户,inactive=不活跃用户,vip=VIP用户',
    
    -- 活动规则
    `rules` text COMMENT '活动规则',
    `rewards` text COMMENT '奖励设置',
    `conditions` text COMMENT '参与条件',
    `auto_reward` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '自动发奖:0=否,1=是',
    
    -- 时间设置
    `start_time` bigint NOT NULL COMMENT '开始时间',
    `end_time` bigint NOT NULL COMMENT '结束时间',
    `registration_deadline` bigint DEFAULT NULL COMMENT '报名截止时间',
    
    -- 参与限制
    `participant_limit` int unsigned DEFAULT NULL COMMENT '参与人数限制',
    `current_participants` int unsigned DEFAULT '0' COMMENT '当前参与人数',
    `daily_limit` int unsigned DEFAULT NULL COMMENT '每日参与限制',
    `per_user_limit` int unsigned DEFAULT '1' COMMENT '每人参与次数限制',
    
    -- 预算管理
    `budget` decimal(10,2) DEFAULT NULL COMMENT '活动预算',
    `spent` decimal(10,2) DEFAULT '0.00' COMMENT '已花费',
    `cost_per_participant` decimal(10,2) DEFAULT '0.00' COMMENT '人均成本',
    
    -- 效果统计
    `conversion_rate` decimal(5,2) DEFAULT '0.00' COMMENT '转化率(%)',
    `roi` decimal(5,2) DEFAULT '0.00' COMMENT '投资回报率(%)',
    `engagement_score` decimal(3,2) DEFAULT '0.00' COMMENT '参与度评分',
    
    -- 管理字段
    `status` enum('draft','active','paused','ended','cancelled') NOT NULL DEFAULT 'draft' COMMENT '状态:draft=草稿,active=进行中,paused=暂停,ended=已结束,cancelled=已取消',
    `priority` enum('low','normal','high') NOT NULL DEFAULT 'normal' COMMENT '优先级:low=低,normal=普通,high=高',
    `admin_notes` text COMMENT '管理员备注',
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `created_by` int unsigned DEFAULT NULL COMMENT '创建人ID',
    `created_by_name` varchar(50) DEFAULT '' COMMENT '创建人',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_campaign_code` (`campaign_code`),
    KEY `idx_status_time` (`status`, `start_time`, `end_time`),
    KEY `idx_type` (`type`),
    KEY `idx_createtime` (`createtime`),
    KEY `idx_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='运营活动配置表';

-- ================================================================
-- 说明：
-- 1. 所有表都支持FastAdmin CRUD操作
-- 2. 包含聚合统计数据，管理员可以直接查看和编辑
-- 3. 提供管理操作字段，支持批量管理
-- 4. 时间戳字段符合FastAdmin规范
-- 5. 注释格式正确，支持自动生成组件
-- 
-- 执行建议：
-- 1. 创建这些管理表
-- 2. 编写定时任务更新统计数据
-- 3. 为这些表生成FastAdmin CRUD界面
-- 4. 原始操作记录表保留但不生成CRUD
-- ================================================================