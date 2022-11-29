// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_dart/myScreen.dart';
import 'package:learning_dart/recipe.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
  //RecipeListScreen({super.key});

  // La liste des recettes
  final List<Recipe> recipes = [
    Recipe(
        "Crevettes aux poivrons",
        "Par Delfine",
        "https://ohlagourmandedotcom.files.wordpress.com/2022/03/img_6913.jpg",
        "Ingrédients : Pour 3 personnes\n- 15 g de gingembre\n- 2 gousses d’ail\n- 1 oignon\n- 1 c à s d’huile d’olive\n- 360 g de crevettes crues décortiquées\n- 3 poivrons ( 2 rouges et un jaune)sel poivre",
        false,
        50),
    Recipe(
        "Frites d'ignames",
        "Par Catalina",
        "https://1.bp.blogspot.com/-GkxjcUUCRWs/XllF20qrUCI/AAAAAAAAwfc/bTDSqp0_NwoYe99Fc30agX-1xFFmtEMhwCLcBGAsYHQ/s640/20200226_182152%2B%25282%2529.jpg",
        "Voici les ingrédients de sa recette :\n-1 igname\n-4 cuillères à soupe d'huile d'olive\n-fleur de sel au thym séché\n-piment d’Espelette",
        false,
        50),
    Recipe(
        "Salade de poulet mariné au gingembre et au citron ",
        "Par Sophie",
        "https://latendresseencuisine.com/wp-content/uploads/2022/04/20220102_133211.jpg",
        "Voici les ingrédients de la recette :\n-100 g de filets de poulet\n-1 c. à s. de gingembre frais\n-1 citron\n-1 salade sucrine\n-1 avocat\n-2 c. à s. d'huile d'olive\n-3 olives noires\n-1 tranche d'oignon rouge\n-6 brins de coriandre fraîche\n-1 c. à s. d'huile d'olive\n-Sel et poivre",
        false,
        50),
    Recipe(
        "Gâteau kéké à la vanille",
        "Par Natly",
        "https://latendresseencuisine.com/wp-content/uploads/2020/04/Togo-Natly.jpg",
        "Voici les ingrédients de sa recette :\n-250 gr de farine\n-6 œufs\n-250 gr de beurre mou\n-200 gr de sucre\n-1 sachet de levure chimique\n-1 gousse de vanille\n-1 (ou 2) bouchon(s) de rhum",
        false,
        50),
    Recipe(
        "Sauce togolais - Dja ou m'gbagba",
        "Par Emma",
        "https://latendresseencuisine.com/wp-content/uploads/2020/04/Togo-Emma.jpg",
        "Voici les ingrédients de sa recette :\n-1 boîte de tomates concassées (600 g)\n-2 oignons, émincés\n-2 cuillères à café de pâte d’ail (à défaut d’ail en poudre)\n-3 cuillères à soupe de pâte de gingembre (à défaut, gingembre en poudre)\n-1-3 piments antillais (je n’en mets pas)\n-4 cuillères à café de concentré  de tomates\n-1 cuillère à soupe de bouillon de légumes en poudre ou autre assaisonnement.\n-Sel et poivre\n-De l’huile d’arachide",
        false,
        50),
    Recipe(
        "Sauce d'épinards à la viande",
        "Par Martine",
        "https://www.latendresseencuisine.com/wp-content/uploads/2017/04/Togo-Martine.jpg",
        "Voici les ingrédients de sa recette :\n\n-350 g de jeunes pousses d' épinards\n-400 g de viande de bœuf\n-1 gros oignon\n-600 g de coulis de tomate\n-1 cs de gingembre\n-sel et poivre\n-1 pincée de piment\n-1 peu d' huile",
        false,
        50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Une nouvelle page
        appBar: AppBar(
          title: const Text("Mes recettes"),
        ),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Dismissible(
                  key: Key(recipe.title),
                  onDismissed: (direction) {
                    setState(() {
                      recipes.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${recipe.title} supprimé")));
                  },
                  background: Container(color: Colors.red),
                  child: RecipeItemWidget(recipe: recipe));
            }));
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Quand on appuie, on tombe sur MyScreen
        onTap: () => Navigator.pushNamed(context, "/recipe", arguments: recipe),
        /*
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    MySreen(recipe: recipe),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  animation =
                      CurvedAnimation(parent: animation, curve: Curves.ease);

                  //var end = Offset.zero;
                  //var curve = Curves.ease;
                  //var tween = Tween(begin: begin, end: end).chain(
                  // CurveTween(curve: curve)); // On chaine 2 animations
                  return FadeTransition(opacity: animation, child: child);
                  //position: animation.drive(tween), child: child);
                })),*/
        child: Card(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                Hero(
                    tag: "Image${recipe.title}",
                    child: CachedNetworkImage(
                        imageUrl: recipe.imageUrl,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // La colonne a comme enfant, un conteneur et un texte
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(recipe.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(recipe.user,
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 20))
                      ]),
                )
              ],
            )));
  }
}
