import 'package:app/components/chuck.dart';
import 'package:flutter/material.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacementNamed(context, '/randomjoke'));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Spacer(),
        const Text("Loading...", style: TextStyle(fontSize: 30.0)),
        Container(
          height: 50.0,
        ),
        Hero(
          tag: "chuck_norris_logo",
          child: Chuck(width: size.width * 0.4),
        ),
        const Spacer(),
        const LinearProgressIndicator(
          minHeight: 20.0,
        ),
      ]),
    ));
  }
}
