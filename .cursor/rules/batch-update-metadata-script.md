# 批量更新规则文件元数据脚本

## 需要更新的核心规则文件清单

### ✅ 已完成增强元数据的文件:
1. ✅ `ldcms-enterprise-cms-standards.mdc` 
2. ✅ `fastadmin-multilanguage-standards.mdc`
3. ✅ `fastadmin-multitemplate-standards.mdc`

### 🔄 待更新的核心规则文件 (按优先级排序):

#### 高优先级 (立即更新)
1. `fastadmin-v5-standards.mdc` - FastAdmin基础规范
2. `thinkphp-v5-development-standards.mdc` - ThinkPHP开发规范
3. `fastadmin-security-standards.mdc` - 安全开发规范

#### 中优先级 (重要功能)
4. `bootstrap-adminlte-ui-standards.mdc` - UI开发规范
5. `fastadmin-crud-generation-standards.mdc` - CRUD生成规范
6. `fastadmin-plugin-development-standards.mdc` - 插件开发规范
7. `fastadmin-performance-optimization.mdc` - 性能优化规范

#### 低优先级 (辅助功能)
8. `ldcms-development-workflow.mdc` - LDCMS工作流
9. `ldcms-context-detection.mdc` - LDCMS上下文检测
10. `biubiustar-project-config.mdc` - 项目配置

### 📋 标准化元数据模板

每个文件都需要包含以下标准结构:
```yaml
---
# ===========================================
# 🤖 AI自动调度配置 (必需)
# ===========================================
ruleName: "规则文件标识"
description: "规则文件描述"
version: "1.0.0"
lastUpdated: "2024-12-19"

alwaysApply: false
priority: [1-10]

# ===========================================
# 🔍 智能检测配置 (核心)
# ===========================================
detection:
  keywords:
    primary: []
    secondary: []
    technical: []
  paths:
    exact: []
    pattern: []
  contexts:
    development_phase: []
    project_type: []
    user_intent: []

# ===========================================
# ⚡ 触发条件配置 (精确)
# ===========================================
triggers:
  explicit_mentions:
    exact_match: []
    fuzzy_match: []
  file_operations:
    reading: []
    editing: []
    creating: []
  code_patterns:
    namespaces: []
    functions: []
    classes: []
    comments: []
  intent_analysis:
    primary_intent: []
    secondary_intent: []
    complexity_level: []

# ===========================================
# 🔗 关联规则配置
# ===========================================
relationships:
  required_with: []
  recommended_with: []
  depends_on: ["common-rules.mdc"]

# ===========================================
# 📊 使用场景描述 (帮助AI理解)
# ===========================================
use_cases:
  primary: []
  secondary: []

# ===========================================
# 🎯 AI指令配置 (明确指导)
# ===========================================
ai_instructions:
  when_to_load: ""
  how_to_apply: ""
  priority_reason: ""
  coordination: ""

# ===========================================
# 📈 性能优化配置
# ===========================================
performance:
  preload_conditions: []
  cache_duration: "20"
  unload_conditions: []
---
```

## 更新策略

1. **优先更新核心基础规则** (FastAdmin、ThinkPHP)
2. **然后更新功能专用规则** (CRUD、插件、性能)
3. **最后更新辅助规则** (工作流、上下文检测)
4. **统一验证和测试** 所有更新后的文件