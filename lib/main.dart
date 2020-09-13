import 'package:baking_app_flutter/Models/Recipe.dart';
import 'package:baking_app_flutter/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Ui/HomeActivity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() async {

  List recipe = await getRecipes();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Constant.KEY_DARK_BLUE_COLOR, // navigation bar color
  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColorDark: Constant.KEY_BLUE_COLOR,
        primaryColor: Constant.KEY_BLUE_COLOR,
        backgroundColor: Constant.KEY_BLUE_COLOR,
        fontFamily: Constant.KEY_FONT),
    home: new Home(recipe),
  ));

}

Future<List> getRecipes() async {
  var api = Constant.KEY_API;
  var data = await http.get(api);
  var jsonData = json.decode(data.body);
  return jsonData;
}

