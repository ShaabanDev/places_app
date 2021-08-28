import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  }
}
