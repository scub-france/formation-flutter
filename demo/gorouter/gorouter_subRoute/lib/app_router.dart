import 'package:go_router/go_router.dart';
import 'package:gorouter/widget/home.widget.dart';
import 'package:gorouter/widget/setting.widget.dart';


//For this example, we named the initial route /home
final router = GoRouter(
  //we need to add initialLocation to tell our application that the default route is no longer "/" but, in our case, "/home".
  //Without this, Flutter will go to "/" when opening the application
  initialLocation: "/home",
  //Now, pay attention to the indentation of things.
  //Here, our 1st GoRoute, does not close after calling the HomePage Widget.
  //We set up another route inside the 1st route.
  //Important point, do not put a '/' before the sub-route
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