import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_task/core/services/shared_preferences_service.dart';
import 'package:todo_app_task/core/services/locator.dart';
import 'package:todo_app_task/features/home/data/repository/todo_repository.dart';
import 'package:todo_app_task/features/home/presentation/cubit/todo_cubit.dart';
import 'package:todo_app_task/features/home/presentation/home_page.dart';

// Note: I have added some BlocTest test folder

// I will Initializing SharedPreference below globally, according to current project requirement.
// Best practice is to use dependency injection
late SharedPreferences preferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => TodoCubit(TodoRepositoryIml(service: SharedPreferencesService(preferences: preferences))),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}