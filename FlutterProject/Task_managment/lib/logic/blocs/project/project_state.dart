
import 'package:task_managment/data/model/Projectmodel.dart';


abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoadedSuccess extends ProjectState {
  final List<Project> projects;

  ProjectLoadedSuccess(this.projects);
}

class ProjectLoadedFailed extends ProjectState {
  final String errorMessage;

  ProjectLoadedFailed(this.errorMessage);
}
