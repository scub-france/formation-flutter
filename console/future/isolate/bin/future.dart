import 'dart:isolate';

void main() async {
  // créer un port pour communiquer entre les isolates
  final p = ReceivePort();

  // créer un map pour envoyer les données avec le port
  final data = {'port': p.sendPort, 'data' : 'here is some data.'};

  // création de l'isolate
  final isolate = await Isolate.spawn(heavyFunction, data);

  // tu peux récupérer seulement le premier élément comme ça
  //final computedData = await p.first;
  
  // mais si tu veux récupérer plus d'éléments tu peux utiliser la méthode listen
  //on va récupérer les données envoyées par le port ainsi que le message qu'on lui à envoyé en premier
  p.listen((message) {
    print(message);
  });

  // ou tu peux utiliser un for
  // await for (var item in p) {
  //   print(item);
  // }
}

// Top Level Function
void heavyFunction(Map<String, dynamic> map) {
  // récupérer les données du map
  final SendPort port = map['port'];
  final String data = map['data'];

  // Heavy computing process
  final computedData = data;
  print('je suis dans le heavyFunction, est voici la data : $computedData');

  // tu peux envoyer des données avec la methode send du port
  port.send('data1');
  port.send('data2');
  port.send('data3');

  // N'oubliez pas  de kill l'isolate afin d'évite tout fuite mémoire ou performance
  // appart si vous utiliser le compute de flutter qui gère tout ça pour vous
  Isolate.exit(port, computedData);
}