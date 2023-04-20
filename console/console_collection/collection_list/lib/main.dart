void main() {

    /**
     * Déclaration de ma liste
     */

    print('--- Déclaration ---');
    var myList = [5, 12, 14];

    // Ma liste
    print(myList);

    print("La longueur de ma liste est : ${myList.length} ");
    print("Le premier élément : ${myList.first} ");
    print("Le dernier élément : ${myList.last} ");

    // J'ajoute un élément à ma liste
    myList.add(19);

    print("La longueur de ma liste est désormais : ${myList.length} ");
    print("Pour l'indice 2, la valeur de l'élément est : ${myList[2]} ");


    print('---');

    // Déclaration d'une nouvelle liste
    var myList2 = [21, 23, 27];
    print(myList2);

    print('---');

    // On concataine les deux listes
    myList.addAll(myList2);

    /*
    Depuis Dart 2 on peut aussi concatainer de cette façon : myList = myList + myList2;
    Depuis Dart 2.3 on peut aussi utiliser le spread operator : myList = [...myList, ...myList2];
    */

    print(myList);
    print("La longueur de la nouvelle liste est : ${myList.length} ");

    /**
     * Itération
     */

    print('--- Boucle for ---');
    for(int i=0; i<myList.length; i++) {
        print("Pour l'indice $i la valeur valeur est ${myList[i]}");
    }

}
