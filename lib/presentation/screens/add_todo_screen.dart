import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add Todos'),
      ),
    );
  }
}
