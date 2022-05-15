import 'youtube_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Recipe_model {
  late List data;

  final List<int> checkColor = <int>[10, 2, 4, 6];
  List name = [];
  final List ingredients = [];
  final List time_to_make = [];
  final List recipe_image = [];
  final List type = [];
  final List youtube_url = [];

  Future<void> getAllData() async {
    Response response;
    try {
      String url = "https://recipe.taabo.tech/api/recipes";
      response = await get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      });
      data = jsonDecode(response.body);
      //print(response.body);
      // name = data

      for (var i = 0; i < data.length; i++) {
        name.add(data[i]['name']);
        ingredients.add(data[i]['ingredients']);
        time_to_make.add(data[i]['time_to_make']);
        recipe_image.add(data[i]['recipe_image']);
        type.add(data[i]['type']);
        youtube_url.add(data[i]['youtube_url']);
        // print(name);
      }
      // print(name[0]);
      // print(ingredients[0]['name']);
    } catch (e) {
      print(e);
    }
  }

  List getNames() {
    return name;
  }

  List getIngredients() {
    return ingredients;
  }

  List getTimeToMake() {
    return time_to_make;
  }

  List getRecipeImage() {
    return recipe_image;
  }

  List getType() {
    return type;
  }

  List getYoutubeUrl() {
    return youtube_url;
  }
}
