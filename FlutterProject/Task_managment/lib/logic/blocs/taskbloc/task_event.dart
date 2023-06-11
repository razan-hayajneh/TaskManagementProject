import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class FetchTasks extends TaskEvent {
  final String token;
  final int projectId;
  final String taskStatus;

  FetchTasks({required this.token, required this.projectId, required this.taskStatus});

  @override
  List<Object> get props => [token, projectId, taskStatus];
}

class FetchTasksByDate extends TaskEvent {
  final String token;
  final int projectId;
  final String taskStatus;

  FetchTasksByDate({required this.token, required this.projectId, required this.taskStatus});

  @override
  List<Object> get props => [token, projectId, taskStatus];
}
