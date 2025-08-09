-- ================================================================
-- 社交媒体平台管理员运营表设计 (优化版)
-- 生成时间: 2025-01-23  
-- 说明: 基于现有表结构优化，避免重复存储，通过关联查询获取内容
-- ================================================================

-- 1. 内容审核管理表 - 只存储审核相关信息，内容通过关联获取
CREATE TABLE `fa_admin_content_review` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `content_type` enum('post','comment','user_profile','activity') NOT NULL COMMENT '内容类型:post=帖子,comment=评论,user_profile=用户资料,activity=活动',
    
    -- 关联原始内容（不重复存储内容）
    `document_id` int unsigned DEFAULT NULL COMMENT '文档ID(fa_ldcms_document.id)',
    `comment_id` int unsigned DEFAULT NULL COMMENT '评论ID(fa_social_comments.id)', 
    `user_id` int unsigned NOT NULL COMMENT '被审核用户ID',
    
    -- 举报信息
    `report_reason` enum('spam','inappropriate','harassment','copyright','violence','fraud','fake','other') DEFAULT NULL COMMENT '举报原因:spam=垃圾信息,inappropriate=不当内容,harassment=骚扰,copyright=侵权,violence=暴力,fraud=诈骗,fake=虚假信息,other=其他',
    `reporter_id` int unsigned DEFAULT NULL COMMENT '举报人ID',
    `report_detail` text COMMENT '举报详情描述',
    `report_count` int unsigned DEFAULT '1' COMMENT '被举报次数',
    `report_ips` text COMMENT '举报IP记录(JSON)',
    
    -- 审核状态和处理
    `review_status` enum('pending','reviewing','approved','rejected','hidden','deleted') NOT NULL DEFAULT 'pending' COMMENT '审核状态:pending=待审核,reviewing=审核中,approved=通过,rejected=拒绝,hidden=隐藏,deleted=删除',
    `reviewer_id` int unsigned DEFAULT NULL COMMENT '审核员ID',
    `review_notes` text COMMENT '审核备注',
    `review_time` bigint DEFAULT NULL COMMENT '审核时间',
    
    -- 违规等级和处理措施
    `violation_level` enum('none','minor','moderate','severe','critical') DEFAULT 'none' COMMENT '违规等级:none=无,minor=轻微,moderate=中等,severe=严重,critical=严重',
    `action_taken` enum('none','warning','hide','delete','ban_user','ban_ip') DEFAULT 'none' COMMENT '处理措施:none=无处理,warning=警告,hide=隐藏,delete=删除,ban_user=封禁用户,ban_ip=封禁IP',
    `ban_duration` int unsigned DEFAULT '0' COMMENT '封禁时长(小时)',
    
    -- 审核流程控制
    `priority` enum('low','normal','high','urgent') DEFAULT 'normal' COMMENT '优先级:low=低,normal=普通,high=高,urgent=紧急',
    `deadline` bigint DEFAULT NULL COMMENT '处理期限',
    `auto_processed` tinyint(1) unsigned DEFAULT '0' COMMENT '自动处理:0=人工,1=自动',
    
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=关闭,1=开启',
    
    PRIMARY KEY (`id`),
    KEY `idx_review_status` (`review_status`),
    KEY `idx_content_type` (`content_type`),
    KEY `idx_document_id` (`document_id`),
    KEY `idx_comment_id` (`comment_id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_priority_createtime` (`priority`, `createtime`),
    KEY `idx_reviewer` (`reviewer_id`),
    
    -- 外键约束（可选）
    FOREIGN KEY (`document_id`) REFERENCES `fa_ldcms_document`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`comment_id`) REFERENCES `fa_social_comments`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `fa_user`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容审核管理表';

-- 2. 用户行为统计扩展表 - 扩展fa_user表的统计功能
CREATE TABLE `fa_admin_user_behavior_stats` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `user_id` int unsigned NOT NULL COMMENT '用户ID(fa_user.id)',
    
    -- 时间段统计（fa_user表没有的）
    `posts_last_7days` int unsigned NOT NULL DEFAULT '0' COMMENT '近7天发帖',
    `posts_last_30days` int unsigned NOT NULL DEFAULT '0' COMMENT '近30天发帖',
    `comments_last_7days` int unsigned NOT NULL DEFAULT '0' COMMENT '近7天评论',
    `comments_last_30days` int unsigned NOT NULL DEFAULT '0' COMMENT '近30天评论',
    `login_days_last_30` int unsigned NOT NULL DEFAULT '0' COMMENT '近30天登录天数',
    `likes_given_last_30days` int unsigned NOT NULL DEFAULT '0' COMMENT '近30天点赞数',
    
    -- 内容质量指标
    `avg_post_likes` decimal(10,2) DEFAULT '0.00' COMMENT '平均帖子获赞数',
    `avg_post_comments` decimal(10,2) DEFAULT '0.00' COMMENT '平均帖子评论数',
    `high_quality_posts` int unsigned DEFAULT '0' COMMENT '优质帖子数(获赞>50)',
    `featured_posts` int unsigned DEFAULT '0' COMMENT '精选帖子数',
    `total_views_received` int unsigned DEFAULT '0' COMMENT '总浏览数',
    
    -- 违规和风险评估
    `warning_count` int unsigned DEFAULT '0' COMMENT '警告次数',
    `violation_count` int unsigned DEFAULT '0' COMMENT '违规次数',
    `ban_count` int unsigned DEFAULT '0' COMMENT '封禁次数',
    `last_violation_time` bigint DEFAULT NULL COMMENT '最后违规时间',
    `risk_score` int unsigned DEFAULT '0' COMMENT '风险评分(0-100)',
    
    -- 用户等级评估（管理员设置）
    `user_level` enum('newbie','regular','active','influential','vip','problematic','banned') DEFAULT 'newbie' COMMENT '用户等级:newbie=新手,regular=普通,active=活跃,influential=有影响力,vip=VIP,problematic=问题用户,banned=已封禁',
    `influence_score` int unsigned DEFAULT '0' COMMENT '影响力评分',
    `activity_score` int unsigned DEFAULT '0' COMMENT '活跃度评分',
    `risk_level` enum('low','medium','high','critical') DEFAULT 'low' COMMENT '风险等级:low=低风险,medium=中风险,high=高风险,critical=严重风险',
    
    -- 管理员操作
    `is_featured_user` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐用户:0=否,1=是',
    `restriction_status` enum('none','limited_post','limited_comment','limited_login','banned') DEFAULT 'none' COMMENT '限制状态:none=无限制,limited_post=限制发帖,limited_comment=限制评论,limited_login=限制登录,banned=已封禁',
    `admin_notes` text COMMENT '管理员备注',
    
    -- 统计时间
    `last_calculated` bigint DEFAULT NULL COMMENT '最后统计时间',
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_id` (`user_id`),
    KEY `idx_user_level` (`user_level`),
    KEY `idx_influence_score` (`influence_score`),
    KEY `idx_risk_level` (`risk_level`),
    KEY `idx_risk_score` (`risk_score`),
    
    -- 外键约束
    FOREIGN KEY (`user_id`) REFERENCES `fa_user`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户行为统计扩展表';

-- 3. 内容热度管理表 - 只存储热度相关数据，内容通过关联获取
CREATE TABLE `fa_admin_content_hotlist` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `content_type` enum('post','activity','topic') NOT NULL COMMENT '内容类型:post=帖子,activity=活动,topic=话题',
    `document_id` int unsigned NOT NULL COMMENT '文档ID(fa_ldcms_document.id)',
    
    -- 热度计算数据（不重复存储fa_ldcms_document中的visits, likes）
    `view_count_today` int unsigned NOT NULL DEFAULT '0' COMMENT '今日浏览数',
    `like_count_today` int unsigned NOT NULL DEFAULT '0' COMMENT '今日点赞数',
    `comment_count_today` int unsigned NOT NULL DEFAULT '0' COMMENT '今日评论数',
    `share_count_today` int unsigned NOT NULL DEFAULT '0' COMMENT '今日分享数',
    `collect_count` int unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
    
    -- 热度评分（计算得出）
    `hot_score` int unsigned NOT NULL DEFAULT '0' COMMENT '热度评分',
    `trending_score` int unsigned NOT NULL DEFAULT '0' COMMENT '趋势评分',
    `quality_score` decimal(3,2) DEFAULT '0.00' COMMENT '质量评分',
    `growth_rate_24h` decimal(5,2) DEFAULT '0.00' COMMENT '24小时增长率(%)',
    `engagement_rate` decimal(5,2) DEFAULT '0.00' COMMENT '互动率(%)',
    
    -- 推荐管理（管理员操作）
    `is_featured` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否精选:0=否,1=是',
    `is_trending` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门:0=否,1=是',
    `is_recommended` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐:0=否,1=是',
    `recommend_position` enum('none','homepage','category','hot','trending') DEFAULT 'none' COMMENT '推荐位置:none=无,homepage=首页,category=分类页,hot=热门,trending=趋势',
    `recommend_weight` int unsigned DEFAULT '0' COMMENT '推荐权重',
    `recommend_start_time` bigint DEFAULT NULL COMMENT '推荐开始时间',
    `recommend_end_time` bigint DEFAULT NULL COMMENT '推荐结束时间',
    
    -- 管理操作
    `admin_action` enum('none','promote','demote','feature','unfeature','hide','delete') DEFAULT 'none' COMMENT '管理操作:none=无,promote=提升,demote=降级,feature=设为精选,unfeature=取消精选,hide=隐藏,delete=删除',
    `manual_hot_score` int unsigned DEFAULT NULL COMMENT '手动设置热度',
    `admin_notes` text COMMENT '管理员备注',
    
    -- 时间记录
    `hot_start_time` bigint DEFAULT NULL COMMENT '开始热门时间',
    `last_calculated` bigint DEFAULT NULL COMMENT '最后计算时间',
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_content_type_document` (`content_type`, `document_id`),
    KEY `idx_hot_score` (`hot_score`),
    KEY `idx_is_featured` (`is_featured`),
    KEY `idx_is_trending` (`is_trending`),
    KEY `idx_recommend_position` (`recommend_position`),
    KEY `idx_document_id` (`document_id`),
    
    -- 外键约束
    FOREIGN KEY (`document_id`) REFERENCES `fa_ldcms_document`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容热度管理表';

-- 4. 活动运营统计表 - 扩展活动管理，不重复存储基础信息
CREATE TABLE `fa_admin_activity_operations` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `document_id` int unsigned NOT NULL COMMENT '活动文档ID(fa_ldcms_document.id)',
    
    -- 报名和参与统计（fa_ldcms_document_activities表没有的详细统计）
    `total_registrations` int unsigned DEFAULT '0' COMMENT '总报名数',
    `approved_registrations` int unsigned DEFAULT '0' COMMENT '通过报名数',
    `rejected_registrations` int unsigned DEFAULT '0' COMMENT '拒绝报名数',
    `actual_attendees` int unsigned DEFAULT '0' COMMENT '实际参与人数',
    `no_show_count` int unsigned DEFAULT '0' COMMENT '爽约人数',
    `waiting_list_count` int unsigned DEFAULT '0' COMMENT '候补人数',
    `checkin_count` int unsigned DEFAULT '0' COMMENT '签到人数',
    
    -- 效果统计（计算得出）
    `registration_rate` decimal(5,2) DEFAULT '0.00' COMMENT '报名率(%)',
    `attendance_rate` decimal(5,2) DEFAULT '0.00' COMMENT '出席率(%)',
    `completion_rate` decimal(5,2) DEFAULT '0.00' COMMENT '完成率(%)',
    `satisfaction_score` decimal(3,2) DEFAULT '0.00' COMMENT '满意度评分',
    `nps_score` decimal(5,2) DEFAULT '0.00' COMMENT 'NPS推荐度',
    
    -- 财务统计
    `total_revenue` decimal(10,2) DEFAULT '0.00' COMMENT '总收入',
    `total_cost` decimal(10,2) DEFAULT '0.00' COMMENT '总成本',
    `profit` decimal(10,2) DEFAULT '0.00' COMMENT '利润',
    `marketing_cost` decimal(10,2) DEFAULT '0.00' COMMENT '营销成本',
    `operational_cost` decimal(10,2) DEFAULT '0.00' COMMENT '运营成本',
    
    -- 用户分析
    `new_user_count` int unsigned DEFAULT '0' COMMENT '新用户参与数',
    `returning_user_count` int unsigned DEFAULT '0' COMMENT '回头用户参与数',
    `user_retention_rate` decimal(5,2) DEFAULT '0.00' COMMENT '用户留存率(%)',
    `conversion_rate` decimal(5,2) DEFAULT '0.00' COMMENT '转化率(%)',
    
    -- 推广效果分析
    `promotion_channels` text COMMENT '推广渠道效果(JSON)',
    `source_analysis` text COMMENT '来源分析(JSON)', 
    `roi` decimal(5,2) DEFAULT '0.00' COMMENT '投资回报率(%)',
    
    -- 管理评估
    `quality_rating` enum('poor','fair','good','excellent') DEFAULT 'good' COMMENT '质量评级:poor=差,fair=一般,good=良好,excellent=优秀',
    `operation_difficulty` enum('easy','medium','hard','expert') DEFAULT 'medium' COMMENT '运营难度:easy=简单,medium=中等,hard=困难,expert=专家级',
    `resource_efficiency` enum('low','medium','high') DEFAULT 'medium' COMMENT '资源效率:low=低,medium=中,high=高',
    `recommend_repeat` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐重复举办:0=否,1=是',
    
    -- 管理备注
    `admin_notes` text COMMENT '管理员备注',
    `lessons_learned` text COMMENT '经验总结',
    `improvement_suggestions` text COMMENT '改进建议',
    `is_featured` tinyint(1) unsigned DEFAULT '0' COMMENT '是否精选案例:0=否,1=是',
    `is_case_study` tinyint(1) unsigned DEFAULT '0' COMMENT '是否案例研究:0=否,1=是',
    
    `last_calculated` bigint DEFAULT NULL COMMENT '最后统计时间',
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_document_id` (`document_id`),
    KEY `idx_quality_rating` (`quality_rating`),
    KEY `idx_attendance_rate` (`attendance_rate`),
    KEY `idx_roi` (`roi`),
    KEY `idx_is_featured` (`is_featured`),
    
    -- 外键约束
    FOREIGN KEY (`document_id`) REFERENCES `fa_ldcms_document`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动运营统计表';

-- 5. 平台运营数据表 - 保持不变，这个表主要是统计汇总数据
CREATE TABLE `fa_admin_platform_operations` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `date` date NOT NULL COMMENT '统计日期',
    `period_type` enum('daily','weekly','monthly') NOT NULL DEFAULT 'daily' COMMENT '统计周期:daily=日,weekly=周,monthly=月',
    `year_month` varchar(7) DEFAULT '' COMMENT '年月(YYYY-MM)',
    
    -- 用户数据统计
    `total_users` int unsigned DEFAULT '0' COMMENT '总用户数',
    `new_users` int unsigned DEFAULT '0' COMMENT '新增用户',
    `active_users` int unsigned DEFAULT '0' COMMENT '活跃用户',
    `daily_active_users` int unsigned DEFAULT '0' COMMENT '日活跃用户',
    `user_retention_1day` decimal(5,2) DEFAULT '0.00' COMMENT '1日留存率(%)',
    `user_retention_7day` decimal(5,2) DEFAULT '0.00' COMMENT '7日留存率(%)',
    `user_retention_30day` decimal(5,2) DEFAULT '0.00' COMMENT '30日留存率(%)',
    
    -- 内容数据统计
    `total_posts` int unsigned DEFAULT '0' COMMENT '总帖子数',
    `new_posts` int unsigned DEFAULT '0' COMMENT '新增帖子',
    `total_comments` int unsigned DEFAULT '0' COMMENT '总评论数',
    `new_comments` int unsigned DEFAULT '0' COMMENT '新增评论',
    `total_likes` int unsigned DEFAULT '0' COMMENT '总点赞数',
    `new_likes` int unsigned DEFAULT '0' COMMENT '新增点赞',
    `content_engagement_rate` decimal(5,2) DEFAULT '0.00' COMMENT '内容互动率(%)',
    
    -- 社交数据统计
    `total_follows` int unsigned DEFAULT '0' COMMENT '总关注数',
    `new_follows` int unsigned DEFAULT '0' COMMENT '新增关注',
    `social_network_density` decimal(5,4) DEFAULT '0.0000' COMMENT '社交网络密度',
    
    -- 活动数据统计
    `total_activities` int unsigned DEFAULT '0' COMMENT '总活动数',
    `new_activities` int unsigned DEFAULT '0' COMMENT '新增活动',
    `completed_activities` int unsigned DEFAULT '0' COMMENT '完成活动数',
    `total_activity_participants` int unsigned DEFAULT '0' COMMENT '总活动参与人次',
    `activity_completion_rate` decimal(5,2) DEFAULT '0.00' COMMENT '活动完成率(%)',
    
    -- 违规数据统计  
    `new_reports` int unsigned DEFAULT '0' COMMENT '新增举报',
    `processed_reports` int unsigned DEFAULT '0' COMMENT '处理举报数',
    `violation_rate` decimal(5,2) DEFAULT '0.00' COMMENT '违规率(%)',
    `content_removal_rate` decimal(5,2) DEFAULT '0.00' COMMENT '内容删除率(%)',
    
    -- 健康度评分
    `platform_health_score` decimal(3,2) DEFAULT '0.00' COMMENT '平台健康度评分',
    `user_satisfaction_score` decimal(3,2) DEFAULT '0.00' COMMENT '用户满意度评分',
    `content_quality_score` decimal(3,2) DEFAULT '0.00' COMMENT '内容质量评分',
    
    -- 增长指标
    `user_growth_rate` decimal(5,2) DEFAULT '0.00' COMMENT '用户增长率(%)',
    `content_growth_rate` decimal(5,2) DEFAULT '0.00' COMMENT '内容增长率(%)',
    `engagement_growth_rate` decimal(5,2) DEFAULT '0.00' COMMENT '互动增长率(%)',
    
    -- 数据质量控制
    `data_quality` enum('excellent','good','fair','poor') DEFAULT 'good' COMMENT '数据质量:excellent=优秀,good=良好,fair=一般,poor=差',
    `anomaly_detected` tinyint(1) unsigned DEFAULT '0' COMMENT '异常检测:0=正常,1=异常',
    `admin_notes` text COMMENT '管理员备注',
    
    `calculated_time` bigint DEFAULT NULL COMMENT '计算时间',
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_date_period` (`date`, `period_type`),
    KEY `idx_date` (`date`),
    KEY `idx_period_type` (`period_type`),
    KEY `idx_platform_health` (`platform_health_score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='平台运营数据表';

-- 6. 营销活动配置表 - 保持不变，主要是配置数据
CREATE TABLE `fa_admin_marketing_campaigns` (
    `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `campaign_name` varchar(255) NOT NULL COMMENT '活动名称',
    `campaign_code` varchar(50) NOT NULL COMMENT '活动代码',
    `campaign_desc` text COMMENT '活动描述',
    `campaign_type` enum('user_acquisition','user_retention','content_promotion','engagement_boost','revenue_increase') NOT NULL COMMENT '活动类型:user_acquisition=用户获取,user_retention=用户留存,content_promotion=内容推广,engagement_boost=互动提升,revenue_increase=收入增长',
    
    -- 目标设置
    `target_audience` enum('all_users','new_users','active_users','inactive_users','vip_users','specific_group') DEFAULT 'all_users' COMMENT '目标用户:all_users=所有用户,new_users=新用户,active_users=活跃用户,inactive_users=不活跃用户,vip_users=VIP用户,specific_group=特定群体',
    `target_user_filter` text COMMENT '用户筛选条件(JSON)',
    `target_metrics` text COMMENT '目标指标(JSON)',
    `success_criteria` text COMMENT '成功标准',
    
    -- 活动规则  
    `participation_rules` text COMMENT '参与规则',
    `reward_rules` text COMMENT '奖励规则',
    `limitations` text COMMENT '限制条件',
    
    -- 时间和预算
    `start_time` bigint NOT NULL COMMENT '开始时间',
    `end_time` bigint NOT NULL COMMENT '结束时间',
    `total_budget` decimal(10,2) DEFAULT '0.00' COMMENT '总预算',
    `current_spent` decimal(10,2) DEFAULT '0.00' COMMENT '当前花费',
    
    -- 参与统计
    `current_participants` int unsigned DEFAULT '0' COMMENT '当前参与人数',
    `target_participants` int unsigned DEFAULT '0' COMMENT '目标参与人数',
    `participation_rate` decimal(5,2) DEFAULT '0.00' COMMENT '参与率(%)',
    
    -- 效果统计
    `conversion_rate` decimal(5,2) DEFAULT '0.00' COMMENT '转化率(%)',
    `roi` decimal(5,2) DEFAULT '0.00' COMMENT '投资回报率(%)',
    `cost_per_acquisition` decimal(10,2) DEFAULT '0.00' COMMENT '获客成本',
    
    -- 推广渠道
    `promotion_channels` text COMMENT '推广渠道(JSON)',
    `channel_performance` text COMMENT '渠道效果(JSON)',
    
    -- 活动状态
    `campaign_status` enum('draft','scheduled','active','paused','completed','cancelled') DEFAULT 'draft' COMMENT '活动状态:draft=草稿,scheduled=已安排,active=进行中,paused=已暂停,completed=已完成,cancelled=已取消',
    `approval_status` enum('pending','approved','rejected') DEFAULT 'pending' COMMENT '审批状态:pending=待审批,approved=已通过,rejected=已拒绝',
    
    -- 管理字段
    `created_by` int unsigned DEFAULT NULL COMMENT '创建人ID',
    `approved_by` int unsigned DEFAULT NULL COMMENT '审批人ID',
    `priority` enum('low','normal','high','critical') DEFAULT 'normal' COMMENT '优先级:low=低,normal=普通,high=高,critical=紧急',
    `admin_notes` text COMMENT '管理员备注',
    
    `createtime` bigint DEFAULT NULL COMMENT '创建时间',
    `updatetime` bigint DEFAULT NULL COMMENT '更新时间',
    `last_calculated` bigint DEFAULT NULL COMMENT '最后统计时间',
    `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_campaign_code` (`campaign_code`),
    KEY `idx_campaign_status` (`campaign_status`),
    KEY `idx_campaign_type` (`campaign_type`),
    KEY `idx_start_end_time` (`start_time`, `end_time`),
    KEY `idx_roi` (`roi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='营销活动配置表';

-- ================================================================
-- 优化说明：
-- 1. 移除重复字段，通过JOIN查询获取fa_ldcms_document、fa_user等表的内容
-- 2. fa_admin_content_review 通过document_id和comment_id关联，不重复存储title、content
-- 3. fa_admin_user_behavior_stats 扩展fa_user表，不重复存储基础用户信息  
-- 4. fa_admin_content_hotlist 关联document_id，不重复存储title、author_name等
-- 5. fa_admin_activity_operations 关联document_id，不重复存储活动基础信息
-- 6. 添加外键约束确保数据一致性
-- 7. 优化索引设计，提高查询性能
-- ================================================================

-- 使用示例查询：
-- 查询需要审核的帖子内容：
-- SELECT r.*, d.title, d.image, u.nickname as user_name
-- FROM fa_admin_content_review r
-- LEFT JOIN fa_ldcms_document d ON r.document_id = d.id  
-- LEFT JOIN fa_user u ON r.user_id = u.id
-- WHERE r.content_type = 'post' AND r.review_status = 'pending';

-- 查询用户统计信息：
-- SELECT u.username, u.nickname, u.posts_count, u.followers_count, s.posts_last_30days, s.user_level
-- FROM fa_user u
-- LEFT JOIN fa_admin_user_behavior_stats s ON u.id = s.user_id
-- WHERE s.user_level IN ('active', 'influential');