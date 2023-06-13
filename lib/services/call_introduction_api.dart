import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thai_temple_app/models/introduction.dart';
import 'package:thai_temple_app/services/env.dart';

class CallIntroductionApi {
  static Future<List<Introduction>> getAllIntroduction() async {
    try {
      final response = await http.get(
        Uri.parse('${Env.API_URL}/introduction/apiGetAllIntroduction.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<Introduction> introductions =
            jsonResponse.map((data) => Introduction.fromJson(data)).toList();
        return introductions;
      } else {
        throw Exception(
            'Failed to load introductions. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}











// // call introduction api
// import 'dart:convert';
// import 'package:thai_temple_app/services/env.dart';

// import '../models/introduction.dart';
// import 'package:http/http.dart' as http;

// class CallIntroductionApi {
//   //method get all introduction api-----------------
//   static Future<List<Introduction>> getAllIntroduction() async {
//     final response = await http.get(
//       Uri.parse('${Env.API_URL}/introduction/apiGetAllIntroduction.php'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse
//           .map((data) => new Introduction.fromJson(data))
//           .toList();
//     } else {
//       throw Exception('Unexpected error occured!');
//     }
//   }

//   //----------------
// }
