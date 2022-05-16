
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shopkg/app_constants.dart/text_style.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopkg/my_app.dart/screens/signup.dart';
import 'package:shopkg/my_app.dart/widgets/changescreen.dart';
import 'package:shopkg/my_app.dart/widgets/mybuttom.dart';
import 'package:shopkg/my_app.dart/widgets/mytextfromfild_widger.dart';
import 'package:shopkg/my_app.dart/widgets/passwordtextformfield.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String p = 
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  String? email;
  String? password;
void validation() async {
  final FormState? _form = _formKey.currentState;
if(!_form!.validate()) {
   try{
     UserCredential result = await FirebaseAuth.instance.
   signInWithEmailAndPassword(email: email!, password: password!);
   print(result.user!.uid);

      } on PlatformException catch (e) {
_scaffoldKey.currentState!.showSnackBar(
  SnackBar(
    content: Text(e.message!),
    ),
);

} 
}  else {
  print("No");          
   }
}
bool obserText = true;

class _LoginState extends State<Login> {
  Widget _buildLoginBottomPart() {
   return Container(
                height: 450,
                width: double.infinity,
                
                child: Container(
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                       Text("Login",
                        style: AppTextStyles.mulishLoginColor16w600
                       ),
                      const SizedBox(height: 20,),
                          MyTextFormField(
                            name: " Email",
                            onChanged: (value) {
                              setState(() {
                                email = value;
                                print(email);
                              });
                            },
                             validator: (value) {
                               if(value=="") {
                               return "Please Fill Email";
                               } else if(!regExp.hasMatch(value!)) {
                                 return "Email Is Invalid";
                                 }
                                 return "";
                            }, 
                          ),
                        const SizedBox(height: 20,),///teksherildi email
                         PasswordTextFormField(
                           obserText: obserText,
                              onChanged: (value) {
                              setState(() {
                                password = value;
                                print(email);
                              });
                            },
                           name: "Password",
                           validator: (value) {
                                 if(value==""){
                                   return "Please Fill Password";
                                 }  else if(value.length <8) {
                                   return "Password is Too Short";
                                 }
                                   return "";
                             },
                             onTap: () {
                              FocusScope.of(context).unfocus();
                               setState(() {
                              obserText = !obserText;///teksherildi password
                         },);
                      },
                    ),
                    const SizedBox(height: 20,),
                     MyButtonWidget(
                     onPressed: () {
                      validation();
                     }, 
                      name: "Login",
                     ),
                      ChangeScreen(
                       name: "SignUp", 
                      whichAccount: "I Have Not Account!",
                     onTap: () {
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                   builder: (ctx)=>SignUp(),
                    ),
                   );
                  }     
               ),
             ],
          ),
                ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoginBottomPart(),
              ]
            )
          ),
        ),
      ),
    );
    
  }
  }

















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:shopkg/app_constants.dart/text_style.dart';
// import 'package:shopkg/my_app.dart/screens/signup.dart';
// import 'package:shopkg/my_app.dart/widgets/changescreen.dart';
// import 'package:shopkg/my_app.dart/widgets/mybuttom.dart';
// import 'package:shopkg/my_app.dart/widgets/mytextfromfild_widger.dart';
// import 'package:shopkg/my_app.dart/widgets/passwordtextformfield.dart';

// import 'package:flutter/material.dart';

// import 'package:shopkg/app_constants.dart/text_style.dart';
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }
// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   String p = 
//   r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

//   RegExp regExp = new RegExp(p);
//   String? email;
//   String? password;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// void validation() async {
//   final FormState? _form = _formKey.currentState;
 
// if(!_form!.validate())  {
//    try{
//  UserCredential result = await FirebaseAuth.instance
//   .signInWithEmailAndPassword(email: email!, password:  password!,);
//    print(result.user!.uid);
    
//   } on PlatformException catch(e){
  
// _scaffoldKey.currentState?.showSnackBar(
//   SnackBar(content: Text(
//     e.message!),
//   ),
//     );
//   }
// print("yes"); 
 
// } else {
//   print("No");          
//    }
// }
// bool obserText = true;

// class _LoginState extends State<Login> {
//   Widget _buildAllPart() {
//    return  Container(
//                   height: 300,
//                   width: double.infinity,
//                   child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children:  [
//                        Text("Login",
//                         style: AppTextStyles.mulishLoginColor16w600,
//                     ),
//                      MyTextFormField(
//                      name: " Email",
//                     onChanged: (value) {
//                     setState(() {
//                       email = value;
//                      print(email);
//                     });
//                     },
//                      validator: (value) {
//                       if(value==""){
//                      return "Please Fill Email";
//                       }
//                       else if(!regExp.hasMatch(value!)) {
//                       return "Email Is Invalid";
//                       }
//                       return "";
//                       },  
//                        ),
//                          PasswordTextFormField(
//                            obserText: obserText,
//                            name: "Password",
//                      onChanged: (value) {
//                     setState(() {
//                       password = value;
//                        print(password);
//                     });
//                     },
//                      validator: (value) {
//                       if(value==""){
//                         return "Please Fill Password";
//                        }
//                        else if(!regExp.hasMatch(value!)) {
//                          return "Email Is Invalid";
//                           }
//                           else if(value.length <8) {
//                            return "Password is Too SHort";
//                            }
//                           return "";
//                            },
//                             onTap: () {
//                             FocusScope.of(context).unfocus();
//                             setState(() {
//                              obserText = !obserText;
//                            },    
//                          );
//                            },
//                              ),
//                          MyButtonWidget(
//                           onPressed: () {
//                           validation();
//                           }, 
//                            name: "Login",
//                            ),
//                             ChangeScreen(
//                             name: "SignUp", 
//                             whichAccount: "I Have Not Account!",
//                              onTap: () {
//                              Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                            builder: (ctx)=>SignUp(),
//                        ),
//                     );
//                   }               
//                 ),
//               ],
//             ),
          
//    );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildAllPart() 
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
    
//   }
//   }


