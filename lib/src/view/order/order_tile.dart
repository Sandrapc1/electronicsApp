import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/colors.dart';
import 'order_track.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: Row(
        children: [
          Container(
            height: height * 0.09,
            width: width * 0.16,
            // color: red,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/z7-blue.jpg'))),
          ),
          // SizedBox(width: width * 0.02),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: height * 0.01),
              Text('z7'),
              Text('₹ 50000'),
              Text('Qty: 1'),
              Text('Order Id : #0000154989',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10))
            ],
          ),
          SizedBox(width: width * 0.1),
          Container(
            alignment: Alignment.topCenter,
            height: height * 0.032,
            width: width * 0.15,
            decoration: BoxDecoration(
                border: Border.all(color: red),
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: red, fontSize: 7),
                )),
          ),
          SizedBox(width: width * 0.01),
          IconButton(
              onPressed: () {
                Get.to(const OrderTrack());
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: grey,
                size: 20,
              ))
        ],
      ),
    );
  }
}
