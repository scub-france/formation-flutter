import 'package:latlng/latlng.dart';

enum Desk {

  vine(
      label: "Cité du Vin",
      coords: LatLng(44.86448969277308, -0.5507083533114048)),
  num(
      label: "Cité du Numérique",
      coords: LatLng(44.81325756087345, -0.554695831316824)),
  park(
      label: "Cité du Parc",
      coords: LatLng(44.8363709475787, -0.6361958618886067));

  const Desk({required this.label, required this.coords});

  final String label;
  final LatLng coords;
}