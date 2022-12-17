import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc_app/cubit/todos_cubit.dart';
import 'package:todo_bloc_app/data/models/todos.dart';
import 'package:todo_bloc_app/data/repository.dart';

part 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  final Repository repository;
  final TodosCubit todosCubit;
  EditTodoCubit({
    required this.repository,
    required this.todosCubit,
  }) : super(EditTodoInitial());

  void deleteTodo(Todo todo) {
    repository.deleteTodo(todo.id).then((isDeleted) {
      if (isDeleted) {
        todosCubit.isDeleted(todo);
        emit(TodoEdited());
      }
    });
  }

  void updateTodo(
    Todo todo,
    String message,
  ) {
    if (message.isEmpty) {
      emit(
        EditTodoError('Empty Message'),
      );
      return;
    }
    repository.updateTodo(message, todo.id).then((isEdited) {
      if (isEdited) {
        todo.todoText = message;
        todosCubit.updateTodoList();
        emit(
          TodoEdited(),
        );
      }
    });
  }
}
