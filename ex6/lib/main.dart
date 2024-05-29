import 'package:ex6/view_models/photo_view_model.dart';
import 'package:ex6/views/photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PhotoScreen(),
      routes: [
        GoRoute(
          path: 'photo_screen',
          builder: (context, state) => const PhotoScreen(),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(ChangeNotifierProvider<PhotoViewModel>(
      create: (context) => PhotoViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo 6',
      theme: ThemeData(
        colorScheme : ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

