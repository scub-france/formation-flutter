Future<int> runner() async => Future.value(3);

int calculate() => 6 * 7;

main() {
  final rs = calculate();
  runner().then((value) => print(value));
}
