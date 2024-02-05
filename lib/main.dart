import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universities_task/controllers/universities_controller.dart';
import 'package:universities_task/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UniversitiesController>(create: (_)=> UniversitiesController()),
      ],
      child: MaterialApp(
        title: 'Universities List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
