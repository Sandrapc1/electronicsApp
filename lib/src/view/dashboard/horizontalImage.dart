import 'package:flutter/material.dart';
import 'package:user_signin/core/colors.dart';

List<Map<String, String>> categories = [
  {'imagePath': 'assets/images/laptop.jpeg', 'productName': 'Laptop'},
  {'imagePath': 'assets/images/boat-rockerz.png', 'productName': 'Headphone'},
  {'imagePath': 'assets/images/z7-blue.jpg', 'productName': 'Phone'},
  {'imagePath': 'assets/images/tv.jpeg', 'productName': 'TV'},
];

Widget horizontalImageList() {
  return SizedBox(
    height:100,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: lightgrey),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(categories[index]['imagePath']!),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      itemCount: categories.length,
    ),
  );
}
