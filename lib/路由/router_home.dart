import 'package:flutter/material.dart';

class RouterHomePage extends StatelessWidget {
  const RouterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('命名路由'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/news');
                },
                child: const Text('不带参数跳转')),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/detail',
                      arguments: {'content': '这是由命名路由跳转带的参数', 'id': '123'});
                },
                child: const Text('带参数跳转')),
                const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/detail',
                      arguments: {'content': '这是由命名路由跳转带的参数，注意不能在路由表中注册', 'id': '456'});
                },
                child: const Text('带参数跳转，不能在路由表中注册')),
          ],
        ),
      ),
    );
  }
}
