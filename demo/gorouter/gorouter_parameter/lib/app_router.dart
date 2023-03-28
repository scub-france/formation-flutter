import 'package:go_router/go_router.dart';
import 'package:gorouter/widget/home.widget.dart';
import 'package:gorouter/widget/setting.widget.dart';



final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage()),
    GoRoute(
      //Nous passons 'name' en parametre de la route
      path: "/settings/:name",
      //Dans le constructeur du Widget que nous appelons, nous prenons la variable que nous avons créée dans le Widget
      builder: (context, state) => SettingPage(
      name: state.params["name"]!,
           ),
        )
  ],
);