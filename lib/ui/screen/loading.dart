// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:somali_recipe/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:somali_recipe/model/recipe_model.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PracLoading extends StatefulWidget {
  _PracLoadingState createState() => _PracLoadingState();
}

class _PracLoadingState extends State<PracLoading> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
