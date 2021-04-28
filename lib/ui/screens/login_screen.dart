import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavaloon/cubits/login_cubit.dart';
import 'package:lavaloon/ui/widgets/big_button_widget.dart';
import 'package:lavaloon/ui/widgets/login_card_widget.dart';
import 'package:provider/provider.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  String _password;

  String _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,

            ),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 0, top: 30),
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Text(
                  "Toggl",
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 35),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 800,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(60)),
                    color: Colors.white,
                  ),
                  child: FormBuilder(
                    key: fbKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 50),
                          child: Text(
                            "Login",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        LoginCard(
                          key: Key("email"),

                          obscure: false,
                          textInputType: TextInputType.emailAddress,
                          name: "Email",
                          valid: FormBuilderValidators.email(context),
                          save: (value) {
                            _email = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginCard(
                          key: Key("password"),
                          obscure: secure,
                          textInputType: TextInputType.visiblePassword,
                          name: "Password",
                          valid: FormBuilderValidators.required(context),
                          save: (value) {
                            _password = value;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BigButton(
                            key: Key("loginButton"),
                            name: "Login",
                            color: Colors.black,
                            onTap: () {
                              if (fbKey.currentState.validate()) {
                                fbKey.currentState.save();

                                context.read<LoginCubit>().login(_email, _password,context);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}