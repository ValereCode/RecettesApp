// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final bool isFavorited;
  final int favoriteCount;

  const FavoriteWidget({
    Key? key,
    required this.isFavorited,
    required this.favoriteCount,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteWidgetState createState() =>
      // ignore: no_logic_in_create_state
      _FavoriteWidgetState(this.isFavorited, this.favoriteCount);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited;
  int _favoriteCount;

  _FavoriteWidgetState(this._isFavorited, this._favoriteCount);

  void onPressed() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: _isFavorited
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            color: Colors.red),
        // Une icone
        Text('$_favoriteCount')
      ],
    );
  }
}
