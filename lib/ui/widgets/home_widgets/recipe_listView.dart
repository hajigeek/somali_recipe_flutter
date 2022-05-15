import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Recipe_ListView extends StatefulWidget {
  const Recipe_ListView(
      {Key? key,
      required this.names,
      required this.images,
      required this.ingredients,
      required this.time_to_make})
      : super(key: key);
  final List names;
  final List images;
  final List ingredients;
  final List time_to_make;
  @override
  State<Recipe_ListView> createState() =>
      _Recipe_ListViewState(names, images, ingredients, time_to_make);
}

class _Recipe_ListViewState extends State<Recipe_ListView> {
  final List names;
  final List images;
  final List ingredients;
  final List time_to_make;
  IconData favourite = FontAwesomeIcons.heart;
  _Recipe_ListViewState(
      this.names, this.images, this.ingredients, this.time_to_make);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print('${names[index]}');
          },
          child: Container(
            //margin for the container
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            //this is for the container to make shadow greyish
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(4, 4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2,
                        child: Image.network(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 8, bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${names[index]}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Somali food an amazing way',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey
                                                    .withOpacity(0.8)),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Icon(
                                            Icons.map_outlined,
                                            size: 12,
                                            color: Colors.green,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '2.00 km to city',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Row(
                                          children: <Widget>[
                                            RatingBar(
                                              initialRating: 4.5,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 24,
                                              ratingWidget: RatingWidget(
                                                full: Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Colors.green,
                                                ),
                                                half: Icon(
                                                  Icons.star_half_rounded,
                                                  color: Colors.green,
                                                ),
                                                empty: Icon(
                                                  Icons.star_border_rounded,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              itemPadding: EdgeInsets.zero,
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            Text(
                                              ' 40 Reviews',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16, top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '${ingredients[index]['name'].length}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    'Ingredients',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.withOpacity(0.8)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        onTap: () {
                          // setState(() {
                          //   if (favourite == FontAwesomeIcons.solidHeart)
                          //     favourite = FontAwesomeIcons.heart;
                          //   else
                          //     favourite = FontAwesomeIcons.solidHeart;
                          // });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            favourite,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: -8.00,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topRight: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0)),
                      ),
                      child: Text('${time_to_make[index]}',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
