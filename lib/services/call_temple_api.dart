import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thai_temple_app/models/temple.dart';
import 'package:thai_temple_app/services/env.dart';

class CallTempleApi {
  static Future<List<Temple>> getAllTemple() async {
    try {
      final response = await http.get(
        Uri.parse('${Env.API_URL}/temple/apiGetAllTemple.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<Temple> temples =
            jsonResponse.map((data) => Temple.fromJson(data)).toList();
        return temples;
      } else {
        throw Exception(
            'Failed to load temples. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
