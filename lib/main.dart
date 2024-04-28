import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_with_cubit/add_todo_page.dart';
import 'package:todo_app_with_cubit/cubit/todo_cubit.dart';
import 'package:todo_app_with_cubit/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
                path: '/',
                builder: (BuildContext context, GoRouterState state) {
                  return const TodoList();
                }),
            GoRoute(
                path: '/addTodo',
                builder: (BuildContext context, GoRouterState state) {
                  return const AddTodo();
                }),
          ],
          errorBuilder: (c, s) {
            return const Scaffold(
              body: Center(child: Text('Page Not Found!')),
            );
          },
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
