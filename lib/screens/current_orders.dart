import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:store_side/screens/order_view_screen.dart';

import '../datamodel/order.model.dart';
import '../repositories/order_data_repository.dart';

class CurrentOrders extends StatefulWidget {
  const CurrentOrders({super.key});

  @override
  State<CurrentOrders> createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {

  Future<List<OrderModel>> recommendedList =
      StoresRepository.getStoreDataList(); 

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Orders'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<OrderModel>>(
              
              future: recommendedList,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  
                  return Column(
                    children: snapshot.data!.map((e){
                      return GestureDetector(
                        child: Card(
                          elevation: BorderSide.strokeAlignOutside,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('Order By: ${e.user}', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
                                  Expanded(child: Text('Pickup From: (USKA ADDRESS)', style: TextStyle(color: Colors.grey),)),
                                  Expanded(child: Text('DELIVERY TYPE', style: TextStyle(color: Colors.grey),)),
                                ],
                              ),
                            ),
                          )
                        ),
                        onTap: () {
                          print(e);
                        },
                      );
                    }).toList()
                  );
                } else if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                } else{
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

// Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderViewScreen()));
//               },
//               child: Card(
//                 elevation: BorderSide.strokeAlignOutside,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white
//                   ),
//                   height: 100,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(child: Text('Order By: (NAAM USKA)', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
//                         Expanded(child: Text('Pickup From: (USKA ADDRESS)', style: TextStyle(color: Colors.grey),)),
//                         Expanded(child: Text('DELIVERY TYPE', style: TextStyle(color: Colors.grey),)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )