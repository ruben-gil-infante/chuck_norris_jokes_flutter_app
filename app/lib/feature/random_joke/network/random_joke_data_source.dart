import 'dart:convert';

import 'package:app/constants/errors_constants.dart';
import 'package:app/feature/random_joke/model/random_joke.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RandomJokeDataSource {
  static const _headers = {
    'X-RapidAPI-Host': 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com',
    'X-RapidAPI-Key': '27aa06345fmsh8f4bfc85f8d8f7dp1ba148jsn9b86ffbf73f8',
    'accept': 'application/json'
  };
  Future<Map<String, dynamic>> getAJoke() async {
    Response response = await http
        .get(
            Uri.parse(
                'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random'),
            headers: _headers)
        .timeout(const Duration(seconds: 1))
        .onError((error, stackTrace) {
      debugPrint("No internet error is ${error.toString()}");
      return http.Response(
          'error', ErrorsConstants.NO_INTERNET_CONNECTION_ERROR_CODE);
    });

    if (response.statusCode == 200) {
      return {
        'error': false,
        'joke': Joke.fromJsonMap(jsonDecode(response.body))
      };
    } else {
      return {'error': true, 'code': response.statusCode};
    }
  }
}
