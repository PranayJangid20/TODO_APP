import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_task/features/home/data/model/task.dart';
import 'package:todo_app_task/features/home/presentation/cubit/todo_cubit.dart';
import 'package:todo_app_task/features/home/presentation/widget/task_dialog.dart';
import 'package:todo_app_task/features/home/presentation/widget/todo_tile.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => TaskDialog(),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add Task"),
                Icon(Icons.add),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, i) => TodoTile(
                  index: i,
                  todo: widget.tasks[i],
                  onChanged: (checked) {
                    context.read<TodoCubit>().updateTask(widget.tasks[i]);
                  }),
              separatorBuilder: (_, i) => const Divider(),
              itemCount: widget.tasks.length),
        ),
      ],
    );
  }
}
