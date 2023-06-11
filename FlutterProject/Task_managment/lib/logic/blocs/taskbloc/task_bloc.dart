import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment/logic/blocs/taskbloc/task_event.dart';
import 'package:task_managment/logic/blocs/taskbloc/task_state.dart';

import '../../../data/repositories/TaskRepository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is FetchTasks) {
      yield TaskLoading();

      try {
        final tasks = await taskRepository.getTasks(event.token, event.projectId, event.taskStatus);
        yield TaskLoadedSuccess(tasks);
      } catch (e) {
        yield TaskLoadedFailed(e.toString());
      }
    }
  }
}
