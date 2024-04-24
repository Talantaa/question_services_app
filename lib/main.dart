import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sabak_6_1/bloc/bloc_approach/bloc/quiz_bloc.dart';

import 'package:sabak_6_1/getx/screens/getx_quiz_screen.dart';
import 'package:sabak_6_1/riverpod/screens/riverpod_quiz_screen.dart';

import 'bloc/bloc_approach/screens/bloc_quiz_screen.dart';

void main() {
  // runGetxApp();
  // runRiverpodApp();
  // runCubitApp();

  // runFlutterApp();
  runBlocApp();
}

void runFlutterApp() {
  runApp(const MyApp());
}

void runGetxApp() {
  runApp(const MyGetxApp());
}

void runRiverpodApp() {
  runApp(const ProviderScope(child: MyRiverpodApp()));
}

void runCubitApp() {
  runApp(const MyCubitApp());
}

void runBlocApp() {
  runApp(const MyBlocApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BlocQuizScreen(),
    );
  }
}

class MyGetxApp extends StatelessWidget {
  const MyGetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GetxQuizScreen(),
    );
  }
}

class MyRiverpodApp extends StatelessWidget {
  const MyRiverpodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RiverpodQuizScreen(),
    );
  }
}

class MyCubitApp extends StatelessWidget {
  const MyCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => QuizBloc(),
        child: const BlocQuizScreen(),
      ),
    );
  }
}

class MyBlocApp extends StatelessWidget {
  const MyBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => QuizBloc(),
        child: const BlocQuizScreen(),
      ),
    );
  }
}
