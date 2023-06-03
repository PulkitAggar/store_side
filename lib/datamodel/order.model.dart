import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

class OrderModel {
  String time;
  String weekday;
  String date;
  String trackOrder;
  String user;
  String nameR;
  String numberR;
  String addressR;
  bool paymentType;
  String userNumber;
  Map<String, dynamic> map;

  OrderModel(
      {required this.time,
      required this.weekday,
      required this.date,
      required this.trackOrder,
      required this.user,
      required this.paymentType,
      required this.nameR,
      required this.numberR,
      required this.addressR,
      required this.map,
      required this.userNumber
      });
}