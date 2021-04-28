import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lavaloon/cubits/client_cubit.dart';
import 'package:lavaloon/locator.dart';
import 'package:lavaloon/models/projects_model.dart';
import 'package:lavaloon/services/utlites_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsInitial());
  UtilitiesService _service = locator<UtilitiesService>();

  List<ProjectsModel> projects = [];
  Map<String, dynamic> project = {};

  ///to get all projects
  Future<List<ProjectsModel>> getProjects(String id)async{

    _service.getWithParams("workspaces/$id/projects", {},)
        .then((response) {
      if (response != null && response.statusCode == 200) {
          ///save if response 200
        projects = (json.decode(response.body)as List).map((projects) => ProjectsModel.fromJson(projects))
            .toList();
        emit(ProjectsFetched(projects: projects,));
      }else{
        print("error");
        emit(ProjectsError(response.body));
      }
    });
    return projects;
  }

  Future<Map> projectDetails(String id , BuildContext context)async{

    _service.getWithParams("projects/$id", {},)
        .then((response) {
      if (response != null && response.statusCode == 200) {

        project = json.decode(response.body);

        context.read<ClientCubit>().getClientDetails(project['data']['cid'].toString());
        emit(ProjectsFetched(projects: projects));
      }else{
        print("error");
        emit(ProjectsError(response.body));
      }
    });
    return project;
  }

}
