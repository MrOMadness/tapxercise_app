import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tapxercise/models/leaderboard_model.dart';

class NssProductions {
  // https://docs.google.com/document/d/13qsqrW7XInVJGFOIPDKezpt3nuSREacM0Kep9vxUYVQ
  static String baseUrl = 'https://www.nss-productions.com/tapxercise';

  static Future<List<Leaderboard>> getAllUsers() async {
    try {
      final response = await Dio().get(baseUrl);
      List<Leaderboard> arrayOfLeaderboard = [];
      for (var value in response.data) {
        Leaderboard leaderboard = new Leaderboard.fromJson(value);
        arrayOfLeaderboard.add(leaderboard);
      }
      return arrayOfLeaderboard;
    } catch (e) {
      print(e);
    }
  }
}
