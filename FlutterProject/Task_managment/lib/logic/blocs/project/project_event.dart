import 'package:equatable/equatable.dart';
import 'package:task_managment/presentation/utils/helper.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];

}class FetchProjects extends ProjectEvent {
  Future<String> tokenFuture;

  FetchProjects({required this.tokenFuture});

  @override
  List<Object> get props => [tokenFuture];
}
