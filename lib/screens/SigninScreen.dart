import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:store_side/screens/DashboardScree.dart';


class SignupScreen extends StatefulWidget {
  static var tag = "/SignUp";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Image.asset("lib/assets/logo.png",
                          height: 100, width: 100),
                      const SizedBox(height: 20),
                      editTextStyle('Unique Validation Key', controller:_email, isPassword: false),
                      const SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: shadowButton('Get Started', () { 
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => DashboardScreen(storeUid: _email.text
                            ))));
                          }),
                        ),
                        
                      const SizedBox(height: 24),
                      
                    ],
                  ),
                ),
              ),)
            );
          } }

Padding editTextStyle(var hintText,
    {isPassword = true,
    TextEditingController? controller,}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: TextFormField(
      style: const TextStyle(fontSize: 20, color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:(value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the key provided to you';
                      }
                      return null;
                    },
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFF1C1F26),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Color(0XFFE8E8E8), width: 0.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Color(0XFFE8E8E8), width: 0.0),
        ),
      ),
    ),
  );
}

Widget shadowButton(String name, void Function()? onPressed) {
  return MaterialButton(
    height: 60,
    minWidth: double.infinity,
    child: Text(
      name,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    textColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    color: const Color(0xFFCCFE00),
    onPressed: onPressed,
  );
}

// class SigninScreen extends StatefulWidget {
//   const SigninScreen({super.key});

//   @override
//   State<SigninScreen> createState() => _SigninScreenState();
// }

// class _SigninScreenState extends State<SigninScreen> {

//   final TextEditingController _textEditingController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Form(
//            key: _formKey,
//            child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                 child: TextFormField(
//                     controller: _textEditingController,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(), labelText: "Unique Validation Key"),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter the key provided to you';
                    //   }
                    //   return null;
                    // },
//                 ),
//               ),
//               Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
//                   child: Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DashboardScreen(storeUid: _textEditingController.text)));
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Please fill input')),
//                           );
//                         }
//                       },
//                       child: const Text('Submit'),
//                     ),
//                   ),
//                 )
//             ],
//            ),
//         ),
//       ),
//     );
//   }