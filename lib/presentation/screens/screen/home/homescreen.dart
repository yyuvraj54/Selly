import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sellingportal/presentation/screens/screen/home/chatPage.dart';
import 'package:sellingportal/presentation/screens/screen/home/myAccountsPage.dart';
import 'package:sellingportal/presentation/screens/screen/home/myAdsPage.dart';
import 'package:sellingportal/presentation/screens/screen/sellFormScreens/stepperMainPage.dart';
import 'package:sellingportal/presentation/screens/screen/sellPage.dart';
import 'package:sellingportal/presentation/widget/bottomBarIcons.dart';
import 'package:sellingportal/res/colors/colors.dart';
import 'package:sellingportal/res/drawable/bottom_clipper.dart';

import 'explorePage.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  static const String routeName = 'homeScreen';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final _controllerBottom = NotchBottomBarController(index: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    BottomBarIcons bottomBarIconsInactive = BottomBarIcons(colorIndex: 0);
    BottomBarIcons bottomBarIconsActive = BottomBarIcons(colorIndex: 1);

    final _pageViewController = PageController(initialPage: 0);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Colours uiColor = Colours();
    @override
    void dispose() {
      _pageViewController.dispose();
      super.dispose();
    }

    //Pages list
    final List<Widget> bottomBarPages = [
      const explorePage(),
      const myAdsPage(),
      const chatPage(),
      const myAdsPage(),
      const myAccountsPage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //very important.. keyboard open karne pe scrollable widget ko bahar fek dera tha.. usse bachane ke liye use kia h isse.

      extendBody: true,

      body: PageView(
        controller: _pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),

      //BottomBar
      // bottomNavigationBar: AnimatedNotchBottomBar(
      //   kBottomRadius: 35,
      //   kIconSize: 24,
      //   durationInMilliSeconds: 80,
      //   notchBottomBarController: _controllerBottom,
      //   bottomBarItems: [
      //     BottomBarItem(
      //         inActiveItem: bottomBarIconsInactive.bottomBarIconsList[0],
      //         activeItem: bottomBarIconsActive.bottomBarIconsList[0]),
      //     BottomBarItem(
      //         inActiveItem: bottomBarIconsInactive.bottomBarIconsList[2],
      //         activeItem: bottomBarIconsActive.bottomBarIconsList[2]),
      //     BottomBarItem(
      //         inActiveItem: bottomBarIconsInactive.bottomBarIconsList[1],
      //         activeItem: bottomBarIconsActive.bottomBarIconsList[1]),
      //
      //
      //   ],
      //   onTap: (index) {
      //     /// perform action on tab change and to update pages you can update pages without pages
      //     // log('current selected index $index');
      //
      //     _pageViewController.jumpToPage(index);
      //     setState(() {});
      //   },
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.pushNamed(context, FormPage.routeName);
        },
        child: Icon(Icons.add),
      ),


      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: 0,
      //     onTap: (currentIndex){
      //       _pageViewController.jumpTo(currentIndex.toDouble());
      //       setState(() {
      //
      //       });
      //     }
      //     ,
      //     items: [
      //
      //   BottomNavigationBarItem(icon: bottomBarIconsInactive.bottomBarIconsList[0],label: "explore"),
      //   BottomNavigationBarItem(icon: bottomBarIconsInactive.bottomBarIconsList[1],label: "request")
      // ])
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index){
            currentIndex = index;
            _pageViewController.jumpToPage(currentIndex);
            setState(() {},
            );
          },
          destinations: [
        NavigationDestination(
            icon: bottomBarIconsActive.bottomBarIconsList[0], label: 'explore'),
        NavigationDestination(
            icon: bottomBarIconsActive.bottomBarIconsList[1], label: 'explore'),
      ]),
    );
  }
}
