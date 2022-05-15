// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:somali_recipe/model/recipe_model.dart';
// import 'package:somali_recipe/recipe.dart';
// import 'package:flutter/services.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:somali_recipe/model/youtube_model.dart';

// class Recpie extends StatefulWidget {
//   @override
//   State<Recpie> createState() => _RecpieState();
// }

// _setOrientation(List<DeviceOrientation> orientations) {
//   SystemChrome.setPreferredOrientations(orientations);
// }

// class _RecpieState extends State<Recpie> {
//   //youtube controller makes easy to controll the load and stop of the video
//   late YoutubePlayerController _ytbPlayerController;

//   Recipe_model recipe_model = new Recipe_model();
//   @override
//   void initState() {
//     super.initState();

//     _setOrientation([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       setState(() {
//         _ytbPlayerController = YoutubePlayerController(
//           initialVideoId: recipe_model.videosList[0].youtubeId,
//           params: YoutubePlayerParams(
//             showFullscreenButton: true,
//           ),
//         );
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0),
//             child: Icon(
//               Icons.bookmark_add_outlined,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//           color: Colors.grey,
//         ),
//         title: Text('Full Recipe', style: GoogleFonts.comfortaa(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.all(28.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     // final _newCode = recipe_model.videosList[1].youtubeId;
//                     // _ytbPlayerController.load(_newCode);
//                     // _ytbPlayerController.stop();
//                   },
//                   child: Container(
//                       height: MediaQuery.of(context).size.height / 5,
//                       margin: EdgeInsets.symmetric(vertical: 7),
//                       decoration: new BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
//                         boxShadow: [
//                           //background color of box
//                           BoxShadow(
//                             color: Color(0xfffe0e0e0),
//                             blurRadius: 10.0, // soften the shadow
//                             spreadRadius: 1.0, //extend the shadow
//                             offset: Offset(0.0, 0.0 // Move to bottom 10 Vertically
//                                 ),
//                           )
//                         ],
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: GestureDetector(
//                           onTap: () {
//                             final _newCode = recipe_model.videosList[0].youtubeId;
//                             _ytbPlayerController.load(_newCode);
//                             _ytbPlayerController.stop();
//                           },
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Positioned(
//                                 child: CachedNetworkImage(
//                                   imageUrl: "https://img.youtube.com/vi/${recipe_model.videosList[0].youtubeId}/0.jpg",
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               // Container(
//                               //     decoration: new BoxDecoration(
//                               //       color: Colors.white,
//                               //       borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
//                               //       boxShadow: [
//                               //         //background color of box
//                               //         BoxShadow(
//                               //           color: Color(0xfffe0e0e0),
//                               //           blurRadius: 10.0, // soften the shadow
//                               //           spreadRadius: 1.0, //extend the shadow
//                               //           offset: Offset(0.0, 0.0 // Move to bottom 10 Vertically
//                               //               ),
//                               //         )
//                               //       ],
//                               //     ),
//                               //     child: Padding(
//                               //       padding: const EdgeInsets.all(12.0),
//                               //       child: Icon(Icons.play_arrow),
//                               //     )),
//                             ],
//                           ),
//                         ),
//                       )),
//                 )),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 32.0),
//                 child: Text('Ingredients (12)', style: GoogleFonts.abhayaLibre(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 28.0),
//                 child: Container(
//                     padding: const EdgeInsets.only(left: 18, right: 5, top: 5, bottom: 5),
//                     decoration: new BoxDecoration(
//                       color: Colors.green[400],
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
//                       boxShadow: [
//                         //background color of box
//                         BoxShadow(
//                           color: Colors.green,
//                           blurRadius: 6.0, // soften the shadow
//                           spreadRadius: 1.0, //extend the shadow
//                           offset: Offset(0.0, 0.0 // Move to bottom 10 Vertically
//                               ),
//                         )
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Text('1 Serving', style: GoogleFonts.cinzel(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
//                         Icon(Icons.arrow_drop_down, color: Colors.white)
//                       ],
//                     )),
//               ),
//             ]),
//             Padding(
//                 padding: const EdgeInsets.only(left: 0.0),
//                 child: Container(
//                   height: 600,
//                   child: ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       padding: const EdgeInsets.all(8),
//                       itemCount: recipe_model.name.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 10),
//                           child: Container(
//                             height: 85,
//                             width: 100,
//                             decoration: new BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0), bottomLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
//                               boxShadow: [
//                                 //background color of box
//                                 BoxShadow(
//                                   color: Color(0xfffe0e0e0),
//                                   blurRadius: 10.0, // soften the shadow
//                                   spreadRadius: 1.0, //extend the shadow
//                                   offset: Offset(0.0, 0.0 // Move to bottom 10 Vertically
//                                       ),
//                                 )
//                               ],
//                             ),
//                             padding: const EdgeInsets.all(0),
//                             child: Center(
//                               child: ListTile(
//                                 leading: Image.network(
//                                   '${recipe_model.img[index]}',
//                                   width: 60,
//                                   height: 60,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 title: Text('${recipe_model.name[index]}', style: GoogleFonts.aleo(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
//                                 subtitle: Text('${recipe_model.servings[index]}'),
//                                 trailing: Icon(Icons.more_vert),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// create c