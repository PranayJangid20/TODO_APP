import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String description;
  final bool isCompleted;

  Task({
    required this.id,
    required this.description,
    this.isCompleted = false,
  });

  @override
  List<Object> get props => [id, description, isCompleted];

  Task copyWith({
    int? id,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
