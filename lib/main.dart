import 'package:flutter/material.dart';
import 'package:somali_recipe/ui/screen/home_screen.dart';

// import 'home_screen.dart';

import 'ui/screen/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: PracLoading()),
    );
  }
}
