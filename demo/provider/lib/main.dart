import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';

final generator = nanoid();

/// Constuire un Article
///
class Article {
  final String id;
  final int prix;
  int quantite = 0;

  /// génère et retourne un article
  Article({required this.id, required this.prix});
}

/// Le fournisseur des articles, il hérite de ChangeNotifier
/// et peut donc, notifier ses Consumer de ces changements
/// grace a l'appel de notifyListeners()
class ArticlesProvider extends ChangeNotifier {
  final articles = List.generate(
      50,
      (_) => Article(
            prix: Random().nextInt(100) + 1,
            id: nanoid(10),
          ));
  List<Article> panier = [];
  int prixTotal = 0;

  ajoutAuPanier(Article article) {
    article.quantite++;
    if (!panier.contains(article)) {
      panier.add(article);
    }
    prixTotal += article.prix;

    /// N'oublier pas de notifier le consumer des changements
    notifyListeners();
  }

  retireDuPanier(Article article) {
    article.quantite--;
    if (article.quantite == 0) {
      panier.remove(article);
    }
    prixTotal -= article.prix;

    /// N'oublier pas de notifier le consumer des changements
    notifyListeners();
  }
}

/// Si vous n'estes pas encore familier avec router(), sachez juste
/// que c'est un package responsable de la navigation dans Flutter.
/// je vous encourage a voir le cours qui traite ce sujet.
GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(path: '/catalogue', builder: (context, state) => const Catalogue(), routes: [
        GoRoute(
          path: 'panier',
          builder: (context, state) => const MonPanier(),
        ),
      ])
    ],
  );
}

void main() => runApp(Provider(create: (_) => ArticlesProvider, child: const ProviderApp()));

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  build(context) {
    /// On place ici ChangeNotifierProvider comme widget principal dans l'arborescence des widgets.
    /// Les widgets enfants(ici, toute l'application), peuvent accéder et modifier ArticlesProvider !
    /// et tout changement chez ce dernier sera notifié au widgets abonnés.
    return ChangeNotifierProvider(
        create: (context) => ArticlesProvider(),
        child: MaterialApp.router(
          routerConfig: router(),
        ));
  }
}

/// Page catalogue
class Catalogue extends StatefulWidget {
  const Catalogue({super.key});

  @override
  State<Catalogue> createState() => _Catalogue();
}

class _Catalogue extends State<Catalogue> {
  @override
  build(context) {
    final provided = context.read<ArticlesProvider>();
    final articles = provided.articles;

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Catalogue', style: Theme.of(context).textTheme.displayMedium)),
          actions: [
            IconButton(
              iconSize: 50,
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => {context.go('/catalogue/panier')},
            ),
          ],
        ),
        body: Center(
            child: ListView(
                children: articles
                    .map((e) => ArticleCard(
                          article: e,
                        ))
                    .toList())));
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    /// un Consumer Widget pour lire mon provider
    return Consumer<ArticlesProvider>(builder: (context, articlePovider, _) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Numero article: ${article.id}", style: const TextStyle(fontSize: 30)),
                    const SizedBox(width: 50),
                    Text("Prix: ${article.prix.toString()}euros")
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => articlePovider.ajoutAuPanier(article),
                    ),
                    Text(article.quantite.toString(), style: const TextStyle(fontSize: 20, color: Colors.green)),
                    const Icon(Icons.shopping_cart),
                    IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (article.quantite > 0) {
                            articlePovider.retireDuPanier(article);
                          }
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class MonPanier extends StatelessWidget {
  const MonPanier({super.key});

  @override
  Widget build(BuildContext context) {
    final providerArticles = Provider.of<ArticlesProvider>(context);
    final articles = providerArticles.panier;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Total: ${providerArticles.prixTotal}euros", style: Theme.of(context).textTheme.displayMedium),
        ),
      ),
      body: Center(
        child: ListView(children: articles.map((e) => ArticleCard(article: e)).toList()),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Acceuil', style: Theme.of(context).textTheme.displayMedium)),
      ),
      body: Center(
        child: ListView(children: [
          const SizedBox(
            height: 200,
          ),
          const Text(
            'ScuBay: application de vente en ligne',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 150,
          ),
          FloatingActionButton(
            child: const Text('Entrez'),
            onPressed: () => context.go('/catalogue'),
          )
        ]),
      ),
    );
  }
}
