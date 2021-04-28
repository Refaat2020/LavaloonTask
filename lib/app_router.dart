import 'package:flutter/material.dart';
import 'package:lavaloon/ui/screens/choose_screen.dart';
import 'package:lavaloon/ui/screens/home_screen.dart';
import 'package:lavaloon/ui/screens/login_screen.dart';
import 'package:lavaloon/ui/screens/splash_screen.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_)=> HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_)=> LoginScreen());
      case '/select':
        return MaterialPageRoute(builder: (_)=> ChooseScreen());
      default:
        return null;
    }
  }
}