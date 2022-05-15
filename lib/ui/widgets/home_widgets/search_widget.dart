import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
        child: TextField(
          textAlign: TextAlign.center,
          minLines: 1,
          maxLines: 1,
          autocorrect: false,
          decoration: InputDecoration(
            suffixIcon: Container(
              height: 60,
              width: 60,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                boxShadow: [
                  //background color of box
                  BoxShadow(
                    color: Color(0xfffe0e0e0),
                    blurRadius: 5.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(0.0, 0.0 // Move to bottom 10 Vertically
                        ),
                  )
                ],
              ),
              padding: const EdgeInsets.all(0),
              child: Icon(
                Icons.travel_explore,
                color: Colors.green[400],
              ),
            ),
            hintText: 'Search Your Recipe',
            hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: 14.6,
                fontWeight: FontWeight.normal),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Color(0xffff5f5f5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xfffe8f5e9)),
            ),
          ),
        ),
      ),
    );
  }
}
