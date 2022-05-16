import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {

  final bool? obserText;
  final  Function? validator;
  final String? name;
  final Function(String)? onChanged;
  final Function()? onTap;

  PasswordTextFormField({
  this.obserText,
  this.validator,
   this.name,
   this.onTap,
     this.onChanged,
    
      
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     
      obscureText: obserText!,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText == true
             ? Icons.visibility 
             : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
