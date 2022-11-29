import 'package:flutter/material.dart';
//import 'package:transparent_image/transparent_image.dart';

// ignore: unused_import
import 'package:learning_dart/myScreen.dart';
// ignore: unused_import
import 'package:learning_dart/recipe.dart';
import 'package:learning_dart/recipeListScreen.dart';
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
        initialRoute: "/",
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        debugShowCheckedModeBanner:
            false, // Enlevons la petite icone de debug dans le code
        theme: ThemeData(
            // Le thème de notre app
            primarySwatch: Colors.red),
        home: const RecipeListScreen());
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const RecipeListScreen());

      case '/recipe':
        if (settings.arguments != null) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MySreen(recipe: settings as Recipe),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation =
                    CurvedAnimation(parent: animation, curve: Curves.ease);
                return FadeTransition(opacity: animation, child: child);
              });
        } else {
          return pageNotFound();
        }
      case '/newRecipe':
      //return MaterialPageRoute(builder: (context) => RecipeFormScreen());

      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(title: const Text("Error"), centerTitle: true),
            body: const Center(
              child: Text("Page not found"),
            )));
  }
}
