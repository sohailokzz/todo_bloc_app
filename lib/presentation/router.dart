import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/constants/strings.dart';
import 'package:todo_bloc_app/cubit/todos_cubit.dart';
import 'package:todo_bloc_app/data/network_service.dart';
import 'package:todo_bloc_app/data/repository.dart';
import 'package:todo_bloc_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_bloc_app/presentation/screens/todo_edit_screen.dart';
import 'package:todo_bloc_app/presentation/screens/todo_screen.dart';

class AppRouter {
  Repository? repository;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
  }

  MaterialPageRoute? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                TodosCubit(repository: repository!),
            child: const TodoScreen(),
          ),
        );
      case editTodoRoute:
        return MaterialPageRoute(
          builder: (_) => const EditTodoScreen(),
        );
      case addTodoRoute:
        return MaterialPageRoute(
          builder: (_) => const AddTodoScreen(),
        );
      default:
        return null;
    }
  }
}
