import 'dart:isolate';

void main() async {
  // Créer un nouveau ReceivePort pour écouter les messages
  final receivePort = ReceivePort();

  // Démarrer un nouvel Isolate et récupérer son SendPort
  final isolate = await Isolate.spawn(isolateFunction, receivePort.sendPort);

  // Attendre la réponse de l'Isolate
  final response = await receivePort.first;
  print('Received response: $response');

  print('je suis dans le main');
  // Tuer l'Isolate
  isolate.kill();
}

void isolateFunction(SendPort sendPort) {
  // Envoyer une réponse au main isolate
  Future.delayed(Duration(seconds: 5), () {
    sendPort.send('j\'ai executer un calcul de 5s');
  });
}
