import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String name = '';
  late String image = '';
  late int phone = 0;
  late String email = '';
  late String address = '';
  late bool rass;

  _callNumber(String number) async{
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

_sendingMails( String mail) async {
  var url = Uri.parse("mailto:$mail");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  void initState() {
    super.initState();
    fetchDocumentData();
  }

  void fetchDocumentData() async {
    final doc = await FirebaseFirestore.instance
        .collection('stores')
        .doc('Jw05mBpXnk9ydGaJh0p0')
        .get();

    if (doc.exists) {
      setState(() {
        name = doc['storeName'] ?? '';
        image = doc['storeAvatarUrl'] ?? '';
        phone = doc['phone'] ?? 0;
        email = doc['storeEmail'] ?? '';
        address =doc['address']??'';
        rass =doc['roadsideassistance']??'';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(34)),
                    child: ClipRRect(child: Image.network(image, fit: BoxFit.fill,), clipBehavior: Clip.hardEdge, borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),),
                  ),
                  SizedBox(height: 10,),
                  Center(child: Text(name, style: TextStyle(fontSize: 26),),),
                  SizedBox(height: 10,),
                ]),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text('Address:'),
                          SizedBox(width: 10,),
                          Expanded(child: Text(address))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text('Provide Roadside Assisstance: '),
                          SizedBox(width: 10,),
                          Expanded(child: rass==true? Text('Yes') : Text('No')),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text('Phone Number:'),
                          SizedBox(width: 10,),
                          Expanded(child: Text(phone.toString()))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 8),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text('Email:'),
                          SizedBox(width: 10,),
                          Expanded(child: Text(email))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.lightGreenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Feel free to contact us: ', style: TextStyle(fontSize: 16),),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
                      child: Row(
                        children: [
                          Text('Give us a call'),
                          Expanded(child: SizedBox(width: 1,)),
                          IconButton(onPressed: (){ _callNumber('8395941016');}, icon: Icon(Icons.call))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8,  bottom: 4),
                      child: Row(
                        children: [
                          Text('Or you can mail us'),
                          Expanded(child: SizedBox(width: 1,)),
                          IconButton(onPressed: (){ _sendingMails('shashikumarbloda@gmail.com');}, icon: Icon(Icons.mail))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ))
    );
  }
}


