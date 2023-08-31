import 'package:dio/dio.dart';

import '../models/data_model.dart';
// import '../models/data_model.dart';

class Api {
  var dio = Dio();

  // static Future<List<CallData>> fetchAll() async {
  Future<Booked> fetchAll() async {
    try {
      final response = await dio.get(
          'https://script.google.com/macros/s/AKfycbxJ6p8Cb0o6qKNcuAGEJMHxpCDh2P8q9t9kbn5FPEGQkfCFXBb4Uh0uMrgJ2x7fM-bR/exec');
      // final body = response.data;
      if (response.statusCode == 200) {
        // List<dynamic> jsonResponse = jsonDecode(response.data);
        // return jsonResponse.map((e) => CallData.fromJson(e)).toList();
        return Booked.fromJson(response.data);
      }
    } catch (e) {
      Booked(
        success: false,
      );
    }
    return Booked(
      success: false,
    );
  }
}
