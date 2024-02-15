import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellingportal/res/drawable/backgroundWave.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "ProfileScreen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        body: Column(
          children: [
            Stack(children: [
              Container(
                height: height * .20,
                // color: Colors.red,
                child: BackgroundWave(
                    height: height * 20,
                    colors: Color.fromRGBO(74, 67, 236, 1)),
              ),
              AppBar(
                backgroundColor: Color.fromRGBO(74, 67, 236, 1),
              )
            ]),
            Flexible(
                child: Container(
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileUserCard(title: 'Aman', desc: 'desc'),




                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1.6,
                            color: Color.fromRGBO(228, 223, 223, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),
                        child: Column(
                          children: [
                            ProfileItem(icons: FontAwesomeIcons.list, title: 'My Items'),
                            SizedBox(height: 10,),
                            Container(height: 1,width: double.infinity,color: Color.fromRGBO(0, 0, 0, 0.1),),
                            SizedBox(height: 10,),
                            ProfileItem(icons: FontAwesomeIcons.bookmark, title: 'Wishlist'),
                            SizedBox(height: 10,),
                            Container(height: 1,width: double.infinity,color: Color.fromRGBO(0, 0, 0, 0.1),),
                            SizedBox(height: 10,),
                            ProfileItem(icons: FontAwesomeIcons.inbox, title: 'Requests'),
                            
                          ],
                        ),
                      ),
                    ),


                  )
                ],
              ),
            ))
          ],
        ));
  }
}

class ProfileUserCard extends StatelessWidget {
  String title;
  String desc;
   ProfileUserCard({
    super.key,
    required this.title,
    required this.desc
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 1.6,
              color: Color.fromRGBO(228, 223, 223, 1)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(
                FontAwesomeIcons.user,
                color: Color.fromRGBO(12, 12, 12, 0.5),
                size: 25,
              ),
              SizedBox(
                width: 25,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    
    
    );
  }
}

class ProfileItem extends StatelessWidget {
  IconData icons;
  String title;

   ProfileItem({

    super.key,
    required this.icons,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13,bottom: 13),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Icon(

            icons,
            color: Color.fromRGBO(12, 12, 12, 0.5),
            size: 20,

          ),
          SizedBox(
            width: 25,
          ),
          Flexible(
            child: Text(
              title,
              style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500)

            ),
          ),
        ],
      ),
    );
  }
}
