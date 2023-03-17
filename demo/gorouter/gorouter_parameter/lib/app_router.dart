import 'package:go_router/go_router.dart';
import 'package:gorouter/widget/home.widget.dart';
import 'package:gorouter/widget/setting.widget.dart';


//For this example, we named the initial route /home
final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage()),
    GoRoute(
      //We pass 'name' as a route parameter
      path: "/settings/:name",
      //In the constructor of the Widget we call, we take the variable we created in the Widget
      builder: (context, state) => SettingPage(
      name: state.params["name"]!,
           ),
        )
  ],
);