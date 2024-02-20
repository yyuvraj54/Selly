import 'package:flutter/material.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';

import '../../../res/drawable/backgroundWave.dart';

class YourWish extends StatelessWidget {
  static const String routeName = 'YourWish';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.20,
              child: BackgroundWave(
                height: height * 20,
                colors: Color.fromRGBO(74, 67, 236, 1),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Color.fromRGBO(74, 67, 236, 1),
              title: Text(
                'Wishlist',
                style: commonTextsStyle(
                    fontsize: 20,
                    color:
                        Colors.white), // You can use your commonTextsStyle here
              ),
              // Add more app bar properties if needed
            ),
          ),
          Positioned.fill(
            top: kToolbarHeight + 10,
            // Adjust this value to position the text below the app bar
            child: Center(
              child: Text(
                'Your wishlist is empty',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey, // Change color as needed
                ),
              ),
            ),
          ),
        ],
      ),
      // Add the rest of your Scaffold properties here
    );
  }
}
