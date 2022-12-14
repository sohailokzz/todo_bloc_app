import 'package:flutter/material.dart';
import 'package:todo_bloc_app/constants/strings.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Todos"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                addTodoRoute,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Todo Screen",
        ),
      ),
    );
  }
}
