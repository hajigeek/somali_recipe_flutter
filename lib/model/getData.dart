import 'dart:convert';

import 'package:http/http.dart';
import 'package:somali_recipe/model/recipe.dart';

class getData {
  List names = [];
  List ingredients = [];
  List images = [];
  List timeToMake = [];
  List type = [];
  List youtube_url = [];
  List quantity = [];
  final String url = "https://recipe.taabo.tech/api/recipes";
  Future fetchData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      //print(response.body);
      RecipeModel recipeModel;
      var data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        names.add(data[i]['name']);
        ingredients.add(data[i]['ingredients']);
        images.add(data[i]['recipe_image']);
        timeToMake.add(data[i]['time_to_make']);
        type.add(data[i]['type']);
        youtube_url.add(data[i]['youtube_url']);
      }
      //print(names.length.toString());
      recipeModel = RecipeModel(names, ingredients, images, timeToMake, type, youtube_url);
      return recipeModel;
    }
  }
}
