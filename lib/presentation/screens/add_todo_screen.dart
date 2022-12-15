import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:todo_bloc_app/cubit/add_todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
        centerTitle: true,
      ),
      body: BlocListener<AddTodoCubit, AddTodoState>(
        listener: (context, state) {
          if (state is AddedTodo) {
            Navigator.pop(context);
          } else if (state is AddTodoError) {
            Toast.show(
              state.error,
              duration: 3,
              gravity: Toast.center,
              backgroundColor: Colors.red,
            );
          }
        },
        child: Container(
          child: _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Write your todo',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            final message = _controller.text;
            BlocProvider.of<AddTodoCubit>(context).addTodoMessage(message);
          },
          child: _addButton(context),
        ),
      ],
    );
  }

  Widget _addButton(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: BlocBuilder<AddTodoCubit, AddTodoState>(
          builder: (context, state) {
            if (state is AddingTodo) return const CircularProgressIndicator();

            return const Text(
              "Add Todo",
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
