import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_task/core/services/database_service.dart';
import 'package:todo_app_task/core/services/shared_preferences_service.dart';
import 'package:todo_app_task/features/home/data/model/task.dart';
import 'package:todo_app_task/features/home/domain/repository/todo_repository.dart';

class TodoRepositoryIml extends TodoRepository {
  final DatabaseService service;

  TodoRepositoryIml({required this.service});

  @override
  List<Task> getData() {
    // Save the updated list back to storage
    List? data = service.getData("key");
    if (data != null) {
      return data.map((e) => Task.fromJson(e)).toList();
    }
    return [];
  }

  @override
  List<Task> updateTask(Task task) {
    // Retrieve the current list of tasks
    List<Task> tasks = getData();

    // Find and update the task with the matching ID
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].id == task.id) {
        tasks[i] = task;
        break;
      }
    }

    // Save the updated list back to storage
    service.setData("key", tasks.map((e) => e.toJson()).toList());

    return tasks;
  }

  @override
  List<Task> addTask(Task task) {

    // Retrieve the current list of tasks
    List<Task> tasks = getData();

    // Save the updated list back to storage
    tasks.add(task);
    service.setData("key", tasks.map((e) => e.toJson()).toList());

    return tasks;
  }
}
