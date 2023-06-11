import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment/presentation/screen/mainScreen.dart';
import 'package:task_managment/presentation/screen/splash_screen.dart';
import 'package:task_managment/presentation/screen/sigInScreen.dart';

import 'logic/blocs/project/project_bloc.dart';
import 'logic/blocs/signin/signin_bloc.dart';
import 'logic/blocs/signup/signup_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<ProjectBloc>(create: (context) => ProjectBloc( )),
        BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
