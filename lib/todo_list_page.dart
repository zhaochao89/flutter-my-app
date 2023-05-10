import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'package:my_app/todo_list_detail.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final todos = List.generate(
      20,
      (index) => TodoItem('Todo $index',
          'A description of what needs to be done for Todo $index'));

  _jumpToDetail(BuildContext context, int index) async {
    //第一种传参方式
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             TodoListDetail(todo: todos[index])));
    //第二种传参方式
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TodoListDetail(),
          settings: RouteSettings(arguments: todos[index])),
    );
    debugPrint(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('待办事项列表'),
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                _jumpToDetail(context, index);
              },
            );
          },
        ));
  }
}
