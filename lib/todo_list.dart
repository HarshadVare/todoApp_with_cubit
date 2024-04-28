import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_with_cubit/cubit/todo_cubit.dart';

import 'models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/addTodo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (ctx, i) {
              final todo = state[i];
              return ListTile(
                title: Text(todo.name),
              );
            },
            itemCount: state.length,
          );
        },
      ),
    );
  }
}
