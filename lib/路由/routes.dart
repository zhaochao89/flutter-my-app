import 'package:flutter/material.dart';
import '../tabbar联动/message.dart';
import '../tabbar联动/news.dart';
import 'router_argument.dart';
import 'router_home.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const RouterHomePage(),
  '/news': (context) => const MyNewsPage(),
  '/message': (context) => const MyMessagePage(),
};

var onGenerateRoute = (RouteSettings settings) {
  print(settings);
  final String? name = settings.name;
  if (name == RouterDetailPage.routeName) {
    final Map? arguments = settings.arguments as Map?;
    late Route? route;
    if (arguments != null) {
      route = MaterialPageRoute(
          builder: (context) => RouterDetailPage(arguments: arguments));
    }
    return route;
  }
  return null;
};
