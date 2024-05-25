import 'package:ex4/models/article.dart';
import 'package:ex4/view_models/article_view_model.dart';
import 'package:ex4/views/article_screen.dart';
import 'package:ex4/views/form_screen.dart';
import 'package:ex4/views/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {

        return ListScreen();
      },
      routes: [
        GoRoute(
          path: 'formscreen',
          builder: (context, state) => const FormScreen(),
        ),
        GoRoute(
          path: 'article/:id',
          builder: (context, state) {
            final idString = state.pathParameters['id']!;
            final Article? article =
              Provider.of<ArticleViewModel>(context, listen: false)
                  .getArticleById(int.parse(idString));;
            return ArticleScreen(article: article!);
}
        ),
      ],
    ),
  ],
);

void main() {
  runApp(ChangeNotifierProvider<ArticleViewModel>(
      create: (context) => ArticleViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Article ex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
