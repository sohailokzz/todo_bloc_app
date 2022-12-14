import 'package:flutter/material.dart';
import 'package:todo_bloc_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_bloc_app/presentation/screens/todo_edit_screen.dart';
import 'package:todo_bloc_app/presentation/screens/todo_screen.dart';

class AppRouter {
  MaterialPageRoute? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const TodoScreen(),
        );
      case '/edit_todo':
        return MaterialPageRoute(
          builder: (_) => const EditTodoScreen(),
        );
      case '/add_todo':
        return MaterialPageRoute(
          builder: (_) => const AddTodoScreen(),
        );
      default:
        return null;
    }
  }
}
