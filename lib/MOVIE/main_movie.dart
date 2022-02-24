
import 'package:flutter/material.dart';
import 'package:movie_api/MOVIE/main.dart';
import 'package:movie_api/MOVIE/page.dart';
import 'package:provider/provider.dart';

import 'api_section.dart';
import 'model_class.dart';
//
// void main() {
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ChangeNotifierProvider(
        create: (context)=>APISection(),builder: (BuildContext context,child)=>MyHome(),),
    );
  }
}

class MyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}
