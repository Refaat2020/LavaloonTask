import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lavaloon/models/client_model.dart';
import 'package:lavaloon/services/utlites_services.dart';

import '../locator.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientInitial());
  List<ClientModel>clientList = [];
  Map<String, dynamic> client = {};

  UtilitiesService _service = locator<UtilitiesService>();

  Future getClients(String id)async{
    emit(ClientLoading());
    _service.getWithParams("workspaces/$id/clients", {},)
        .then((response) {
      if (response != null && response.statusCode == 200) {

        clientList = (json.decode(response.body)as List).map((projects) => ClientModel.fromJson(projects))
            .toList();
        emit(ClientFetched());
      }else{
        print("error");
        emit(ClientError(response.body));
      }
    });
    return clientList;
  }
  Future getClientDetails(String id)async{
    emit(ClientLoading());
    _service.getWithParams("clients/$id", {})
        .then((response) {
      if (response != null && response.statusCode == 200) {

        client = json.decode(response.body);
        emit(ClientFetched());
      }else{
        print("error");
        emit(ClientError(response.body));
      }
    });
    return client;
  }
}
