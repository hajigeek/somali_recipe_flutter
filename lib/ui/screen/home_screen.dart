// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:somali_recipe/constants/colors.dart';
import 'package:somali_recipe/model/recipe_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:somali_recipe/ui/widgets/home_widgets/categories.dart';
import 'package:somali_recipe/ui/widgets/home_widgets/recipe_listView.dart';
// import 'package:somali_recipe/recipe.dart';
import 'package:somali_recipe/ui/widgets/home_widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  final List names;
  final List ingredients;
  final List time_to_make;
  final List recipe_image;
  final List type;
  final List youtube_url;
  const HomeScreen(
      {Key? key,
      required this.names,
      required this.ingredients,
      required this.time_to_make,
      required this.recipe_image,
      required this.type,
      required this.youtube_url})
      : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState(
      names, ingredients, time_to_make, recipe_image, type, youtube_url);
}

class _HomeScreenState extends State<HomeScreen> {
  Recipe_model recipe_model = new Recipe_model();
  final List names;
  final List ingredients;
  final List time_to_make;
  final List recipe_image;
  final List type;
  final List youtube_url;
  IconData favourite = FontAwesomeIcons.heart;
  List favoriteList = [];
  _HomeScreenState(this.names, this.ingredients, this.time_to_make,
      this.recipe_image, this.type, this.youtube_url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
          //ontap hide virtual keyboard
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 40,
              ),
              SearchWidget(),
              SizedBox(
                height: 20,
              ),
              Categories_food(
                type: type,
              ),
              SingleChildScrollView(
                  // ignore: prefer_const_constructors
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      Recipe_ListView(
                        names: names,
                        images: recipe_image,
                        ingredients: ingredients,
                        time_to_make: time_to_make,
                      )
                    ],
                  ))

              //outlined button with text
            ]),
          )),
    );
  }

//listview for food items

}
