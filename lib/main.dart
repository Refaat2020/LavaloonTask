import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavaloon/cubits/client_cubit.dart';
import 'package:lavaloon/cubits/login_cubit.dart';
import 'package:lavaloon/cubits/projects_cubit.dart';
import 'package:lavaloon/cubits/time_cubit.dart';


import 'app_router.dart';
import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProjectsCubit(),),
        BlocProvider(create: (context) => TimeCubit(),),
        BlocProvider(create: (context) => ClientCubit(),),
        BlocProvider(create: (context) => LoginCubit(),),



      ],
      child: MaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}