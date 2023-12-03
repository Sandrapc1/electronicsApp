import 'package:flutter/material.dart';
import 'package:user_signin/core/colors.dart';

List<Map<String, String>> categories = [
  {'imagePath': 'assets/images/laptop.jpeg', 'productName': 'Laptop'},
  {'imagePath': 'assets/images/sony.jpg','productName': 'Headphone'},
  {'imagePath': 'assets/images/z7-blue.jpg', 'productName': 'Mobile'},
  {'imagePath': 'assets/images/Tv.jpg', 'productName': 'TV'},
];

Widget horizontalImageList() {
  return SizedBox(
    height:120,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 92,
              width: 95,
              decoration: BoxDecoration(
                border: Border.all(color: lightgrey),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(categories[index]['imagePath']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5,),
             Text(
                categories[index]['productName']!,
                style: const TextStyle(fontSize: 12),
              ),
          ],
        );
      
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 10);
      },
      itemCount: categories.length,
    ),
  );
}
