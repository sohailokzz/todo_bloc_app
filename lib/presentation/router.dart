import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/constants/strings.dart';
import 'package:todo_bloc_app/cubit/add_todo_cubit.dart';
import 'package:todo_bloc_app/cubit/todos_cubit.dart';
import 'package:todo_bloc_app/data/network_service.dart';
import 'package:todo_bloc_app/data/repository.dart';
import 'package:todo_bloc_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_bloc_app/presentation/screens/todo_edit_screen.dart';
import 'package:todo_bloc_app/presentation/screens/todo_screen.dart';

class AppRouter {
  Repository? repository;
  TodosCubit? todosCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    todosCubit = TodosCubit(repository: repository!);
  }

  MaterialPageRoute? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: todosCubit!,
            child: const TodoScreen(),
          ),
        );
      case editTodoRoute:
        return MaterialPageRoute(
          builder: (_) => const EditTodoScreen(),
        );
      case addTodoRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                AddTodoCubit(repository: repository!, todosCubit: todosCubit!),
            child: AddTodoScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
