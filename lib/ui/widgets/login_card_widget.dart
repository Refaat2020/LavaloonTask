import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavaloon/common/validators.dart';
import 'package:lavaloon/locator.dart';

// ignore: must_be_immutable
class LoginCard extends StatelessWidget {
  String name;
  FormFieldValidator<String> valid;
  TextInputType textInputType;
  bool obscure  = true;
  Function save;
  String initial;
  Key key;
  LoginCard({this.name, this.valid,this.textInputType, this.obscure,this.save,this.key});
  ValidateFields _validateFields = locator<ValidateFields>();
  @override
  Widget build(BuildContext context) {

    return  Card(
      elevation: 8,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 15,),
      child: ListTile(
        title: Text(name,style: GoogleFonts.acme(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 20,
        ),),
        subtitle: name != "Password"?FormBuilderTextField(
          key: key,
          initialValue: initial,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.next,
          showCursor: true,
          keyboardType: textInputType,
          obscureText: obscure,
          onSaved: save,
          name: "Email",
          validator: (String value){
          return  _validateFields.validateEmail(value, context);
        },

        ):FormBuilderTextField(
          key: key,
          initialValue: initial,
          name: "password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.next,
          showCursor: true,
          keyboardType: textInputType,
          obscureText: true,
          maxLines: 1,
          onSaved: save,
          validator: (String value){
            return _validateFields.validatePass(value, context);
          },
        ),
      ),
    );
  }
}