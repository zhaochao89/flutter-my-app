import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef IntCallBack = void Function(int count);

class CustomPickerView extends StatelessWidget {
  final int selectedIndex;
  final String title;
  final List<String> itemNames;

  final IntCallBack confirmCallback;

  const CustomPickerView({
    super.key,
    this.selectedIndex = 0,
    required this.title,
    required this.itemNames,
    required this.confirmCallback,
  });

  @override
  Widget build(BuildContext context) {
    //临时保存
    late int tempIndex = selectedIndex;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 47,
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  '取消',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {
                  confirmCallback(tempIndex);
                },
                child: const Text(
                  '确定',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF436FF6),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        SizedBox(
          height: 200,
          child: CupertinoPicker(
            scrollController:
                FixedExtentScrollController(initialItem: selectedIndex),
            backgroundColor: Colors.transparent,
            itemExtent: 40,
            onSelectedItemChanged: (position) => tempIndex = position,
            // selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
            //   capStartEdge: false,
            //   capEndEdge: false,
            //   background: Colors.transparent,
            // ),
            children: itemNames
                .map((e) => Center(
                      child: Text(
                        e,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
