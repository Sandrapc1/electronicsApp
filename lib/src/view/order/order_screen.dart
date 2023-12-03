import 'package:flutter/material.dart';
import 'package:user_signin/core/colors.dart';

import 'order_tile.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: redd),
        backgroundColor: redd,
        title:
            const Text('Order', style: TextStyle(fontSize: 23, color: white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.02,),
              const Text(
                'Order Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.02),
              const Divider(),
              OrderTile(height: height, width: width),
              SizedBox(height: height * 0.02),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
