// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/app_router.dart';

import 'constance/bloc_observe.dart';

void main() {
  runApp(MovieApp(appRouter: AppRouter(),));
  Bloc.observer = MyBlocObserver();
}

class MovieApp extends StatelessWidget {
  final AppRouter appRouter;

  const MovieApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

