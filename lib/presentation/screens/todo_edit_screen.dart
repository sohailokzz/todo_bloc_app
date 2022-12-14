import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:todo_bloc_app/cubit/edit_todo_cubit.dart';

import '../../data/models/todos.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;
  EditTodoScreen({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = todo.todoText!;
    return BlocListener<EditTodoCubit, EditTodoState>(
      listener: (context, state) {
        if (state is TodoEdited) {
          Navigator.pop(context);
        } else if (state is EditTodoError) {
          Toast.show(
            state.error,
            backgroundColor: Colors.red,
            duration: 3,
            gravity: Toast.center,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Todo"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<EditTodoCubit>(context).deleteTodo(todo);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            autocorrect: true,
            decoration: const InputDecoration(
              hintText: "Enter todo message...",
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              BlocProvider.of<EditTodoCubit>(context).updateTodo(
                todo,
                _controller.text,
              );
            },
            child: _updateBtn(context),
          )
        ],
      ),
    );
  }

  Widget _updateBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Text(
          "Update Todo",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
