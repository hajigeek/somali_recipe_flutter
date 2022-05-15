import 'package:flutter/material.dart';
import 'package:somali_recipe/model/recipe_model.dart';

class Categories_food extends StatefulWidget {
  const Categories_food({Key? key, required this.type}) : super(key: key);
  final List type;
  @override
  State<Categories_food> createState() => _Categories_foodState(type);
}

class _Categories_foodState extends State<Categories_food> {
  final List type;
  Recipe_model recipe_model = new Recipe_model();
  _Categories_foodState(this.type);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Container(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: type.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flexible(
                    child: Container(
                      height: 15,
                      width: 100,
                      decoration: new BoxDecoration(
                        color: recipe_model.checkColor[index] >= 10
                            ? Colors.green[400]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: recipe_model.checkColor[index] >= 10
                                ? Colors.green
                                : Color(0xfffe0e0e0),
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset:
                                Offset(0.0, 0.0 // Move to bottom 10 Vertically
                                    ),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text('${type[index]}',
                            style: TextStyle(
                                color: recipe_model.checkColor[index] >= 10
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
