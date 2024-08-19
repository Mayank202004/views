import 'package:flutter/material.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Views"),),
      body: const Center(
        child: Text("This is views"),
      ),
    );
  }
}
