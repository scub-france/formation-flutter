import 'dart:convert';

import 'package:http/http.dart' as http;

//la classe photo represente notre model de donnée
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  //La factory permet de construire un objet Photo depuis json (Map<clef, valeur>)...
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      //as permet de profiter de la puissance des langages typés
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

//Collecte des données sous forme d'une Future
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  return parsePhotos(response.body);
}

// fonction pour convertir la reponse Json en une liste de photos
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

//On a pas besoin d'une UI pour tester du Dart....
main() async {
  List<Photo> photos = await fetchPhotos(http.Client());
  photos.forEach((photo) => print(photo.title));
}
