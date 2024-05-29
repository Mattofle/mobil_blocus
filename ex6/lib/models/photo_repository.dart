import 'dart:convert';
import 'dart:developer';
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

  Future<bool> addPhoto(Photos photo) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/photos'),
        body: jsonEncode({
          'title': photo.title,
          'url': photo.url,
          'thumbnailUrl': photo.thumbnailUrl
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          },
      );
      if (response.statusCode == 201) {
        final dynamic photoJson =
            await Future.value(jsonDecode(response.body));
        final photo = Photos.fromJson(photoJson);
        log("add : id :${photo.id} thumbnailUrl : ${photo.thumbnailUrl}",
            name: "PhotoRepository");
        return true;
      } else {
        log("Status code ${response.statusCode} response.body : ${response.body}",
            name: "PhotoRepository");
        return false;
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}