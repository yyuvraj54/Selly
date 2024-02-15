import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellingportal/res/colors/colors.dart';

Colours uiColor = Colours();

class chatPage extends StatelessWidget {
  const chatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var Swidth = MediaQuery.of(context).size.width;
    return Center(child: Text('chat page'));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Chat'),
    //   ),
    //   body: SafeArea(
    //       child: ListView.builder(
    //         itemCount: 2,
    //           itemBuilder: (context, index) => Container(
    //                 height: 50,
    //                 child: Container(
    //                   height: 50,
    //                   child: Card(
    //                     color: Colors.red,
    //                     child: ListTile(
    //                       tileColor: Colors.red,
    //                       title: Text('name'),
    //                       leading: ClipRRect(
    //                         child: Container(
    //                           height: 40,
    //                           color: Colors.red,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //             // child: Text('hhhhh',style: TextStyle(color:Colors.red),),
    //               ),)),
    // );
  }
}
