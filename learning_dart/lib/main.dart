import 'package:flutter/material.dart';
//import 'package:transparent_image/transparent_image.dart';

import 'package:learning_dart/myScreen.dart';
import 'package:learning_dart/recipe.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
//==============================================================================

// ignore: slash_for_doc_comments
/**
 * Un objet de type StatelessWidget ne change pas d'état
 * 
 * Un objet de type StatefulWidget peut changer d'état
 * 
 * Row me permet de définir une ligne
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner:
            false, // Enlevons la petite icone de debug dans le code
        theme: ThemeData(
            // Le thème de notre app
            primarySwatch: Colors.red),
        home: MySreen(
            recipe: Recipe(
                'Crevettes aux poivrons',
                'Par Delfine',
                'https://ohlagourmandedotcom.files.wordpress.com/2022/03/img_6913.jpg',
                'Ingrédients : Pour 3 personnes\n15 g de gingembre\n2 gousses d’ail\n1 oignon\n1 c à s d’huile d’olive\n360 g de crevettes crues décortiquées\n3 poivrons ( 2 rouges et un jaune)sel poivre',
                false,
                5)));
  }
}
