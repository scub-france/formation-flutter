# flutter_decoration

---
title: Décoration
publishDate: 2023-03-23
img: /cours/image/decoration.png
img_alt: DecoratedBox
description: Décorer vos containers
tags:
  - ui
  - layout

steps: [{ "Ressource locale": "zi2o06x6i2p0" }, { "Conclusion": "conclusion" }]

author: Matthieu Dejean
conclusion: "Le widget DecoratedBox est un excellent moyen de personnaliser l'apparence de vos widgets et d'ajouter des éléments décoratifs à vos interfaces utilisateur. Vous pouvez expérimenter avec différentes combinaisons de couleurs, de bordures, d'images et de gradients pour créer des interfaces utilisateur magnifiques et uniques."
difficulty: 1
---

Flutter offre une large gamme de widgets pré-construits qui peuvent être utilisés pour créer des interfaces utilisateur conviviales.

L'un des widgets les plus intéressants de Flutter est le DecoratedBox. Ce widget permet de décorer un enfant en appliquant une décoration à son arrière-plan. La décoration peut inclure des éléments tels que des bordures, des couleurs d'arrière-plan, des images d'arrière-plan, etc.

Voici comment utiliser le widget DecoratedBox dans Flutter :

1. Importez le package Flutter Material Design en ajoutant la ligne suivante dans votre fichier dart:

```dart
import 'package:flutter/material.dart';
```

2. Créez un nouveau widget DecoratedBox en lui passant les propriétés de décoration et d'enfant souhaitées :

```dart
DecoratedBox(
  decoration: BoxDecoration(
    color: Colors.yellow,
    border: Border.all(
      color: Colors.red,
      width: 2,
    ),
  ),
  child: const Center(
    child: Text('L\'enfant n°1 décoré'),
  ),
),
```

Dans cet exemple, nous avons créé un nouveau DecoratedBox avec une couleur d'arrière-plan jaune et une bordure rouge de 2 pixels. Nous avons également ajouté un enfant Text qui affiche "L\'enfant n°1 décoré".

3. Vous pouvez également utiliser des images comme arrière-plan de DecoratedBox. Par exemple :

```dart
DecoratedBox(
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      image: AssetImage('images/background.jpg'),
      fit: BoxFit.cover,
    ),
  ),
  child: Center(
      child: Text('L\'enfant n°2 décoré',
          style: TextStyle(color: Colors.white))),
),
```

Dans cet exemple, nous avons utilisé une image de fond pour la décoration de notre DecoratedBox en utilisant la propriété "image" de la classe "DecorationImage". La propriété "fit" est utilisée pour spécifier comment l'image doit être ajustée dans le DecoratedBox.

Pense à ajouter ton image dans la rubrique assets de ton fichier pubspec.yaml

4. Vous pouvez également utiliser des gradients comme arrière-plan de DecoratedBox. Par exemple :

```dart
DecoratedBox(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, Colors.red],
    ),
  ),
  child: Text('L\'enfant n°3 décoré'),
),
```

Dans cet exemple, nous avons utilisé un gradient linéaire pour la décoration de notre DecoratedBox en utilisant la propriété "gradient" de la classe BoxDecoration. Nous avons spécifié le point de départ et le point d'arrivée du gradient en utilisant les propriétés "begin" et "end", respectivement. Nous avons également spécifié les couleurs que nous voulons dans notre gradient à l'aide de la propriété "colors".
