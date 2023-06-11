import 'package:equatable/equatable.dart';

import '../../../data/model/Task.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoadedSuccess extends TaskState {
  final List<Task> tasks;

  TaskLoadedSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskLoadedFailed extends TaskState {
  final String errorMessage;

  TaskLoadedFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
