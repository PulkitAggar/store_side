import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderViewScreen extends StatefulWidget {
  const OrderViewScreen({super.key});

  @override
  State<OrderViewScreen> createState() => _OrderViewScreenState();
}

class _OrderViewScreenState extends State<OrderViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: BorderSide.strokeAlignOutside,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text('Order By: (NAAM USKA)', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
                        Expanded(child: Text('Pickup From: (USKA ADDRESS)', style: TextStyle(color: Colors.grey),)),
                        Expanded(child: Text('DELIVERY TYPE', style: TextStyle(color: Colors.grey),)),
                        Expanded(child: Text('Phone Number: (NUMBER USKA)', style: TextStyle(color: Colors.grey),)),
                        Expanded(child: Text('Payment Kaise Kya Ki Hai', style: TextStyle(color: Colors.grey),)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CustomCard(3, 'https://picsum.photos/200/300', 'name')
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard(this.count, this.imageurl, this.name);
  //final double cost;
  final int count;
  final String imageurl;
  final String name;

  @override
  Widget build(BuildContext context) {
    //final url = 'https://picsum.photos/200/300';
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 5),
      child: Container(
        //height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(imageurl, height: 64, width: 64),
                  //Expanded(child: SizedBox(width: 1)),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      '$name x ${count.toString()}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  //Spacer(),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 79,
              //     ),
              //     Text(
              //       count.toString(),
              //       style:
              //           TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //     ),
              //     //Spacer(),
              //     SizedBox(
              //       width: 15,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
