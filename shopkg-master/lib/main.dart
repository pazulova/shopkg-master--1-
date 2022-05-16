import 'package:flutter/material.dart';
import 'package:shopkg/my_app.dart/screens/cartscreen.dart';
import 'package:shopkg/my_app.dart/screens/checkout.dart';
import 'package:shopkg/my_app.dart/screens/details_screen.dart';
import 'package:shopkg/my_app.dart/screens/homepage.dart';
import 'package:shopkg/my_app.dart/screens/list_products.dart';
import 'package:shopkg/my_app.dart/screens/login.dart';
import 'package:shopkg/my_app.dart/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopkg/my_app.dart/screens/slider.dart';
import 'package:shopkg/my_app.dart/screens/welcomescreen.dart';
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: StreamBuilder(
        stream: 
        FirebaseAuth.instance.authStateChanges(),
        builder: (cxt, snapshot) {
            if(snapshot.hasData) {
              return HomePage();
            }
            else{
              return SignUp();
             }
          },
        ),
    );
  }
}