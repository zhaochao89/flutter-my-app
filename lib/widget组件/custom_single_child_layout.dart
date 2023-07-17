import 'package:flutter/material.dart';

class MyLayout extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // return super.getConstraintsForChild(constraints);
    return constraints / 2;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return constraints.biggest;
    // return const Size(50, 50);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // return super.getPositionForChild(size, childSize);
    return const Offset(50, 80);
  }
}

class CustomSingleChildLayoutExample extends StatelessWidget {
  const CustomSingleChildLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          width: 300,
          height: 300,
          child: CustomSingleChildLayout(
            delegate: MyLayout(),
            child: Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
