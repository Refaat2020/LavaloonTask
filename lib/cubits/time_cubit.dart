import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lavaloon/cubits/client_cubit.dart';
import 'package:lavaloon/cubits/projects_cubit.dart';
import 'package:lavaloon/models/time_model.dart';
import 'package:lavaloon/services/utlites_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../locator.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit() : super(TimeInitial());
  UtilitiesService _service = locator<UtilitiesService>();
  List<TimeModel> timeEntries = [];
  Map<String, dynamic> time = {};



  Future getTime(BuildContext context)async{
  emit(TimeLoading());
  _service.getWithParams('time_entries', {},).then((response) async {
    if (response != null && response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      timeEntries = (responseJson as List).map((time) => TimeModel.fromJson(time))
          .toList();
      int id = timeEntries.elementAt(2).wid;
      String sa = id.toString();
      context.read<ProjectsCubit>().getProjects(sa);
      context.read<ClientCubit>().getClients(sa);
      Future.delayed(Duration(milliseconds: 300)).then((value) {      emit(TimeFetched(timeList: timeEntries));
      });

      //  _projectProvider.getProjects(sa ).then((response) {
      //   if (response != null && response.statusCode == 200) {
      //     print("donee*****");
      //   }
      // });
    }else{
      print("error");
      emit(TimeError(response.body));
    }
  });
  }

  Future getTimeForLastMonth(BuildContext context)async{
    emit(TimeLoading());
    _service.getWithParams('time_entries', {
      "start_date":"2021-04-01T00:00:00Z",
      "end_date":"2021-04-27T00:00:00Z"
    },).then((response) async {
      if (response != null && response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        timeEntries = (responseJson as List).map((time) => TimeModel.fromJson(time))
            .toList();
        emit(TimeFetched());
      }else{
        print("error");
        emit(TimeError(response.body));
      }
    });
  }


  Future getTimeDetails(BuildContext context , String id)async{
    emit(TimeLoading());
    _service.getWithParams('time_entries/$id', {},).then((response) async {
      if (response != null && response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        time = responseJson;
        emit(TimeFetched());
      }else{
        print("error");
        emit(TimeError(response.body));
      }
    });
  }
}
