import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Theme( //套一层Theme，修改未选中时的颜色
                data: ThemeData(unselectedWidgetColor: Colors.cyan),
                child: Radio(value: 'value',
                groupValue: 'value1',
                activeColor: Colors.green,
                // fillColor: MaterialStateProperty.all(Colors.red),
                onChanged: (value) {
                  print('====$value=====');
                }),
              ),
              Radio.adaptive(value: 'value2', groupValue: 'value3', onChanged: (value) {
                print('====$value=====');
              })
            ],
          ),
        );
      }, separatorBuilder: (context, index) {
          return Container(
            color: Colors.white,
            padding:const EdgeInsets.all(16),
            child: const Text('header'));
      }, itemCount: 20),
    );
  }
}