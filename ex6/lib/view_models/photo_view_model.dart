import 'dart:convert';

import 'package:ex6/models/photo_repository.dart';
import 'package:ex6/models/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class PhotoViewModel extends ChangeNotifier{

  final PhotoRepository _photoRepository = PhotoRepository();
  String _errorMessage = '';
  Future<List<Photos>> get photos => fetchPhotos();
  String get errorMessage => _errorMessage;
  bool get hasError => _errorMessage.isNotEmpty;

  Future<List<Photos>> fetchPhotos() async {
    try{
      final List<Photos> fetchedPhotos = await Future.delayed(
        const Duration(seconds: 4), () => _photoRepository.fetchPhotos());
      fetchedPhotos.sort((a, b) => b.id.compareTo(b.id));
      return fetchedPhotos;
    } catch (error){
      _errorMessage = error.toString();
      rethrow;
    }
  }



}