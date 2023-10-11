import 'package:flutter/material.dart';
import 'package:user_signin/core/colors.dart';

List<Map<String, String>> categories = [
  {'imagePath': 'assets/images/laptop.jpeg', 'productName': 'Laptop'},
  {'imagePath': 'assets/images/boat-rockerz.png', 'productName': 'Headphone'},
  {'imagePath': 'assets/images/z7-blue.jpg', 'productName': 'Phone'},
  {'imagePath': 'assets/images/tv.jpeg', 'productName': 'TV'},
];

Widget verticalImageList() {
  double itemHeight = 900.0 / categories.length; // Adjust the item height

  return SizedBox(
    height: 230,
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          height: itemHeight, // Set the height of each item
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: lightgrey),
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(categories[index]['imagePath']!),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: categories.length,
    ),
  );
}
