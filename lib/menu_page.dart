import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, this.icon = '', this.itemText = ''});
  final String icon;
  final String itemText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        icon,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
      title: Text(itemText),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Menu Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              // Modify code here
              Example1(),
              Example2(),
              Example3(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Problem 1: Overflow error
class Example1 extends StatelessWidget {
  const Example1({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              'Explore the restaurant\'s delicious menu items below!',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Problem 2: Viewport was given unbounded height error
class Example2 extends StatelessWidget {
  const Example2({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          MenuItem(icon: '🍔', itemText: 'Burger'),
          MenuItem(icon: '🌭', itemText: 'Hot Dog'),
          MenuItem(icon: '🍟', itemText: 'Fries'),
          MenuItem(icon: '🥤', itemText: 'Soda'),
          MenuItem(icon: '🍦', itemText: 'Ice Cream'),
        ],
      ),
    );
  }
}

// Problem 3: Invisible VerticalDivider
class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              print('Pickup button pressed.');
            },
            child: const Text(
              'Pickup',
            ),
          ),
          // This widget is not shown on screen initially.
          const VerticalDivider(
            width: 20.0,
            thickness: 5.0, //绘制线条的粗细
          ),
          ElevatedButton(
            onPressed: () {
              print('Delivery button pressed.');
            },
            child: const Text(
              'Delivery',
            ),
          )
        ],
      ),
    );
  }
}
