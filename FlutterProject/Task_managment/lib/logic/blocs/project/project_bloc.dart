import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment/data/model/Projectmodel.dart';
import 'package:task_managment/data/repositories/ProjectRepository.dart';
import 'package:task_managment/presentation/utils/helper.dart';
import 'project_event.dart';
import 'project_state.dart';
import 'package:task_managment/data/model/Projectmodel.dart';
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial());

  @override
  Stream<ProjectState> mapEventToState(ProjectEvent event) async* {
    if (event is FetchProjects) {
      yield ProjectLoading();

      try {
        final token = await event.tokenFuture;
        final projects = await ProjectRepository.getProjects(token);
        yield ProjectLoadedSuccess(projects);
      } catch (e) {
        yield ProjectLoadedFailed(e.toString());
      }
    }
  }
}
