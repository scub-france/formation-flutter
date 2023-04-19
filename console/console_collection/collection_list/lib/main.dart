void main() {

    // Déclaration de ma liste
    var myList = [5, 12, 14];
    print("Ma liste mergée : ");
    print(myList);

    print("La longeur de ma liste est : ${myList.length} ");

    // J'ajoute un élément à ma liste
    myList.add(19);

    print("La longeur de ma nouvelle liste est : ${myList.length} ");
    print("Pour l'indice 2, la valeur de l'élément est : ${myList[2]} ");

    print('---');

    // Déclaration d'une nouvelle liste
    var myList2 = [21, 23, 27];

    print("Ma deuxième liste : ");
    print(myList2);

    print('---');

    // On concataine les deux listes
    myList.addAll(myList2);

    /*
    Depuis Dart 2 on peut aussi concatainer de cette façon : myList = myList + myList2;
    Depuis Dart 2.3 on peut aussi utiliser le spread operator : myList = [...myList, ...myList2];
    */

    print("La nouvelle liste concatainée : ");
    print(myList);
    print("La longeur de la nouvelle liste est : ${myList.length} ");


}
