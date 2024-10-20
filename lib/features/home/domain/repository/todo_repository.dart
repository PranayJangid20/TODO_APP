import 'package:todo_app_task/features/home/data/model/task.dart';

abstract class TodoRepository {
  List<Task> updateTask(Task data);
  List<Task> addTask(Task data);
  List<Task> getData();
}