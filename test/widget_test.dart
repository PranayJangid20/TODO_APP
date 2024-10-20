import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_task/core/services/test_DB.dart';
import 'package:todo_app_task/features/home/data/repository/todo_repository.dart';
import 'package:todo_app_task/features/home/presentation/cubit/todo_cubit.dart';

void main() {

  group("TodoApp", (){
    blocTest<TodoCubit, TodoState>(
      'TODO: Empty',
      build: () => TodoCubit(TodoRepositoryIml(service: TestDatabaseService())),
      act: (bloc) {
        // TODO: implement

        bloc.getAllTodos();
      },
      expect: () => [
        TodoEmpty(),
      ],
    );
    blocTest<TodoCubit, TodoState>(
      'TODO: Task Add',
      build: () => TodoCubit(TodoRepositoryIml(service: TestDatabaseService())),
      act: (bloc) {
        bloc.getAllTodos();
        bloc.addTask("desc");
      },
      expect: () => [
        TodoEmpty(),
        isA<TodoLoaded>()
      ],
    );
  });
}
