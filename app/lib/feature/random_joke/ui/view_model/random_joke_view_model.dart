import 'package:app/constants/errors_constants.dart';
import 'package:app/feature/random_joke/network/random_joke_data_source.dart';
import 'package:flutter/material.dart';

class RandomJokeViewModel extends ChangeNotifier {
  final RandomJokeDataSource _randomJokeDataSource = RandomJokeDataSource();
  String joke = "...";
  bool showProgressBar = false;
  bool firstLoad = true;

  getARandomJoke() {
    showProgressBar = true;
    notifyListeners();

    _randomJokeDataSource.getAJoke().then((value) {
      if (value['error'] == false) {
        joke = value['joke'].value;
        firstLoad = false;
        showProgressBar = false;
        notifyListeners();
      } else {
        if (value['code'] ==
            ErrorsConstants.NO_INTERNET_CONNECTION_ERROR_CODE) {
          joke = "Check your internet connection";
        } else {
          joke = "Something went wrong, retry later";
        }
        firstLoad = false;
        showProgressBar = false;
        notifyListeners();
      }
    });
  }
}
