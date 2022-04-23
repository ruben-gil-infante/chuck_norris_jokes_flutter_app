import 'package:app/components/chuck.dart';
import 'package:app/feature/random_joke/ui/view_model/random_joke_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomJokeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomJokeScreen();
}

class _RandomJokeScreen extends State<RandomJokeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewModel = Provider.of<RandomJokeViewModel>(context);
    if (viewModel.firstLoad) viewModel.getARandomJoke();
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: "chuck_norris_logo",
              child: Chuck(width: size.width * 0.6),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text('"${viewModel.joke}"',
                    style: const TextStyle(
                        fontSize: 20.0, fontStyle: FontStyle.italic))),
            Container(height: 100.0),
            !viewModel.showProgressBar
                ? ElevatedButton(
                    onPressed: () => viewModel.getARandomJoke(),
                    child: const Text("MORE"))
                : const CircularProgressIndicator(),
          ],
        )),
      ),
    );
  }
}
