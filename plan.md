# Flutter Gems List 插件同步计划

> 记录维护原则：本文件采用累加式维护。新增数据源、插件范围、依赖安装结果、Demo 覆盖结果应追加到对应章节，不应删除既有历史记录。

更新时间：2026-05-08  
当前项目：`D:\project\flutter_application_1`

## 历史记录：pub.dev 插件 Demo 计划

更新时间：2026-05-07  
原计划主题：`pub.dev` 热门 Flutter 插件 Demo 应用。

### 历史数据来源

- 热门 UI/交互插件：来自 `pub.dev` 官方搜索结果，使用 `sdk:flutter widget`、`sdk:flutter ui`、`sdk:flutter animation` 等关键词，并按 popularity/default ranking 去重筛选。
- Flutter Favorite 插件：来自 `pub.dev` 的 `is:flutter-favorite` 查询。读取时页面显示约 73 个 Flutter Favorite 包，结果顺序可能随 pub.dev 排名变化。
- pub.dev 搜索排序参考：搜索会综合查询相关性、下载量、likes、pub points 等因素。

### 历史实施结果

- 已将项目从最初的前 50 个插件清单升级为“热门 UI/交互 + Flutter Favorite 扩展”的持续增长清单，不再限制为 100 个。
- 已生成 Demo 应用页面，支持分类筛选、搜索、热门排序卡片、详情页、安装命令、接入要点和 Demo 预览。
- 已将 Demo 预览从“按类型通用占位”升级为“按插件名优先匹配”，常见插件展示真实或贴近真实功能。
- 已新增 Demo 直接相关的热门 UI 依赖：`dotted_border`、`dropdown_button2`、`badges`、`pin_code_fields`、`confetti`、`toggle_switch`、`flutter_animate`、`auto_size_text`、`photo_view`、`loading_animation_widget`。
- 已把 Flutter Favorite 扩展中适合直接运行 Demo 的包加入依赖：`provider`、`go_router`、`intl`、`device_info_plus`、`battery_plus`、`sensors_plus`、`animated_text_kit`、`flex_color_scheme`、`flutter_slidable`、`infinite_scroll_pagination`、`video_player`。
- 已为新增依赖补充 Demo：`provider` 状态计数器、`intl` 日期/货币格式化、`animated_text_kit` 文字动效、`flutter_slidable` 列表侧滑、`flex_color_scheme` 主题预览、`infinite_scroll_pagination` 分页加载示意，以及 `google_fonts`/`font_awesome_flutter` 真实渲染 Demo。
- 已保留既有依赖：`flutter_svg`、`carousel_slider`、`qr_flutter`、`fl_chart`、`lottie`、`shimmer`、`animations`、`google_fonts`、`font_awesome_flutter` 等。

## 历史记录：Flutter Favorite 分析

Flutter Favorite 不等同于“只适合 UI Demo 的插件”。它更像 pub.dev 生态委员会认可的高质量包集合，覆盖 UI、状态管理、平台能力、Firebase、数据持久化、代码生成、路由、监控、游戏、桌面和工具链。

| 分类 | 代表插件 | Demo 策略 |
|---|---|---|
| UI/视觉/动效 | `flutter_svg`、`google_fonts`、`font_awesome_flutter`、`auto_size_text`、`flutter_animate`、`animated_text_kit`、`toggle_switch`、`flutter_slidable`、`convex_bottom_bar`、`bottom_navy_bar`、`fluent_ui`、`macos_ui`、`fluentui_system_icons` | 优先做真实 Widget Demo |
| 路由/导航 | `go_router`、`beamer`、`routemaster` | 展示路由结构、嵌套路由和参数页 |
| 状态管理 | `flutter_bloc`、`bloc`、`riverpod`、`provider`、`mobx`、`flutter_mobx`、`flutter_redux`、`redux`、`rxdart` | 用同一个计数器或购物车场景对比写法 |
| 平台能力 | `shared_preferences`、`path_provider`、`url_launcher`、`connectivity_plus`、`flutter_local_notifications`、`geolocator`、`video_player`、`sensors_plus`、`battery_plus`、`device_info_plus`、`network_info_plus`、`location`、`android_intent_plus`、`android_alarm_manager_plus` | Web 上提供降级说明，Android 模拟器或真机上做真实调用 |
| Firebase/云服务 | `firebase_core`、`firebase_auth`、`firebase_messaging`、`firebase_crashlytics`、`cloud_firestore`、`cloud_functions`、`firebase_storage` | 不强行接真实 Firebase 项目，使用配置教程和模拟状态 |
| 数据/序列化/持久化 | `sqflite`、`drift`、`hive`、`built_value`、`built_collection`、`json_serializable`、`built_value_generator`、`characters`、`intl` | 本地可运行数据结构、表格、序列化结果 Demo |
| 网络/API/生成 | `chopper`、`retrofit`、`dio`、`googleapis` | 用 mock API 面板展示请求、响应和生成流程 |
| 工具链/开发期 | `flutter_native_splash`、`flutter_launcher_icons`、`build_runner`、`freezed`、`freezed_annotation`、`mobx_codegen`、`msix`、`flutter_rust_bridge` | 教程型 Demo，展示配置文件、命令和产物 |
| 监控/反馈 | `sentry`、`sentry_flutter`、`feedback` | 使用模拟错误上报和用户反馈面板 |
| 游戏/多媒体 | `flame`、`video_player`、`just_audio`、`lottie`、`camera`、`image_picker`、`file_picker`、`mobile_scanner` | 已安装或低配置包做真实 Demo，权限重的做平台说明 |

### Flutter Favorite 遗漏核对结果

核对后发现，Flutter Favorite 中有一批包此前只写在计划里，没有进入首页 Demo 数据源。已追加到 `lib/data/plugin_catalog.dart`，当时 Demo 清单从 100+ 条扩展到 166 条。新增覆盖重点包括：

- 状态管理：`provider`、`mobx`、`flutter_mobx`、`redux`、`flutter_redux`、`rxdart`
- 路由导航：`go_router`、`beamer`、`routemaster`、`convex_bottom_bar`、`bottom_navy_bar`
- 平台能力：`shared_preferences`、`path_provider`、`url_launcher`、`connectivity_plus`、`geolocator`、`device_info_plus`、`battery_plus`、`sensors_plus`、`location`
- Firebase/云服务：`firebase_core`、`firebase_auth`、`firebase_messaging`、`cloud_firestore`、`cloud_functions`、`firebase_storage`、`firebase_crashlytics`
- 工具链/代码生成：`json_serializable`、`built_value_generator`、`mobx_codegen`、`flutter_native_splash`、`msix`、`flutter_rust_bridge`
- 多媒体/游戏/反馈：`video_player`、`flame`、`feedback`、`sentry`、`sentry_flutter`、`animated_text_kit`

需要二次核验的原因：pub.dev 搜索页是动态排序页面，读取时显示约 73 个结果，但分页和顺序可能随时间调整。后续若要完全自动同步，建议增加脚本定期读取 pub.dev API/页面并生成差异报告。

## 历史记录：已观察 Flutter Favorite 包

| 插件 | 类型 | 当前关系 | 建议动作 |
|---|---|---|---|
| `shared_preferences` | 本地存储 | 已在依赖中 | 做真实键值读写 Demo |
| `path_provider` | 平台路径 | 已在依赖中 | Android 展示目录获取，Web 显示平台限制 |
| `url_launcher` | 平台跳转 | 已在依赖中 | 做真实打开网页/邮件/电话示例 |
| `flutter_svg` | UI/图片 | 已在 Demo 清单中 | 已做真实 SVG Demo |
| `google_fonts` | UI/字体 | 已在依赖中 | 补充字体切换 Demo |
| `firebase_core` | Firebase | 已覆盖 | 教程/模拟，不接真实项目 |
| `sqflite` | 本地数据库 | 已覆盖 | Android 可做 Todo 表 Demo |
| `connectivity_plus` | 网络状态 | 已在依赖中 | 做真实网络状态读取 |
| `json_serializable` | 代码生成 | 已覆盖 | 教程型 Demo |
| `flutter_local_notifications` | 本地通知 | 已覆盖 | Android 真机/模拟器按权限做 |
| `flutter_bloc` | 状态管理 | 已在依赖中 | 做真实 Cubit 计数器 |
| `geolocator` | 定位 | 已覆盖 | 权限型 Demo |
| `firebase_messaging` | Firebase 消息 | 已观察 | 教程/模拟推送状态 |
| `riverpod` | 状态管理 | 已在依赖中 | 做真实 Riverpod 计数器 |
| `flutter_native_splash` | 启动屏工具 | 已覆盖 | 教程型 Demo |
| `firebase_auth` | Firebase 认证 | 已覆盖 | 教程/模拟登录 |
| `bloc` | 状态管理 | 已覆盖 | 与 `flutter_bloc` 合并展示 |
| `win32` | Windows FFI | 已覆盖 | Windows 平台说明 |
| `font_awesome_flutter` | UI/图标 | 已在依赖中 | 图标墙 Demo |
| `firebase_crashlytics` | 崩溃监控 | 已覆盖 | 模拟崩溃上报面板 |
| `sign_in_with_apple` | 登录 | 已观察 | 平台配置教程 |
| `infinite_scroll_pagination` | 列表分页 | 已观察 | 新增真实分页列表 Demo |
| `characters` | 文本处理 | 已观察 | Unicode 字符计数 Demo |
| `toggle_switch` | UI/输入 | 已在 Demo 清单中 | 已做真实切换 Demo |
| `sensors_plus` | 传感器 | 已观察 | Android 展示传感器读数 |
| `sentry` | 监控 | 已观察 | 模拟错误上报 |
| `animated_text_kit` | UI/动效 | 已观察 | 新增真实文字动画 Demo |
| `flutter_rust_bridge` | FFI/工具链 | 已观察 | 教程型 Demo |
| `network_info_plus` | 网络信息 | 已观察 | 平台能力 Demo |
| `cloud_functions` | Firebase 云函数 | 已观察 | 教程/mock 调用 Demo |
| `flame` | 游戏引擎 | 已观察 | 轻量小游戏场景 |
| `android_intent_plus` | Android Intent | 已观察 | Android 专属能力说明 |
| `chopper` | API client/codegen | 已观察 | mock REST client Demo |
| `flex_color_scheme` | 主题系统 | 已观察 | 主题切换 Demo |
| `mobx` | 状态管理 | 已观察 | 计数器对比 Demo |
| `battery_plus` | 电池状态 | 已观察 | Android 真实读取，Web 降级 |
| `flutter_mobx` | 状态管理 UI | 已观察 | 与 `mobx` 合并展示 |
| `googleapis` | Google API client | 已观察 | 教程/mock 请求 Demo |
| `macos_ui` | 桌面 UI | 已在 Demo 清单中 | 平台/设计系统 Demo |
| `flutter_redux` | 状态管理 | 已观察 | 与 `redux` 合并展示 |
| `built_value_generator` | 代码生成 | 已观察 | 教程型 Demo |
| `fluentui_system_icons` | UI/图标 | 已在 Demo 清单中 | 图标墙 Demo |
| `intl` | 国际化 | 已观察 | 日期/货币/语言格式化 Demo |
| `go_router` | 路由 | 已观察 | 嵌套路由 Demo |
| `device_info_plus` | 设备信息 | 已观察 | Android 真实读取设备信息 |
| `provider` | 状态管理 | 已观察 | 计数器对比 Demo |
| `video_player` | 多媒体 | 已观察 | 本地/网络视频教程型 Demo |
| `android_alarm_manager_plus` | Android 后台闹钟 | 已观察 | Android 专属教程 |
| `auto_size_text` | UI/文字 | 已在 Demo 清单中 | 已做自适应文字 Demo |
| `cloud_firestore` | Firebase 数据库 | 已观察 | 教程/模拟数据同步 |
| `built_value` | 数据模型 | 已观察 | 不可变模型 Demo |
| `flutter_animate` | UI/动效 | 已在 Demo 清单中 | 已做真实动画 Demo |
| `flutter_slidable` | UI/列表交互 | 已观察 | 侧滑操作 Demo |
| `drift` | 本地数据库 | 已覆盖 | 教程/模拟数据库表 |
| `firebase_storage` | Firebase 文件 | 已观察 | 教程/模拟上传 |
| `sentry_flutter` | Flutter 监控 | 已观察 | 模拟错误上报 |
| `built_collection` | 不可变集合 | 已观察 | 数据结构 Demo |
| `fpdart` | 函数式编程 | 已观察 | Either/Option 结果面板 |
| `msix` | Windows 打包 | 已观察 | 教程型 Demo |
| `beamer` | 路由 | 已观察 | 与路由组统一比较 |
| `feedback` | 用户反馈 | 已观察 | 反馈截图/标注模拟 Demo |
| `mobx_codegen` | 代码生成 | 已观察 | 教程型 Demo |
| `convex_bottom_bar` | UI/导航 | 已观察 | 底部导航 Demo |
| `location` | 定位 | 已观察 | 与 `geolocator` 对比说明 |
| `bottom_navy_bar` | UI/导航 | 已观察 | 底部导航 Demo |
| `rxdart` | 响应式流 | 已观察 | 输入流防抖 Demo |
| `fluent_ui` | 设计系统 | 已在 Demo 清单中 | 已有设计系统预览 |
| `redux` | 状态管理 | 已观察 | 与 `flutter_redux` 合并展示 |
| `routemaster` | 路由 | 已观察 | 与路由组统一比较 |

## 历史记录：热门 UI/交互插件基础清单

原计划包含前 100 个热门 UI/交互插件基础清单，作为 Demo 首页初始内容。为避免本文件再次变得过长且难维护，此处保留该清单的完整包名序列，详细排名和中文用途以 `lib/data/plugin_catalog.dart` 当前数据为准。

`flutter_svg`, `webview_flutter`, `carousel_slider`, `qr_flutter`, `dotted_border`, `flutter_html`, `dropdown_button2`, `badges`, `pin_code_fields`, `confetti`, `toggle_switch`, `widgetbook`, `flutter_widget_from_html_core`, `after_layout`, `animate_do`, `home_widget`, `another_flushbar`, `group_button`, `expandable_page_view`, `two_dimensional_scrollables`, `numberpicker`, `barcode_widget`, `animated_toggle_switch`, `smooth_sheets`, `resizable_widget`, `octo_image`, `oktoast`, `blur`, `blurrycontainer`, `multi_dropdown`, `multi_split_view`, `rfw`, `flutter_carousel_widget`, `flutter_markdown_plus`, `bdd_widget_test`, `delayed_display`, `shimmer_animation`, `kalender`, `auto_size_text`, `model_viewer_plus`, `flutter_animate`, `easy_stepper`, `photo_view`, `sidebarx`, `widgets_to_image`, `screenshot`, `flutter_hooks`, `floating`, `forui`, `flutter_tilt`, `animations`, `cupertino_icons`, `quick_actions`, `talker_flutter`, `flutter_form_builder`, `file_selector`, `flutter_chat_ui`, `calendar_view`, `shadcn_ui`, `macos_ui`, `settings_ui`, `liquid_glass_renderer`, `fluentui_system_icons`, `native_device_orientation`, `share_plus`, `awesome_snackbar_content`, `wechat_assets_picker`, `fluent_ui`, `flutter_quill`, `purchases_ui_flutter`, `sizer`, `responsive_framework`, `scaled_app`, `infinite_carousel`, `wechat_camera_picker`, `shadcn_flutter`, `flutter_json_view`, `material_table_view`, `responsive_builder`, `carousel_slider_plus`, `syncfusion_flutter_sliders`, `flutter_staggered_animations`, `jovial_svg`, `auto_animated`, `curved_navigation_bar`, `heroine`, `slide_countdown`, `custom_refresh_indicator`, `flutter_map_animations`, `loading_animation_widget`, `animated_size_and_fade`, `simple_animations`, `typewritertext`, `wolt_modal_sheet`, `loading_animations`, `animated_flip_counter`, `avatar_glow`, `animated_digit`, `custom_sliding_segmented_control`, `animated_bottom_navigation_bar`。

## 历史记录：Demo 页面结构

- `lib/main.dart`：应用入口、主题、首页挂载。
- `lib/models/plugin_info.dart`：插件分类、Demo 类型和插件模型。
- `lib/data/plugin_catalog.dart`：热门 UI/交互插件 + Flutter Favorite 扩展静态清单，目前已超过 100 个并可继续追加。
- `lib/screens/home_screen.dart`：搜索、分类筛选、卡片网格。
- `lib/screens/plugin_detail_screen.dart`：详情页、安装命令、接入要点、最小示例。
- `lib/demos/plugin_demo_host.dart`：按插件名优先匹配真实 Demo，未安装或平台能力类插件使用专属说明/模拟 Demo。

## 历史记录：上一轮新增插件 Demo Scope

上一轮已经新增以下插件到依赖、插件目录和详情页 Demo：

- `seam_scroll: 0.1.1`：展示底部可拖拽 sheet 与内部列表滚动的连续联动效果。
- `draggable_scrollbar: 0.1.0`：展示长列表右侧可拖拽滚动条和滚动位置标签。
- `phone_form_field: 10.0.17`：展示带国家区号、格式化和校验的手机号输入表单。
- `slinky_view: 1.1.0`：展示底部弹性展开面板，拖拽展开后继续滚动内容。

这些新增插件提供真实可交互 Demo；`draggable_scrollbar` 的重复声明只保留一份依赖。

## 历史记录：后续建议与验收命令

- 下一轮优先补齐 Flutter Favorite 中尚未进入 Demo 的高价值包：`go_router`、`provider`、`flutter_slidable`、`infinite_scroll_pagination`、`flex_color_scheme`、`animated_text_kit`、`intl`、`device_info_plus`、`battery_plus`。
- Firebase、Sentry、Apple Sign-In、Android Alarm、Intent、Camera、Location 等平台/账号/权限类插件不要强行接真实服务，保留“配置教程 + 模拟结果 + 平台权限提示”的安全模式。
- Android 模拟器如遇 Gradle 缓存损坏，需要先处理 `C:\Users\liugang\.gradle\wrapper\dists\gradle-8.12-all` 后再运行。

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
flutter run -d emulator-5554
```

## 数据来源与当前状态

- 数据来源：Flutter Gems List 分类页 `https://fluttergems.dev/list/`。
- 页面范围：Slideable List、Swipeable List、Grouped List、Alphabet List、Reorderable List、Sliver List 等列表相关 Flutter 包。
- 页面更新时间：2026-05-06。
- 本次同步范围：仅同步 `/list/` 分类页的 82 个插件，不扩展到 Flutter Gems 全站 7100+ 包。
- 当前执行状态：已完成插件包清单同步到计划；依赖安装暂缓。上一轮 `flutter pub add ...` 批量安装耗时过长并被人工中断，`pubspec.yaml` 当前未发现新增 List 批量依赖。

## 执行策略

- 先把 82 个插件写入计划，作为后续依赖安装、目录同步和 demo 开发的固定基线。
- 依赖安装不要再一次性安装几十个包，改为每批 8-12 个包执行 `flutter pub add`，每批后运行 `flutter pub get`。
- 对已存在依赖不重复添加，例如当前已有 `flutter_slidable`。
- 对解析失败、Dart `^3.9.2` 不兼容、Flutter SDK 不兼容、下架或长期无人维护的包，保留插件目录项并记录阻塞原因，demo 页面使用可运行的兼容性说明，不伪造真实 API demo。
- 对能成功安装的包，优先写真实 import/API/Widget demo。

## Dart 3.11.5 兼容性筛查结果

筛查时间：2026-05-08  
筛查方式：通过 pub.dev 官方 API 读取 82 个 Flutter Gems List 包最新版本的 `pubspec.environment.sdk`，按当前 Dart SDK `3.11.5` 判断是否可作为真实依赖。

- 兼容或初步满足 Dart 3.11.5 的包：39 个，保留在 `pubspec.yaml` 中等待 `flutter pub get` 进一步验证传递依赖。
- 不满足 Dart 3.11.5 的包：43 个，已从 `pubspec.yaml` 移除，并在下方插件表中标记为阻塞。
- 阻塞判定依据：最新版本 SDK 上限为 `<3.0.0`，或仍不支持 null safety，因此无法在 Dart `3.11.5` 项目中作为真实依赖解析。
- 注意：本筛查只判断包自身最新版本的 SDK 约束；`flutter pub get` 仍可能继续暴露传递依赖冲突或 Flutter SDK 版本约束冲突。
- 传递依赖调整：`device_info_plus` 最新版 `13.1.0` 依赖 `win32 ^6.0.1`，与项目既有 `flutter_secure_storage 10.1.0` 间接依赖的 `flutter_secure_storage_windows ^4.1.0` / `win32 ^5.5.4` 冲突；已降级为 `device_info_plus ^12.2.0`，该版本依赖 `win32 ^5.11.0`，可与现有约束相交。

不兼容并移出依赖的包：

`reorderables`, `scroll_snap_list`, `azlistview`, `sticky_grouped_list`, `infinite_listview`, `group_list_view`, `alphabet_list_scroll_view`, `sticky_and_expandable_list`, `flutter_reorderable_list`, `sticky_infinite_list`, `great_list_view`, `alphabet_scroll_view`, `circle_list`, `clickable_list_wheel_view`, `list_tile_switch`, `shaky_animated_listview`, `scroll_to_id`, `diffutil_sliverlist`, `selectable_list`, `stacked_listview`, `automatic_animated_list`, `infinite_scroll`, `item_selector`, `smooth_sort`, `extended_list`, `expandable_sliver_list`, `flutter_horizontal_featured_list`, `list_tile_more_customizable`, `flutter_text_drawable`, `scrollable_list_tabview`, `reorderableitemsview`, `multi_select_item`, `side_header_list_view`, `animated_stream_list`, `snaplist`, `animated_list_view_scroll`, `pull_to_reveal`, `marquee_flutter`, `list_wheel_scroll_view_x`, `sliver_grouped_list`, `expandable_group`, `flutter_section_list_view`, `checkbox_list_tile_more_customizable`。

## 82 个插件清单

| 序号 | 插件 | 分组 | Demo 策略 | 依赖状态 |
|---:|---|---|---|---|
| 1 | `flutter_slidable` | Swipe/Slidable | 真实 API，列表项侧滑操作 | 已在 `pubspec.yaml` |
| 2 | `scrollable_positioned_list` | Scroll/Position | 真实 API，按 index 跳转 | 待安装 |
| 3 | `grouped_list` | Grouped | 真实 API，分组列表 | 待安装 |
| 4 | `reorderables` | Reorder/Drag | 说明型 demo，拖拽排序 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 5 | `inview_notifier_list` | Visibility/List | 真实 API，可见区域监听 | 待安装 |
| 6 | `flutter_swipe_action_cell` | Swipe/Slidable | 真实 API，iOS 风格滑动操作 | 待安装 |
| 7 | `drag_and_drop_lists` | Reorder/Drag | 真实 API，双层列表拖拽 | 待安装 |
| 8 | `scroll_snap_list` | Scroll/Snap | 说明型 demo，吸附滚动列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 9 | `accordion` | Tile/Expandable | 真实 API，折叠面板列表 | 待安装 |
| 10 | `super_sliver_list` | Sliver/List | 真实 API，大列表/可变高度列表 | 待安装 |
| 11 | `azlistview` | Alphabet | 说明型 demo，A-Z 索引列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 12 | `sticky_grouped_list` | Grouped | 说明型 demo，吸顶分组列表 | 阻塞：最新版本 SDK 约束 `>=2.17.0 <3.0.0`，不满足 Dart `3.11.5` |
| 13 | `searchable_listview` | Search/List | 真实 API，搜索列表 | 待安装 |
| 14 | `indexed_list_view` | Scroll/Position | 真实 API，索引列表视图 | 待安装 |
| 15 | `infinite_listview` | Infinite/List | 说明型 demo，无限列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 16 | `animated_list_plus` | Animation/List | 真实 API，增删动画列表 | 待安装 |
| 17 | `animated_reorderable_list` | Reorder/Animation | 真实 API，动画拖拽排序 | 待安装 |
| 18 | `swipeable_tile` | Swipe/Tile | 真实 API，滑动 Tile | 待安装 |
| 19 | `group_list_view` | Grouped | 说明型 demo，分组 ListView | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 20 | `alphabet_list_scroll_view` | Alphabet | 说明型 demo，字母索引滚动 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 21 | `sticky_and_expandable_list` | Grouped/Expandable | 说明型 demo，吸顶且可展开列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 22 | `flutter_reorderable_list` | Reorder/Drag | 说明型 demo，拖拽排序列表 | 阻塞：最新版本 SDK 约束 `>=2.17.0 <3.0.0`，不满足 Dart `3.11.5` |
| 23 | `flutter_list_view` | ListView | 真实 API，增强 ListView | 待安装 |
| 24 | `transformable_list_view` | Animation/List | 真实 API，滚动变换列表 | 待安装 |
| 25 | `sticky_infinite_list` | Infinite/Sticky | 说明型 demo，吸顶无限列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 26 | `great_list_view` | ListView | 说明型 demo，高性能列表 | 阻塞：最新版本 SDK 约束 `>=2.17.0 <3.0.0`，不满足 Dart `3.11.5` |
| 27 | `flutter_cart` | List/Cart | 说明型 demo，购物车列表 | 阻塞：传递依赖冲突，`flutter_cart >=0.0.9` 依赖 `freezed ^2.4.6`，与当前 `flutter_test`/`riverpod` 引入的 `test_api`、`matcher` 版本约束冲突 |
| 28 | `alphabet_scroll_view` | Alphabet | 说明型 demo，字母滚动选择 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 29 | `circle_list` | Special/List | 说明型 demo，圆形列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 30 | `clickable_list_wheel_view` | Wheel/List | 说明型 demo，可点击滚轮列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 31 | `flutter_expanded_tile` | Tile/Expandable | 真实 API，展开 Tile | 待安装 |
| 32 | `list_tile_switch` | Tile/Input | 说明型 demo，带 switch 的 tile | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 33 | `animation_list` | Animation/List | 真实 API，列表入场动画 | 待安装 |
| 34 | `shaky_animated_listview` | Animation/List | 说明型 demo，抖动动画列表 | 阻塞：最新版本 SDK 约束 `>=2.16.1 <3.0.0`，不满足 Dart `3.11.5` |
| 35 | `flutter_story_list` | Story/List | 真实 API 或说明型 demo，故事列表 | 待安装 |
| 36 | `cupertino_listview` | Cupertino/List | 真实 API，iOS 风格列表 | 待安装 |
| 37 | `alphabet_list_view` | Alphabet | 真实 API，通讯录字母列表 | 待安装 |
| 38 | `scroll_to_id` | Scroll/Position | 说明型 demo，按 id 滚动 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 39 | `diffutil_sliverlist` | Sliver/Animation | 说明型 demo，Diff SliverList | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 40 | `grouped_scroll_view` | Grouped/Scroll | 真实 API，分组滚动视图 | 待安装 |
| 41 | `selectable_list` | Selection/List | 说明型 demo，可选列表 | 阻塞：最新版本 SDK 约束 `>=2.17.3 <3.0.0`，不满足 Dart `3.11.5` |
| 42 | `infinite_grouped_list` | Infinite/Grouped | 真实 API，无限分组列表 | 待安装 |
| 43 | `auto_animated_list` | Animation/List | 真实 API，自动动画列表 | 待安装 |
| 44 | `stacked_listview` | Special/List | 说明型 demo，堆叠列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 45 | `implicitly_animated_reorderable_list_2` | Reorder/Animation | 真实 API，隐式动画拖拽排序 | 待安装 |
| 46 | `expandable_reorderable_list` | Reorder/Expandable | 真实 API，可展开拖拽排序 | 待安装 |
| 47 | `kanban_board` | Reorder/Kanban | 说明型 demo，看板拖拽 | 阻塞：传递依赖冲突，`kanban_board >=1.0.0` 依赖 `dotted_border ^2.1.0`，当前项目使用 `dotted_border ^3.1.0` |
| 48 | `automatic_animated_list` | Animation/List | 说明型 demo，自动动画列表 | 阻塞：最新版本 SDK 约束 `>=2.15.1 <3.0.0`，不满足 Dart `3.11.5` |
| 49 | `implicitly_animated_list` | Animation/List | 真实 API，隐式动画列表 | 待安装 |
| 50 | `reorderable_staggered_scroll_view` | Reorder/Grid | 真实 API，瀑布流拖拽排序 | 待安装 |
| 51 | `infinite_scroll` | Infinite/List | 说明型 demo，无限滚动 | 阻塞：最新版本 SDK 约束 `>=2.12.1 <3.0.0`，不满足 Dart `3.11.5` |
| 52 | `item_selector` | Selection/List | 说明型 demo，条目选择器 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 53 | `smooth_list_view` | Animation/List | 真实 API，平滑列表 | 待安装 |
| 54 | `smooth_sort` | Reorder/Animation | 说明型 demo，平滑排序 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 55 | `flex_list` | Layout/List | 真实 API，弹性列表布局 | 待安装 |
| 56 | `left_scroll_actions` | Swipe/Slidable | 真实 API，左滑动作 | 待安装 |
| 57 | `extended_list` | ListView | 说明型 demo，扩展列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 58 | `slideable` | Swipe/Slidable | 真实 API 或说明型 demo，侧滑组件 | 待安装 |
| 59 | `expandable_sliver_list` | Sliver/Expandable | 说明型 demo，可展开 SliverList | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 60 | `flutter_horizontal_featured_list` | Horizontal/List | 说明型 demo，横向特色列表 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 61 | `selectable_draggable_listbox` | Selection/Reorder | 真实 API，可选可拖拽列表框 | 待安装 |
| 62 | `list_tile_more_customizable` | Tile/Input | 说明型 demo，自定义 ListTile | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 63 | `flutter_text_drawable` | Visual/List | 说明型 demo，文本头像/Drawable | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 64 | `alphabet_navigation` | Alphabet | 真实 API，字母导航条 | 待安装 |
| 65 | `flutter_slidable_panel` | Swipe/Slidable | 真实 API，滑动面板 | 待安装 |
| 66 | `responsive_flex_list` | Responsive/List | 真实 API，响应式弹性列表 | 待安装 |
| 67 | `configura_tiles` | Tile/Layout | 真实 API，可配置 Tiles | 待安装 |
| 68 | `scrollable_list_tabview` | Scroll/Tabs | 说明型 demo，列表与 tabs 联动 | 阻塞：最新版本 SDK 约束 `>=2.7.0 <3.0.0`，不满足 Dart `3.11.5` |
| 69 | `circle_wheel_scroll` | Wheel/List | 真实 API，圆形滚轮滚动 | 待安装 |
| 70 | `reorderableitemsview` | Reorder/Drag | 说明型 demo，条目拖拽排序 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 71 | `multi_select_item` | Selection/List | 说明型 demo，多选条目 | 阻塞：不支持 null safety，SDK 约束为 `>=2.7.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 72 | `side_header_list_view` | Grouped/List | 说明型 demo，侧边 header 列表 | 阻塞：不支持 null safety，SDK 约束为 `>=1.8.0 <2.0.0 or >=2.0.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 73 | `animated_stream_list` | Animation/Stream | 说明型 demo，Stream 驱动动画列表 | 阻塞：不支持 null safety，SDK 约束为 `>=2.1.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 74 | `snaplist` | Scroll/Snap | 说明型 demo，吸附列表 | 阻塞：不支持 null safety，SDK 约束为 `>=2.0.0-dev.68.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 75 | `animated_list_view_scroll` | Animation/Scroll | 说明型 demo，动画滚动列表 | 阻塞：不支持 null safety，SDK 约束为 `>=2.1.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 76 | `pull_to_reveal` | Scroll/Reveal | 说明型 demo，下拉揭示内容 | 阻塞：最新版本 SDK 约束 `>=2.1.0 <3.0.0`，不满足 Dart `3.11.5` |
| 77 | `marquee_flutter` | Animation/Text | 说明型 demo，跑马灯列表文本 | 阻塞：不支持 null safety，SDK 约束为 `>=2.0.0-dev.68.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 78 | `list_wheel_scroll_view_x` | Wheel/List | 说明型 demo，增强滚轮列表 | 阻塞：不支持 null safety，SDK 约束为 `>=2.7.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 79 | `sliver_grouped_list` | Sliver/Grouped | 说明型 demo，Sliver 分组列表 | 阻塞：最新版本 SDK 约束 `>=2.7.0 <3.0.0`，不满足 Dart `3.11.5` |
| 80 | `expandable_group` | Grouped/Expandable | 说明型 demo，展开分组 | 阻塞：最新版本 SDK 约束 `>=2.12.0 <3.0.0`，不满足 Dart `3.11.5` |
| 81 | `flutter_section_list_view` | Section/List | 说明型 demo，Section ListView | 阻塞：不支持 null safety，SDK 约束为 `>=2.1.0 <3.0.0`，当前 Dart 为 `3.11.5` |
| 82 | `checkbox_list_tile_more_customizable` | Tile/Input | 说明型 demo，自定义 CheckboxListTile | 阻塞：不支持 null safety，SDK 约束为 `>=2.1.0 <3.0.0`，当前 Dart 为 `3.11.5` |

## 建议安装批次

### 批次 1：核心且较常用

```bash
flutter pub add scrollable_positioned_list grouped_list flutter_swipe_action_cell drag_and_drop_lists scroll_snap_list accordion super_sliver_list sticky_grouped_list searchable_listview animated_reorderable_list
flutter pub get
```

### 批次 2：字母索引、分组与定位

```bash
flutter pub add azlistview group_list_view alphabet_list_scroll_view alphabet_scroll_view alphabet_list_view alphabet_navigation scroll_to_id grouped_scroll_view side_header_list_view sliver_grouped_list
flutter pub get
```

### 批次 3：拖拽排序与看板

```bash
flutter pub add reorderables flutter_reorderable_list reorderable_staggered_scroll_view reorderableitemsview expandable_reorderable_list kanban_board selectable_draggable_listbox smooth_sort
flutter pub get
```

### 批次 4：无限滚动、Sliver 与增强列表

```bash
flutter pub add indexed_list_view infinite_listview flutter_list_view sticky_infinite_list great_list_view infinite_grouped_list infinite_scroll extended_list expandable_sliver_list scrollable_list_tabview
flutter pub get
```

### 批次 5：动画列表与特殊视觉

```bash
flutter pub add animated_list_plus transformable_list_view animation_list shaky_animated_listview auto_animated_list stacked_listview automatic_animated_list implicitly_animated_list animated_stream_list animated_list_view_scroll
flutter pub get
```

### 批次 6：Tile、选择与输入

```bash
flutter pub add flutter_expanded_tile list_tile_switch selectable_list item_selector multi_select_item list_tile_more_customizable checkbox_list_tile_more_customizable configura_tiles expandable_group
flutter pub get
```

### 批次 7：低维护、特殊交互或需重点验证

```bash
flutter pub add inview_notifier_list swipeable_tile sticky_and_expandable_list flutter_cart circle_list clickable_list_wheel_view flutter_story_list cupertino_listview diffutil_sliverlist implicitly_animated_reorderable_list_2 smooth_list_view flex_list left_scroll_actions slideable flutter_horizontal_featured_list flutter_text_drawable flutter_slidable_panel responsive_flex_list circle_wheel_scroll snaplist pull_to_reveal marquee_flutter list_wheel_scroll_view_x flutter_section_list_view
flutter pub get
```

## Demo 覆盖计划

- Swipe/Slidable：列表项左滑/右滑，展示删除、归档、更多操作。
- Grouped/Alphabet：联系人或订单列表，展示 section header、sticky header、A-Z 快速索引。
- Reorder/Drag：待办列表、双层列表或 Kanban 看板，展示拖拽排序。
- Scroll/Position/Sliver：展示跳转到指定 index/id、吸附滚动、无限滚动、Sliver 列表。
- Animation/List Effects：展示插入、删除、重排、Stream 更新和滚动入场动画。
- Tile/Input：展示可展开 Tile、Switch Tile、Checkbox Tile、单选/多选 item。

## 后续验收命令

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
flutter run -d emulator-5554
```

## 注意事项

- 项目当前不是 git repo，实施依赖和 demo 改动前需要逐个文件检查，避免覆盖已有 demo。
- 计划文件已先恢复为可读 UTF-8；其他 Dart 文件里的中文乱码本轮不处理，避免无关大面积改动。
- 如果继续安装依赖，必须逐批执行并及时记录失败包，避免再次长时间卡住。
