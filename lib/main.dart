import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store_side/screens/DashboardScree.dart';
import 'package:store_side/screens/SigninScreen.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(unselectedWidgetColor: Colors.white),
          title: 'Aura',
          home: SignupScreen(),
          // home: (FirebaseAuth.instance.currentUser != null)
          //     ? DashboardScreen()
          //     : const LandingScreen(),
        );
  }
}
