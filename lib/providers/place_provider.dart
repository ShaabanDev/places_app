import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:places_app/helpers/db_helper.dart';
import 'package:places_app/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(File pickedImage, String pickedTitle) {
    final newplace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage);

    _items.add(newplace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dbTable = await DBHelper.fetData('user_places');
    _items = dbTable
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
