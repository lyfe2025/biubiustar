# 📋 Biubiustar社交媒体平台开发清单

> **项目概述**: 基于现有FastAdmin + LDCMS企业网站系统，扩展开发社交媒体平台功能
> 
> **技术栈**: FastAdmin v1.6 + ThinkPHP 5.1 + LDCMS v1.4.3 + MySQL
> 
> **多语言支持**: 越南语（默认）、英语、中文简体、中文繁体
> 
> **开发原则**: 复用现有用户系统，扩展LDCMS模型管理，实现简洁大气的毛玻璃UI风格

---

## ⏱ 进度总览
- 已完成：数据库扩展（fa_user 字段、fa_social_*、fa_ldcms_document_social_posts、fa_ldcms_document_activities）、LDCMS 模型注册（social_posts、activities、topics）
- 进行中：后台通用 `ldcms/document` 已用于社交帖子扩展数据管理
- 待开始：专用后台模块、栏目配置、前台控制器与 API、UI/UX、社交互动功能、推荐算法

## 📊 项目现状分析

### ✅ 已有基础设施

#### 1. 用户系统（可直接复用）
- **表结构**: `fa_user` 表包含完整用户信息（id、username、nickname、email、avatar等）
- **认证系统**: 前台注册登录已完善（支持用户名/邮箱登录，无需邮箱验证）
- **会员中心**: `/application/index/controller/User.php` 提供基础个人中心功能
- **权限管理**: `fa_user_group`、`fa_user_rule` 表支持用户分组和权限控制

#### 2. LDCMS内容管理系统（可扩展复用）
- **核心表结构**:
  - `fa_ldcms_category` - 栏目分类管理（支持多语言）
  - `fa_ldcms_document` - 文档内容管理
  - `fa_ldcms_models` - 模型管理系统
  - `fa_ldcms_ad` - 广告/轮播图管理
  - `fa_ldcms_diyform` - 自定义表单系统

#### 3. 多语言基础设施
- **语言支持**: 已配置4种语言（vi-vn、en、zh-cn、zh-tw）
- **模板系统**: 支持多模板切换（`biubiustar2025vn`、`biubiustar2025zh-cn`等）
- **语言字段**: 所有核心表都包含`lang`字段用于多语言数据分离

---

## 🎯 开发任务分解

### 阶段一：数据库设计与扩展（优先级：P0｜状态：已完成）

#### 1.1 扩展用户表结构
- 状态：已完成
- 参考：`database/社交媒体平台数据库创建脚本.sql`（第一部分：fa_user 字段与索引）、`database/social_tables_simple.sql`
- 完成报告：`docs/项目管理/阶段一数据库创建完成报告.md`

#### 1.2 新建社交媒体核心表

##### 1.2.1 社交关系表（状态：已完成）
- 表：`fa_social_follows`
- 参考：`database/social_tables_simple.sql`

##### 1.2.2 帖子互动表（状态：已完成）
- 表：`fa_social_post_likes`
- 参考：`database/social_tables_simple.sql`

##### 1.2.3 评论系统表（状态：已完成）
- 表：`fa_social_comments`
- 参考：`database/social_tables_simple.sql`

##### 1.2.4 通知系统表（状态：已完成）
- 表：`fa_social_notifications`
- 参考：`database/social_tables_simple.sql`

#### 1.3 扩展LDCMS模型系统

##### 1.3.1 创建社交媒体内容模型（状态：已完成）
- 模型：`social_posts`、`activities`、`topics`（已注册）
- 参考：`database/create_social_tables.sql`、`database/social_tables_simple.sql`
- 完成报告：`docs/项目管理/阶段一数据库创建完成报告.md`

##### 1.3.2 社交帖子扩展表（状态：已完成）
- 表：`fa_ldcms_document_social_posts`
- 参考：`database/create_social_tables.sql`、`database/social_tables_simple.sql`
- 完成报告：`docs/项目管理/阶段一数据库创建完成报告.md`

##### 1.3.3 活动信息扩展表（状态：已完成）
- 表：`fa_ldcms_document_activities`
- 参考：`database/create_social_tables.sql`、`database/social_tables_simple.sql`
- 完成报告：`docs/项目管理/阶段一数据库创建完成报告.md`

---

### 阶段二：后台模型管理开发（优先级：P0｜状态：进行中）

#### 2.0 数据库校验结果（MCP）
- `fa_ldcms_document_social_posts`、`fa_ldcms_document_activities`：已存在，结构完整（含 `document_id`、`post_type`/`activity_status` 等字段）
- `fa_ldcms_models`：包含 `social_posts`、`activities`、`topics`
- `fa_social_follows`、`fa_social_post_likes`、`fa_social_comments`、`fa_social_notifications`、`fa_social_activity_participants`：已存在
- `fa_user`：已存在扩展字段（`followers_count`、`following_count`、`posts_count`、`likes_received`、`is_verified`、`cover_image`、`social_links`）

#### 2.x 阶段二详细执行说明（含 FastAdmin CRUD 命令）

1) 生成「社交帖子」后台模块（与文档表建立从属关系）

```bash
php think crud \
  -t fa_ldcms_document_social_posts \
  -c ldcms/SocialPosts \
  -m ldcms/SocialPosts \
  -r ldcms_document \
  -o belongsto \
  -k document_id \
  -p id \
  -s title,lang,status \
  -u 1
```

2) 生成「活动信息」后台模块（与文档表建立从属关系）

```bash
php think crud \
  -t fa_ldcms_document_activities \
  -c ldcms/Activities \
  -m ldcms/Activities \
  -r ldcms_document \
  -o belongsto \
  -k document_id \
  -p id \
  -s title,lang,status \
  -u 1
```

3) 生成「社交管理」系列模块（可选，便于运营与风控）

```bash
# 关注关系
php think crud -t fa_social_follows -c social/Follows -m social/Follows -u 1

# 点赞记录
php think crud -t fa_social_post_likes -c social/PostLikes -m social/PostLikes -u 1

# 评论管理
php think crud -t fa_social_comments -c social/Comments -m social/Comments -u 1

# 通知管理
php think crud -t fa_social_notifications -c social/Notifications -m social/Notifications -u 1

# 活动参与
php think crud -t fa_social_activity_participants -c social/ActivityParticipants -m social/ActivityParticipants -u 1
```

说明：以上命令已满足一键生成控制器/模型/校验器/视图/JS/语言包并自动创建后台菜单（`-u 1`）。如需重建请增加 `-f 1` 强制覆盖；如需删除已生成文件，可追加 `-d 1 -f 1`。

4) 前台会员新增字段的操作（无DB变更，仅前台表单与保存）

- 目的：让会员在个人中心配置新字段（`cover_image`、`social_links`）
- 操作：
  - 在 `application/index/view/user/profile.html` 增加上传封面图与社交链接（JSON/多行）输入项
  - 在 `application/index/controller/User.php` 的资料更新逻辑中，允许接收并保存 `cover_image`、`social_links`
  - 校验与安全：限制图片类型/大小；`social_links` 建议做 JSON 校验与字段白名单
  - 影响：仅前端交互与显示，数据库在阶段一已扩展完成，无需再次改动

5) 菜单的一键生成（推荐在 CRUD 后补跑一次）

```bash
# 单控制器生成权限菜单
php think menu -c ldcms/SocialPosts -f 1
php think menu -c ldcms/Activities -f 1

# 可选：批量生成社交管理类菜单
php think menu -c social/Follows -c social/PostLikes -c social/Comments -c social/Notifications -c social/ActivityParticipants -f 1
```

6) 审核要求与落地（前台发帖 → 后台审核）

- 策略：前台会员发布的文档（模型：`social_posts`）统一写入 `fa_ldcms_document.status = 0`（隐藏/待审核），仅当管理员审核后改为 `1`（正常）
- 后台操作入口：`内容管理 → ldcms/document`（选择模型“社交帖子”），使用“更多 → 设为正常/设为隐藏”完成审核流
- 前台入口（阶段四实现）：发布接口在保存文档主表时强制 `status=0`；扩展表 `fa_ldcms_document_social_posts` 同步写入。该约定使审核流程即插即用，无需额外DB变更

#### 2.1 扩展LDCMS后台管理
当前：通过通用 `ldcms/document` 模块管理 `social_posts` 扩展数据；专用控制器 `ldcms/SocialPosts.php`、`ldcms/Activities.php` 尚未创建。

##### 2.1.1 社交内容管理模块
- **路径**: `/application/admin/controller/ldcms/SocialPosts.php`
- **功能**:
  - 帖子内容审核（通过/拒绝/要求修改）
  - 批量审核功能
  - 帖子置顶/推荐功能
  - 敏感词过滤设置
  - 用户举报处理

##### 2.1.2 活动管理模块
- **路径**: `/application/admin/controller/ldcms/Activities.php`
- **功能**:
  - 活动信息发布管理
  - 活动状态管理（进行中/即将开始/已结束）
  - 参与用户统计
  - 活动数据分析

##### 2.1.3 用户社交管理模块
- **路径**: `/application/admin/controller/social/Users.php`
- **功能**:
  - 用户社交数据统计
  - 违规用户处理
  - 用户认证管理
  - 关注关系监控

#### 2.2 多语言模板页面开发

##### 2.2.1 后台管理界面多语言（状态：未开始）
- **中文简体**: `/application/admin/lang/zh-cn/social/`
- **中文繁体**: `/application/admin/lang/zh-tw/social/`
- **英语**: `/application/admin/lang/en/social/`
- **越南语**: `/application/admin/lang/vi-vn/social/`

##### 2.2.2 后台视图模板
- **社交内容管理**: `/application/admin/view/ldcms/social_posts/`
- **活动管理**: `/application/admin/view/ldcms/activities/`
- **用户管理**: `/application/admin/view/social/users/`

---

### 阶段三：栏目管理配置（优先级：P1｜状态：未开始）

#### 3.1 配置社交媒体栏目结构

##### 3.1.1 栏目层级设计
```
社交媒体平台
├── 首页 (homepage)
│   ├── 热门内容区
│   ├── 推荐用户区
│   └── 活动推荐区
├── 热门 (hot)
│   ├── 热门帖子
│   ├── 热门话题
│   └── 热门用户
├── 活动 (activities)
│   ├── 进行中活动
│   ├── 即将开始
│   └── 已结束活动
├── 联系合作 (contact) - 复用现有LDCMS自定义表单
└── 关于公司 (about) - 复用现有企业介绍页面
```

##### 3.1.2 栏目配置SQL
```sql
-- 为4种语言分别创建栏目结构
INSERT INTO `fa_ldcms_category` (`name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `lang`, `type`, `status`, `is_nav`) VALUES
-- 越南语栏目
('Trang chủ', 'Homepage', 0, 2, 'trang-chu', 'index.html', '', 'vi-vn', 0, 1, 1),
('Phổ biến', 'Hot Content', 0, 2, 'pho-bien', 'hot.html', 'detail.html', 'vi-vn', 0, 1, 1),
('Hoạt động', 'Activities', 0, 3, 'hoat-dong', 'activities.html', 'activity_detail.html', 'vi-vn', 0, 1, 1),
('Liên hệ hợp tác', 'Contact', 0, 1, 'lien-he-hop-tac', 'contact.html', '', 'vi-vn', 1, 1, 1),
('Về công ty', 'About Us', 0, 1, 've-cong-ty', 'about.html', '', 'vi-vn', 1, 1, 1),

-- 英语栏目
('Home', 'Homepage', 0, 2, 'home', 'index.html', '', 'en', 0, 1, 1),
('Hot', 'Hot Content', 0, 2, 'hot', 'hot.html', 'detail.html', 'en', 0, 1, 1),
('Activities', 'Activities', 0, 3, 'activities', 'activities.html', 'activity_detail.html', 'en', 0, 1, 1),
('Contact', 'Contact', 0, 1, 'contact', 'contact.html', '', 'en', 1, 1, 1),
('About Us', 'About Us', 0, 1, 'about', 'about.html', '', 'en', 1, 1, 1),

-- 中文简体栏目
('首页', 'Homepage', 0, 2, 'shouye', 'index.html', '', 'zh-cn', 0, 1, 1),
('热门', 'Hot Content', 0, 2, 'remen', 'hot.html', 'detail.html', 'zh-cn', 0, 1, 1),
('活动', 'Activities', 0, 3, 'huodong', 'activities.html', 'activity_detail.html', 'zh-cn', 0, 1, 1),
('联系合作', 'Contact', 0, 1, 'lianxi', 'contact.html', '', 'zh-cn', 1, 1, 1),
('关于公司', 'About Us', 0, 1, 'guanyu', 'about.html', '', 'zh-cn', 1, 1, 1),

-- 中文繁体栏目
('首頁', 'Homepage', 0, 2, 'shouye', 'index.html', '', 'zh-tw', 0, 1, 1),
('熱門', 'Hot Content', 0, 2, 'remen', 'hot.html', 'detail.html', 'zh-tw', 0, 1, 1),
('活動', 'Activities', 0, 3, 'huodong', 'activities.html', 'activity_detail.html', 'zh-tw', 0, 1, 1),
('聯繫合作', 'Contact', 0, 1, 'lianxi', 'contact.html', '', 'zh-tw', 1, 1, 1),
('關於公司', 'About Us', 0, 1, 'guanyu', 'about.html', '', 'zh-tw', 1, 1, 1);
```

---

### 阶段四：前台功能开发（优先级：P1｜状态：未开始）

#### 4.1 前台控制器开发

##### 4.1.1 社交媒体主控制器
- **路径**: `/application/index/controller/Social.php`
- **功能**:
  - 首页内容展示
  - 热门内容筛选
  - 用户动态流
  - AJAX接口支持

##### 4.1.2 用户个人中心扩展
- **路径**: 扩展现有 `/application/index/controller/User.php`
- **新增功能**:
  - 社交数据展示（粉丝/关注/帖子数）
  - 发布内容管理
  - 社交互动记录
  - 隐私设置

##### 4.1.3 API接口开发
- **路径**: `/application/api/controller/Social.php`
- **功能**:
  - RESTful API接口
  - 移动端支持
  - 实时通知推送
  - 数据统计接口

#### 4.2 前台视图模板开发

##### 4.2.1 模板目录结构
```
/addons/ldcms/view/biubiustar2025vn/    (越南语模板)
├── index.html                          (首页)
├── hot.html                           (热门页面)
├── activities.html                    (活动列表)
├── activity_detail.html               (活动详情)
├── post_detail.html                   (帖子详情)
├── user_profile.html                  (用户资料页)
└── layout/
    ├── header.html                    (页头导航)
    ├── footer.html                    (页脚)
    └── sidebar.html                   (侧边栏)
```

##### 4.2.2 响应式设计规范
- **桌面端** (1200px+): 完整功能展示
- **平板端** (768px-1199px): 适配式布局
- **移动端** (<768px): 移动优先设计

---

### 阶段五：UI/UX设计实现（优先级：P1｜状态：未开始）

#### 5.1 简洁大气毛玻璃风格

##### 5.1.1 CSS样式框架
- **主色调**: 紫色系 (#8B5CF6, #A855F7, #C084FC)
- **毛玻璃效果**: `backdrop-filter: blur(10px)`
- **半透明背景**: `rgba(255, 255, 255, 0.1-0.3)`
- **统一圆角**: 8px

##### 5.1.2 组件设计规范
- **导航栏**: 毛玻璃效果，半透明紫色调
- **卡片容器**: 统一间距，1px极细边框
- **按钮设计**: 主要按钮毛玻璃+紫色，次要按钮简洁边框
- **弹窗设计**: 大尺寸，毛玻璃背景模糊

#### 5.2 用户认证弹窗系统

##### 5.2.1 弹窗组件开发
- **注册弹窗**: 模态弹窗，响应式设计
- **登录弹窗**: 支持用户名/邮箱登录
- **忘记密码**: 邮件重置流程
- **关闭方式**: ESC键、点击遮罩、关闭按钮

---

### 阶段六：社交功能实现（优先级：P2｜状态：未开始）

#### 6.1 核心社交功能

##### 6.1.1 点赞系统
- **点赞机制**: 一键点赞/取消点赞
- **实时统计**: 点赞数量实时更新
- **防刷机制**: IP限制+用户限制
- **点赞历史**: 用户点赞记录

##### 6.1.2 评论系统
- **多级评论**: 支持3级评论嵌套
- **@用户功能**: 评论中@其他用户
- **实时通知**: 评论通知推送
- **敏感词过滤**: 自动过滤敏感内容

##### 6.1.3 关注系统
- **用户关注**: 关注/取消关注
- **关注动态**: 关注用户的动态流
- **关注推荐**: 基于兴趣推荐用户
- **关注统计**: 粉丝/关注数统计

#### 6.2 内容管理功能

##### 6.2.1 发布系统
- **富文本编辑**: 支持文字、图片、视频
- **多媒体上传**: 图片批量上传，视频上传
- **标签系统**: 话题标签，内容分类
- **隐私控制**: 公开/粉丝可见/私密

##### 6.2.2 内容审核
- **自动审核**: 敏感词自动过滤
- **人工审核**: 后台人工审核机制
- **用户举报**: 举报功能和处理流程
- **内容标记**: 违规内容标记和处理

---

### 阶段七：高级功能开发（优先级：P3｜状态：未开始）

#### 7.1 活动管理系统

##### 7.1.1 活动发布
- **活动创建**: 活动信息完整填写
- **时间管理**: 开始/结束时间设置
- **参与管理**: 报名/签到功能
- **活动推广**: 活动推荐和分享

##### 7.1.2 活动数据
- **参与统计**: 参与人数和数据分析
- **效果评估**: 活动效果数据报告
- **反馈收集**: 活动反馈和改进建议

#### 7.2 推荐算法

##### 7.2.1 内容推荐
- **热门算法**: 基于互动量的热门内容
- **个性化推荐**: 基于用户行为的推荐
- **时间权重**: 新鲜度权重算法
- **多样性保证**: 避免内容同质化

##### 7.2.2 用户推荐
- **共同关注**: 基于共同关注的推荐
- **兴趣匹配**: 基于标签和行为的匹配
- **地理位置**: 基于位置的推荐
- **活跃度权重**: 活跃用户优先推荐

---

### 阶段八：性能优化与安全（优先级：P2｜状态：未开始）

#### 8.1 性能优化

##### 8.1.1 数据库优化
- **索引优化**: 关键查询字段索引
- **分页优化**: 大数据量分页处理
- **缓存策略**: Redis缓存热门数据
- **查询优化**: SQL查询语句优化

##### 8.1.2 前端优化
- **图片优化**: 图片压缩和CDN加速
- **JS/CSS压缩**: 资源文件压缩
- **懒加载**: 图片和内容懒加载
- **PWA支持**: 渐进式Web应用

#### 8.2 安全防护

##### 8.2.1 数据安全
- **SQL注入防护**: 参数化查询
- **XSS防护**: 输入内容过滤
- **CSRF防护**: Token验证
- **文件上传安全**: 文件类型和大小限制

##### 8.2.2 用户安全
- **密码安全**: 密码强度要求
- **登录保护**: 登录频率限制
- **隐私保护**: 用户数据隐私控制
- **举报机制**: 违规内容举报和处理

---

## 📅 开发时间规划

### 第一周：数据库设计与基础架构
- [x] 扩展用户表结构
- [x] 创建社交媒体核心表
- [x] 配置LDCMS模型系统
- [x] 数据库测试和优化（基础索引与触发器）

### 第二周：后台管理系统开发
- [ ] 社交内容管理模块
- [ ] 活动管理模块
- [ ] 用户社交管理模块
- [ ] 后台多语言界面

### 第三周：栏目配置与前台控制器
- [ ] 配置4语言栏目结构
- [ ] 开发前台控制器
- [ ] API接口开发
- [ ] 用户个人中心扩展

### 第四周：前台模板与UI实现
- [ ] 4语言模板开发
- [ ] 毛玻璃UI风格实现
- [ ] 响应式设计适配
- [ ] 用户认证弹窗系统

### 第五周：核心社交功能
- [ ] 点赞系统开发
- [ ] 评论系统开发
- [ ] 关注系统开发
- [ ] 内容发布系统

### 第六周：高级功能与优化
- [ ] 活动管理系统
- [ ] 推荐算法实现
- [ ] 性能优化
- [ ] 安全防护加强

---

## 🔧 技术实现要点

### 1. 复用现有架构
- **用户系统**: 直接扩展现有`fa_user`表，保持兼容性
- **LDCMS模型**: 利用LDCMS的模型管理系统创建社交内容模型
- **多语言支持**: 复用现有多语言基础设施
- **权限系统**: 基于现有FastAdmin权限系统扩展

### 2. 数据库设计原则
- **表前缀统一**: 使用`fa_`前缀保持一致性
- **字段命名规范**: 遵循现有项目命名约定
- **索引优化**: 为高频查询字段添加索引
- **外键关联**: 合理设计表关联关系

### 3. 代码组织结构
- **MVC分层**: 严格遵循ThinkPHP 5.1 MVC架构
- **代码复用**: 抽象公共功能为traits或公共类
- **注释规范**: 完善的中文注释和文档
- **错误处理**: 统一的异常处理机制

### 4. 前端开发规范
- **模板继承**: 利用LDCMS模板继承机制
- **组件化**: 公共组件抽象和复用
- **响应式设计**: Bootstrap框架基础上的响应式适配
- **性能优化**: 图片懒加载、JS异步加载

---

## ✅ 验收标准

### 功能验收
- [ ] 用户可以正常注册登录（复用现有系统）
- [ ] 用户可以发布图文视频内容
- [ ] 用户可以点赞、评论、关注其他用户
- [ ] 后台可以管理内容审核和用户管理
- [ ] 4种语言界面正常切换显示
- [ ] 响应式设计在各设备正常显示

### 性能验收
- [ ] 页面加载时间 < 3秒
- [ ] 数据库查询优化，无慢查询
- [ ] 支持1000+并发用户访问
- [ ] 图片视频上传和显示正常

### 安全验收
- [ ] 通过SQL注入、XSS等安全测试
- [ ] 用户数据隐私保护到位
- [ ] 文件上传安全检查
- [ ] 用户权限控制正确

---

## 📝 开发注意事项

1. **保持兼容性**: 确保新功能不影响现有企业网站功能
2. **数据备份**: 开发过程中定期备份数据库
3. **分支管理**: 使用Git分支管理不同功能模块开发
4. **测试驱动**: 每个功能模块完成后进行充分测试
5. **文档更新**: 及时更新API文档和使用手册
6. **性能监控**: 开发过程中持续关注性能指标
7. **用户体验**: 始终从用户角度考虑功能设计
8. **安全优先**: 每个功能都要考虑安全因素

---

> **总结**: 本开发清单基于现有FastAdmin + LDCMS架构，充分复用已有的用户系统、多语言支持和内容管理功能，通过扩展数据库表结构和LDCMS模型系统，实现社交媒体平台的核心功能。开发过程中注重代码复用、性能优化和安全防护，确保项目稳定可靠运行。