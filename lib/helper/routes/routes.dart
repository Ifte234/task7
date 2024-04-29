import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/add_new_screen/new_screen.dart';
import '../../presentation/graph_screen/graph_screen.dart';
import '../../presentation/home_screen/home_screen.dart';


class Routes {
  static Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/graph':
        return MaterialPageRoute(builder: (context) => GraphScreen());

      case '/new':
        return MaterialPageRoute(builder: (context) => NewScreen());


    }
  }
}