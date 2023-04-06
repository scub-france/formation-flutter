/// Dans cet exemple, je vous montre comment implementer une extension pratique
/// En effet, le type Iterable na pas de methode removeWhere(....), il faut ainsi caster notre Iterable el List
/// pour pouvoir avoir accées a la methode removeWhere.... pourquoi ne pas automatiser ca dans une extention!?
extension Remove<E> on Iterable<E> {
  Iterable<E> deleteWhere(bool Function(E element) test) => toList()..removeWhere(test);
}


void main(List<String> arguments) {
  Iterable<int> iterable= Iterable.generate(10, (index) => index);
  /// sans extension on aurait prcédés comme suite:
  /// final result= iterable.toList()..removeWhere((element) => element%2==0);
  final result= iterable.deleteWhere((element) => element%2==0);
  print(result);
}
