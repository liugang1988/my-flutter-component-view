# My Flutter Component View

一个用于浏览、检索和演示 Flutter 组件/插件的 Demo 应用。

项目目标不是做一个静态插件列表，而是把 pub.dev 上常见的 UI、交互、平台能力、Flutter Favorite、Flutter Gems 列表类插件整理成一个可运行、可扩展、可逐步完善的组件预览工程。每个插件都有自己的 Demo 文件，后续新增插件时可以按插件名直接扩展。

## 当前能力

- 支持插件搜索、分类筛选和卡片式浏览。
- 支持插件详情页，包含说明、标签、安装命令、接入要点和 Demo 预览。
- 已整理热门 UI/交互插件、Flutter Favorite 插件和一批列表/滚动类 Flutter Gems 插件。
- `lib/demos/plugin_demos/` 下已有 171 个 Demo 相关文件。
- 已将 Demo 拆分为“一个插件一个文件”，避免单个文件持续膨胀。
- 部分插件使用真实 API 演示，部分平台/权限/账号/代码生成类插件使用可运行的接入说明或模拟 Demo。

## 项目结构

```text
lib/
  main.dart
  data/
    plugin_catalog.dart          # 插件目录数据
  models/
    plugin_info.dart             # 插件模型、分类、Demo 类型
  screens/
    home_screen.dart             # 首页搜索、筛选、卡片网格
    plugin_detail_screen.dart    # 插件详情页
  demos/
    plugin_demo_host.dart        # Demo 分发入口
    plugin_demos/
      generic_demo.dart          # 通用说明/平台能力/兜底 Demo
      generated_registry.dart    # 批量生成 Demo 的注册表
      flutter_svg.dart
      provider.dart
      intl.dart
      flutter_slidable.dart
      ...
```

## Demo 文件规范

每个插件 Demo 使用插件名作为文件名：

```text
lib/demos/plugin_demos/<plugin_name>.dart
```

例如：

```text
lib/demos/plugin_demos/flutter_svg.dart
lib/demos/plugin_demos/qr_flutter.dart
lib/demos/plugin_demos/provider.dart
lib/demos/plugin_demos/flutter_slidable.dart
```

新增插件时推荐流程：

1. 在 `lib/data/plugin_catalog.dart` 添加插件信息。
2. 新建 `lib/demos/plugin_demos/<plugin_name>.dart`。
3. 如果是真实 Demo，在 `plugin_demo_host.dart` 中添加 import 和 switch 分发。
4. 如果是批量生成的说明型 Demo，可走 `generated_registry.dart`。
5. 执行格式化和检查。

## Demo 类型策略

### 真实 Widget/API Demo

适合直接在 Flutter 页面里运行的插件会优先使用真实 API，例如：

- `flutter_svg`
- `qr_flutter`
- `carousel_slider`
- `dropdown_button2`
- `badges`
- `pin_code_fields`
- `confetti`
- `toggle_switch`
- `provider`
- `intl`
- `animated_text_kit`
- `flutter_slidable`
- `fl_chart`
- `photo_view`
- `loading_animation_widget`
- `shimmer`
- `auto_size_text`
- `flutter_animate`

### 平台能力 Demo

需要 Android/iOS/Desktop 权限、系统服务、Manifest/Info.plist 或真机能力的插件不会强行做不完整调用，而是提供平台说明或模拟状态，例如：

- `device_info_plus`
- `battery_plus`
- `sensors_plus`
- `video_player`
- `geolocator`
- `location`
- `flutter_local_notifications`
- `webview_flutter`
- `share_plus`
- `file_selector`

### 账号/云服务/代码生成类 Demo

Firebase、Sentry、Apple 登录、代码生成和构建工具类插件默认使用教程型或模拟 Demo，避免要求本地必须配置第三方账号或生成流程：

- `firebase_core`
- `firebase_auth`
- `firebase_messaging`
- `cloud_firestore`
- `firebase_storage`
- `sentry_flutter`
- `sign_in_with_apple`
- `json_serializable`
- `built_value_generator`
- `flutter_native_splash`
- `msix`

## 运行项目

安装依赖：

```bash
flutter pub get
```

Web 运行：

```bash
flutter run -d chrome
```

Android 模拟器运行：

```bash
flutter devices
flutter run -d emulator-5554
```

如果设备 ID 不是 `emulator-5554`，请替换为 `flutter devices` 中显示的设备 ID。

## 常用开发命令

格式化：

```bash
dart format lib test
```

静态检查：

```bash
flutter analyze
```

测试：

```bash
flutter test
```

Web 构建：

```bash
flutter build web
```

## 热更新

当应用已经通过 `flutter run` 启动后：

```text
r  热更新
R  热重启
q  退出运行
```

新增依赖后通常需要先执行：

```bash
flutter pub get
```

然后使用 `R` 热重启，必要时重新运行应用。

## 已知问题

### Android Gradle 缓存损坏

如果 Android 模拟器运行时报：

```text
java.util.zip.ZipException: zip END header not found
at org.gradle.wrapper.Install.unzip
```

通常是本机 Gradle wrapper 下载缓存损坏。可以清理对应缓存后重新运行：

```powershell
$gradleDist = "$env:USERPROFILE\.gradle\wrapper\dists\gradle-8.12-all"
Remove-Item -Recurse -Force $gradleDist
flutter run -d emulator-5554
```

如果 Windows 提示目录非空或路径过长，需要先关闭 Java/Gradle 进程，或使用长路径方式删除。

### Flutter Web 字体加载

Web 运行时如果看到类似：

```text
Failed to load font Roboto at https://fonts.gstatic.com/...
```

通常是网络无法访问 Google Fonts。Flutter Web 会 fallback 到可用字体，不影响主要功能。

## Git 说明

当前工作区曾遇到 Windows ACL 导致 `.git` 初始化失败的问题，因此使用 `gitmeta/` 作为 Git 元数据目录，并已在 `.gitignore` 中忽略：

```text
gitmeta/
```

如果重新克隆 GitHub 仓库，正常情况下会使用标准 `.git` 目录，不需要关心本地 `gitmeta/`。

远端仓库：

[https://github.com/liugang1988/my-flutter-component-view](https://github.com/liugang1988/my-flutter-component-view)

## 后续方向

- 将更多说明型 Demo 升级为真实 API Demo。
- 为平台能力插件补充 Android/iOS 权限状态、失败态和真机验证说明。
- 增加插件来源标记，例如 Flutter Favorite、Flutter Gems、热门 UI、平台能力。
- 增加自动同步脚本，从 pub.dev 或维护清单生成新增插件差异。
- 增加截图测试或 golden test，保证 Demo 页面长期可维护。
