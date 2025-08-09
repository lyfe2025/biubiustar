# biubiustar 专用规则检测测试

## 测试目的
验证 `biubiustar-project-specific-standards.mdc` 能够被智能规则调度系统正确识别和自动加载。

## 测试场景

### 场景1：项目路径触发
- **测试输入**: 工作空间路径包含 `/biubiustar`
- **预期结果**: 自动加载 `biubiustar-project-specific-standards.mdc`

### 场景2：数据库操作触发
- **测试输入**: "我需要用MCP操作MySQL数据库"
- **预期结果**: 
  - 自动加载 `biubiustar-project-specific-standards.mdc`
  - 强制执行备份检查
  - 应用数据库操作规范

### 场景3：日志问题排查触发
- **测试输入**: "遇到了一个错误，需要查看日志"
- **预期结果**:
  - 自动加载 `biubiustar-project-specific-standards.mdc`
  - 引导检查 `/runtime/log/` 目录

### 场景4：LDCMS相关操作触发
- **测试输入**: "需要修改LDCMS的模板功能"
- **预期结果**:
  - 自动加载 `biubiustar-project-specific-standards.mdc` (P0优先级)
  - 同时加载 `ldcms-enterprise-cms-standards.mdc`

## 触发关键词测试清单

### ✅ 应该触发的关键词
- [x] `biubiustar`
- [x] `MySQL`, `mysql`, `数据库`
- [x] `MCP`, `mcp`
- [x] `日志`, `log`, `错误`, `error`
- [x] `LDCMS`, `ldcms`, `FastAdmin`, `fastadmin`
- [x] `ThinkPHP`, `thinkphp`
- [x] `备份`, `backup`
- [x] `runtime/log`

### ❌ 不应该误触发的关键词
- [ ] 纯技术问答（如"PHP语法问题"）
- [ ] 其他项目名称
- [ ] 通用开发问题

## 验证步骤

1. **路径检测验证**
   ```bash
   # 当前工作目录应包含 biubiustar
   pwd  # /Volumes/wwx/dev/WebProjects/biubiustar
   ```

2. **规则文件存在性验证**
   ```bash
   ls -la .cursor/rules/biubiustar-project-specific-standards.mdc
   ```

3. **内容完整性验证**
   - 包含智能触发条件
   - 包含项目特定的MySQL配置
   - 包含日志路径和数据库备份规范

## 预期行为

当用户提到任何相关关键词时，系统应该：

1. **立即识别** → `🎯 项目检测: biubiustar → 自动加载 biubiustar-project-specific-standards.mdc (P0优先级)`
2. **强制应用** → 数据库操作前备份、日志检查优先
3. **集成其他规则** → 与技术栈相关规则协同工作
4. **用户透明** → 用户无需知道规则切换，但获得项目定制化的帮助

## 成功标准

- ✅ 规则文件能被自动识别
- ✅ P0优先级生效
- ✅ 数据库操作自动应用备份要求
- ✅ 日志问题自动引导到正确路径
- ✅ 与其他规则文件协同工作
- ✅ 用户体验无缝切换