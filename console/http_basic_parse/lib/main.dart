import 'dart:convert';

import 'package:http/http.dart' as http;

/// Combiner GET avec le parsing JSON
main() async {
  List<Photo> photos = await fetchPhotos(http.Client());
  photos.forEach((photo) => print(photo.title));
}

/// Model de donnée cible
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

  /// Une factory comme constructeur
  factory Photo.fromJson(Map<String, dynamic> json) =>
    Photo(
      //as permet de profiter de la puissance des langages typés
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
 
}

// Appel http et parsing
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  return parsePhotos(response.body);
}

// Convertion du corps de la réponse http vers Json.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
