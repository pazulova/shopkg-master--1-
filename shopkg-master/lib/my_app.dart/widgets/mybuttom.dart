import 'package:flutter/material.dart';
import 'package:shopkg/app_constants.dart/app_colors.dart';

class MyButtonWidget extends StatelessWidget {
  
final Function ()? onPressed;

final String? name;

MyButtonWidget ({this.name, this.onPressed, String? whichAccount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 35,
        width: double.infinity,
        child: RaisedButton(
        
         child: Text(name!),
            color: AppColors.loginColor,
            onPressed: onPressed,
                    )
                            
      
      ),
    );
  }
}