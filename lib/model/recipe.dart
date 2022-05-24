import 'dart:convert';

import 'package:http/http.dart';

class RecipeModel {
  List names;
  List ingredients;
  List images;
  List timeToMake;
  List type;
  List youtube_url;

  RecipeModel(this.names, this.ingredients, this.images, this.timeToMake, this.type, this.youtube_url);
}
