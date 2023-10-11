// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../core/colors.dart';

List<Map<String, String>> categories = [
  {'imagePath': 'assets/images/laptop.jpeg', 'productName': 'Laptop'},
  {'imagePath': 'assets/images/boat-rockerz.png', 'productName': 'Headphone'},
  {'imagePath': 'assets/images/z7-blue.jpg', 'productName': 'Phone'},
  {'imagePath': 'assets/images/tv.jpeg', 'productName': 'TV'},
];

Widget gridViewImageList(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var width = size.width;
  double containerHeight = width * 0.45;
  return SizedBox(
    height: containerHeight * 2,
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
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
                      border: Border.all(color: grey),
                      image: DecorationImage(
                        image: AssetImage(categories[index]['imagePath']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: containerHeight * 0.2,
                child: Center(
                  child: Text(
                    categories[index]['productName']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
