import 'package:flutter/material.dart';
import 'package:todo_bloc_app/presentation/router.dart';

void main() {
  runApp(
    TodoApp(
      router: AppRouter(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  final AppRouter router;
  const TodoApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoutes,
    );
  }
}
