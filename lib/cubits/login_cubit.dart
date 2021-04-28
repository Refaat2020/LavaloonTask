import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lavaloon/models/user_model.dart';
import 'package:lavaloon/services/utlites_services.dart';

import '../locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  UtilitiesService _service = locator<UtilitiesService>();

  Future login(String username, String password,BuildContext context)async{
    final storage =  FlutterSecureStorage();
    emit(LoginLoading());
    _service.dioGetRequest("me", {
      "secret":'$username'
    }, username,
        password).then((response)async {
      if (response != null && response.statusCode == 200) {

        UserModel.fromJson(response.data);
        final token = response.data["data"]["api_token"];

        print(token);
        await storage.write(key: "api_token", value: token.toString());
        emit(LoginDone());
        Navigator.pushReplacementNamed(context, "/select");
      }else{
        emit(LoginError());

        Fluttertoast.showToast(
          msg:"${response.data}",
          textColor: Colors.black,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
        );

      }

    });
  }
}
