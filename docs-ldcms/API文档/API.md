# API

LDCMS企业网站管理系统提供了API接口，在接入API时强烈建议**开启认证**并设置密钥。

![API配置](image.png)

## API认证配置

### 设置密钥

在系统配置中配置API认证信息：

- **API Appid**：建议填写6~32位的任意字符
- **Api Secret**：建议填写6~32位的任意字符

### UNIAPP上配置

在uniapp文件下找到 `common/config.js` 文件进行配置：

![UNIAPP配置](image.png)

- **domain** 表示 api请求的域名
- 更多uniapp配置请参考：https://doc.fastadmin.net/ldcms/2185.html

## 接口使用

### 认证机制

客户端发起请求必须包含以下三个参数：
- **appid**（认证用户）
- **timestamp**（时间戳）  
- **signature**（签名）

### 签名生成

签名参数signature通过appid、secret、timestamp三个值连接为一个字符串，然后进行双层md5加密生成：

```
signature = md5(md5(appid + secret + timestamp))
```

### 使用示例

#### Uniapp请求拦截器示例

```javascript
// 请求拦截
uni.$u.http.interceptors.request.use((config) => {
    // 可使用async await 做异步操作
    let timesamp = Date.parse(new Date()) / 1000;
    
    //后台设置的API Appid
    config.header['appid'] = vm.$setting.api_appid;
    
    //时间戳
    config.header['timestamp'] = timesamp;
    
    //signature
    config.header['signature'] = vm.$md5(vm.$md5(vm.$setting.api_appid + vm.$setting.api_secret + timesamp));
    
    return config;
}, config => {
    // 可使用async await 做异步操作
    return Promise.reject(config);
});
```

#### HTML页面AJAX示例

```javascript
$('.more').click(function() {
    var url = '/addons/ldcms/api.v1/lists';
    
    $.ajax({
        type: 'get',
        url: url,
        dataType: 'json',
        data: {
            cid: '145',
            limit: '8'
        },
        beforeSend: function(XMLHttpRequest) {
            XMLHttpRequest.setRequestHeader("appid", "{$ld.appid}");
            XMLHttpRequest.setRequestHeader("timestamp", "{$ld.timestamp}");
            XMLHttpRequest.setRequestHeader("signature", "{$ld.signature}");
        },
        success: function(response, status) {
            if (response.code) {
                //获取数据成功
                alert('获取数据成功');
            } else {
                //返回错误数据
                alert('返回错误数据');
            }
        },
        error: function(xhr, status, error) {
            //返回数据异常
            alert('返回数据异常');
        }
    });
});
```

## API接口列表

### 获取配置

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/config`
**请求方法：** GET

获取网站基本配置信息，如站点标题、关键词、描述等。

---

### 获取导航

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/nav`
**请求方法：** GET

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| pid | 否 | 父栏目ID，不填写默认为0，则调用顶级栏目 |
| limit | 否 | 调用数量 |

#### 返回数据

返回网站导航栏目数据，包含栏目名称、链接、子栏目等信息。

---

### 获取指定分类或子类

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/category`
**请求方法：** GET

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| cid | 否 | 需要获取的栏目ID 与 pid 二选一填写 |
| pid | 否 | 父栏目ID |
| limit | 否 | 调用数量 |

#### 使用说明

- cid参数用于获取指定栏目的详细信息
- pid参数用于获取指定父栏目下的子栏目列表
- cid和pid参数二选一填写

---

### 获取幻灯片

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/ad`
**请求方法：** GET

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| name | 是 | 填写后台对应的幻灯片类型 |

#### 使用说明

根据幻灯片类型名称获取对应的轮播图数据，包含图片URL、标题、链接等信息。

---

### 获取内容列表

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/lists`
**请求方法：** GET

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| cid | 是 | 所属栏目的ID |
| limit | 否 | 调用数量（不填写默认获取16条） |

#### 使用说明

获取指定栏目下的内容列表，支持分页和数量限制。

---

### 获取单页内容

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/content`
**请求方法：** GET

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| cid | 是 | 所属栏目的ID |

#### 使用说明

获取单页栏目的内容，如关于我们、联系我们等页面内容。

---

### 获取内容详情

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/detail`
**请求方法：** GET

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| id | 是 | 内容ID |

#### 使用说明

根据内容ID获取文章或产品的详细信息。

---

### 友情链接

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/links`
**请求方法：** GET

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| name | 是 | 填写后台对应的友情链接类型 |

#### 使用说明

根据友情链接类型获取对应的链接列表。

---

### 提交表单

**接口地址：** `http://www.yoursite.com/addons/ldcms/api.v1/diyform/type/表单名称`
**请求方法：** POST

#### 请求参数

| 参数 | 必需 | 描述 |
|------|------|------|
| type | 是 | 填写后台对应的表单名称 |
| ... | 是 | 填写后台表单字段 |

#### 使用说明

提交自定义表单数据，表单字段根据后台配置的表单结构确定。

## API响应格式

### 成功响应

```json
{
    "code": 1,
    "msg": "成功",
    "data": {
        // 具体数据内容
    },
    "time": "1647858476"
}
```

### 错误响应

```json
{
    "code": 0,
    "msg": "错误信息",
    "data": null,
    "time": "1647858476"
}
```

## 错误代码说明

| 错误码 | 说明 | 解决方案 |
|--------|------|----------|
| 10001 | 缺少appid参数 | 请在请求头中添加appid |
| 10002 | 缺少timestamp参数 | 请在请求头中添加timestamp |
| 10003 | 缺少signature参数 | 请在请求头中添加signature |
| 10004 | 签名验证失败 | 请检查签名生成算法 |
| 10005 | 时间戳过期 | 请使用当前时间戳 |
| 20001 | 栏目不存在 | 请检查栏目ID是否正确 |
| 20002 | 内容不存在 | 请检查内容ID是否正确 |
| 30001 | 参数错误 | 请检查请求参数 |

## 使用建议

### 安全建议

1. **启用认证**：生产环境必须启用API认证
2. **保护密钥**：不要在前端代码中暴露API密钥
3. **HTTPS传输**：使用HTTPS协议保护数据传输
4. **频率限制**：避免过于频繁的API调用

### 性能优化

1. **缓存策略**：对不经常变化的数据进行缓存
2. **分页加载**：大量数据使用分页方式加载
3. **字段筛选**：只请求需要的字段数据
4. **错误处理**：实现完善的错误处理机制

### 开发建议

1. **接口文档**：详细阅读API文档
2. **参数验证**：客户端做好参数验证
3. **异常处理**：处理网络异常和服务器错误
4. **数据校验**：验证返回数据的完整性

---
*文档最后更新时间：2024-02-06*