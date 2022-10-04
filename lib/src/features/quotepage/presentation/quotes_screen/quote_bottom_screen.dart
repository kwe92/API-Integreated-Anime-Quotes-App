// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:quotes/src/constants/layout.dart';

// class MyWidget extends ConsumerWidget {
//   const MyWidget({Key? key, required this.controller, required this.provider}) : super(key: key);
// final controller;
// final provider;

//  @override
//   Widget build(BuildContext context) {
//     return Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0, 15, 0, 0),
//                                         child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               ListTile(
//                                                 title: TextFormField(
//                                                   controller:
//                                                       controller,
//                                                   decoration: InputDecoration(
//                                                     label: const Text(
//                                                         'Enter a anime...'),
//                                                     hintText:
//                                                         'eg: Bleach, Naruto, One Piece...',
//                                                     border:
//                                                         const OutlineInputBorder(),
//                                                     suffixIcon: IconButton(
//                                                       onPressed: () {
//                                                         _animeTitleController
//                                                             .clear();
//                                                       },
//                                                       icon: const Icon(
//                                                           Icons.clear),
//                                                     ),
//                                                   ),
//                                                   keyboardType:
//                                                       TextInputType.name,
//                                                 ),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding: const EdgeInsets
//                                                               .fromLTRB(
//                                                           Sizes.p26,
//                                                           0,
//                                                           Sizes.p26,
//                                                           0),
//                                                       child: MaterialButton(
//                                                         onPressed: () {
//                                                           setState(() {
//                                                             ref.refresh(
//                                                                 animeQuoteListProvider(
//                                                                     _animeTitleController
//                                                                         .text));
//                                                           });
//                                                           Navigator.pop(
//                                                               context);
//                                                         },
//                                                         color: BackgroundColors
//                                                             .main,
//                                                         child: const Text(
//                                                           'Search by Title',
//                                                           style: TextStyle(
//                                                               fontSize:
//                                                                   Sizes.p26,
//                                                               fontFamily:
//                                                                   Fonts.main,
//                                                               color:
//                                                                   Colors.white),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ]),
//                                       );


// }}
