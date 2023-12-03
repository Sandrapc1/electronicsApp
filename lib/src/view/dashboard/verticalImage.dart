import 'package:flutter/material.dart';
import 'package:user_signin/core/colors.dart';

List brandsImage = [
  'assets/images/sonybrand.png',
  'assets/images/apple.png',
  'assets/images/images.jpg',
  'assets/images/99063297.jpg',
 ];

Widget verticalImageList() {
  double itemHeight = 110.0*brandsImage.length; 

  return SizedBox(
    height:itemHeight,
    child: ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          // color: black,
          height: 100, 
          width: 140,
          child: Stack(
            alignment: Alignment.center,
            children:[ Container(
              height: 90,
              width:220,
               decoration: BoxDecoration(  
            border: Border.all(color: lightgrey),
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(brandsImage[index]),
              fit: BoxFit.cover,
            ),
          ),
            ),
            ]
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: brandsImage.length,
    ),
  );
}
