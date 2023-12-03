// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../core/colors.dart';

// List<Map<String, String>> allItems = [
//   {'imagePath': 'assets/images/laptop.jpeg', 'productName': 'Laptop'},
//   {'imagePath': 'assets/images/boat-rockerz.png', 'productName': 'Headphone'},
//   {'imagePath': 'assets/images/z7-blue.jpg', 'productName': 'Phone'},
//   {'imagePath': 'assets/images/Tv.jpg', 'productName': 'TV'},
// ];
List allItem=[
  'assets/images/head.jpg',
  'assets/images/Tv.jpg',
  'assets/images/z7-blue.jpg',
  'assets/images/earphn.jpg',
  'assets/images/iphn.jpg',
  'assets/images/lap.jpg',
];
List productName=[
  'HeadPhone',
  'LED TV',
  'Z7',
  'Ear Phone',
  'Iphone',
  'Lap TOP',
];


Widget gridViewImageList(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var width = size.width;
  double containerHeight = width * 0.45;

  return SizedBox(
    height: containerHeight * 3,
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (0.3 / 0.31),
        mainAxisSpacing: 13,
        crossAxisSpacing: 17,
      ),
      itemCount: allItem.length,
      itemBuilder: (context, index) {
        return Material(
          elevation: 5,
          child: Container(
            height: containerHeight,
            width: width * 0.4,
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: containerHeight * 0.72,
                      width: width * 0.32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(allItem[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          productName[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
