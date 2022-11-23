// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:learning_dart/favorite.dart';
import 'package:learning_dart/recipe.dart';

class MySreen extends StatelessWidget {
  const MySreen({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
//==============================================================================
    Widget titleSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          // Les enfants de la ligne !!!
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                // La colonne a comme enfant, un conteneur et un texte
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 20))
              ])),
          FavoriteWidget(
              isFavorited: recipe.isFavorite,
              favoriteCount: recipe.favoriteCount)
        ]));
    //==========================================================================

    // Il s'agit ici d'une méthode qui va retourner une colonne
    // Contenant une icone et un texte !!!
    // ignore: no_leading_underscores_for_local_identifiers
    Column _buildCommentsColumn(Color color, IconData icon, String label) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color),
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: color),
        )
      ]);
    }

    //==========================================================================
    // On crée içi simplement une ligne contenant les deux colonnes précendents
    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildCommentsColumn(Colors.blue, Icons.comment, "COMMENT"),
        _buildCommentsColumn(Colors.blue, Icons.share, "SHARE")
      ]),
    );
    //==========================================================================
    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(recipe.description, softWrap: true),
    );
//==============================================================================

    return Scaffold(
        appBar: AppBar(title: const Text("Mes recettes")),
        body: ListView(
            // Avec se widget, on n'aura plus de problème de overflow et donc on peut scroller facilement
            children: [
              CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: ((context, url) =>
                    const Center(child: CircularProgressIndicator())),
                errorWidget: ((context, url, error) => const Icon(Icons.error)),
                width: 600,
                height: 240,
                fit: BoxFit.cover, // Afficher au mieux l'image
              ),
              titleSection,
              buttonSection,
              descriptionSection
            ]));
  }
}
