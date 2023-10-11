import 'package:flutter/material.dart';
import 'package:user_signin/src/view/dashboard/verticalImage.dart';
import 'package:user_signin/src/view/dashboard/gridViewImage.dart';
import 'horizontalImage.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Gallery',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            horizontalImageList(),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Brand',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            verticalImageList(),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('All',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            gridViewImageList(context)
          ],
        ),
      ),
    );
  }
}
