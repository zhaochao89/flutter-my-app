import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List _tabTitles = ['旅游', '美食', '汽车', '科技', '八卦'];

  @override
  void initState() {
    super.initState();
    debugPrint('====_MyHomePageState initState====');
    _tabController = TabController(length: _tabTitles.length, vsync: this);
    _tabController.addListener(() {
      //既能监听选中事件也能监听滑动事件，要做个判断，否则点击事件会执行两次
      if (_tabController.animation?.value == _tabController.index) {
        print('===选中了${_tabController.index}');
      }
    });
  }

  List<Widget> _getTabItems() {
    return _tabTitles.map((e) {
      return Tab(
        text: e,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('首页'),
          elevation: 0.0,
          bottom: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.white,
            elevation: 0.0, //AppBar 外层还包裹了一层 AppBar,去除阴影时也需要将  外层AppBar的阴影去除。
            title: TabBar(
              controller: _tabController,
              tabs: _getTabItems(),
              padding: const EdgeInsets.only(bottom: 2), //修改间距
              indicatorWeight: 2, //修改指示器的高度
              indicatorColor: Colors.blue,
              labelColor: Colors.blue, //文字默认颜色
              unselectedLabelColor: Colors.grey, //文字选中颜色
              labelStyle: const TextStyle(fontSize: 14), //style 设置颜色无效，需要配合labelColor 使用
              unselectedLabelStyle: const TextStyle(fontSize: 14),
              indicatorPadding: const EdgeInsets.only(bottom: 4), //修改指示器的间距
              indicatorSize: TabBarIndicatorSize.label, //修改指示器的宽度，和文字宽还是和tab宽，默认是tab
              // onTap: (value) { //只能监听点击事件，监听不到滑动事件
              //   print('===选中了$value===');
              // },
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _getTabItems(),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
