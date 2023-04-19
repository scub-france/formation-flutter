# firestore

Gestion firestore

### Qu'est-ce que c'est ?

Firestore est conçu pour stocker et gérer des données structurées et non structurées dans le cloud de
manière efficace et évolutive. Avec Firestore, vous pouvez stocker des données sous forme de
documents JSON, qui sont organisés en collections et sous-collections. Ces documents peuvent être
consultés, mis à jour et supprimés en temps réel, ce qui permet à votre application de réagir
rapidement aux changements de données. Firestore prend également en charge la synchronisation des
données en temps réel entre les clients et le serveur, ce qui facilite la création d'applications en
temps réel.

### Le NoSQL

Firestore est un service de base de données NoSQL. Les bases de données NoSQL sont des bases de
données qui ne sont pas basées sur le modèle relationnel. Les bases de données relationnelles
stockent les données dans des tables, qui sont ensuite liées entre elles par des clés étrangères.
Les bases de données NoSQL, quant à elles, stockent les données dans des collections, qui sont liées
entre elles par des clés étrangères. Les bases de données NoSQL sont plus flexibles que les bases de
données relationnelles, car elles permettent de stocker des données de manière non structurée. Les
bases de données NoSQL sont également plus faciles à mettre à l'échelle que les bases de données
relationnelles, car elles peuvent être facilement réparties sur plusieurs serveurs.

### Initialisation

Il vous suffit de suivre les étapes sur flutterfire pour initialiser firestore dans votre projet.
https://firebase.flutter.dev/docs/overview/

### Query

Firestore fournit une API de requête puissante qui vous permet de rechercher et de filtrer des
données dans votre base de données. Vous pouvez utiliser les requêtes pour rechercher des documents
spécifiques, filtrer les documents en fonction de leurs champs et de leurs valeurs, et trier les
documents en fonction de leurs champs.

**add**: Ajoute un document à la collection spécifiée. Si le document n'a pas d'ID, un ID est généré
automatiquement.

exemple:

```dart

final documentReference = await firestore.collection('books').
add({
'title': 'Mastering Flutter',
'description': 'Programming Guide for Dart'
});
```

**set**: Ajoute un document à la collection spécifiée. Si le document n'a pas d'ID, un ID est généré
automatiquement. Si le document existe déjà, il est écrasé.

exemple:

```dart

final documentReference = await firestore.collection('books').
set({
'title': 'Mastering Flutter',
'description': 'Programming Guide for Dart'
});
```

**update**: Met à jour un document existant. Si le document n'existe pas, une exception est levée.

exemple:

```dart

final documentReference = await firestore.collection('books').
update({
'title': 'Mastering Flutter',
'description': 'Programming Guide for Dart'
});
```

**delete**: Supprime un document existant. Si le document n'existe pas, une exception est levée.

exemple:

```dart

final documentReference = await firestore.collection('books').delete();
```

**get**: Récupère un document existant. Si le document n'existe pas, une exception est levée.

exemple:

```dart

final documentReference = await firestore.collection('books').get();
```


