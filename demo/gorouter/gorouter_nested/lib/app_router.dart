import 'package:go_router/go_router.dart';
import 'package:gorouter/widget/home.widget.dart';
import 'package:gorouter/widget/setting.widget.dart';


//Here we define routes
//this is simple route to navigate between HomePage and SettingPage
//Pay attention: here, we defined routes but we must call them where we need them
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