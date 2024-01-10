import 'package:flutter/material.dart';
import 'package:todo_app/ui/auth/auth_screen.dart';
import 'package:todo_app/ui/splash/splash_screen.dart';
import 'package:todo_app/ui/tabs/tabs_screen.dart';
import '../models/todo_model/todo_model.dart';
import 'add_todo/add_todo_screen.dart';
import 'on_boarding/on_boarding_screen.dart';

class RouteNames {
  static const String initial = "/";
  static const String boarding = "/boarding_route";
  static const String tabs = "/tabs_route";
  static const String addToDoScreen = "/add_todo_route";
  static const String auth = "/auth_route";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.boarding:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case RouteNames.tabs:
        return MaterialPageRoute(builder: (context) => TabsScreen());
      case RouteNames.auth:
        return MaterialPageRoute(builder: (context) => AuthScreen());
      case RouteNames.addToDoScreen:
        return MaterialPageRoute(
          builder: (context) => AddToDoScreen(
            onAdded: settings.arguments as ValueChanged<ToDoModel>,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}
