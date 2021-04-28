part of 'projects_cubit.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();
}

class ProjectsInitial extends ProjectsState {
  @override
  List<Object> get props => [];
}
class ProjectsLoading extends ProjectsState {
  @override
  List<Object> get props => [];
}
class ProjectsFetched extends ProjectsState {
  List<ProjectsModel> projects;

  ProjectsFetched({this.projects,});

  @override
  List<Object> get props => [];
}
class ProjectsError extends ProjectsState {
  String error;

  ProjectsError(this.error);

  @override
  List<Object> get props => [];
}
