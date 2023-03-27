## Méthodes de type then

`Then()` est une méthode d'un Future qui permet de définir une action à effectuer lorsque la Future est
terminée. Cette méthode prend en paramètre une fonction qui sera exécutée lorsque la Future est
terminée. exemple: `Future.delayed(Duration(seconds: 2).then((value) => print(value));`

# Liens

- [Dart async-await](https://dart.dev/codelabs/async-await)
- [Dart asynchrony support](https://dart.dev/guides/language/language-tour#asynchrony-support)
- https://api.flutter.dev/flutter/dart-async/Future-class.html
