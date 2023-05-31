import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_side/datamodel/order.model.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

class StoresRepository {


  static Future<List<OrderModel>> getStoreDataList() async {
    List<OrderModel> storesList = [];

    // Fetch data from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('stores').doc('Jw05mBpXnk9ydGaJh0p0').collection('orders').get();

    // Process each document in the query snapshot
    querySnapshot.docs.forEach((doc) {
      String date = doc.data()['date'] ?? '';

      String time = doc.data()['time'] ?? '';

      String user = doc.data()['user'] ?? '';

      bool paymentType = doc.data()['isCancelled'] ?? false;

      String weekday = doc.data()['weekday'] ?? '';
      String trackOrder =doc.data()['orderStatus']??'';
      List<DocumentSnapshotPlatform>list =  doc.data()['lstOfItems']??[];

      OrderModel orderModel = OrderModel(time: time, weekday: weekday, date: date, trackOrder: trackOrder, user: user, isCancelled: paymentType, lstOfItems: list);

      storesList.add(orderModel);
    });

    return storesList;
  }

}