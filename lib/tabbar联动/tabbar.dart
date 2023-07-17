import 'package:flutter/material.dart';
import 'package:my_app/tabbar%E8%81%94%E5%8A%A8/add_page.dart';
import 'package:my_app/tabbar%E8%81%94%E5%8A%A8/home.dart';
import 'package:my_app/tabbar%E8%81%94%E5%8A%A8/message.dart';
import 'package:my_app/tabbar%E8%81%94%E5%8A%A8/news.dart';
import 'package:my_app/tabbar%E8%81%94%E5%8A%A8/personal.dart';

class MyTabbar extends StatefulWidget {
  const MyTabbar({super.key});

  @override
  createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    const MyNewsPage(),
    Container(),
    const MyMessagePage(),
    const MyPersonalPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: '新闻'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed, //必须设置这个属性，否则底部栏是白色的，看不清
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        currentIndex: _currentIndex,
      ),
      // body: _pages[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const AddPage();
                },
                fullscreenDialog: true //设置这个参数为 true，可以实现iOS present 的效果
                )
                );
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
