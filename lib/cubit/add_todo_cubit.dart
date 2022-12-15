import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc_app/cubit/todos_cubit.dart';
import 'package:todo_bloc_app/data/repository.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final Repository repository;
  final TodosCubit todosCubit;
  AddTodoCubit({
    required this.repository,
    required this.todosCubit,
  }) : super(AddTodoInitial());

  void addTodoMessage(String message) {
    if (message.isEmpty) {
      emit(AddTodoError('Todo message is empty'));
      return;
    }
    emit(AddingTodo());
    Timer(
      const Duration(seconds: 3),
      () {
        repository.addTodo(message).then((todo) {
          if (todo != null) {
            todosCubit.addTodo(todo);
            emit(AddedTodo());
          }
        });
      },
    );
  }
}
