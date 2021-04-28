import 'package:flutter/material.dart';
import 'package:lavaloon/common/get_token.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value)async {
      final String token = await getToken("api_token");
      if (token != null) {
        print(token);
        Navigator.pushReplacementNamed(context, '/select');

      }else{
        Navigator.pushReplacementNamed(context, '/login');

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
            ),
          ),
        ],
      ),
    );
  }
}
