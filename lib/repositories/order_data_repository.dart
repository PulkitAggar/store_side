import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_side/datamodel/order.model.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

class StoresRepository {


  static Future<List<OrderModel>> getStoreDataList() async {
    List<OrderModel> storesList = [];

    // Fetch data from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('stores').doc('daGNNmLEKnPVDTNbaDqd').collection('orders').where("orderStatus", isNotEqualTo: 'delivered').get();

    // Process each document in the query snapshot
    querySnapshot.docs.forEach((doc) {
      String date = doc.data()['date'] ?? '';

      String time = doc.data()['time'] ?? '';

      String user = doc.data()['user'] ?? '';

      bool paymentType = doc.data()['paymentdone'] ?? false;

      String nameR = doc.data()['nameR']??'';
      String numberR = doc.data()['numberR']??'';
      String addressR = doc.data()['addressR']??'';

      String weekday = doc.data()['weekday'] ?? '';
      String trackOrder =doc.data()['orderStatus']??'';
      String altN = doc.data()['numberUser']??'';
      Map<String, dynamic> map = doc.data()['order'] ?? [];

      OrderModel orderModel = OrderModel(map: map,time: time, weekday: weekday, date: date, trackOrder: trackOrder, user: user, paymentType: paymentType, addressR: addressR, nameR: nameR, numberR: numberR, userNumber: altN);

      storesList.add(orderModel);
    });

    return storesList;
  }

  static Future<List<OrderModel>> getStoreData2List() async {
    List<OrderModel> storesList = [];

    // Fetch data from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('stores').doc('Jw05mBpXnk9ydGaJh0p0').collection('orders').where("orderStatus", isEqualTo: 'delivered').get();

    // Process each document in the query snapshot
    querySnapshot.docs.forEach((doc) {
      String date = doc.data()['date'] ?? '';

      String time = doc.data()['time'] ?? '';

      String user = doc.data()['user'] ?? '';

      bool paymentType = doc.data()['paymentdone'] ?? false;

      String nameR = doc.data()['nameR']??'';
      String numberR = doc.data()['numberR']??'';
      String addressR = doc.data()['addressR']??'';
      String altN = doc.data()['numberUser']??'';

      String weekday = doc.data()['weekday'] ?? '';
      String trackOrder =doc.data()['orderStatus']??'';
      Map<String, dynamic> map = doc.data()['order'] ?? [];

      OrderModel orderModel = OrderModel(map: map,time: time, weekday: weekday, date: date, trackOrder: trackOrder, user: user, paymentType: paymentType, addressR: addressR, nameR: nameR, numberR: numberR, userNumber: altN);

      storesList.add(orderModel);
    });

    return storesList;
  }

}