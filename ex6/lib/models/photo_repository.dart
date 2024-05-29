import 'dart:convert';
import 'package:ex6/models/photos.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {

  final String _baseUrl = 'https://unreal-api.azurewebsites.net/';


  Future<List<Photos>> fetchPhotos() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/photos'));
      if (response.statusCode == 200) {
        return compute(
                (responseBodyReceived) => jsonDecode(responseBodyReceived)
                .map<Photos>((jsonObj) => Photos.fromJson(jsonObj))
                .toList(),
            response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}