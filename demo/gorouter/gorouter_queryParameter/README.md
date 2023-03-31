# Liens

https://zapp.run/github/Robert-Scub/formation-flutter/tree/main/demo/gorouter/gorouter_queryParameter


## Utilisation de queryParameter

Les queryParams (ou paramètres de requête) sont une façon de transmettre des données à une route à travers l'URL.

Ces données sont représentées sous la forme de paires clé-valeur et peuvent être utilisées pour de nombreuses tâches telles que la recherche, la pagination, etc.

GoRouter permet de facilement récupérer et utiliser les queryParams associés à une route. 

Pour utiliser des queryParams avec GoRouter, il faut tout d'abord les définir dans l'URL lors de la navigation vers une route.


Par exemple, dans cette leçon pour naviguer vers une route nommée `setting` en passant les queryParams "email", "age" et "place" avec les valeurs correspondantes, on peut utiliser la méthode `goNamed` de `BuildContext`.

Une fois que la route settings est atteinte, on peut récupérer les queryParams associés à cette route grâce à l'objet state passé en paramètre de la méthode builder de la route correspondante.

Par exemple, pour récupérer la valeur du paramètre "email", on peut utiliser le code suivant :

`final email = state.queryParams["email"];`

Il est important de noter que les queryParams sont considérés comme facultatifs et qu'ils peuvent ne pas être présents dans l'URL lors de la navigation vers une route. 

Dans ce cas, la valeur associée sera nulle.

## Conclusion

En résumé, GoRouter permet de facilement utiliser les queryParams dans vos routes en les récupérant avec l'objet state et la propriété queryParams.