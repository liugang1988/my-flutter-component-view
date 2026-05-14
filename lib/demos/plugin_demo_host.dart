import 'package:flutter/material.dart';

import '../models/plugin_info.dart';
import 'plugin_demos/animated_text_kit.dart' as animated_text_kit_demo;
import 'plugin_demos/animated_bottom_navigation_bar.dart'
    as animated_bottom_navigation_bar_demo;
import 'plugin_demos/animated_flip_counter.dart' as animated_flip_counter_demo;
import 'plugin_demos/auto_size_text.dart' as auto_size_text_demo;
import 'plugin_demos/avatar_glow.dart' as avatar_glow_demo;
import 'plugin_demos/badges.dart' as badges_demo;
import 'plugin_demos/carousel_slider.dart' as carousel_slider_demo;
import 'plugin_demos/confetti.dart' as confetti_demo;
import 'plugin_demos/custom_refresh_indicator.dart'
    as custom_refresh_indicator_demo;
import 'plugin_demos/dotted_border.dart' as dotted_border_demo;
import 'plugin_demos/dropdown_button2.dart' as dropdown_button2_demo;
import 'plugin_demos/easy_stepper.dart' as easy_stepper_demo;
import 'plugin_demos/expandable_page_view.dart' as expandable_page_view_demo;
import 'plugin_demos/flex_color_scheme.dart' as flex_color_scheme_demo;
import 'plugin_demos/fl_chart.dart' as fl_chart_demo;
import 'plugin_demos/flutter_animate.dart' as flutter_animate_demo;
import 'plugin_demos/flutter_chat_ui.dart' as flutter_chat_ui_demo;
import 'plugin_demos/flutter_form_builder.dart' as flutter_form_builder_demo;
import 'plugin_demos/flutter_html.dart' as flutter_html_demo;
import 'plugin_demos/flutter_json_view.dart' as flutter_json_view_demo;
import 'plugin_demos/flutter_markdown_plus.dart' as flutter_markdown_plus_demo;
import 'plugin_demos/flutter_quill.dart' as flutter_quill_demo;
import 'plugin_demos/flutter_slidable.dart' as flutter_slidable_demo;
import 'plugin_demos/flutter_svg.dart' as flutter_svg_demo;
import 'plugin_demos/flutter_tilt.dart' as flutter_tilt_demo;
import 'plugin_demos/font_awesome_flutter.dart' as font_awesome_flutter_demo;
import 'plugin_demos/generated_registry.dart';
import 'plugin_demos/generic_demo.dart';
import 'plugin_demos/google_fonts.dart' as google_fonts_demo;
import 'plugin_demos/group_button.dart' as group_button_demo;
import 'plugin_demos/infinite_scroll_pagination.dart'
    as infinite_scroll_pagination_demo;
import 'plugin_demos/intl.dart' as intl_demo;
import 'plugin_demos/loading_animation_widget.dart'
    as loading_animation_widget_demo;
import 'plugin_demos/lottie.dart' as lottie_demo;
import 'plugin_demos/model_viewer_plus.dart' as model_viewer_plus_demo;
import 'plugin_demos/numberpicker.dart' as numberpicker_demo;
import 'plugin_demos/octo_image.dart' as octo_image_demo;
import 'plugin_demos/photo_view.dart' as photo_view_demo;
import 'plugin_demos/pin_code_fields.dart' as pin_code_fields_demo;
import 'plugin_demos/provider.dart' as provider_demo;
import 'plugin_demos/qr_flutter.dart' as qr_flutter_demo;
import 'plugin_demos/resizable_widget.dart' as resizable_widget_demo;
import 'plugin_demos/responsive_framework.dart' as responsive_framework_demo;
import 'plugin_demos/settings_ui.dart' as settings_ui_demo;
import 'plugin_demos/shimmer_animation.dart' as shimmer_animation_demo;
import 'plugin_demos/slide_countdown.dart' as slide_countdown_demo;
import 'plugin_demos/smooth_sheets.dart' as smooth_sheets_demo;
import 'plugin_demos/toggle_switch.dart' as toggle_switch_demo;
import 'plugin_demos/two_dimensional_scrollables.dart'
    as two_dimensional_scrollables_demo;
import 'plugin_demos/widgets_to_image.dart' as widgets_to_image_demo;

class PluginDemoHost extends StatelessWidget {
  const PluginDemoHost({super.key, required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    final generatedDemo = generatedPluginDemoFor(plugin);
    if (generatedDemo != null) {
      return generatedDemo;
    }

    switch (plugin.name) {
      case 'flutter_svg':
      case 'jovial_svg':
        return const flutter_svg_demo.FlutterSvgDemo();
      case 'google_fonts':
        return const google_fonts_demo.GoogleFontsDemo();
      case 'font_awesome_flutter':
      case 'fluentui_system_icons':
      case 'cupertino_icons':
        return const font_awesome_flutter_demo.FontAwesomeFlutterDemo();
      case 'carousel_slider':
      case 'flutter_carousel_widget':
      case 'infinite_carousel':
      case 'carousel_slider_plus':
        return const carousel_slider_demo.CarouselSliderDemo();
      case 'qr_flutter':
      case 'barcode_widget':
        return qr_flutter_demo.QrFlutterDemo(label: plugin.name);
      case 'dotted_border':
        return const dotted_border_demo.DottedBorderDemo();
      case 'flutter_html':
      case 'flutter_widget_from_html_core':
        return const flutter_html_demo.FlutterHtmlDemo();
      case 'dropdown_button2':
      case 'multi_dropdown':
        return const dropdown_button2_demo.DropdownButton2Demo();
      case 'badges':
        return const badges_demo.BadgesDemo();
      case 'pin_code_fields':
        return const pin_code_fields_demo.PinCodeFieldsDemo();
      case 'confetti':
      case 'flutter_confetti':
        return const confetti_demo.ConfettiDemo();
      case 'toggle_switch':
      case 'animated_toggle_switch':
      case 'custom_sliding_segmented_control':
        return const toggle_switch_demo.ToggleSwitchDemo();
      case 'group_button':
        return const group_button_demo.GroupButtonDemo();
      case 'expandable_page_view':
        return const expandable_page_view_demo.ExpandablePageViewDemo();
      case 'two_dimensional_scrollables':
      case 'material_table_view':
        return const two_dimensional_scrollables_demo.TwoDimensionalScrollablesDemo();
      case 'numberpicker':
        return const numberpicker_demo.NumberPickerDemo();
      case 'smooth_sheets':
      case 'wolt_modal_sheet':
      case 'stupid_simple_sheet':
        return const smooth_sheets_demo.SmoothSheetsDemo();
      case 'resizable_widget':
      case 'multi_split_view':
        return const resizable_widget_demo.ResizableWidgetDemo();
      case 'octo_image':
        return const octo_image_demo.OctoImageDemo();
      case 'flutter_markdown_plus':
        return const flutter_markdown_plus_demo.FlutterMarkdownPlusDemo();
      case 'fl_chart':
        return const fl_chart_demo.FlChartDemo();
      case 'lottie':
        return const lottie_demo.LottieDemo();
      case 'flutter_animate':
      case 'animate_do':
      case 'flutter_staggered_animations':
      case 'auto_animated':
      case 'animated_size_and_fade':
      case 'simple_animations':
      case 'delayed_display':
        return flutter_animate_demo.FlutterAnimateDemo(name: plugin.name);
      case 'calendar_view':
      case 'kalender':
        return const settings_ui_demo.CalendarLikeDemo();
      case 'auto_size_text':
        return const auto_size_text_demo.AutoSizeTextDemo();
      case 'model_viewer_plus':
        return const model_viewer_plus_demo.ModelViewerPlusDemo();
      case 'easy_stepper':
        return const easy_stepper_demo.EasyStepperDemo();
      case 'sidebarx':
        return const settings_ui_demo.SidebarDemo();
      case 'widgets_to_image':
      case 'screenshot':
        return const widgets_to_image_demo.WidgetsToImageDemo();
      case 'provider':
        return const provider_demo.ProviderDemo();
      case 'intl':
        return const intl_demo.IntlDemo();
      case 'animated_text_kit':
      case 'typewritertext':
        return const animated_text_kit_demo.AnimatedTextKitDemo();
      case 'flutter_slidable':
        return const flutter_slidable_demo.FlutterSlidableDemo();
      case 'infinite_scroll_pagination':
        return const infinite_scroll_pagination_demo.InfiniteScrollPaginationDemo();
      case 'flex_color_scheme':
        return const flex_color_scheme_demo.FlexColorSchemeDemo();
      case 'settings_ui':
        return const settings_ui_demo.SettingsUiDemo();
      case 'flutter_chat_ui':
        return const flutter_chat_ui_demo.FlutterChatUiDemo();
      case 'flutter_form_builder':
        return const flutter_form_builder_demo.FlutterFormBuilderDemo();
      case 'flutter_quill':
        return const flutter_quill_demo.FlutterQuillDemo();
      case 'sizer':
      case 'responsive_framework':
      case 'scaled_app':
      case 'responsive_builder':
        return responsive_framework_demo.ResponsiveFrameworkDemo(
          name: plugin.name,
        );
      case 'flutter_json_view':
        return const flutter_json_view_demo.FlutterJsonViewDemo();
      case 'curved_navigation_bar':
      case 'animated_bottom_navigation_bar':
      case 'curved_labeled_navigation_bar':
      case 'convex_bottom_bar':
      case 'bottom_navy_bar':
        return const animated_bottom_navigation_bar_demo.AnimatedBottomNavigationBarDemo();
      case 'slide_countdown':
        return const slide_countdown_demo.SlideCountdownDemo();
      case 'custom_refresh_indicator':
        return const custom_refresh_indicator_demo.CustomRefreshIndicatorDemo();
      case 'animated_flip_counter':
      case 'animated_digit':
        return const animated_flip_counter_demo.AnimatedFlipCounterDemo();
      case 'avatar_glow':
        return const avatar_glow_demo.AvatarGlowDemo();
      case 'flutter_tilt':
        return const flutter_tilt_demo.FlutterTiltDemo();
      case 'photo_view':
        return const photo_view_demo.PhotoViewDemo();
      case 'loading_animation_widget':
      case 'loading_animations':
        return const loading_animation_widget_demo.LoadingAnimationWidgetDemo();
      case 'shimmer_animation':
      case 'shimmer':
        return const shimmer_animation_demo.ShimmerAnimationDemo();
      case 'flutter_bloc':
      case 'bloc':
      case 'riverpod':
      case 'mobx':
      case 'flutter_mobx':
      case 'flutter_redux':
      case 'redux':
      case 'rxdart':
        return StateManagementDemo(name: plugin.name);
      case 'shared_preferences':
      case 'path_provider':
      case 'url_launcher':
      case 'connectivity_plus':
      case 'sqflite':
      case 'geolocator':
      case 'flutter_local_notifications':
      case 'firebase_core':
      case 'firebase_auth':
      case 'firebase_messaging':
      case 'firebase_crashlytics':
      case 'cloud_firestore':
      case 'cloud_functions':
      case 'firebase_storage':
      case 'sign_in_with_apple':
      case 'win32':
      case 'device_info_plus':
      case 'battery_plus':
      case 'sensors_plus':
      case 'video_player':
      case 'location':
      case 'android_intent_plus':
      case 'android_alarm_manager_plus':
      case 'webview_flutter':
      case 'home_widget':
      case 'file_selector':
      case 'share_plus':
      case 'wechat_assets_picker':
      case 'wechat_camera_picker':
        return PlatformCapabilityDemo(plugin: plugin);
      case 'json_serializable':
      case 'flutter_native_splash':
      case 'built_value_generator':
      case 'mobx_codegen':
      case 'msix':
      case 'flutter_rust_bridge':
      case 'chopper':
      case 'googleapis':
      case 'built_value':
      case 'built_collection':
      case 'fpdart':
      case 'characters':
      case 'sentry':
      case 'sentry_flutter':
        return DevConceptDemo(plugin: plugin);
      default:
        return FallbackSpecificDemo(plugin: plugin);
    }
  }
}
