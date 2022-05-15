// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:somali_recipe/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:somali_recipe/model/recipe_model.dart';
import 'package:http/http.dart';

class PracLoading extends StatefulWidget {
  _PracLoadingState createState() => _PracLoadingState();
}

class _PracLoadingState extends State<PracLoading> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue[900], body: Center());
  }

  void getData() async {
    Recipe_model recipe_model = Recipe_model();
    await recipe_model.getAllData();

    List names = recipe_model.getNames();

    List ingredients = recipe_model.getIngredients();
    List time_to_make = recipe_model.getTimeToMake();
    List recipe_image = recipe_model.getRecipeImage();
    List type = recipe_model.getType();
    List youtube_url = recipe_model.getYoutubeUrl();
    // print(names);
    // print(ingredients[0]['name'].length);
    // print(time_to_make);
    // print(recipe_image);
    // print(type);
    // print(youtube_url);

    if (names != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    names: names,
                    ingredients: ingredients,
                    time_to_make: time_to_make,
                    recipe_image: recipe_image,
                    type: type,
                    youtube_url: youtube_url,
                  )));
    }
  }
}
