# Tags标签

> 用于展现网站所有内容的tags标签，有利于seo
> tags标签的排序是根据tags被使用的频率由多到少来排的。
> tags列表对应模板文件中的"tag.html"文件

## 基本使用方法

```html
//id 与 cid 二选一填写 
{ld:tags id="$content['id']" cid="$category['id']" limit='16'}
<a href="{$item.url}">{$item.title}</a>
{/ld:tags}
```

## 调用参数

| 参数 | 是否必填 | 说明 |
|------|----------|------|
| cid | 否 | 栏目id (用于获取指定栏目下所有文档的tags) |
| id | 否 | 文档内容的id (用于调用单个文档的tags) |
| limit | 否 | 调用数量（不填写默认获取16条） |
| alias | 否 | 默认为"item",代表循环列表的变量名称。 |
| empty | 否 | 数列为空时显示的数据 |
| key | 否 | 列表循环键名变量,默认为i |
| mod | 否 | 取模值，常用于控制换行，默认为2 |

## 调用字段

> 默认为`{$item.id}` 如果`alias`修改别名为'vo', 那么则变成`{$vo.id}`

| 字段名 | 说明 |
|--------|------|
| `{$item.url}` | 链接 |
| `{$item.title}` | 标题 |
| `{$item.name}` | 名称 |

## 在内容详情页中调用

```html
{ld:tags id="$content['id']"}
<a href="{$item.url}">{$item.title}</a>
{/ld:tags}
```

> Tags的url会自动跳转到tag的列表页，也就是模板`tag.html`
> 在模板页里，我们可以调用`{ld:list}{/ld:list}`标签来显示对应的文档内容。

## 在tag.html列表页中调用

```html
<!-- 通过$tag变量来获取，相关tags的内容 -->
{ld:list cid='0' tags='$tag' }
<a href="{$item.url}" title="{$item.title}">
    <img src="{$item.thumb}" alt="{$item.title}" />
</a>
<a href="{$item.url}" title="{$item.title}">
    {$item.title}
</a>
<i>{$item.description}</i>
{/ld:list}
```

## 实际应用示例

### 1. 文章详情页标签
```html
<div class="article-tags">
    <h4>相关标签：</h4>
    <div class="tags-list">
        {ld:tags id="$content['id']"}
        <a href="{$item.url}" class="tag-item">
            <i class="fas fa-tag"></i>
            {$item.title}
        </a>
        {else}
        <span class="no-tags">暂无标签</span>
        {/ld:tags}
    </div>
</div>
```

### 2. 栏目页标签云
```html
<div class="tags-cloud">
    <h3>热门标签</h3>
    <div class="cloud-container">
        {ld:tags cid="$category['id']" limit="20"}
        <a href="{$item.url}" 
           class="tag-cloud-item" 
           style="font-size: {$item.weight|default=14}px;">
            {$item.title}
        </a>
        {/ld:tags}
    </div>
</div>
```

### 3. 侧边栏标签展示
```html
<div class="sidebar-tags">
    <div class="widget">
        <h4 class="widget-title">标签云</h4>
        <div class="widget-content">
            {ld:tags limit="15"}
            <a href="{$item.url}" class="sidebar-tag">
                {$item.title}
                <span class="tag-count">({$item.count|default=0})</span>
            </a>
            {/ld:tags}
        </div>
    </div>
</div>
```

### 4. 标签列表页面
```html
<div class="tag-list-page">
    <div class="page-header">
        <h1>标签：{$tag}</h1>
        <p class="tag-description">与"{$tag}"相关的所有内容</p>
    </div>
    
    <div class="tag-content">
        {ld:list cid='0' tags='$tag' limit="12" page="true"}
        <article class="content-item">
            <div class="item-image">
                <a href="{$item.url}">
                    <img src="{$item.image|default='__ADDON__/images/default.jpg'}" 
                         alt="{$item.title}">
                </a>
            </div>
            <div class="item-content">
                <h3 class="item-title">
                    <a href="{$item.url}">{$item.title}</a>
                </h3>
                <p class="item-summary">{$item.seo_description}</p>
                <div class="item-meta">
                    <span class="item-date">{$item.show_time|date="Y-m-d",###}</span>
                    <span class="item-views">{$item.visits}次浏览</span>
                </div>
            </div>
        </article>
        {else}
        <div class="no-content">
            <p>暂无相关内容</p>
        </div>
        {/ld:list}
    </div>
    
    <div class="pagination">
        {$pages}
    </div>
</div>
```

### 5. 相关标签推荐
```html
<div class="related-tags">
    <h4>相关标签</h4>
    <div class="related-tags-list">
        {ld:tags id="$content['id']"}
        <span class="current-tag">{$item.title}</span>
        {/ld:tags}
        
        {ld:tags cid="$content['cid']" limit="8"}
        <a href="{$item.url}" class="related-tag">
            {$item.title}
        </a>
        {/ld:tags}
    </div>
</div>
```

### 6. 标签筛选器
```html
<div class="tag-filter">
    <h3>按标签筛选</h3>
    <div class="filter-tags">
        <a href="{:addon_url('ldcms/index/index')}" 
           class="filter-tag {if !$tag}active{/if}">
            全部
        </a>
        {ld:tags cid="$category['id']" limit="10"}
        <a href="{$item.url}" 
           class="filter-tag {if $tag==$item.title}active{/if}">
            {$item.title}
        </a>
        {/ld:tags}
    </div>
</div>
```

### 7. 热门标签排行
```html
<div class="hot-tags">
    <h3>热门标签排行</h3>
    <ol class="hot-tags-list">
        {ld:tags limit="10"}
        <li class="hot-tag-item">
            <span class="tag-rank">{$i}</span>
            <a href="{$item.url}" class="tag-name">
                {$item.title}
            </a>
            <span class="tag-count">{$item.count|default=0}篇</span>
        </li>
        {/ld:tags}
    </ol>
</div>
```

### 8. 响应式标签云
```html
<div class="responsive-tag-cloud">
    <div class="tag-cloud-header">
        <h3>标签云</h3>
        <button class="expand-toggle" onclick="toggleTagCloud()">
            <span class="toggle-text">展开</span>
            <i class="fas fa-chevron-down"></i>
        </button>
    </div>
    
    <div class="tag-cloud-content" id="tagCloudContent">
        {ld:tags limit="30"}
        <a href="{$item.url}" 
           class="responsive-tag"
           data-weight="{$item.weight|default=1}">
            {$item.title}
        </a>
        {/ld:tags}
    </div>
</div>

<script>
function toggleTagCloud() {
    const content = document.getElementById('tagCloudContent');
    const toggle = document.querySelector('.expand-toggle');
    const text = toggle.querySelector('.toggle-text');
    const icon = toggle.querySelector('i');
    
    if (content.classList.contains('expanded')) {
        content.classList.remove('expanded');
        text.textContent = '展开';
        icon.style.transform = 'rotate(0deg)';
    } else {
        content.classList.add('expanded');
        text.textContent = '收起';
        icon.style.transform = 'rotate(180deg)';
    }
}

// 根据权重设置标签大小
document.addEventListener('DOMContentLoaded', function() {
    const tags = document.querySelectorAll('.responsive-tag');
    tags.forEach(function(tag) {
        const weight = parseInt(tag.dataset.weight) || 1;
        const fontSize = Math.min(Math.max(12 + weight * 2, 12), 24);
        tag.style.fontSize = fontSize + 'px';
    });
});
</script>
```

## CSS样式参考

```css
/* 基础标签样式 */
.tags-list {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-top: 10px;
}

.tag-item {
    display: inline-flex;
    align-items: center;
    padding: 4px 12px;
    background: #f8f9fa;
    color: #495057;
    text-decoration: none;
    border-radius: 15px;
    font-size: 14px;
    transition: all 0.3s;
}

.tag-item:hover {
    background: #007bff;
    color: white;
    transform: translateY(-1px);
}

.tag-item i {
    margin-right: 4px;
    font-size: 12px;
}

/* 标签云样式 */
.tags-cloud {
    background: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    margin: 20px 0;
}

.cloud-container {
    text-align: center;
    line-height: 2;
}

.tag-cloud-item {
    display: inline-block;
    margin: 4px 8px;
    padding: 2px 8px;
    color: #007bff;
    text-decoration: none;
    border-radius: 3px;
    transition: all 0.3s;
}

.tag-cloud-item:hover {
    background: #007bff;
    color: white;
}

/* 侧边栏标签样式 */
.sidebar-tags .widget {
    background: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.widget-title {
    margin: 0 0 15px 0;
    color: #333;
    font-size: 18px;
    border-bottom: 2px solid #007bff;
    padding-bottom: 8px;
}

.sidebar-tag {
    display: inline-block;
    margin: 3px 5px;
    padding: 3px 8px;
    background: #e9ecef;
    color: #495057;
    text-decoration: none;
    border-radius: 10px;
    font-size: 13px;
}

.sidebar-tag:hover {
    background: #007bff;
    color: white;
}

.tag-count {
    font-size: 11px;
    opacity: 0.7;
}

/* 热门标签排行样式 */
.hot-tags-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.hot-tag-item {
    display: flex;
    align-items: center;
    padding: 8px 0;
    border-bottom: 1px solid #eee;
}

.tag-rank {
    width: 24px;
    height: 24px;
    background: #007bff;
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    font-weight: bold;
    margin-right: 10px;
}

.tag-name {
    flex: 1;
    color: #333;
    text-decoration: none;
}

.tag-name:hover {
    color: #007bff;
}

.tag-count {
    font-size: 12px;
    color: #999;
}

/* 响应式标签云 */
.responsive-tag-cloud {
    border: 1px solid #dee2e6;
    border-radius: 8px;
    overflow: hidden;
}

.tag-cloud-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    background: #f8f9fa;
    border-bottom: 1px solid #dee2e6;
}

.expand-toggle {
    background: none;
    border: none;
    display: flex;
    align-items: center;
    cursor: pointer;
    color: #007bff;
}

.expand-toggle i {
    margin-left: 5px;
    transition: transform 0.3s;
}

.tag-cloud-content {
    padding: 20px;
    max-height: 120px;
    overflow: hidden;
    transition: max-height 0.3s;
}

.tag-cloud-content.expanded {
    max-height: none;
}

.responsive-tag {
    display: inline-block;
    margin: 3px 6px;
    padding: 4px 10px;
    background: #f8f9fa;
    color: #495057;
    text-decoration: none;
    border-radius: 12px;
    transition: all 0.3s;
}

.responsive-tag:hover {
    background: #007bff;
    color: white;
}

/* 响应式设计 */
@media (max-width: 768px) {
    .tags-list {
        gap: 6px;
    }
    
    .tag-item {
        padding: 3px 8px;
        font-size: 12px;
    }
    
    .tag-cloud-header {
        padding: 10px 15px;
    }
    
    .tag-cloud-content {
        padding: 15px;
    }
    
    .hot-tag-item {
        padding: 6px 0;
    }
}
```

---

*文档最后更新时间：2024-04-03 15:10:08*
*著作权归应用插件开发者所有，未经许可，禁止转载、复制此文档的任何内容。*