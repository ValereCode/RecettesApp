// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

// Cette classe est un ChangeNotifier
class FavoriteChangeNotifier with ChangeNotifier {
  bool _isFavorited;
  final int _favoriteCount;

  // Le constructeur
  FavoriteChangeNotifier(this._isFavorited, this._favoriteCount);

  // Les récupérations
  bool get isFavorited => _isFavorited;

  int get favoriteCount => _favoriteCount + (_isFavorited ? 1 : 0);

  set isFavorited(bool isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}
