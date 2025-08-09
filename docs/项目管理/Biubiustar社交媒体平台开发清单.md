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
- ✅ **阶段一已完成**：数据库扩展（fa_user社交字段、fa_social_*核心表、fa_ldcms_document_social_posts/activities）、LDCMS模型注册（social_posts、activities、topics）
- 🎯 **准备阶段二**：FastAdmin CRUD生成（专用后台模块）、后台管理体验优化、中文化菜单系统
- 📋 **后续待开始**：栏目配置、前台控制器与API、UI/UX设计、社交互动功能、推荐算法

## 📊 项目现状分析

### ✅ 已有基础设施

#### 1. 用户系统（已扩展完成）
- **表结构**: `fa_user` 表包含完整用户信息（id、username、nickname、email、avatar等）
- **社交扩展字段**: `followers_count`、`following_count`、`posts_count`、`likes_received`、`is_verified`、`cover_image`、`social_links`
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

##### 1.4 字段类型合规审计（MCP × FastAdmin 指南）
- 参考：`https://doc.fastadmin.net/doc/database.html#toc-2`
- 审计范围：阶段一新增/扩展相关表

- 结论与建议：
  - `fa_user`（扩展字段）：
    - 计数字段：`followers_count`、`following_count`、`posts_count`、`likes_received` → int unsigned（合规）
    - 状态字段：`is_verified` → tinyint unsigned（合规）
    - 媒体/配置：`cover_image` varchar(255)（合规）、`social_links` text（合规，建议保存前做 JSON 校验）
    - 时间字段：核心表自带 `createtime/updatetime`（bigint），与 FastAdmin 兼容（建议模型中开启时间映射）
  - `fa_social_follows`：`status` tinyint unsigned、时间 bigint（合规）
  - `fa_social_post_likes`：`post_type` varchar(20) 默认 'post'（可选优化：改为 ENUM('post','comment','activity') 以避免非法值）
  - `fa_social_comments`：`post_type` varchar(20)（可选优化：改为 ENUM('post','activity')；如未来支持更多类型，可保留 varchar）
  - `fa_social_notifications`：`type` varchar(50)（可选优化：如类型集合固定，改为 ENUM('follow','like','comment','reply','mention','system','activity')；考虑可扩展性可维持 varchar）
  - `fa_ldcms_document_social_posts`：`post_type`、`privacy_level` 已为 ENUM（合规）
  - `fa_ldcms_document_activities`：`activity_type`、`activity_status` 为 varchar（可选优化：改为 ENUM('event','meetup','workshop','competition') 与 ENUM('draft','published','ongoing','completed','cancelled')）

- 非破坏性 DDL（仅当需收紧取值范围时执行）：
  ```sql
  -- 点赞/评论的内容类型收紧
  ALTER TABLE `fa_social_post_likes`
    MODIFY COLUMN `post_type` ENUM('post','comment','activity') DEFAULT 'post' COMMENT '内容类型';
  ALTER TABLE `fa_social_comments`
    MODIFY COLUMN `post_type` ENUM('post','activity') DEFAULT 'post' COMMENT '内容类型';

  -- 通知类型（如希望强约束）
  ALTER TABLE `fa_social_notifications`
    MODIFY COLUMN `type` ENUM('follow','like','comment','reply','mention','system','activity') NOT NULL COMMENT '通知类型';

  -- 活动类型/状态（如希望强约束）
  ALTER TABLE `fa_ldcms_document_activities`
    MODIFY COLUMN `activity_type` ENUM('event','meetup','workshop','competition') DEFAULT 'event' COMMENT '活动类型',
    MODIFY COLUMN `activity_status` ENUM('draft','published','ongoing','completed','cancelled') DEFAULT 'draft' COMMENT '活动状态';
  ```

- 时间字段与 FastAdmin 映射（模型层）：
  ```php
  protected $autoWriteTimestamp = 'integer';
  protected $createTime = 'create_time';
  protected $updateTime = 'update_time';
  protected $deleteTime = 'delete_time';
  ```

---

### 阶段二：后台模型管理开发（优先级：P0｜状态：准备开始）

#### 2.0 数据库最新状态确认（2024-12-20检查）

##### ✅ 阶段一完成情况验证
- **LDCMS扩展表**：
  - `fa_ldcms_document_social_posts` ✅ 已创建，含document_id、post_type(ENUM)、privacy_level(ENUM)等18个字段
  - `fa_ldcms_document_activities` ✅ 已创建，含document_id、activity_type(ENUM)、activity_status(ENUM)等26个字段
- **LDCMS模型注册**：
  - `social_posts` (ID:14, 名称:"社交帖子", 状态:启用) ✅
  - `activities` (ID:15, 名称:"活动信息", 状态:启用) ✅ 
  - `topics` (ID:16, 名称:"热门话题", 状态:启用) ✅
- **社交媒体核心表**：
  - `fa_social_follows` ✅ (关注关系)
  - `fa_social_post_likes` ✅ (点赞记录)
  - `fa_social_comments` ✅ (评论系统)
  - `fa_social_notifications` ✅ (通知系统)
  - `fa_social_activity_participants` ✅ (活动参与)
  - `fa_social_topics` ✅ (话题管理)
- **用户表扩展**：
  - `fa_user` ✅ 已完成社交字段扩展：`followers_count`、`following_count`、`posts_count`、`likes_received`、`is_verified`、`cover_image`、`social_links`

##### 🎯 FastAdmin CRUD兼容性检查
- **主键设计** ✅ 所有表使用 `id` int unsigned auto_increment
- **时间字段** ✅ 使用 `create_time`、`update_time` bigint（需要模型映射配置）
- **状态字段** ✅ 使用 `status` tinyint unsigned 和 ENUM类型
- **索引设置** ✅ 关键字段已建立索引（document_id UNIQUE、外键索引等）
- **字段命名** ✅ 符合FastAdmin规范（无特殊字符、合理长度）

#### 2.1 FastAdmin CRUD一键生成（优化后台管理体验）

##### 🎯 生成策略：分层管理，优化体验
- **核心层**：LDCMS扩展表（社交帖子、活动信息）- 与文档表关联，支持审核流程
- **管理层**：社交关系表（关注、点赞、评论等）- 独立管理，便于运营监控
- **配置层**：话题管理、通知设置 - 系统级别的配置管理

##### 📋 第一步：生成LDCMS扩展模块（核心功能）

**社交帖子扩展管理**
```bash
php think crud \
  -t fa_ldcms_document_social_posts \
  -c ldcms/SocialPosts \
  -m ldcms/SocialPosts \
  --relation=ldcms_document:document_id:id \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

**活动信息扩展管理**
```bash
php think crud \
  -t fa_ldcms_document_activities \
  -c ldcms/Activities \
  -m ldcms/Activities \
  --relation=ldcms_document:document_id:id \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

##### 📋 第二步：生成社交关系管理模块（运营监控）

**关注关系管理**
```bash
php think crud \
  -t fa_social_follows \
  -c social/Follows \
  -m social/Follows \
  --relation=user:follower_id:id,user:following_id:id \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

**点赞记录管理**
```bash
php think crud \
  -t fa_social_post_likes \
  -c social/PostLikes \
  -m social/PostLikes \
  --relation=user:user_id:id \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

**评论系统管理**
```bash
php think crud \
  -t fa_social_comments \
  -c social/Comments \
  -m social/Comments \
  --relation=user:user_id:id \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

**通知系统管理**
```bash
php think crud \
  -t fa_social_notifications \
  -c social/Notifications \
  -m social/Notifications \
  --relation=user:user_id:id \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

**活动参与管理**
```bash
php think crud \
  -t fa_social_activity_participants \
  -c social/ActivityParticipants \
  -m social/ActivityParticipants \
  --relation=user:user_id:id \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

**话题管理**
```bash
php think crud \
  -t fa_social_topics \
  -c social/Topics \
  -m social/Topics \
  --fields="id,create_time,update_time" \
  --force=1 \
  --menu=1
```

**命令参数说明：**
- `--relation`: 建立关联关系，支持数据关联查询和显示
- `--fields`: 排除不必要的字段（如id、时间字段）避免在表单中显示
- `--force=1`: 强制覆盖已存在的文件
- `--menu=1`: 自动生成后台菜单和权限规则

##### 📋 第三步：后台管理体验优化（重要）

**2.2 菜单中文化与层次化组织**

执行CRUD生成后，需要优化菜单结构和中文化：

```bash
# 重新生成菜单（支持中文标题）
php think menu -c ldcms/SocialPosts -e 1 -f 1
php think menu -c ldcms/Activities -e 1 -f 1
php think menu -c social/Follows -e 1 -f 1
php think menu -c social/PostLikes -e 1 -f 1
php think menu -c social/Comments -e 1 -f 1
php think menu -c social/Notifications -e 1 -f 1
php think menu -c social/ActivityParticipants -e 1 -f 1
php think menu -c social/Topics -e 1 -f 1
```

**控制器注释规范（确保中文菜单）：**
```php
/**
 * 社交帖子扩展管理
 * @icon fa fa-comments
 * @remark 管理用户发布的社交帖子扩展信息，支持审核与推荐
 */
class SocialPosts extends Backend
{
    /** 查看列表 */
    public function index() { ... }
    
    /** 添加帖子 */
    public function add() { ... }
    
    /** 编辑帖子 */
    public function edit($ids = null) { ... }
    
    /** 删除帖子 */
    public function del($ids = "") { ... }
    
    /** 批量操作 */
    public function multi($ids = "") { ... }
}
```

**建议菜单结构：**
```
🏢 系统管理
├── 管理员管理
├── 权限管理
└── 系统配置

📰 内容管理 (LDCMS)
├── 栏目管理
├── 文档管理
├── 📱 社交帖子管理    <- 新增
├── 🎭 活动信息管理    <- 新增
└── 广告管理

👥 社交管理          <- 新增分组
├── 👫 关注关系管理
├── ❤️ 点赞记录管理
├── 💬 评论系统管理
├── 🔔 通知系统管理
├── 🎯 活动参与管理
└── 🏷️ 话题管理

👤 用户管理
├── 用户管理
├── 用户组管理
└── 权限规则
```

**2.3 UI/UX体验优化配置**

**表格显示优化：**
```javascript
// 社交帖子列表优化配置
{field: 'id', title: 'ID', width: 80, sortable: true},
{field: 'document.title', title: '帖子标题', operate: 'LIKE', formatter: function(value, row) {
    return '<a href="javascript:;" class="btn-detail" data-id="' + row.document_id + '">' + value + '</a>';
}},
{field: 'post_type', title: '类型', searchList: {"text":"文字","image":"图片","video":"视频","mixed":"混合"}, 
 formatter: Table.api.formatter.normal},
{field: 'privacy_level', title: '隐私级别', searchList: {"public":"公开","followers":"粉丝可见","private":"私密"}, 
 formatter: Table.api.formatter.label},
{field: 'document.user.nickname', title: '发布者', operate: 'LIKE'},
{field: 'is_featured', title: '推荐', searchList: {"0":"否","1":"是"}, 
 formatter: Table.api.formatter.toggle, table: table, events: Table.api.events.toggle},
{field: 'document.status', title: '状态', searchList: {"0":"待审核","1":"正常","2":"隐藏"}, 
 formatter: Table.api.formatter.status},
{field: 'create_time', title: '创建时间', operate:'RANGE', addclass:'datetimerange', 
 formatter: Table.api.formatter.datetime, width: 160}
```

**表单字段优化：**
```html
<!-- 社交帖子编辑表单优化 -->
<div class="form-group">
    <label class="control-label col-xs-12 col-sm-2">帖子类型:</label>
    <div class="col-xs-12 col-sm-8">
        <select class="form-control selectpicker" name="row[post_type]" data-rule="required">
            <option value="text">📝 纯文字</option>
            <option value="image">🖼️ 图片</option>
            <option value="video">🎬 视频</option>
            <option value="mixed">🎨 图文混合</option>
        </select>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-xs-12 col-sm-2">媒体文件:</label>
    <div class="col-xs-12 col-sm-8">
        <div class="input-group">
            <input class="form-control" name="row[media_files]" type="text" placeholder="支持多个文件，用逗号分隔">
            <div class="input-group-addon no-border no-padding">
                <button type="button" class="btn btn-danger plupload" data-multiple="true" 
                        data-mimetype="image/*,video/*"><i class="fa fa-upload"></i> 选择文件</button>
            </div>
        </div>
    </div>
</div>
```

**2.4 模型时间字段映射配置**

生成的模型需要手动配置时间字段映射：

```php
// application/admin/model/ldcms/SocialPosts.php
<?php
namespace app\admin\model\ldcms;

use think\Model;

class SocialPosts extends Model
{
    // 表名
    protected $name = 'ldcms_document_social_posts';
    
    // 自动写入时间戳字段  
    protected $autoWriteTimestamp = 'integer';
    
    // 定义时间戳字段名（重要：适配现有bigint字段）
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
    
    // 关联LDCMS文档表
    public function document()
    {
        return $this->belongsTo('app\\admin\\model\\ldcms\\Document', 'document_id', 'id')
                    ->with(['user']);  // 预加载用户信息
    }
    
    // 获取帖子类型列表
    public function getPostTypeList()
    {
        return [
            'text' => '纯文字',
            'image' => '图片', 
            'video' => '视频',
            'mixed' => '图文混合'
        ];
    }
    
    // 获取隐私级别列表  
    public function getPrivacyLevelList()
    {
        return [
            'public' => '公开',
            'followers' => '粉丝可见',
            'private' => '私密'
        ];
    }
}
```

**2.5 前台会员新增字段接入（扩展个人中心）**
- **目的**：让会员在个人中心配置新字段（`cover_image`、`social_links`）
- **操作要点**：
  - 在 `application/index/view/user/profile.html` 增加上传封面图与社交链接输入项
  - 在 `application/index/controller/User.php` 的资料更新逻辑中，允许接收并保存 `cover_image`、`social_links`
  - 校验与安全：限制图片类型/大小；`social_links` 建议做 JSON 校验与字段白名单
  - 影响：仅前端交互与显示，数据库在阶段一已扩展完成，无需再次改动

**2.6 内容审核机制配置（关键业务逻辑）**

- **审核策略**：前台会员发布的社交帖子默认置为"待审核"，后台审核后才对外展示
- **技术实现**：
  - 发布入口：`/application/index/controller/Social.php`（新增发布接口），写入 `fa_ldcms_document` 与 `fa_ldcms_document_social_posts`
  - 默认状态：插入 `fa_ldcms_document.status = 0`（隐藏/待审核），`lang` 按当前站点语言，`mid` 为"社交帖子"模型 ID (14)
  - 后台审核：通过 `ldcms/SocialPosts` 或通用 `ldcms/document` 对应模型进行审核置为 `status = 1`
  - 前台展示：所有列表/详情页查询统一加 `status = 1` 条件，避免未审核内容外泄

**2.7 多语言后台界面支持**

**语言包配置**（支持4种语言）：
```php
// application/admin/lang/zh-cn/ldcms/social_posts.php
return [
    'Id' => 'ID',
    'Document_id' => '文档ID',  
    'Post_type' => '帖子类型',
    'Media_files' => '媒体文件',
    'Hashtags' => '话题标签',
    'Location' => '位置信息',
    'Privacy_level' => '隐私级别',
    'Is_featured' => '推荐状态',
    'Allow_comment' => '允许评论',
    'Allow_share' => '允许分享',
    'Share_count' => '分享次数',
    'Comment_count' => '评论数量',
    'Mood' => '心情状态',
    'Create_time' => '创建时间',
    'Update_time' => '更新时间'
];

// application/admin/lang/vi-vn/ldcms/social_posts.php  
return [
    'Id' => 'ID',
    'Post_type' => 'Loại bài viết',
    'Privacy_level' => 'Mức độ riêng tư',
    'Is_featured' => 'Trạng thái đề xuất',
    // ... 越南语翻译
];
```

**响应式设计优化**：
```css
/* 后台移动端适配 */
@media (max-width: 768px) {
    .table-responsive .btn-group {
        display: block;
        width: 100%;
        margin-bottom: 5px;
    }
    
    .form-horizontal .control-label {
        text-align: left;
        padding-bottom: 5px;
    }
    
    .box-header .box-tools {
        position: relative;
        top: auto;
        right: auto;
        margin-top: 10px;
    }
}
```

**菜单权限一键生成（CRUD后执行）：**
```bash
# 单控制器生成权限菜单
php think menu -c ldcms/SocialPosts -f 1
php think menu -c ldcms/Activities -f 1

# 社交管理类菜单
php think menu -c social/Follows -f 1
php think menu -c social/PostLikes -f 1  
php think menu -c social/Comments -f 1
php think menu -c social/Notifications -f 1
php think menu -c social/ActivityParticipants -f 1
php think menu -c social/Topics -f 1
```

**菜单权重优化**（建议在后台手动调整）：
- 社交帖子管理：权重 100
- 活动信息管理：权重 90
- 关注关系管理：权重 80
- 评论系统管理：权重 70
- 通知系统管理：权重 60
- 话题管理：权重 50

**权限分组建议**：
- **内容审核员**：仅可访问社交帖子、活动信息的查看和审核操作
- **社交运营**：可访问所有社交管理模块，但不能删除重要数据
- **系统管理员**：拥有所有权限

---

## 🎯 阶段二执行检查清单

### ✅ CRUD生成验证
- [ ] 执行7个CRUD生成命令，确认无错误
- [ ] 检查生成的控制器类注释是否包含中文标题和图标
- [ ] 验证模型文件时间字段映射配置正确
- [ ] 确认视图模板中的表单字段显示合理

### ✅ 后台界面验证  
- [ ] 登录后台查看新增菜单结构
- [ ] 测试社交帖子管理列表页面显示
- [ ] 测试活动信息管理的添加/编辑功能
- [ ] 验证关联查询是否正常工作（显示用户昵称等）

### ✅ 功能完整性验证
- [ ] 社交帖子：添加/编辑/删除/批量操作
- [ ] 活动信息：时间选择、状态切换、参与者统计
- [ ] 关注关系：查看关注列表、数据统计
- [ ] 评论管理：内容审核、批量处理
- [ ] 通知系统：类型筛选、批量标记已读

### ✅ 审核流程验证
- [ ] 前台发布的内容默认状态为待审核(status=0)
- [ ] 后台可以将待审核内容设为正常(status=1)
- [ ] 前台查询自动过滤未审核内容

### ✅ 多语言支持验证
- [ ] 后台界面语言包是否生效
- [ ] 各个语言环境下菜单显示正确
- [ ] 表单提示信息多语言化

### ✅ 响应式设计验证
- [ ] 移动端后台管理界面适配
- [ ] 表格在小屏幕下的显示效果
- [ ] 表单在平板设备上的交互体验

---

## 🎯 阶段二完成标志

当所有CRUD模块生成并配置完成后，阶段二即宣告完成。预期效果：
- ✅ 后台拥有完整的社交媒体内容管理界面
- ✅ 支持4种语言的后台管理体验
- ✅ 内容审核流程就绪，可供运营团队使用
- ✅ 为阶段三（栏目配置）和阶段四（前台开发）奠定基础

---

### 阶段三：栏目管理配置（优先级：P1｜状态：等待阶段二完成）

> **状态更新**: 阶段二完成后即可开始

#### 3.1 配置社交媒体栏目结构（多语言）

基于现有数据库验证，栏目配置已具备完整基础：
- ✅ `fa_ldcms_category` 表支持多语言栏目 
- ✅ 模型 ID 确认：social_posts(14)、activities(15)、topics(16)
- ✅ 多语言支持：vi-vn(默认)、en、zh-cn、zh-tw

#### 3.2 栏目层级设计与SQL脚本

**栏目结构：**
```
社交媒体平台 (Biubiustar Social Platform)
├── 首页动态 (home_feed) - 关联 social_posts 模型
├── 热门内容 (trending) - 关联 social_posts 模型  
├── 活动中心 (activities) - 关联 activities 模型
├── 话题广场 (topics) - 关联 topics 模型
├── 联系合作 (contact) - 复用现有 diyform
└── 关于公司 (about) - 复用现有页面模型
```

**一键栏目创建脚本**：
```sql
-- 4语言栏目批量创建（确保模型ID正确：14=social_posts, 15=activities, 16=topics）
INSERT INTO `fa_ldcms_category` (`name`, `ename`, `pid`, `mid`, `urlname`, `template_list`, `template_detail`, `lang`, `type`, `status`, `is_nav`, `weigh`) VALUES
-- 越南语栏目 (默认语言)
('Trang động', 'Home Feed', 0, 14, 'trang-dong', 'social_feed.html', 'social_detail.html', 'vi-vn', 0, 1, 1, 100),
('Xu hướng', 'Trending', 0, 14, 'xu-huong', 'trending.html', 'social_detail.html', 'vi-vn', 0, 1, 1, 90),
('Trung tâm sự kiện', 'Activities', 0, 15, 'su-kien', 'activities.html', 'activity_detail.html', 'vi-vn', 0, 1, 1, 80),
('Quảng trường chủ đề', 'Topics', 0, 16, 'chu-de', 'topics.html', 'topic_detail.html', 'vi-vn', 0, 1, 1, 70),
-- 英语栏目
('Home Feed', 'Home Feed', 0, 14, 'home-feed', 'social_feed.html', 'social_detail.html', 'en', 0, 1, 1, 100),
('Trending', 'Trending', 0, 14, 'trending', 'trending.html', 'social_detail.html', 'en', 0, 1, 1, 90),
('Activities Center', 'Activities', 0, 15, 'activities', 'activities.html', 'activity_detail.html', 'en', 0, 1, 1, 80),
('Topics Square', 'Topics', 0, 16, 'topics', 'topics.html', 'topic_detail.html', 'en', 0, 1, 1, 70),
-- 中文简体栏目
('首页动态', 'Home Feed', 0, 14, 'dongtai', 'social_feed.html', 'social_detail.html', 'zh-cn', 0, 1, 1, 100),
('热门内容', 'Trending', 0, 14, 'remen', 'trending.html', 'social_detail.html', 'zh-cn', 0, 1, 1, 90),
('活动中心', 'Activities', 0, 15, 'huodong', 'activities.html', 'activity_detail.html', 'zh-cn', 0, 1, 1, 80),
('话题广场', 'Topics', 0, 16, 'huati', 'topics.html', 'topic_detail.html', 'zh-cn', 0, 1, 1, 70),
-- 中文繁体栏目  
('首頁動態', 'Home Feed', 0, 14, 'dongtai', 'social_feed.html', 'social_detail.html', 'zh-tw', 0, 1, 1, 100),
('熱門內容', 'Trending', 0, 14, 'remen', 'trending.html', 'social_detail.html', 'zh-tw', 0, 1, 1, 90),
('活動中心', 'Activities', 0, 15, 'huodong', 'activities.html', 'activity_detail.html', 'zh-tw', 0, 1, 1, 80),
('話題廣場', 'Topics', 0, 16, 'huati', 'topics.html', 'topic_detail.html', 'zh-tw', 0, 1, 1, 70);
```

### 阶段四：前台功能开发（优先级：P1｜状态：等待阶段三完成）

> **依赖**: 阶段二（后台管理）+ 阶段三（栏目配置）

#### 4.1 前台控制器开发路线图

**核心控制器**：
- `/application/index/controller/Social.php` - 社交主控制器
- `/application/index/controller/Activity.php` - 活动控制器  
- `/application/index/controller/Topic.php` - 话题控制器
- 扩展 `/application/index/controller/User.php` - 个人中心社交功能

**API接口支持**：
- `/application/api/controller/Social.php` - RESTful API
- 移动端支持与实时通知推送

#### 4.2 前台模板开发（毛玻璃UI风格）

**模板目录结构**：
```
/addons/ldcms/view/biubiustar2025vn/    (越南语主模板)
├── social_feed.html                     (首页动态流)
├── trending.html                        (热门内容)  
├── activities.html                      (活动列表)
├── activity_detail.html                 (活动详情)
├── social_detail.html                   (帖子详情)
├── topics.html                          (话题广场)
├── topic_detail.html                    (话题详情)
├── user_profile.html                    (用户主页)
└── layout/
    ├── social_header.html               (社交导航)
    ├── social_sidebar.html              (社交侧边栏)
    └── social_footer.html               (社交页脚)
```

**多语言模板复制**：
- `biubiustar2025en/` (英语)
- `biubiustar2025zh-cn/` (中文简体)  
- `biubiustar2025zh-tw/` (中文繁体)

### 阶段五：UI/UX设计实现（优先级：P1｜状态：等待阶段四完成）

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

### 阶段六：社交功能实现（优先级：P2｜状态：等待阶段五完成）

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

### 阶段七：高级功能开发（优先级：P3｜状态：等待阶段六完成）

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

### 阶段八：性能优化与安全（优先级：P2｜状态：等待阶段七完成）

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

## 📅 开发时间规划（更新：2024-12-20）

### ✅ 第一周：数据库设计与基础架构（已完成）
- [x] 扩展用户表结构（社交字段）
- [x] 创建社交媒体核心表（7个表）
- [x] 配置LDCMS模型系统（3个模型）
- [x] 数据库测试和兼容性验证

### 🎯 第二周：后台管理系统开发（阶段二-进行中）
- [ ] 执行FastAdmin CRUD一键生成（7个模块）
- [ ] 后台界面中文化与菜单优化
- [ ] 模型关联配置与时间字段映射
- [ ] 审核流程配置与权限设置
- [ ] 多语言后台界面支持（4种语言）
- [ ] UI/UX体验优化与响应式适配

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

## 📋 最新开发状态总结（2024-12-20）

### ✅ 项目基础已完善
- **数据库架构**：✅ 完整的社交媒体数据表（用户扩展+7个核心表+LDCMS扩展表）
- **模型注册**：✅ LDCMS模型系统集成（social_posts、activities、topics）
- **多语言支持**：✅ 4种语言环境配置（vi-vn、en、zh-cn、zh-tw）
- **技术栈兼容**：✅ FastAdmin + ThinkPHP 5.1 + LDCMS v1.4.3 完美集成

### 🎯 当前关键任务（阶段二）
- **优先级**：P0（最高优先级）
- **核心目标**：建立完整的后台管理体系，为社交功能提供管理界面
- **关键特性**：
  - 一键CRUD生成（7个管理模块）
  - 中文化菜单与权限配置
  - 审核流程与内容管理
  - 响应式后台界面
  - 多语言管理支持

### 🚀 技术优势
- **架构复用**：基于成熟的FastAdmin+LDCMS架构，开发效率高
- **数据完整性**：严格遵循FastAdmin数据库规范，确保兼容性
- **管理便利性**：利用CRUD生成器快速构建管理界面
- **国际化支持**：原生多语言架构，支持全球化部署
- **审核机制**：内置内容审核流程，确保平台内容质量

### 🎖️ 下一步关键里程碑
1. **阶段二完成** → 后台管理系统可用（预计1周）
2. **阶段三启动** → 栏目配置与URL路由（预计3天）
3. **阶段四推进** → 前台功能与API开发（预计2周）
4. **阶段五实现** → 毛玻璃UI风格与用户体验（预计1周）

---

> **项目总结**: 本开发清单基于现有FastAdmin + LDCMS企业级架构，通过科学的阶段化开发和数据库扩展策略，实现了社交媒体平台的完整技术基础。当前项目已完成数据库设计阶段，正准备进入后台管理开发阶段，具备了快速推进的所有技术条件。整个架构注重代码复用、开发效率和系统稳定性，为后续的社交功能开发奠定了坚实基础。