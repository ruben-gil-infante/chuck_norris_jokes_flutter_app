import 'package:flutter/material.dart';

class Chuck extends StatelessWidget {
  double width;

  Chuck({required this.width});

  @override
  Widget build(BuildContext context) =>
      Image.asset("assets/images/chuck.png", width: width);
}
