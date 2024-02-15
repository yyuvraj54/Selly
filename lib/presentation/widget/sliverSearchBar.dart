import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellingportal/presentation/widget/searchBar.dart';
import 'package:sellingportal/res/drawable/backgroundWave.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  const SliverSearchAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;

    return Scaffold(
      body: Stack(
        children: [
           BackgroundWave(
            colors: Color.fromRGBO(74, 67, 236, 1,),
            height: 280,
          ),
          AppBar(
            forceMaterialTransparency: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Text("Hi, Name"),
            ),
            actions: [
              Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 255, 255, 1000)),
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(FontAwesomeIcons.bookmark),
                    iconSize: 20,
                  )),
              SizedBox(
                width: 20,
              )
            ],
          ),
          Positioned(
            top: topPadding + offset,
            child:  SearchBarCustom(title: 'djugh',),
            left: 16,
            right: 16,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 280;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
