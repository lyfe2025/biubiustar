# 📋 LDCMS功能清单开发任务计划

> **项目基础**: FastAdmin + LDCMS企业网站管理系统插件 v1.4.3  
> **项目域名**: biubiustar.local  
> **后台管理**: http://biubiustar.local/SWTvGsCQjH.php  
> **数据库**: biubiustar (fa_前缀)  
> **文档版本**: v1.0  
> **生成日期**: 2025-01-08

## 🎯 功能清单总览

基于对现有数据库结构和项目需求文档的深度分析，将所有功能按实现方式分类：

**📋 相关文档**:
- 📄 [LDCMS数据库现状分析与任务计划补充.md](./LDCMS数据库现状分析与任务计划补充.md) - 数据库详细分析与时间优化
- 📄 [联系合作表单配置指南.md](./联系合作表单配置指南.md) - 表单配置详细操作指南

**🚀 快速导航**:
- [🔧 阶段一：立即配置任务](#阶段一后台配置任务立即可执行) ⏱️ 55分钟
- [🛠️ 阶段二：功能增强开发](#阶段二功能开发增强任务) ⏱️ 6.3天  
- [🆕 阶段三：新功能开发](#阶段三新功能开发任务) ⏱️ 6天
- [🎨 阶段四：UI主题定制](#阶段四ui主题定制任务) ⏱️ 2天

### 📊 功能实现统计
- **✅ 配置即可实现**: 8项功能（35%）
- **⚠️ 需要开发增强**: 6项功能（26%）  
- **❌ 需要新开发**: 8项功能（39%）
- **🎨 UI定制优化**: 2项功能

---

## 🔧 阶段一：后台配置任务（立即可执行）

### ✅ 任务1.1：配置多语言支持
**操作路径**: 后台管理 → LDCMS → 语言管理  
**预估时间**: 10分钟  
**执行人员**: 管理员手动配置  
**🔥 优先级**: **必须先执行** - 栏目创建需要多语言支持

**语言配置**:
```
1. 启用多语言功能
2. 添加语言支持:
   - vi-vn: 越南语 (默认)
   - en: 英语  
   - zh-cn: 简体中文
   - zh-tw: 繁体中文
3. 设置默认语言为越南语
4. 配置语言切换显示方式
```

### ✅ 任务1.2：创建内容分类配置
**操作路径**: 后台管理 → LDCMS → 栏目管理 → 添加栏目  
**预估时间**: 15分钟  
**执行人员**: 管理员手动配置  
**📋 前置条件**: 需要先完成任务1.1（多语言配置）

**具体配置内容**:
```
1. 热门板块 (Hot)
   - 中文名: 热门
   - 英文名: Hot  
   - 越南语名: Nổi bật
   - 繁体中文名: 熱門
   - URL名称: hot
   - 模型: 新闻模型 (mid=2)
   - 模板: list_news.html, detail_news.html
   - 权限: 前台用户可发布
   - 审核: 需要审核

2. 活动板块 (Activity)
   - 中文名: 活动
   - 英文名: Activity
   - 越南语名: Hoạt động  
   - 繁体中文名: 活動
   - URL名称: activity
   - 模型: 新闻模型 (mid=2)
   - 模板: list_news.html, detail_news.html

3. 关于公司 (About)
   - 中文名: 关于公司
   - 英文名: About Company
   - 越南语名: Về công ty
   - 繁体中文名: 關於公司
   - URL名称: about-company
   - 模型: 单页模型 (mid=1)
   - 模板: detail_page.html
```

### ✅ 任务1.3：配置联系合作自定义表单
**操作路径**: 后台管理 → LDCMS → 自定义表单 → 添加表单  
**预估时间**: 20分钟  
**执行人员**: 管理员手动配置  
**📋 详细配置指南**: 📄 [联系合作表单配置指南.md](./联系合作表单配置指南.md)  

**表单配置详情**:
```
表单名称: 联系合作表单
表单标识: contact_cooperation  
数据表名: ldcms_contact_cooperation
需要登录: 否
验证码: 是

字段配置:
1. category (下拉选择)
   - 标题: 合作类目
   - 选项: 直播电商|短视频|商务合作|达人合作|技术咨询|产品询价|媒体合作|其他咨询
   - 必填: 是

2. name (单行文本)
   - 标题: 姓名
   - 验证: 2-50个字符
   - 必填: 是

3. company (单行文本)  
   - 标题: 公司名称
   - 验证: 2-100个字符
   - 必填: 否

4. phone (单行文本)
   - 标题: 联系电话
   - 验证: 手机号或座机格式
   - 必填: 是

5. email (邮箱)
   - 标题: 邮箱地址
   - 验证: 邮箱格式
   - 必填: 是

6. description (多行文本)
   - 标题: 合作描述
   - 最大长度: 1000字符
   - 必填: 是
```

### ✅ 任务1.4：用户权限配置
**操作路径**: 后台管理 → 权限管理 → 用户组管理  
**预估时间**: 10分钟  
**执行人员**: 管理员手动配置  

**📋 前置条件**: 需要先完成任务1.2（栏目创建）

**权限配置内容**:
```
1. 前台用户发布权限
   - 允许发布到"热门"分类
   - 发布状态: 待审核 (pending)
   - 允许上传图片和视频

2. 审核流程配置
   - 管理员审核权限
   - 审核状态管理
   - 审核通知机制
```

---

## 🛠️ 阶段二：功能开发增强任务

### ⚠️ 任务2.1：多语言开发
**开发内容**: 创建越南语、繁体中文和英文语言包  
**预估时间**: 2.3天  
**优先级**: P1 (高优先级)  

#### 子任务2.1.1：越南语语言包开发
**文件路径**: `addons/ldcms/lang/vi-vn/`  
**开发时间**: 1.5天  

**需要创建的文件**:
```
1. vi-vn.php - 主语言包
2. frontend.php - 前台语言包  
3. backend.php - 后台语言包
4. validation.php - 验证信息语言包
```

**核心翻译内容**:
```php
// vi-vn.php 核心内容
return [
    // 导航菜单
    'Home' => 'Trang chủ',
    'Hot' => 'Nổi bật', 
    'Activity' => 'Hoạt động',
    'Contact Cooperation' => 'Liên hệ hợp tác',
    'About Company' => 'Về công ty',
    
    // 合作类型
    'Livestream E-commerce' => 'Thương mại điện tử livestream',
    'Short Video' => 'Video ngắn',
    'Business Cooperation' => 'Hợp tác kinh doanh',
    'Influencer Cooperation' => 'Hợp tác với KOL',
    'Technical Consulting' => 'Tư vấn kỹ thuật',
    'Product Inquiry' => 'Tư vấn sản phẩm',
    'Media Cooperation' => 'Hợp tác truyền thông',
    'Other Consulting' => 'Tư vấn khác',
    
    // 用户系统
    'Login' => 'Đăng nhập',
    'Register' => 'Đăng ký',
    'My Profile' => 'Hồ sơ của tôi',
    'My Posts' => 'Bài viết của tôi',
    'Settings' => 'Cài đặt',
    
    // 内容发布
    'Publish' => 'Xuất bản',
    'Title' => 'Tiêu đề',
    'Content' => 'Nội dung',
    'Image' => 'Hình ảnh',
    'Video' => 'Video',
    'Tags' => 'Thẻ',
    
    // 表单相关
    'Name' => 'Họ và tên',
    'Company' => 'Công ty',
    'Phone' => 'Số điện thoại',
    'Email' => 'Email',
    'Category' => 'Danh mục',
    'Description' => 'Mô tả',
    'Submit' => 'Gửi',
    'Cancel' => 'Hủy',
    
    // 状态信息
    'Success' => 'Thành công',
    'Error' => 'Lỗi',
    'Loading' => 'Đang tải...',
    'No data' => 'Không có dữ liệu',
    'Pending Review' => 'Chờ duyệt',
    'Approved' => 'Đã duyệt',
    'Rejected' => 'Bị từ chối',
];
```

#### 子任务2.1.2：繁体中文语言包开发  
**文件路径**: `addons/ldcms/lang/zh-tw/`  
**开发时间**: 0.5天  

**核心翻译内容**:
```php
// zh-tw.php 核心内容
return [
    // 導航菜單
    'Home' => '首頁',
    'Hot' => '熱門',
    'Activity' => '活動', 
    'Contact Cooperation' => '聯繫合作',
    'About Company' => '關於公司',
    
    // 合作類型
    'Livestream E-commerce' => '直播電商',
    'Short Video' => '短視頻',
    'Business Cooperation' => '商務合作',
    'Influencer Cooperation' => '達人合作',
    'Technical Consulting' => '技術諮詢',
    'Product Inquiry' => '產品詢價',
    'Media Cooperation' => '媒體合作',
    'Other Consulting' => '其他諮詢',
    
    // 用戶系統
    'Login' => '登入',
    'Register' => '註冊',
    'My Profile' => '我的資料',
    'My Posts' => '我的貼文',
    'Settings' => '設定',
    
    // 內容發布
    'Publish' => '發布',
    'Title' => '標題',
    'Content' => '內容',
    'Image' => '圖片',
    'Video' => '影片',
    'Tags' => '標籤',
];
```

#### 子任务2.1.3：英文语言包开发  
**文件路径**: `addons/ldcms/lang/en/`  
**开发时间**: 0.3天  

**核心翻译内容**:
```php
// en.php 核心内容
return [
    // Navigation Menu
    'Home' => 'Home',
    'Hot' => 'Hot',
    'Activity' => 'Activity', 
    'Contact Cooperation' => 'Contact & Cooperation',
    'About Company' => 'About Company',
    
    // Cooperation Types
    'Livestream E-commerce' => 'Livestream E-commerce',
    'Short Video' => 'Short Video',
    'Business Cooperation' => 'Business Cooperation',
    'Influencer Cooperation' => 'Influencer Cooperation',
    'Technical Consulting' => 'Technical Consulting',
    'Product Inquiry' => 'Product Inquiry',
    'Media Cooperation' => 'Media Cooperation',
    'Other Consulting' => 'Other Consulting',
    
    // User System
    'Login' => 'Login',
    'Register' => 'Register',
    'My Profile' => 'My Profile',
    'My Posts' => 'My Posts',
    'Settings' => 'Settings',
    
    // Content Publishing
    'Publish' => 'Publish',
    'Title' => 'Title',
    'Content' => 'Content',
    'Image' => 'Image',
    'Video' => 'Video',
    'Tags' => 'Tags',
    
    // Form Related
    'Name' => 'Name',
    'Company' => 'Company',
    'Phone' => 'Phone',
    'Email' => 'Email',
    'Category' => 'Category',
    'Description' => 'Description',
    'Submit' => 'Submit',
    'Cancel' => 'Cancel',
    
    // Status Information
    'Success' => 'Success',
    'Error' => 'Error',
    'Loading' => 'Loading...',
    'No data' => 'No data',
    'Pending Review' => 'Pending Review',
    'Approved' => 'Approved',
    'Rejected' => 'Rejected',
];
```

### ⚠️ 任务2.2：视频功能增强
**开发内容**: 为Document模型添加视频支持  
**预估时间**: 1天  
**优先级**: P1 (高优先级)  
**📋 参考依据**: 📄 [LDCMS数据库现状分析与任务计划补充.md](./LDCMS数据库现状分析与任务计划补充.md) - 广告表视频功能参考实现  

#### 子任务2.2.1：数据库结构增强
**执行内容**: 为fa_ldcms_document表添加视频相关字段  

```sql
-- 添加视频支持字段
ALTER TABLE `fa_ldcms_document` ADD COLUMN `video` varchar(255) DEFAULT '' COMMENT '视频文件路径';
ALTER TABLE `fa_ldcms_document` ADD COLUMN `video_thumb` varchar(255) DEFAULT '' COMMENT '视频缩略图';  
ALTER TABLE `fa_ldcms_document` ADD COLUMN `video_duration` int(11) DEFAULT '0' COMMENT '视频时长（秒）';
ALTER TABLE `fa_ldcms_document` ADD COLUMN `is_video` tinyint(1) DEFAULT '0' COMMENT '是否包含视频';
```

#### 子任务2.2.2：后台管理功能增强
**涉及文件**:
- `application/admin/controller/ldcms/Document.php`
- `application/admin/view/ldcms/document/add.html`  
- `application/admin/view/ldcms/document/edit.html`

**开发内容**:
```php
// Document控制器增强视频处理
public function add()
{
    if ($this->request->isPost()) {
        $params = $this->request->post();
        
        // 视频文件上传处理
        if (isset($params['video']) && !empty($params['video'])) {
            $params['is_video'] = 1;
            // 视频缩略图生成逻辑
            $params['video_thumb'] = $this->generateVideoThumbnail($params['video']);
            // 视频时长获取逻辑  
            $params['video_duration'] = $this->getVideoDuration($params['video']);
        }
        
        // 其他处理逻辑...
    }
}
```

#### 子任务2.2.3：前台视频播放器集成
**涉及文件**:
- `addons/ldcms/view/default/detail_news.html`
- `addons/ldcms/view/default/list_news.html`

**开发内容**:
```html
<!-- 视频播放器模板 -->
{if condition="$document.is_video && $document.video"}
<div class="video-player-wrapper">
    <video id="video-{$document.id}" 
           class="video-js vjs-default-skin"
           controls preload="auto" 
           width="100%" height="400"
           poster="{$document.video_thumb}"
           data-setup="{}">
        <source src="{$document.video}" type="video/mp4">
        <p class="vjs-no-js">您的浏览器不支持视频播放</p>
    </video>
</div>
{/if}
```

### ⚠️ 任务2.3：内容审核流程开发
**开发内容**: 实现用户发布内容的审核机制  
**预估时间**: 1天  
**优先级**: P1 (高优先级)  

#### 子任务2.3.1：Document模型状态扩展
**涉及文件**: `addons/ldcms/model/Document.php`

```php
// 扩展状态定义
public function getStatusList()
{
    return [
        'normal' => '已发布',
        'hidden' => '隐藏',
        'pending' => '待审核',  
        'rejected' => '审核拒绝'
    ];
}

// 审核相关方法
public function approve($id)
{
    return $this->where('id', $id)->update(['status' => 'normal']);
}

public function reject($id, $reason = '')
{
    return $this->where('id', $id)->update([
        'status' => 'rejected',
        'reject_reason' => $reason
    ]);
}
```

#### 子任务2.3.2：后台审核管理功能
**涉及文件**: 
- `application/admin/controller/ldcms/Document.php`
- `application/admin/view/ldcms/document/index.html`

**开发内容**:
```php
// 添加审核操作方法
public function approve()
{
    $id = $this->request->post('id');
    $model = new \addons\ldcms\model\Document();
    
    if ($model->approve($id)) {
        $this->success('审核通过');
    } else {
        $this->error('审核失败');
    }
}

public function reject()  
{
    $id = $this->request->post('id');
    $reason = $this->request->post('reason', '');
    $model = new \addons\ldcms\model\Document();
    
    if ($model->reject($id, $reason)) {
        $this->success('已拒绝');
    } else {
        $this->error('操作失败');
    }
}
```

### ⚠️ 任务2.4：前台用户发布功能
**开发内容**: 实现前台用户发布帖子功能  
**预估时间**: 1.5天  
**优先级**: P1 (高优先级)  

#### 子任务2.4.1：前台发布控制器开发
**文件路径**: `addons/ldcms/controller/Publish.php`

```php
<?php
namespace addons\ldcms\controller;

use addons\ldcms\model\Document;
use addons\ldcms\model\Category;

class Publish extends Base
{
    public function index()
    {
        // 检查用户登录状态
        if (!$this->auth->isLogin()) {
            $this->error('请先登录', '/user/login');
        }
        
        // 获取可发布的分类
        $categories = Category::where('lang', get_home_lang())
            ->where('status', 1)
            ->where('urlname', 'in', ['hot', 'activity'])
            ->select();
            
        $this->assign('categories', $categories);
        return $this->view->fetch();
    }
    
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post();
            
            // 数据验证
            $validate = new \addons\ldcms\validate\Document();
            if (!$validate->check($params)) {
                $this->error($validate->getError());
            }
            
            // 设置默认值
            $params['status'] = 'pending'; // 待审核状态
            $params['admin_id'] = $this->auth->id;
            $params['author'] = $this->auth->nickname;
            $params['lang'] = get_home_lang();
            $params['show_time'] = time();
            
            $model = new Document();
            if ($model->save($params)) {
                $this->success('发布成功，等待审核', '/user/my-posts');
            } else {
                $this->error('发布失败');
            }
        }
    }
}
```

#### 子任务2.4.2：前台发布页面模板
**文件路径**: `addons/ldcms/view/default/publish/index.html`

```html
<div class="publish-container">
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header">
                        <h4>发布内容</h4>
                    </div>
                    <div class="card-body">
                        <form id="publishForm" method="post" action="{:url('publish/add')}">
                            <div class="form-group">
                                <label>分类</label>
                                <select name="cid" class="form-control" required>
                                    <option value="">请选择分类</option>
                                    {volist name="categories" id="category"}
                                    <option value="{$category.id}">{$category.name}</option>
                                    {/volist}
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>标题</label>
                                <input type="text" name="title" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label>内容</label>
                                <textarea name="content" class="form-control editor" rows="10"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label>缩略图</label>
                                <input type="file" name="image" class="form-control" accept="image/*">
                            </div>
                            
                            <div class="form-group">
                                <label>视频</label>
                                <input type="file" name="video" class="form-control" accept="video/*">
                            </div>
                            
                            <div class="form-group">
                                <label>标签</label>
                                <input type="text" name="tag" class="form-control" placeholder="多个标签用逗号分隔">
                            </div>
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">发布</button>
                                <a href="/user/profile" class="btn btn-secondary">取消</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
```

### ⚠️ 任务2.5：个人中心功能增强
**开发内容**: 增强用户个人中心功能  
**预估时间**: 1天  
**优先级**: P2 (中优先级)  

#### 子任务2.5.1：我的发布内容管理
**文件路径**: `application/index/controller/User.php`

```php
// 我的发布内容
public function myposts()
{
    if (!$this->auth->isLogin()) {
        $this->error('请先登录', '/user/login');
    }
    
    $page = $this->request->param('page', 1);
    $limit = 10;
    
    $model = new \addons\ldcms\model\Document();
    $list = $model->where('admin_id', $this->auth->id)
        ->where('lang', get_home_lang())
        ->order('create_time desc')
        ->paginate($limit);
        
    $this->assign('list', $list);
    return $this->view->fetch();
}

// 编辑我的内容
public function editpost()
{
    $id = $this->request->param('id');
    
    if (!$this->auth->isLogin()) {
        $this->error('请先登录');
    }
    
    $model = new \addons\ldcms\model\Document();
    $post = $model->where('id', $id)
        ->where('admin_id', $this->auth->id)
        ->find();
        
    if (!$post) {
        $this->error('内容不存在或无权限编辑');
    }
    
    if ($this->request->isPost()) {
        $params = $this->request->post();
        $params['status'] = 'pending'; // 重新审核
        
        if ($post->save($params)) {
            $this->success('修改成功，等待审核');
        } else {
            $this->error('修改失败');
        }
    }
    
    $this->assign('post', $post);
    return $this->view->fetch();
}
```

### ⚠️ 任务2.6：标签系统增强  
**开发内容**: 优化现有标签系统功能  
**预估时间**: 0.5天  
**优先级**: P2 (中优先级)  

**说明**: 现有数据库已包含fa_ldcms_tags和fa_ldcms_tagaction表，只需要增强前台功能。

#### 子任务2.6.1：标签筛选功能
**涉及文件**: 
- `addons/ldcms/controller/Index.php`
- `addons/ldcms/view/default/list_news.html`

```php
// 标签筛选方法
public function bytag()
{
    $tag = $this->request->param('tag');
    $page = $this->request->param('page', 1);
    
    $model = new \addons\ldcms\model\Document();
    $list = $model->where('tag', 'like', "%{$tag}%")
        ->where('status', 'normal')
        ->where('lang', get_home_lang())
        ->order('show_time desc')
        ->paginate(12);
        
    $this->assign('list', $list);
    $this->assign('tag', $tag);
    return $this->view->fetch('list_tag');
}
```

---

## 🆕 阶段三：新功能开发任务

### ❌ 任务3.1：社交互动系统开发
**开发内容**: 全新开发点赞、评论、分享功能  
**预估时间**: 4天  
**优先级**: P2 (中优先级)  

#### 子任务3.1.1：点赞系统开发
**开发时间**: 1天  
**📋 优化说明**: 📄 [LDCMS数据库现状分析与任务计划补充.md](./LDCMS数据库现状分析与任务计划补充.md) - Document表已有likes字段，开发成本降低

**数据库表创建**:
```sql
CREATE TABLE `fa_document_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `document_id` int(11) NOT NULL COMMENT '文档ID',
  `create_time` int(11) DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_document` (`user_id`, `document_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文档点赞表';
```

**点赞模型开发**:
```php
// addons/ldcms/model/DocumentLikes.php
<?php
namespace addons\ldcms\model;

use think\Model;

class DocumentLikes extends Model
{
    protected $name = 'document_likes';
    
    // 点赞
    public function like($userId, $documentId)
    {
        $exists = $this->where('user_id', $userId)
            ->where('document_id', $documentId)
            ->find();
            
        if ($exists) {
            return false; // 已点赞
        }
        
        $this->save([
            'user_id' => $userId,
            'document_id' => $documentId,
            'create_time' => time()
        ]);
        
        // 更新文档点赞数
        \addons\ldcms\model\Document::where('id', $documentId)
            ->setInc('likes');
            
        return true;
    }
    
    // 取消点赞
    public function unlike($userId, $documentId)
    {
        $result = $this->where('user_id', $userId)
            ->where('document_id', $documentId)
            ->delete();
            
        if ($result) {
            // 减少文档点赞数
            \addons\ldcms\model\Document::where('id', $documentId)
                ->setDec('likes');
        }
        
        return $result;
    }
}
```

**点赞API控制器**:
```php
// addons/ldcms/controller/Like.php  
<?php
namespace addons\ldcms\controller;

class Like extends Base
{
    public function toggle()
    {
        if (!$this->auth->isLogin()) {
            $this->error('请先登录');
        }
        
        $documentId = $this->request->post('document_id');
        $userId = $this->auth->id;
        
        $model = new \addons\ldcms\model\DocumentLikes();
        
        // 检查是否已点赞
        $liked = $model->where('user_id', $userId)
            ->where('document_id', $documentId)
            ->find();
            
        if ($liked) {
            // 取消点赞
            $model->unlike($userId, $documentId);
            $this->success('取消点赞', null, ['liked' => false]);
        } else {
            // 点赞
            $model->like($userId, $documentId);
            $this->success('点赞成功', null, ['liked' => true]);
        }
    }
}
```

#### 子任务3.1.2：评论系统开发
**开发时间**: 2天

**数据库表创建**:
```sql
CREATE TABLE `fa_document_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL COMMENT '文档ID',
  `user_id` int(11) NOT NULL COMMENT '评论用户ID',
  `parent_id` int(11) DEFAULT '0' COMMENT '父评论ID',
  `reply_to_user_id` int(11) DEFAULT '0' COMMENT '回复的用户ID',
  `content` text NOT NULL COMMENT '评论内容',
  `likes_count` int(11) DEFAULT '0' COMMENT '点赞数',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1正常，0隐藏',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文档评论表';
```

**评论模型开发**:
```php
// addons/ldcms/model/DocumentComments.php
<?php
namespace addons\ldcms\model;

use think\Model;

class DocumentComments extends Model
{
    protected $name = 'document_comments';
    
    // 获取评论列表（树形结构）
    public function getCommentTree($documentId)
    {
        $comments = $this->where('document_id', $documentId)
            ->where('status', 1)
            ->with(['user'])
            ->order('create_time desc')
            ->select();
            
        return $this->buildTree($comments);
    }
    
    // 构建评论树
    private function buildTree($comments, $parentId = 0)
    {
        $tree = [];
        foreach ($comments as $comment) {
            if ($comment['parent_id'] == $parentId) {
                $comment['children'] = $this->buildTree($comments, $comment['id']);
                $tree[] = $comment;
            }
        }
        return $tree;
    }
    
    // 用户关联
    public function user()
    {
        return $this->belongsTo('app\common\model\User', 'user_id');
    }
}
```

#### 子任务3.1.3：分享功能开发  
**开发时间**: 1天

**分享功能实现**:
```javascript
// 社交媒体分享功能
class SocialShare {
    constructor() {
        this.init();
    }
    
    init() {
        this.bindEvents();
    }
    
    bindEvents() {
        // Facebook分享
        $('.share-facebook').on('click', (e) => {
            e.preventDefault();
            const url = encodeURIComponent(window.location.href);
            const shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${url}`;
            this.openShareWindow(shareUrl);
        });
        
        // Twitter分享
        $('.share-twitter').on('click', (e) => {
            e.preventDefault();
            const url = encodeURIComponent(window.location.href);
            const text = encodeURIComponent(document.title);
            const shareUrl = `https://twitter.com/intent/tweet?url=${url}&text=${text}`;
            this.openShareWindow(shareUrl);
        });
        
        // LinkedIn分享
        $('.share-linkedin').on('click', (e) => {
            e.preventDefault();
            const url = encodeURIComponent(window.location.href);
            const shareUrl = `https://www.linkedin.com/sharing/share-offsite/?url=${url}`;
            this.openShareWindow(shareUrl);
        });
    }
    
    openShareWindow(url) {
        window.open(url, 'share', 'width=600,height=400');
    }
}

// 初始化分享功能
new SocialShare();
```

### ❌ 任务3.2：用户注册登录系统增强
**开发内容**: 基于FastAdmin现有用户系统进行增强  
**预估时间**: 1天  
**优先级**: P1 (高优先级)  

**说明**: FastAdmin已提供完整的用户系统，只需要针对项目需求进行定制。

#### 子任务3.2.1：注册页面定制
**涉及文件**: 
- `application/index/controller/User.php`
- `application/index/view/user/register.html`

```php
// 注册功能增强
public function register()
{
    $config = get_addon_config('user');
    if (!$config['allowregister']) {
        $this->error(__('Registration is not allowed'));
    }
    
    if ($this->request->isPost()) {
        $username = $this->request->post('username');
        $password = $this->request->post('password');
        $email = $this->request->post('email');
        $mobile = $this->request->post('mobile');
        $nickname = $this->request->post('nickname', $username);
        
        // 数据验证
        $validate = new \app\common\validate\User();
        if (!$validate->scene('register')->check([
            'username' => $username,
            'password' => $password,
            'email' => $email,
            'mobile' => $mobile
        ])) {
            $this->error($validate->getError());
        }
        
        // 注册用户
        $result = $this->auth->register($username, $password, $email, $mobile, [
            'nickname' => $nickname
        ]);
        
        if ($result) {
            $this->success(__('Registration successful'), url('user/login'));
        } else {
            $this->error($this->auth->getError());
        }
    }
    
    return $this->view->fetch();
}
```

### ❌ 任务3.3：响应式设计优化
**开发内容**: 优化移动端用户体验  
**预估时间**: 1天  
**优先级**: P1 (高优先级)  

#### 子任务3.3.1：移动端适配优化
**涉及文件**: 
- `addons/ldcms/view/default/static/css/mobile.css`
- 各模板文件的响应式优化

```css
/* 移动端优化样式 */
@media (max-width: 768px) {
    .container {
        padding: 0 15px;
    }
    
    .card {
        margin-bottom: 15px;
        border-radius: 8px;
    }
    
    .video-player-wrapper {
        position: relative;
        width: 100%;
        height: 0;
        padding-bottom: 56.25%; /* 16:9 */
    }
    
    .video-player-wrapper video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }
    
    .publish-form {
        padding: 15px;
    }
    
    .btn {
        width: 100%;
        margin-bottom: 10px;
    }
}
```

---

## 🎨 阶段四：UI主题定制任务

### 🎨 任务4.1：紫色主题设计开发
**开发内容**: 创建紫色系现代化UI主题  
**预估时间**: 1.5天  
**优先级**: P1 (高优先级)  

#### 子任务4.1.1：主题色彩系统设计
**文件路径**: `addons/ldcms/view/purple-theme/static/css/theme.css`

```css
/* 紫色主题色彩系统 */
:root {
    /* 主色调 */
    --primary-color: #8B5CF6;
    --primary-light: #A78BFA;
    --primary-dark: #7C3AED;
    --primary-gradient: linear-gradient(135deg, #8B5CF6, #A78BFA);
    
    /* 辅助色 */
    --secondary-color: #F3F4F6;
    --accent-color: #10B981;
    --warning-color: #F59E0B;
    --danger-color: #EF4444;
    
    /* 文本色 */
    --text-primary: #1F2937;
    --text-secondary: #6B7280;
    --text-light: #9CA3AF;
    --text-white: #FFFFFF;
    
    /* 背景色 */
    --bg-primary: #FFFFFF;
    --bg-secondary: #F9FAFB;
    --bg-dark: #111827;
    
    /* 边框色 */
    --border-color: #E5E7EB;
    --border-light: #F3F4F6;
    
    /* 阴影 */
    --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
    --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
}

/* 按钮样式 */
.btn-primary {
    background: var(--primary-gradient);
    border: none;
    border-radius: 8px;
    padding: 12px 24px;
    color: var(--text-white);
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: var(--shadow-sm);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-lg);
    background: linear-gradient(135deg, #7C3AED, #8B5CF6);
}

/* 卡片样式 */
.card {
    background: var(--bg-primary);
    border-radius: 12px;
    box-shadow: var(--shadow-md);
    border: 1px solid var(--border-light);
    overflow: hidden;
    transition: all 0.3s ease;
}

.card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-lg);
}

/* 表单样式 */
.form-control {
    border-radius: 8px;
    border: 1px solid var(--border-color);
    padding: 12px 16px;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1);
}

/* 导航样式 */
.navbar {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    box-shadow: var(--shadow-sm);
}

.navbar-brand {
    font-weight: 700;
    color: var(--primary-color);
}

.nav-link {
    color: var(--text-primary);
    font-weight: 500;
    transition: color 0.3s ease;
}

.nav-link:hover,
.nav-link.active {
    color: var(--primary-color);
}
```

#### 子任务4.1.2：组件样式定制
**开发内容**: 定制各种UI组件的紫色主题样式

```css
/* 标签样式 */
.tag {
    display: inline-block;
    padding: 4px 12px;
    background: rgba(139, 92, 246, 0.1);
    color: var(--primary-color);
    border-radius: 20px;
    font-size: 12px;
    font-weight: 500;
    margin: 2px;
    text-decoration: none;
    transition: all 0.3s ease;
}

.tag:hover {
    background: var(--primary-color);
    color: var(--text-white);
}

/* 状态标识 */
.status-badge {
    padding: 4px 8px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 500;
}

.status-pending {
    background: rgba(245, 158, 11, 0.1);
    color: var(--warning-color);
}

.status-approved {
    background: rgba(16, 185, 129, 0.1);
    color: var(--accent-color);
}

.status-rejected {
    background: rgba(239, 68, 68, 0.1);
    color: var(--danger-color);
}

/* 加载动画 */
.loading {
    display: inline-block;
    width: 20px;
    height: 20px;
    border: 2px solid var(--border-color);
    border-radius: 50%;
    border-top-color: var(--primary-color);
    animation: spin 1s linear infinite;
}

@keyframes spin {
    to {
        transform: rotate(360deg);
    }
}
```

### 🎨 任务4.2：弹窗表单效果开发
**开发内容**: 实现联系合作弹窗表单  
**预估时间**: 0.5天  
**优先级**: P1 (高优先级)  
**📋 配置前置**: 📄 [联系合作表单配置指南.md](./联系合作表单配置指南.md) - 需要先完成后台表单配置  

#### 子任务4.2.1：弹窗组件开发
**文件路径**: `addons/ldcms/view/purple-theme/static/js/contact-modal.js`

```javascript
// 联系合作弹窗类
class ContactModal {
    constructor() {
        this.modal = null;
        this.form = null;
        this.isSubmitting = false;
        this.init();
    }
    
    init() {
        this.createModal();
        this.bindEvents();
    }
    
    createModal() {
        const modalHtml = `
        <div class="modal fade" id="contactModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="fas fa-handshake text-primary"></i>
                            联系合作
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form id="contactForm" class="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">合作类目 *</label>
                                        <select name="category" class="form-control" required>
                                            <option value="">请选择合作类目</option>
                                            <option value="livestream">直播电商</option>
                                            <option value="shortvideo">短视频</option>
                                            <option value="business">商务合作</option>
                                            <option value="influencer">达人合作</option>
                                            <option value="technical">技术咨询</option>
                                            <option value="product">产品询价</option>
                                            <option value="media">媒体合作</option>
                                            <option value="other">其他咨询</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">姓名 *</label>
                                        <input type="text" name="name" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">联系电话 *</label>
                                        <input type="tel" name="phone" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">邮箱地址 *</label>
                                        <input type="email" name="email" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group mb-3">
                                <label class="form-label">公司名称</label>
                                <input type="text" name="company" class="form-control">
                            </div>
                            
                            <div class="form-group mb-3">
                                <label class="form-label">合作描述 *</label>
                                <textarea name="description" class="form-control" rows="4" required 
                                          placeholder="请详细描述您的合作需求..."></textarea>
                            </div>
                            
                            <div class="form-group mb-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                                    <label class="form-check-label" for="agreeTerms">
                                        我已阅读并同意 <a href="/terms" target="_blank">服务条款</a> 和 <a href="/privacy" target="_blank">隐私政策</a>
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" id="submitContact">
                            <span class="submit-text">提交申请</span>
                            <span class="loading d-none">
                                <i class="fas fa-spinner fa-spin"></i> 提交中...
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>`;
        
        document.body.insertAdjacentHTML('beforeend', modalHtml);
        this.modal = new bootstrap.Modal(document.getElementById('contactModal'));
        this.form = document.getElementById('contactForm');
    }
    
    bindEvents() {
        // 打开弹窗按钮
        document.addEventListener('click', (e) => {
            if (e.target.matches('.contact-btn, .contact-btn *')) {
                e.preventDefault();
                this.show();
            }
        });
        
        // 提交表单
        document.getElementById('submitContact').addEventListener('click', () => {
            this.submit();
        });
    }
    
    show() {
        this.modal.show();
        this.resetForm();
    }
    
    hide() {
        this.modal.hide();
    }
    
    resetForm() {
        this.form.reset();
        this.isSubmitting = false;
        this.updateSubmitButton(false);
    }
    
    updateSubmitButton(loading) {
        const btn = document.getElementById('submitContact');
        const text = btn.querySelector('.submit-text');
        const loadingSpan = btn.querySelector('.loading');
        
        if (loading) {
            btn.disabled = true;
            text.classList.add('d-none');
            loadingSpan.classList.remove('d-none');
        } else {
            btn.disabled = false;
            text.classList.remove('d-none');
            loadingSpan.classList.add('d-none');
        }
    }
    
    async submit() {
        if (this.isSubmitting) return;
        
        // 表单验证
        if (!this.form.checkValidity()) {
            this.form.reportValidity();
            return;
        }
        
        this.isSubmitting = true;
        this.updateSubmitButton(true);
        
        try {
            const formData = new FormData(this.form);
            
            const response = await fetch('/addons/ldcms/diyform/post', {
                method: 'POST',
                body: formData
            });
            
            const result = await response.json();
            
            if (result.code === 1) {
                this.showSuccess('提交成功！我们会在24小时内联系您。');
                setTimeout(() => {
                    this.hide();
                }, 2000);
            } else {
                this.showError(result.msg || '提交失败，请稍后重试');
            }
        } catch (error) {
            this.showError('网络错误，请稍后重试');
        } finally {
            this.isSubmitting = false;
            this.updateSubmitButton(false);
        }
    }
    
    showSuccess(message) {
        this.showMessage(message, 'success');
    }
    
    showError(message) {
        this.showMessage(message, 'error');
    }
    
    showMessage(message, type) {
        // 创建消息提示
        const alertClass = type === 'success' ? 'alert-success' : 'alert-danger';
        const alertHtml = `
        <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>`;
        
        const modalBody = document.querySelector('#contactModal .modal-body');
        modalBody.insertAdjacentHTML('afterbegin', alertHtml);
        
        // 3秒后自动移除
        setTimeout(() => {
            const alert = modalBody.querySelector('.alert');
            if (alert) {
                alert.remove();
            }
        }, 3000);
    }
}

// 初始化联系弹窗
document.addEventListener('DOMContentLoaded', () => {
    new ContactModal();
});
```

---

## 📋 开发任务优先级与时间安排

### 🚀 第一阶段：基础配置（立即执行）
**总时间**: 55分钟  
**执行方式**: 管理员手动配置  

| 任务编号 | 任务名称 | 时间 | 执行人员 | 依赖关系 |
|---------|----------|------|----------|----------|
| 1.1 | 配置多语言支持 | 10分钟 | 管理员 | 无 |
| 1.2 | 创建内容分类配置 | 15分钟 | 管理员 | 1.1完成 |
| 1.3 | 配置联系合作表单 | 20分钟 | 管理员 | 无 |
| 1.4 | 用户权限配置 | 10分钟 | 管理员 | 1.2完成 |

### 🛠️ 第二阶段：功能增强开发（高优先级）
**总时间**: 6.3天  
**执行方式**: 开发人员编码实现  

| 任务编号 | 任务名称 | 时间 | 优先级 | 依赖关系 |
|---------|----------|------|--------|----------|
| 2.1 | 多语言开发 | 2.3天 | P1 | 1.1完成 |
| 2.2 | 视频功能增强 | 1天 | P1 | 无 |
| 2.3 | 内容审核流程开发 | 1天 | P1 | 1.2,1.4完成 |
| 2.4 | 前台用户发布功能 | 1.5天 | P1 | 2.3完成 |
| 2.5 | 个人中心功能增强 | 1天 | P2 | 2.4完成 |
| 2.6 | 标签系统增强 | 0.5天 | P2 | 无 |

### 🆕 第三阶段：新功能开发（中优先级）
**总时间**: 6天  
**执行方式**: 开发人员编码实现  

| 任务编号 | 任务名称 | 时间 | 优先级 | 依赖关系 |
|---------|----------|------|--------|----------|
| 3.1.1 | 点赞系统开发 | 1天 | P2 | 2.4完成 |
| 3.1.2 | 评论系统开发 | 2天 | P2 | 2.4完成 |
| 3.1.3 | 分享功能开发 | 1天 | P2 | 无 |
| 3.2 | 用户系统增强 | 1天 | P1 | 无 |
| 3.3 | 响应式设计优化 | 1天 | P1 | 无 |

### 🎨 第四阶段：UI主题定制（高优先级）
**总时间**: 2天  
**执行方式**: 前端开发人员设计实现  

| 任务编号 | 任务名称 | 时间 | 优先级 | 依赖关系 |
|---------|----------|------|--------|----------|
| 4.1 | 紫色主题设计开发 | 1.5天 | P1 | 无 |
| 4.2 | 弹窗表单效果开发 | 0.5天 | P1 | 1.2完成 |

---

## 🎯 项目实施建议

### 📅 分阶段实施计划

#### 🚀 MVP版本（第1-2阶段，6.5天）
**目标**: 实现基本功能，用户可以正常使用网站核心功能
- ✅ 完成所有后台配置
- ✅ 多语言支持（越南语优先）
- ✅ 用户发布和审核功能
- ✅ 基础UI主题

#### 🚀 完整版本（第3-4阶段，8天）
**目标**: 实现所有社交功能，提供完整用户体验
- ✅ 点赞评论分享功能
- ✅ 完整的紫色主题
- ✅ 响应式移动端优化
- ✅ 弹窗表单效果

### 📊 风险评估与应对

**📋 优化参考**: 📄 [LDCMS数据库现状分析与任务计划补充.md](./LDCMS数据库现状分析与任务计划补充.md) - 基于现状分析的风险降低方案

#### 🟢 风险降低项目（基于现状优化）
1. **点赞功能开发** - 原评估高风险，现已降为低风险
   - **原因**: Document表已有likes字段，只需开发关联逻辑
   
2. **视频功能开发** - 原评估中风险，现已降为低风险  
   - **原因**: 广告表已有完整视频功能，可直接参考

3. **表单系统** - 原评估中风险，现已降为无风险
   - **原因**: 系统已有完整的自定义表单功能和示例

#### 🔴 高风险项目
1. **多语言开发** - 翻译准确性风险
   - **应对**: 找越南语母语人员协助校对
   
2. **社交功能开发** - 功能复杂性风险（仅评论系统）
   - **应对**: 分步骤实现，先实现基础功能

#### 🟡 中风险项目  
1. **响应式设计** - 兼容性风险
   - **应对**: 多设备测试，渐进增强

### 🎯 成功标准

#### 功能完整性检查
- [ ] 四大板块正常运行（热门、活动、联系合作、关于公司）
- [ ] 用户注册登录功能完整
- [ ] 多语言切换正常（4种语言）
- [ ] 响应式设计适配PC和移动端
- [ ] 紫色主题风格统一
- [ ] 社交功能正常（点赞、评论、分享）

#### 性能标准
- [ ] 页面加载速度 < 3秒
- [ ] 移动端操作流畅
- [ ] 表单提交成功率 > 95%
- [ ] 多语言内容准确性 > 98%

#### 技术标准
- [ ] 代码符合LDCMS规范
- [ ] 数据库查询优化
- [ ] 安全性验证通过
- [ ] 跨浏览器兼容性良好

---

## 📝 开发注意事项

### 🔧 技术要求
1. **遵循LDCMS架构** - 使用现有的模型、控制器、模板结构
2. **保持向后兼容** - 不破坏现有功能
3. **代码规范** - 遵循PSR标准和FastAdmin编码规范
4. **安全考虑** - 数据验证、SQL注入防护、XSS防护

### 🌐 多语言注意事项
1. **语言包结构** - 保持与现有zh-cn.php结构一致
2. **翻译质量** - 确保专业术语翻译准确
3. **文化适应** - 考虑不同文化背景的用户习惯
4. **SEO优化** - 多语言URL结构和meta信息

### 📱 响应式设计要求
1. **移动优先** - 先设计移动端，再适配桌面端
2. **触摸友好** - 按钮大小适合手指点击
3. **加载优化** - 移动端图片和视频优化
4. **性能考虑** - 减少HTTP请求，压缩资源

### 🎨 UI设计原则
1. **一致性** - 保持整体视觉风格统一
2. **可用性** - 界面简洁，操作直观
3. **可访问性** - 考虑视觉障碍用户需求
4. **品牌一致** - 体现BiuBiu Star品牌特色

---

## 📋 总结

本开发任务计划基于对现有LDCMS系统的深度分析，将22项核心功能需求分解为具体的开发任务。通过合理的分阶段实施，可以在14.8天内完成完整项目开发。

**📋 配套文档**:
- 📄 [LDCMS数据库现状分析与任务计划补充.md](./LDCMS数据库现状分析与任务计划补充.md) - 技术架构分析与开发优化建议
- 📄 [联系合作表单配置指南.md](./联系合作表单配置指南.md) - 步骤1.2的详细操作指南

**关键优势**:
- 35%的功能通过配置即可实现，大大降低开发成本
- 基于成熟的LDCMS架构，开发风险可控
- 分阶段实施，可以快速上线MVP版本
- 详细的任务分解，便于项目管理和进度跟踪
- 现有系统基础超出预期，实际开发难度降低

**🚀 执行建议**:
1. **立即开始**: 按照阶段一的配置任务，30分钟内可完成基础框架
2. **优先级排序**: 先完成第一、二阶段任务，确保网站基本功能正常运行
3. **参考补充文档**: 遇到技术问题时查阅数据库现状分析文档
4. **逐步完善**: 再逐步完善社交功能和UI效果

**建议您现在就可以开始执行阶段一的配置任务，这些都是后台操作，立即可以看到效果。**