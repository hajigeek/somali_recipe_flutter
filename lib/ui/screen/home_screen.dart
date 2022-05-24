// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:somali_recipe/constants/colors.dart';
import 'package:somali_recipe/model/getData.dart';
import 'package:somali_recipe/model/recipe_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:somali_recipe/ui/screen/loading.dart';
import 'package:somali_recipe/ui/widgets/home_widgets/categories.dart';
import 'package:somali_recipe/ui/widgets/home_widgets/recipe_listView.dart';
// import 'package:somali_recipe/recipe.dart';
import 'package:somali_recipe/ui/widgets/home_widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconData favourite = FontAwesomeIcons.heart;
  List favoriteList = [];
  _HomeScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: getData().fetchData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GestureDetector(
                    //ontap hide virtual keyboard
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: SingleChildScrollView(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SizedBox(
                          height: 40,
                        ),
                        SearchWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        Categories_food(
                          type: snapshot.data.type,
                        ),
                        SingleChildScrollView(
                            // ignore: prefer_const_constructors
                            physics: ScrollPhysics(),
                            child: Column(
                              children: [
                                Recipe_ListView(
                                  names: snapshot.data.names,
                                  images: snapshot.data.images,
                                  ingredients: snapshot.data.ingredients,
                                  time_to_make: snapshot.data.timeToMake,
                                )
                              ],
                            ))

                        //outlined button with text
                      ]),
                    ));
              } else {
                return PracLoading();
              }
            }));
  }

//listview for food items

}
