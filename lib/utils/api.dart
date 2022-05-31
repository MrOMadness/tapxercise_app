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
      throw (e);
    }
  }

  static Future<int> postChangePlayer(
      int gameType, String playerOne, String playerTwo) async {
    try {
      final response = await Dio()
          .post('https://www.nss-productions.com/tapxercise/players', data: {
        "gameType": gameType,
        "playerOne": playerOne,
        "playerTwo": playerTwo
      });
      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      throw (e);
      // return 400;
    }
  }
}
