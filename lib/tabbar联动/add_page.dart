import 'package:flutter/material.dart';


class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('这是Present出来的'), 
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.close))
        ),
      body: const Center(
        child: Text('Add Page'),
      ),
    );
  }
}