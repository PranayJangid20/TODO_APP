part of 'todo_cubit.dart';

@immutable
abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodoLoading extends TodoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodoEmpty extends TodoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodoLoaded extends TodoState {
  final List<Task> tasks;

  TodoLoaded({required this.tasks});

  @override
  // TODO: implement props
  List<Object?> get props => [tasks];
}
