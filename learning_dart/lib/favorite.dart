// ignore_for_file: unnecessary_this
import 'package:flutter/material.dart';
import 'package:learning_dart/favoriteChangeNotifier.dart';
import 'package:provider/provider.dart';

//==============================================================================
// Une icone widget
class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool _isFavorited = true;

  void onPressed(FavoriteChangeNotifier notifier) {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });

    notifier.isFavorited = _isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier notifier =
        Provider.of<FavoriteChangeNotifier>(context);
    _isFavorited = notifier.isFavorited;
    return IconButton(
        onPressed: (() => onPressed(notifier)),
        icon: _isFavorited
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        color: Colors.red);
    // Une icone
  }
}

//==============================================================================
// Un texte widget
class FavoriteTextWidget extends StatefulWidget {
  const FavoriteTextWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChangeNotifier>(
        builder: ((context, notifier, _) =>
            Text(notifier.favoriteCount.toString())));
  }
}
