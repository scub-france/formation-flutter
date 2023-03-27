import 'package:go_router/go_router.dart';
import 'package:gorouter/widget/home.widget.dart';
import 'package:gorouter/widget/setting.widget.dart';


//Pour cet exemple, nous avons nommé la route initiale /home
final router = GoRouter(
  //nous devons ajouter initialLocation pour indiquer à notre application que la route par défaut n'est plus "/" mais, dans notre cas, "/home".
  //Sans cela, Flutter ira à "/" lors de l'ouverture de l'application.
  initialLocation: "/home",
  //Maintenant, faites attention à l'indentation des choses.
  //Ici, notre premier GoRoute ne se ferme pas après avoir appelé le HomePage Widget.
  //Nous avons établi une autre route à l'intérieur de la première route.
  //Point important, ne pas mettre de '/' avant le sous-itinéraire.
  routes: [
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
        routes : [
          GoRoute(
            path: "settings",
            builder: (context, state) => const SettingPage(),
          )
        ]
    ),
  ],
);