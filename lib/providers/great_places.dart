import 'dart:io';

import 'package:flutter/Foundation.dart';
import 'package:flutter_camera_app/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  late List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: title,
        location: null);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetLlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: item['location'],
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
