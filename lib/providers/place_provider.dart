import 'package:flutter/cupertino.dart';
import 'package:places_app/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }
}
