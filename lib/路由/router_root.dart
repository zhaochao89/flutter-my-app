import 'package:flutter/material.dart';
import 'routes.dart';

class MyRouterPage extends StatefulWidget {
  const MyRouterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyRouterPageState();
  }
}

class _MyRouterPageState extends State<MyRouterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '命名路由',
        routes: routes,
        initialRoute:
            '/', //设置初始路由路径，会将匹配上的全部放到路由堆栈中，如/message，会先将MyHomePage，然后在将MyMessagePage放入；如果路由 map 中是这样的/news/message，这里再设置/news/message，会将 home、news、message都放到路由堆栈中，返回的时候一层层返回。
        // initialRoute: '/news/message/',//如果这里匹配不到任何路由，则报错。只有根路由匹配上的话就显示根页面
        onGenerateRoute:
            onGenerateRoute //命名路由带参数跳转时要配合onGenerateRoute函数，同时不能在路由表中注册被跳转的路由，要在onGenerateRoute函数中去创建跳转页面
        );
  }
}
