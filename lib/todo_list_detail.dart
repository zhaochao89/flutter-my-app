import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'todo_item.dart';

class TodoListDetail extends StatelessWidget {
  const TodoListDetail({super.key, this.todo});

  final TodoItem? todo;

  Widget _rowItem() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    Navigator.of(context).pop('这是详情页面返回的值');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    //另一种取参方式
    var todo = ModalRoute.of(context)!.settings.arguments as TodoItem;
    
    return WillPopScope(
      onWillPop: () => _willPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('待办事项详情'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                todo.detail,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop('这是详情页面返回来的');
                  },
                  child: const Text('返回上一页带参数')),
              CupertinoButton(
                onPressed: () {},
                color: Colors.blue,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Text('CupertinoButton'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: 100,
                    child: _rowItem(),
                  ),
                  Flexible(
                    flex: 3,
                    child: _rowItem(),
                  ),
                  Flexible(
                    flex: 2,
                    child: _rowItem(),
                  ),
                  Expanded(
                    flex: 3,
                    child: _rowItem(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
