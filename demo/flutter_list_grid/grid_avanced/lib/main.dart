import 'package:flutter/material.dart';

/// Cette démo présente l'utilisation d'une GridView avancée.
/// Utilisation d'un builder.
/// Utilisation d'une collection d'objet Movie.
void main() => runApp(const GridAvancedApp());

class GridAvancedApp extends StatelessWidget {
  const GridAvancedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Démo List - GridView",
      home: GridWidget(),
    );
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Collection d'objets servant à alimenter GridView
    final List<Movie> movies = [
      const Movie(title: 'Willow', imageUrl: "../assets/willow.jpg"),
      const Movie(title: 'E.T.', imageUrl: "../assets/et.jpg"),
      const Movie(
          title: 'Le professionnel',
          imageUrl: "../assets/le-professionnel.jpg"),
      const Movie(title: 'Highlander', imageUrl: "../assets/highlander.jpg"),
      const Movie(title: 'Goonies', imageUrl: "../assets/goonies.jpg"),
      const Movie(title: 'Start Wars', imageUrl: "../assets/starwars.jpg"),
      const Movie(title: 'Mad Max', imageUrl: "../assets/madmax.jpg"),
    ];

    /// Le builder
    return GridView.builder(
      padding: const EdgeInsets.all(40),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 2 / 3,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: movies.length,
      itemBuilder: (BuildContext ctx, index) {
        return GridItem(movie: movies[index]);
      },
    );
  }
}

/// Widget correspondant à un item de la GridView
class GridItem extends StatelessWidget {
  final movie;

  const GridItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
        image: DecorationImage(
          image: AssetImage(movie.imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5));

    return Stack(
      children: <Widget>[
        Container(
          decoration: decoration,
        ),
        Container(
          child: Center(
            child: Text(
              movie.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class Movie {
  final title;
  final imageUrl;

  const Movie({required this.title, required this.imageUrl});
}
