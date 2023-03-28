import 'package:go_router/go_router.dart';
import 'package:gorouter/widget/home.widget.dart';
import 'package:gorouter/widget/setting.widget.dart';


// Nous définissons ici les routes
// Il s'agit d'une route simple pour naviguer entre HomePage et SettingPage
// Attention : ici, nous avons défini des itinéraires, mais nous devons les appeler là où nous en avons besoin.
final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingPage(),
    )
  ],
);