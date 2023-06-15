// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:thai_temple_app/models/temple.dart';
import 'package:thai_temple_app/services/env.dart';

class CallTempleApi {
  static Future<List<Temple>> getAllTemple(Position userPosition) async {
    try {
      final response = await http.get(
        Uri.parse('${Env.API_URL}/temple/apiGetAllTemple.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);

        // Print the API response
        print('API Response: $jsonResponse');

        // Check if the response contains an error message
        if (jsonResponse.isNotEmpty && jsonResponse[0].containsKey('error')) {
          throw Exception(jsonResponse[0]['error']);
        }

        List<Temple> temples =
            jsonResponse.map((data) => Temple.fromJson(data)).toList();

        // Calculate the distance from the user to each temple and sort the temples
        temples.forEach((temple) {
          double distanceInMeters = Geolocator.distanceBetween(
            userPosition.latitude,
            userPosition.longitude,
            double.parse(temple.latitude),
            double.parse(temple.longitude),
          );
          temple.distance = distanceInMeters / 1000; // Convert to kilometers
        });

        temples.sort((a, b) => a.distance.compareTo(b.distance));

        return temples;
      } else {
        throw Exception(
            'Failed to load temples. Status code: ${response != null ? response.statusCode : 'unknown'}');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Connection timeout');
    } catch (e) {
      throw Exception('Failed to load temples: $e');
    } finally {}
  }
}
