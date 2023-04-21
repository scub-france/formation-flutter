// Comment implementer une extension pratique
// Le type Iterable n'a pas de méthode removeWhere(....), il faut ainsi caster
// notre Iterable en List pour pouvoir accéder a la methode removeWhere....
// pourquoi ne pas automatiser ca dans une extension!?

extension ExtendedList<E> on Iterable<E> {
  Iterable<E> deleteWhere(bool Function(E element) test) => toList()..removeWhere(test);
}
// Pensez a coder vos extensions dans des fichiers séparés afin de pouvoir les
// importer dans tout le projet voir meme dans d'autre projet


void main(List<String> arguments) {
  print("Génération d'une liste");
  Iterable<int> iterable = Iterable.generate(10, (index) => index);

  // Sans extension nous aurions du procédé ainsi:
  // final result= iterable.toList()..removeWhere((element) => element%2==0);

  print("Liste originale $iterable");

  final result = iterable.deleteWhere((element) => element % 2 == 0);
  print('Liste nettoyée: $result');

  final found = result.contains(2);
  print('Contient 2 ? => $found');
}
