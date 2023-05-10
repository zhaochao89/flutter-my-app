import 'package:flutter/material.dart';

abstract class Animal {
  int getNum();
  void test();
  void eat() => debugPrint('Animal chichichi');
}

class Boy implements Animal {
  @override
  int getNum() {
    return 3;
  }

  @override
  void test() {}

  @override
  void eat() {
    // TODO: implement eat
  }
}

class Girl extends Animal {
  @override
  int getNum() {
    return 5;
  }

  @override
  void test() {}
}

//混入
mixin AA {
  void eat() => debugPrint('AA chichichi');
}

mixin BB {
  drink() => debugPrint('hehehe');
  eat() => debugPrint('BB chichichi');
}

class Dog extends Animal with BB, AA {
  @override
  int getNum() {
    // TODO: implement getNum
    throw UnimplementedError();
  }

  @override
  void test() {
    // TODO: implement test
  }

  @override
  void eat() {
    debugPrint('Dog chichichi');
  }
}

extension TestNum on String {
  int parseToInt() => int.parse(this);
}

//扩展
class Person {
  Person(this.fullName);

  final String fullName;
}

extension ExtendedPerson on Person {
  static Person create(String firstName, String lastName) {
    return Person("$firstName $lastName");
  }
}

//泛型
T transform<T>(T params) {
  return params;
}

T transform2<T, Q>(T p1, Q p2) {
  return p1;
}

class ZCTest extends StatefulWidget {
  const ZCTest({Key? key, required this.count}) : super(key: key);
  final int count;

  @override
  State<ZCTest> createState() {
    return _ZCTestState();
  }
}

class _ZCTestState extends State<ZCTest> {
  static const arr1 = [1, 2, 3];
  static const arr2 = [4, 5, 6];

  @override
  void initState() {
    super.initState();
    debugPrint("===_ZCTestState initState===");
  }

  @override
  void didUpdateWidget(covariant ZCTest oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("===_ZCTestState didUpdateWidget===");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("===_ZCTestState build===");

    Dog().eat();
    var num = '12'.parseToInt;
    print(num);
    var str = transform('hello world');
    print(str);
    transform2<int, String>(5, 'p2');
    transform2(1, 'world');

    return Scaffold(
      body: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                '${widget.count}',
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              const TextField(
                decoration: InputDecoration(hintText: '这是提示文字'),
              ),
            ],
          )),
    );
  }
}

class TestPageOne extends StatefulWidget {
  const TestPageOne({Key? key, required this.count}) : super(key: key);
  final int count;

  @override
  State<TestPageOne> createState() {
    return _TestPageOneState();
  }
}

class _TestPageOneState extends State<TestPageOne> {
  @override
  void initState() {
    super.initState();
    debugPrint("===_TestPageOneState initState===");
  }

  @override
  void didUpdateWidget(covariant TestPageOne oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("===_TestPageOneState didUpdateWidget===");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("===_TestPageOneState build===");
    return Material(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Text(
          '${widget.count}',
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}

class TestPageTwo extends StatefulWidget {
  const TestPageTwo({Key? key}) : super(key: key);

  @override
  State<TestPageTwo> createState() {
    return TestPageTwoState();
  }
}

class TestPageTwoState extends State<TestPageTwo> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    debugPrint("===_TestPageTwoState initState===");
  }

  @override
  void didUpdateWidget(covariant TestPageTwo oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("===_TestPageTwoState didUpdateWidget===");
  }

  void updateCount(int num) {
    setState(() {
      count = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("===_TestPageTwoState build===");
    return Scaffold(
        body: Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.green),
      child: Text(
        '$count',
        style: const TextStyle(fontSize: 50, color: Colors.white),
      ),
    ));
  }
}

class ValueNotifierTestPage extends StatefulWidget {
  const ValueNotifierTestPage({Key? key}) : super(key: key);

  @override
  State<ValueNotifierTestPage> createState() => _ValueNotifierTestPageState();
}

class _ValueNotifierTestPageState extends State<ValueNotifierTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class TestPageThree extends StatefulWidget {
  final int count;
  const TestPageThree({Key? key, required this.count}) : super(key: key);

  @override
  State<TestPageThree> createState() => _TestPageThreeState();
}

class _TestPageThreeState extends State<TestPageThree> {
  @override
  void didUpdateWidget(covariant TestPageThree oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('===_TestPageThreeState didUpdateWidget===');
  }

  @override
  void initState() {
    super.initState();
    debugPrint('===_TestPageThreeState initState===');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('===_TestPageThreeState build===');
    return Scaffold(
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.purple),
        child: Text(
          '${widget.count}',
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
