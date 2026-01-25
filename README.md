教务管理系统（edu-management-system）
基于 OpenHarmony 生态开发的轻量级教务管理鸿蒙应用，聚焦院校日常教务场景，提供课表管理、成绩查询、学生信息管理等核心功能，适配鸿蒙多设备部署特性，满足院校轻量化教务办公需求。
项目简介
本项目是面向院校的鸿蒙原生教务管理应用，基于 OpenHarmony API 规范开发，覆盖学生、教师、管理员三类角色的核心教务操作：
学生端：课表查看、成绩查询、个人信息维护；
教师端：课程信息发布、成绩录入；
管理员端：学生 / 教师信息管理、权限配置。
项目遵循鸿蒙应用开发规范，采用模块化、组件化设计，具备低耦合、易扩展、多设备适配的特点。
技术栈
开发框架：OpenHarmony（API Version 9/10，以 entry 模块实际配置为准）
构建工具：Hvigor（鸿蒙专属构建工具）
开发语言：ArkTS（鸿蒙主流开发语言）
组件库：鸿蒙原生 UI 组件（Text、List、Form、Navigator 等）
配置工具：oh-package.json5（包依赖管理）、build-profile.json5（构建配置）
环境要求
开发工具：DevEco Studio 4.0+
OpenHarmony SDK：API Version 9/10（需与 entry 模块配置一致）
Node.js：16.x+（适配鸿蒙工具链依赖）
运行环境：OpenHarmony 模拟器（API 9/10）或鸿蒙真机设备
操作系统：Windows 10+/macOS 12+（支持 DevEco Studio 运行）
快速开始
1. 克隆项目
bash
运行
git clone https://github.com/aiaod1009/edu-management-system.git
cd edu-management-system
2. 安装依赖
项目依赖通过 Hvigor 工具自动安装，打开 DevEco Studio 后执行：
bash
运行
# 项目根目录执行
hvigorw install
# 或进入entry模块执行
cd entry
hvigorw install
3. 项目配置
打开 DevEco Studio，导入edu-management-system项目；
检查entry/build-profile.json5：确认 API Version、编译模式（debug/release）、应用包名；
核对entry/oh-package.json5：确认依赖版本与本地 SDK 匹配；
配置模拟器 / 真机：连接 OpenHarmony 模拟器（API 9/10）或鸿蒙真机（开启开发者模式）。
项目结构（核心目录）
plaintext
edu-management-system/
├── AppScope/                # 应用全局配置
│   ├── app.json5            # 应用名称、权限、设备类型等全局配置
│   └── resources/           # 全局资源（应用图标、多语言、主题）
├── entry/                   # 应用主入口模块（核心业务代码）
│   ├── src/main/            # 主代码目录
│   │   ├── ets/             # ArkTS业务代码
│   │   │   ├── entryability/ # 应用入口能力（生命周期管理）
│   │   │   ├── pages/       # 页面目录（核心业务页面）
│   │   │   │   ├── login/   # 登录页面
│   │   │   │   ├── student/ # 学生端页面（课表、成绩）
│   │   │   │   ├── teacher/ # 教师端页面（课程、成绩录入）
│   │   │   │   └── admin/   # 管理员端页面（信息管理）
│   │   │   ├── components/  # 通用组件（按钮、列表、表单）
│   │   │   ├── model/       # 数据模型（学生、课程、成绩实体）
│   │   │   └── util/        # 工具类（数据解析、存储、权限）
│   │   ├── resources/       # 模块级资源（页面样式、图片、字符串）
│   │   └── module.json5     # 模块配置（页面路由、权限、入口）
│   ├── build-profile.json5  # entry模块构建配置
│   ├── oh-package.json5     # entry模块依赖配置
│   └── hvigorfile.ts        # 模块构建脚本
├── .gitignore               # Git忽略配置
└── README.md                # 项目说明
