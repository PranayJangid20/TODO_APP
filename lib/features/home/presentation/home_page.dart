import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_task/features/home/presentation/cubit/todo_cubit.dart';
import 'package:todo_app_task/features/home/presentation/widget/task_dialog.dart';
import 'package:todo_app_task/features/home/presentation/widget/todo_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Get All Todos
    context.read<TodoCubit>().getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TODO List",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (_, state) {

            // Handle for List Loaded and has data
            if (state is TodoLoaded) {
              return TodoListView(tasks: state.tasks,);
            }

            // Handle for List Loaded and empty
            if (state is TodoEmpty) {
              return Center(
                  child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => TaskDialog(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Add A Task"), Icon(Icons.add)],
                      )));
            }

            // Handle for loading state
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
