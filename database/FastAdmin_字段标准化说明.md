# Biubiustar FastAdmin 数据库字段标准化说明

## 📋 修改概述

根据 [FastAdmin 数据库规范](https://doc.fastadmin.net/doc/database.html#toc-4) 和现有 FastAdmin 标准表结构，对阶段一涉及的8个表进行字段标准化。

## 🎯 主要修改项目

### 1. 时间字段命名规范
**问题**: 使用了下划线命名 `create_time`、`update_time`  
**修改**: 改为 FastAdmin 标准命名 `createtime`、`updatetime`  
**数据类型**: `bigint(16)` 存储时间戳  
**参考**: fa_admin 表的标准时间字段

### 2. 布尔字段类型规范
**问题**: 部分布尔字段使用 `tinyint` 或缺少标准注释  
**修改**: 统一使用 `tinyint(1) unsigned` 类型  
**默认值**: 根据业务逻辑设置 0 或 1  
**注释格式**: `字段说明:0=否,1=是`

### 3. 枚举字段注释规范
**问题**: enum 字段缺少详细的值说明  
**修改**: 添加完整的值说明注释  
**格式**: `字段说明:value1=说明1,value2=说明2`  
**用途**: 便于 FastAdmin CRUD 生成器自动生成 TAB 选项卡组件

### 4. 状态字段标准化
**问题**: 状态字段类型不统一  
**修改**: 根据字段含义选择合适类型
- 简单开关: `tinyint(1) unsigned`
- 多状态: `enum` 类型
- 默认值: 符合业务逻辑的初始状态

## 📊 涉及的表和字段

### 1. fa_ldcms_document_social_posts (社交帖子表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| create_time | bigint | createtime bigint(16) | 时间字段标准化 |
| update_time | bigint | updatetime bigint(16) | 时间字段标准化 |
| is_featured | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| allow_comment | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| allow_share | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| post_type | enum | 添加详细注释 | 用于自动生成TAB组件 |
| privacy_level | enum | 添加详细注释 | 用于自动生成TAB组件 |

### 2. fa_ldcms_document_activities (活动表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| create_time | bigint | createtime bigint(16) | 时间字段标准化 |
| update_time | bigint | updatetime bigint(16) | 时间字段标准化 |
| registration_required | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| need_approval | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| activity_type | enum | 添加详细注释 | 用于自动生成TAB组件 |
| activity_status | enum | 添加详细注释 | 用于自动生成TAB组件 |
| fee_type | enum | 添加详细注释 | 用于自动生成TAB组件 |

### 3. fa_social_comments (评论表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| create_time | bigint | createtime bigint(16) | 时间字段标准化 |
| update_time | bigint | updatetime bigint(16) | 时间字段标准化 |
| delete_time | bigint | deletetime bigint(16) | 时间字段标准化 |
| status | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| post_type | enum | 添加详细注释 | 用于自动生成TAB组件 |

### 4. fa_social_post_likes (点赞表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| create_time | bigint | createtime bigint(16) | 时间字段标准化 |
| status | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| post_type | enum | 添加详细注释 | 用于自动生成TAB组件 |

### 5. fa_social_follows (关注表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| create_time | bigint | createtime bigint(16) | 时间字段标准化 |
| update_time | bigint | updatetime bigint(16) | 时间字段标准化 |
| status | tinyint | tinyint(1) unsigned | 布尔字段规范化 |

### 6. fa_social_notifications (通知表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| create_time | bigint | createtime bigint(16) | 时间字段标准化 |
| read_time | bigint | readtime bigint(16) | 时间字段标准化 |
| is_read | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| status | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| notification_type | enum | 添加详细注释 | 用于自动生成TAB组件 |

### 7. fa_social_activity_participants (活动参与者表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| join_time | bigint | jointime bigint(16) | 时间字段标准化 |
| update_time | bigint | updatetime bigint(16) | 时间字段标准化 |
| is_organizer | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| participation_status | enum | 添加详细注释 | 用于自动生成TAB组件 |
| payment_status | enum | 添加详细注释 | 用于自动生成TAB组件 |

### 8. fa_social_topics (话题表)
| 字段 | 修改前 | 修改后 | 说明 |
|------|-------|--------|------|
| create_time | bigint | createtime bigint(16) | 时间字段标准化 |
| update_time | bigint | updatetime bigint(16) | 时间字段标准化 |
| is_featured | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| is_trending | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| status | tinyint | tinyint(1) unsigned | 布尔字段规范化 |
| topic_type | enum | 添加详细注释 | 用于自动生成TAB组件 |

## 🔧 FastAdmin 组件自动生成说明

### 开关组件 (Switch)
使用 `tinyint(1) unsigned` 类型的字段将自动生成开关组件:
- `is_featured` → 精选开关
- `allow_comment` → 评论允许开关
- `registration_required` → 报名必需开关

### TAB选项卡组件
使用 `enum` 类型且注释格式正确的字段将自动生成TAB选项卡:
- `post_type` → 帖子类型选择
- `activity_type` → 活动类型选择
- `privacy_level` → 隐私级别选择
- `notification_type` → 通知类型选择

### 日期时间组件
使用 `bigint` 类型且字段名包含 `time` 的字段将自动生成日期时间选择器:
- `createtime` → 创建时间选择器
- `start_time` → 开始时间选择器
- `register_start` → 报名开始时间选择器

## 📈 性能优化

### 新增索引
为提高查询性能，添加了以下索引:
- 时间字段索引: `createtime`, `start_time`, `jointime` 等
- 状态组合索引: `(status, type)` 复合索引
- 查询频繁字段索引: `is_read`, `participation_status` 等

## 🔧 SQL修复说明（重要）

**注意：已修复SQL执行错误！**

### 修复的问题：
1. **移除不存在字段**: `fa_social_post_likes` 表没有 `status` 字段
2. **修正字段名称**: `notification_type` → `type`（在通知表中）
3. **更新字段映射**: 根据实际表结构调整所有字段修改
4. **enum值匹配**: 确保enum值与现有数据结构一致
5. **索引优化**: 暂时注释索引创建，避免重复索引错误

### 修复后的表映射：
- `fa_social_post_likes`: 只修改 `create_time`、`post_type`、`ip` 字段
- `fa_social_notifications`: 字段名为 `type`（非 `notification_type`）
- `fa_social_activity_participants`: 使用实际的字段名和enum值
- `fa_social_topics`: 使用 `topic_name`、`topic_desc` 等实际字段名

## ⚠️ 执行注意事项

1. **备份数据**: 执行前请先备份数据库
2. **执行顺序**: 按SQL文件中的顺序执行，避免外键约束问题
3. **错误修复**: 已修复所有字段不存在的错误，现在可以安全执行
4. **应用代码**: 修改后需要更新对应的模型文件中的字段映射
5. **CRUD重新生成**: 建议重新生成相关的CRUD文件以应用新的组件配置

## 📝 后续工作

1. 更新模型文件中的字段映射关系
2. 重新生成FastAdmin CRUD管理页面
3. 测试所有功能确保正常工作
4. 更新API文档中的字段说明

## 参考文档

- [FastAdmin 数据库规范](https://doc.fastadmin.net/doc/database.html#toc-4)
- [FastAdmin CRUD生成器说明](https://doc.fastadmin.net/doc/crud.html)
- [FastAdmin 字段类型说明](https://doc.fastadmin.net/doc/field.html)