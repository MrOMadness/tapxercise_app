import 'package:dio/dio.dart';

class NssProductions {
  // https://docs.google.com/document/d/13qsqrW7XInVJGFOIPDKezpt3nuSREacM0Kep9vxUYVQ
  static String baseUrl = 'https://www.nss-productions.com/tapxercise';

  static Future<dynamic> getAllUsers() async {
    try {
      var response = await Dio().get(baseUrl + '/');
      return response;
    } catch (e) {
      throw (e);
    }
  }
}
