import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/view/news_fav.dart';
import 'package:my_app/view/news_detail_page.dart';
import 'package:my_app/view/news_page.dart';
import 'package:my_app/viewmodel/news_detail_vm.dart';
import 'package:provider/provider.dart';

extension RouteSettingsEx on RouteSettings {
  T? routeArgs<T>() {
    return arguments as T?;
  }
}

class AppRouters {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    bool fullscreenDialog = false;
    late WidgetBuilder widgetBuilder;

    switch (routeSettings.name) {
      case "/":
        widgetBuilder = (_) => const NewsPage();
        break;
      case "/savedNews":
        widgetBuilder = (_) => const SavedNewsPage();
        break;
      case "/detail":
        widgetBuilder = (_) => ChangeNotifierProvider(
              create: (_) => NewsDetailViewModel(routeSettings.routeArgs()),
              child: const NewsDetailPage(),
            );
        break;
      default:
        fullscreenDialog = true;
        widgetBuilder = (_) => Container();
    }
    return MaterialPageRoute(
        builder: widgetBuilder,
        settings: routeSettings,
        fullscreenDialog: fullscreenDialog);
  }
}
