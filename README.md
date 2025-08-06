# biubiustar - 基于FastAdmin + LDCMS的企业网站管理系统

> 基于FastAdmin框架 + LDCMS企业网站管理系统插件构建的多语言、多模板企业网站解决方案

## 项目概述

biubiustar是一个功能完善的企业网站管理系统，采用FastAdmin作为后台管理框架，集成LDCMS企业网站管理系统插件，支持多语言、多模板的现代化企业网站解决方案。

### 🌟 项目特色

* **多语言支持**: 支持中文(zh-cn)、英文(en)、繁体中文(zh-tw)等多种语言
* **多模板系统**: 内置default、en、ldcms2024、ldcms2025等多套精美模板
* **企业级功能**: 完整的内容管理、广告管理、自定义表单、SEO优化等功能
* **移动端支持**: 响应式设计，完美支持PC、平板、手机等设备
* **API接口**: 提供完整的RESTful API，支持UniApp等移动应用开发

## 技术栈

* **后端框架**: FastAdmin (基于ThinkPHP 5.1)
* **前端框架**: Bootstrap + AdminLTE + RequireJS
* **数据库**: MySQL 5.7+
* **PHP版本**: PHP 7.4+
* **核心插件**: LDCMS企业网站管理系统 v1.4.3


## 🚀 核心功能

### 📝 内容管理系统 (LDCMS)
* **文档管理**: 支持富文本编辑、多媒体插入、SEO优化
* **分类管理**: 无限级分类、自定义URL、模板绑定
* **广告管理**: 多位置广告投放、图片/视频广告支持
* **标签管理**: 文章标签、标签云、相关内容推荐
* **友情链接**: 链接分类管理、自动检测失效链接

### 🌍 多语言系统
* **语言支持**: 中文(zh-cn)、英文(en)、繁体中文(zh-tw)
* **内容翻译**: 支持内容多语言版本管理
* **URL多语言**: 支持多语言友好URL结构
* **模板多语言**: 每种语言可配置独立模板

### 🎨 多模板系统
* **内置模板**: 
  - `default` - 默认中文模板
  - `en` - 英文模板  
  - `ldcms2024` - 2024现代化主题
  - `ldcms2025` - 2025最新主题
* **响应式设计**: 完美适配PC、平板、手机
* **模板切换**: 支持在线切换模板主题
* **自定义开发**: 支持自定义模板开发

### 🔧 自定义功能
* **自定义模型**: 灵活创建各种内容类型
* **自定义字段**: 支持文本、图片、文件、日期等多种字段类型
* **自定义表单**: 在线表单生成器，支持各种表单控件
* **数据导出**: 支持Excel、CSV等格式数据导出

### 📱 移动端支持
* **API接口**: 完整的RESTful API接口
* **UniApp支持**: 原生移动应用开发支持
* **响应式模板**: 移动端优化的用户界面
* **PWA支持**: 渐进式Web应用特性

### 🛡️ 安全与权限
* **权限管理**: 基于FastAdmin的完善权限体系
* **数据安全**: 输入过滤、SQL注入防护、XSS防护
* **访问控制**: 支持IP白名单、访问频率限制
* **安全日志**: 详细的操作日志记录

### ⚡ 性能优化
* **缓存系统**: 多级缓存机制，提升访问速度
* **CDN支持**: 静态资源CDN加速
* **图片优化**: 自动图片压缩、懒加载
* **代码优化**: 前端资源压缩、合并

## 🔧 环境要求

* **PHP版本**: PHP 7.4 或更高版本
* **数据库**: MySQL 5.7+ 或 MariaDB 10.2+
* **Web服务器**: Apache 2.4+ 或 Nginx 1.10+
* **PHP扩展**: 
  - PDO、PDO_MYSQL
  - OpenSSL
  - JSON
  - CURL
  - GD2 或 Imagick
  - BCMath

## 📦 快速安装

### 1. 下载项目
```bash
git clone https://github.com/your-username/biubiustar.git
cd biubiustar
```

### 2. 安装依赖
```bash
composer install
```

### 3. 配置环境
```bash
cp .env.sample .env
# 编辑 .env 文件，配置数据库连接信息
```

### 4. 导入数据库
```bash
# 导入FastAdmin基础数据
mysql -u用户名 -p密码 数据库名 < fastadmin.sql
# 导入LDCMS插件数据
mysql -u用户名 -p密码 数据库名 < addons/ldcms/install.sql
```

### 5. 设置权限
```bash
chmod -R 755 runtime/
chmod -R 755 public/uploads/
chmod -R 755 addons/
```

## 🌐 项目访问

### 开发环境访问地址
* **前台地址**: http://biubiustar.local/
* **后台管理**: http://biubiustar.local/SWTvGsCQjH.php
* **API接口**: http://biubiustar.local/addons/ldcms/api/

### 默认登录信息
* **管理员账号**: admin
* **管理员密码**: 123456

> ⚠️ **安全提醒**: 部署到生产环境后，请及时修改默认密码和后台入口文件名

## 📱 在线演示

* **演示地址**: https://demo.fastadmin.net
* **用户名**: admin
* **密码**: 123456

> 💡 **提示**: 演示站数据无法修改，请下载源码本地安装体验完整功能

## 📁 项目结构

```
biubiustar/
├── addons/                    # 插件目录
│   └── ldcms/                # LDCMS企业网站管理系统插件
│       ├── controller/       # 前台控制器
│       ├── model/           # 数据模型
│       ├── view/            # 模板文件
│       │   ├── default/     # 默认模板
│       │   ├── en/          # 英文模板
│       │   ├── ldcms2024/   # 2024主题
│       │   └── ldcms2025/   # 2025主题
│       ├── lang/            # 语言包
│       └── utils/           # 工具类
├── application/              # 应用目录
│   ├── admin/               # 后台管理
│   ├── api/                 # API接口
│   ├── index/               # 前台首页
│   └── common/              # 公共模块
├── public/                   # 公共资源
│   ├── assets/              # 静态资源
│   └── uploads/             # 上传文件
├── runtime/                  # 运行时目录
├── .env                      # 环境配置
└── composer.json            # 依赖管理
```

## 🎯 开发指南

### 🔧 自定义开发
* **控制器开发**: 继承 `addons\ldcms\controller\Base` 类
* **模型开发**: 使用 `fa_ldcms_` 前缀数据表
* **模板开发**: 使用 `{ldcms:}` 标签系统
* **多语言开发**: 使用 `LanguageHandler` 工具类
* **API开发**: 继承 `LdcmsApiController` 基类

### 📚 开发文档
* **FastAdmin文档**: https://doc.fastadmin.net/
* **LDCMS插件文档**: https://doc.fastadmin.net/ldcms
* **ThinkPHP文档**: https://www.kancloud.cn/manual/thinkphp5_1/

## 🤝 问题反馈

### 💬 社区支持
* **问答社区**: https://ask.fastadmin.net
* **官方QQ群**: 636393962

### 🔗 源码仓库
* **GitHub**: https://github.com/fastadminnet/fastadmin
* **Gitee**: https://gitee.com/fastadminnet/fastadmin

### 📧 联系方式
如有项目相关问题，请通过以上渠道反馈，我们会及时回复并解决。

## 🙏 特别鸣谢

感谢以下优秀的开源项目，为biubiustar项目提供了强大的技术支撑：

### 🔧 核心框架
* **[FastAdmin](https://www.fastadmin.net)** - 极速后台开发框架
* **[ThinkPHP](http://www.thinkphp.cn)** - PHP开发框架
* **[LDCMS](https://www.fastadmin.net/store/ldcms.html)** - 企业网站管理系统插件

### 🎨 前端技术
* **[AdminLTE](https://adminlte.io)** - 后台管理模板
* **[Bootstrap](http://getbootstrap.com)** - 前端UI框架
* **[jQuery](http://jquery.com)** - JavaScript库
* **[RequireJS](https://requirejs.org)** - JavaScript模块加载器

### 🧩 组件库
* **[Bootstrap-table](https://github.com/wenzhixin/bootstrap-table)** - 表格组件
* **[Nice-validator](https://validator.niceue.com)** - 表单验证
* **[SelectPage](https://github.com/TerryZ/SelectPage)** - 下拉选择组件
* **[Layer](https://layuion.com/layer/)** - 弹层组件
* **[DropzoneJS](https://www.dropzonejs.com)** - 文件上传组件

## 📄 版权信息

### 📜 开源协议
* **FastAdmin**: 遵循Apache2开源协议，提供免费使用
* **LDCMS插件**: 遵循相应的商业许可协议
* **第三方组件**: 各自遵循对应的开源协议

### 🏢 版权声明
```
biubiustar项目基于FastAdmin + LDCMS构建
FastAdmin版权所有 © 2017-2024 by FastAdmin (https://www.fastadmin.net)
项目中包含的第三方源码和二进制文件的版权信息另行标注
```

### ⚖️ 使用须知
* 本项目可用于学习、研究和商业用途
* 使用时请保留相关版权信息
* 如需商业使用LDCMS插件，请购买相应授权
* 遵守相关开源协议的使用条款

---

<div align="center">

**🌟 如果这个项目对您有帮助，请给我们一个Star！**

**💡 有问题或建议？欢迎提交Issue或PR**

Made with ❤️ by biubiustar Team

</div>
