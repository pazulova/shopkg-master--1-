









import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopkg/my_app.dart/screens/login.dart';
import 'package:shopkg/my_app.dart/widgets/changescreen.dart';
import 'package:shopkg/my_app.dart/widgets/mybuttom.dart';
import 'package:shopkg/my_app.dart/widgets/mytextfromfild_widger.dart';
import 'package:shopkg/my_app.dart/widgets/passwordtextformfield.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}
final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

final GlobalKey<ScaffoldState> _scaffoldKey= GlobalKey<ScaffoldState>();


  String p = 
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


//FirebaseAuthException ([firebase_auth/network-request-failed]
// A network error (such as timeout, interrupted connection or unreachable host) has occurred.)
  RegExp regExp =  new RegExp(p);
  bool obserText = true;
   String? email;
   String? password;


class _SignUpState extends State<SignUp> {
void validation() async{
  final FormState? _form= _fromKey.currentState;
  if(!_form!.validate()) {
    try{
     UserCredential result = await FirebaseAuth.instance.
   createUserWithEmailAndPassword(email: email!, password: password!);
   print(result.user!.uid);
      } 
      on PlatformException catch (e) {
print(e.message.toString());
// _scaffoldKey.currentState!.showSnackBar(
//   SnackBar(
//     content: Text(e.message!),
//     ),
//     );

      }
      print("uuh"); 
  } else{
    print("No"); 
  }
}
    

Widget _buildAllTextFromField(){
return Container(
  height: 350,
  margin: EdgeInsets.symmetric(horizontal: 10),
  width: double.infinity,
  child: Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
   MyTextFormField(
          name: "UserName",
           validator: (value) {
              if(value == "") {
               return "Please Fill UserName";
              } else if (value!.length < 6) { 
                return "userName is Too Short";
              } return "";
            },
           ),
                  MyTextFormField( //////email good
                    name: " Email",
                    onChanged: (value) {
                      setState(() {
                        email = value;
                       print(email);
                      });
                    },
                      validator: (value) { 
                     if(value==""){
                     return "Please Fill Email";
                     } else if(!regExp.hasMatch(value!)) {
                     return "Email Is Invalid";
                     }
                    return "";
                    }, 
                   ),//////email good
                    PasswordTextFormField(
                   obserText: obserText,
                   name: "Password",
                     onChanged: (value) {
                      setState(() {
                         password = value;
                        print(password);
                      });
                    },
                   validator: (value) {
                   if(value==""){
                   return "Please Fill Password";
                  }
                   else if(value!.length < 8){
                  return "Password Is Too Short";
                 }
                return "";
                },   
                onTap: () {
               FocusScope.of(context).unfocus();
               setState(() {
              obserText= !obserText;
             });
             },
             ),
             MyTextFormField(
            name: "Phone Number",
           validator: (value) {
          if(value==""){
           return "Please Fill Phone Number";
           }else if(value!.length < 10){
            return "Phone Number Must Be 10";
            }
             return "";
           },  ///////////        gooooooooooddddddddddddd phone Number
        ),
  ],
  ),
);
}


Widget _buildBottomPart() {
return Container(
 height: 450,
  margin: const EdgeInsets.symmetric(horizontal: 10),
   width: double.infinity,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    _buildAllTextFromField(),
    const SizedBox(height: 20,),
     MyButtonWidget(
       name: "Sign Up",
        onPressed: () {
         validation();
       
          },
          ),
            ChangeScreen(
            name: "Login",
            whichAccount: "I have Already An Account!",
            onTap: () {
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(
            builder: (ctx)=> Login(),
             ),
              );
             },
          ),
         ],
        ),
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _fromKey,
              child: Container(
                child: Column(
                  children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                            
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          ),
                         ),
                        ],
                      ),
                    ),
                  // const SizedBox(height: 20,),
                     _buildBottomPart()
                ],
                ),
            ),
          ),
        )
      )
    );
  }
  }
























// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shopkg/my_app.dart/screens/login.dart';
// import 'package:shopkg/my_app.dart/widgets/changescreen.dart';
// import 'package:shopkg/my_app.dart/widgets/mybuttom.dart';
// import 'package:shopkg/my_app.dart/widgets/mytextfromfild_widger.dart';
// import 'package:shopkg/my_app.dart/widgets/passwordtextformfield.dart';

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpstate createState() => _SignUpstate();
// }
// final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   String p = 
//   r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

//   RegExp regExp =  new RegExp(p);
//   bool obserText = true;
//   String? email;
//   String? password;

//  class _SignUpstate extends State<SignUp> {
// void validation() async {
//   final FormState? _form= _fromKey.currentState;
// if(!_form!.validate()) {
//   try{
//       UserCredential result =  await FirebaseAuth.instance
//   .createUserWithEmailAndPassword(email: email!, password: password!);
  
//     print(result.user!.uid);

//   } on PlatformException catch (e) {
// print(e.message.toString());

// _scaffoldKey.currentState?.showSnackBar(
//   SnackBar(content: Text(
//     e.message!
//     ),
//     ),
//     );
//   } 
//   print("yhjk"); 
// } else {
//   print("No"); 

// }
// }

// Widget _buildAllTextFromField(){
// return Container(
//   height: 330,
//   child: Column(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//    MyTextFormField(
//           name: "UserName",
//            validator: (value) {
//               if(value == "") {
//                return "Please Fill UserName";
//               } else if (value!.length < 6) {
//                return "userName is Too Short";
//                } 
//                return "";
//                 }, 
//                  ),
//                   MyTextFormField(
//                     name: " Email",
//                     onChanged: (value) {
//                     setState(() {
//                       email = value;
//                      print(email);
//                     });
//                     },
//                       validator: (value) { 
//                      if(value==""){
//                      return "Please Fill Email";
//                      }
//                      else if(!regExp.hasMatch(value!)) {
//                      return "Email Is Invalid";
//                      }
//                     return "";
//                     },
//                    ),
//                     PasswordTextFormField(
//                    obserText: obserText,
//                    name: "Password",
//                     onChanged: (value) {
//                     setState(() {
//                        password = value;
//                        print(password);
//                     });
//                     },
//                    validator: (value) {
//                    if(value == ""){
//                    return "Please Fill Password";
//                   }
//                    else if(value!.length < 8){
//                   return "Password Is Too Short";
//                  }
//                 return "";
//                 },   
//                 onTap: () {
//                FocusScope.of(context).unfocus();
//                setState(() {
//               obserText= !obserText;
//              });
//              },
//              ),
//              MyTextFormField(
//             name: "Phone Number",
//            validator: (value) {
//           if(value==""){
//            return "Please Fill Phone Number";
//            }
//             else if(value!.length < 10){
//             return "Phone Number Must Be 10";
//             }
//              return "";
//            },
//         ),
//   ],
//   ),
// );
// }
// Widget _buildBottomPart() {
// return Container(
//  height: 400,
//   margin: const EdgeInsets.symmetric(horizontal: 10),
//    width: double.infinity,
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//     _buildAllTextFromField(),
//      MyButtonWidget(
//        name: "Sign Up",
//         onPressed: () {
//          validation();
//           },
//           ),
//             ChangeScreen(
//             name: "Login",
//             whichAccount: "I have Already An Account!",
//             onTap: () {
//             Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//             builder: (ctx)=> Login(),
//              ),
//               );
//              },
//           ),
//          ],
//         ),
//        );
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _fromKey,
            
//               child: Container(
//                 child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                   Container(
//                     height: 160,
//                     width: double.infinity,
                            
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: const[
//                       Text(
//                         "Register",
//                         style: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           ),
//                          ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20,),
//                     //  _buildAllTextFromField()
//                      _buildBottomPart()
//                 ],
//                 ),
//               ),
//             ),
//           ),
//         )
//       )
//     );
//   }
// }

