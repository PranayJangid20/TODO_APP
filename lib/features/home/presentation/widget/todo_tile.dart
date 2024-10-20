import 'package:flutter/material.dart';
import 'package:todo_app_task/features/home/data/model/task.dart';

class TodoTile extends StatelessWidget {
  final int index;
  final Task todo;
  final ValueChanged<bool?> onChanged;

  const TodoTile({
    super.key,
    required this.index,
    required this.todo,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${index+1}', style: TextStyle(
          color: todo.isCompleted? Colors.black54 : Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 18),),
      title: Text(
        todo.description,
        style: TextStyle(
            color: todo.isCompleted? Colors.black54 : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: onChanged,
            ),
    );
  }
}
