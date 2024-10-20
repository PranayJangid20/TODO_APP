import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_task/features/home/data/model/task.dart';
import 'package:todo_app_task/features/home/data/repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this._repo) : super(TodoInitial());

  final TodoRepositoryIml _repo;

  // Get all TodoTask
  getAllTodos(){
    List<Task> tasks = _repo.getData();
    if(tasks.isEmpty){
      emit(TodoEmpty());
    }
    else{
      emit(TodoLoaded(tasks: tasks));
    }
  }

  // Update TodoTask
  updateTask(Task task){
    List<Task> tasks = _repo.updateTask(task.copyWith(isCompleted: !task.isCompleted));
    if(tasks.isEmpty){
      emit(TodoEmpty());
    }
    else{
      emit(TodoLoaded(tasks: tasks));
    }
  }

  // Add new TodoTask
  addTask(String desc){
    Task task = Task(id: DateTime.now().millisecondsSinceEpoch, description: desc);

    List<Task> tasks = _repo.addTask(task);
    emit(TodoLoaded(tasks: tasks));
   }

}
