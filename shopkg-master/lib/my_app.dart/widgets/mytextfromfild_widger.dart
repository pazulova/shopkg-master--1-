import 'package:flutter/material.dart';






 class MyTextFormField extends StatelessWidget {

   final Function? validator;
   final  Function(String)? onChanged;
   final String? name;
MyTextFormField ({
  this.name,
 this.onChanged, 
  required this.validator});

@override
Widget build(BuildContext context) {
  return TextFormField(
    //validator: validator,
    onChanged: onChanged,
    decoration:  InputDecoration(
      border: OutlineInputBorder(),
    hintText: name,
    ),
  );
}

 }






// class MyTextFormField extends StatelessWidget {
//   // final TextEditingController controller;
// final String? name;
// final Function()? onTap;
// final bool? obserText;
// final Function? validator;
//   MyTextFormField({    // required this.controller,
//     required this.name, 
//      this.validator,
//      this.onTap,
//     this.obserText
//   });
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       // controller: controller,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: name,
//         suffixIcon: GestureDetector(
//           onTap: onTap,
//           child: Icon(obserText == true
//            ? Icons.visibility 
//            : Icons.visibility_off),)
//       ),
//     );
//   }
// }


  
