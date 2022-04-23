import 'package:app/feature/random_joke/ui/view_model/random_joke_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/random_joke/ui/screens/random_joke_screen.dart';
import 'feature/splash/ui/screens/custom_splahs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<RandomJokeViewModel>(
              create: (context) => RandomJokeViewModel())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chuck Norris Joke',
            initialRoute: '/',
            routes: {
              '/': (context) => const CustomSplashScreen(),
              "/randomjoke": (context) => RandomJokeScreen(),
            },
            theme: ThemeData(
              primarySwatch: Colors.green,
            )));
  }
}
