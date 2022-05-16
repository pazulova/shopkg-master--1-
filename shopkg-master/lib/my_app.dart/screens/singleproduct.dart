import 'package:flutter/material.dart';
import 'package:shopkg/app_constants.dart/text_style.dart';

class SigleProduct extends StatelessWidget {
   final String? image;
   final double? price;
   final String? name;
SigleProduct({
  this.image,
  this.price,
  this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
                   child: Container(
                     height: 240,
                      width: 170,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 180,
                              width: 150,
                              decoration:  BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("images/$image"),
                                ),
                              ),
                            ),
                          ),
                           Text(
                             "\$ ${price.toString() }", 
                           style: AppTextStyles.homepageTextStyleclother,
                           ),
                       Text(
                         name!, style:
                          AppTextStyles.homepageTextStyleclother,
                          )
                 ],
               ),        
         ),   
    );
  }
  }


  // Widget _buildFeaturedProduct({String? name, double? price, String? image}) {
  //   return  Card(
  //                  child: Container(
  //                    height: 240,
  //                     width: 170,
  //                     child: Column(
  //                       children: [
  //                         Container(
  //                           padding: EdgeInsets.symmetric(vertical: 10),
  //                           child: Container(
  //                             height: 180,
  //                             width: 150,
  //                             decoration:  BoxDecoration(
  //                               image: DecorationImage(
  //                                 fit: BoxFit.fill,
  //                                 image: AssetImage("images/$image"),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                          Text("\$ $price", 
  //                          style: AppTextStyles.homepageTextStyleclother,
  //                          ),
  //                      Text(name!, style: AppTextStyles.homepageTextStyleclother,)
  //                ],
  //              ),        
  //        ),   
  //   );
  // }