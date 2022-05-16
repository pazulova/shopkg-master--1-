// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shopkg/app_constants.dart/text_style.dart';
import 'package:shopkg/my_app.dart/screens/homepage.dart';
import 'package:shopkg/my_app.dart/screens/singleproduct.dart';

class ListProducts extends StatelessWidget {


 final String? name;

 ListProducts({this.name, TextStyle });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:  IconButton(
          icon: const Icon(
            Icons.arrow_back, 
            color: Colors.black,
            ),
            onPressed: (){
                 Navigator.of(context)
                             .pushReplacement(MaterialPageRoute(
                               builder: (ctx)=> 
                               HomePage()
                                
                             )
                             );
                             
       
                }
                ),
            actions: <Widget> [
              IconButton(icon: Icon(Icons.search, color: Colors.black,),
              onPressed: () {},
              ),
              IconButton(icon: Icon(Icons.notifications_none, color: Colors.black,),
                onPressed: () {},
                ),
              ]
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: <Widget>[
                Column(children: [
                  Container(
                     height: 45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:<Widget>[
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  <Widget>[
                                 Text(
                                   name!,
                                 style: AppTextStyles.homepageTextStyle,
                                ),
                          //      Text("See All",
                          //    style: AppTextStyles.homepageTextStyle
                          //  ),
                         ],
                       ),
                    ],
                 ),
                        ),
                     SizedBox(height: 10,),   
                  Container(
                 height: 500,
                 child: GridView.count(
                   mainAxisSpacing: 10,
                   childAspectRatio: 0.7,
                   crossAxisCount: 2, children: [
                       SigleProduct(
                             image: "camera.jpg", price: 30.0, name: "camera"),
                             SigleProduct(
                             image: "about.png", price: 33.0, name: "All clother",
                            ),
                           
                              SigleProduct(
                             image: "man.jpg", price: 30.0, name: "Man Long T-Shirt"),
                             SigleProduct(
                             image: "women.jpg", price: 33.0, name: "Women T-Shirt",
                             ),
                           SigleProduct(
                             image: "man.jpg", price: 30.0, name: "Man Long T-Shirt"),
                             SigleProduct(
                             image: "women.jpg", price: 33.0, name: "Women T-Shirt",
                        ),
                    SigleProduct(
                             image: "camera.jpg", price: 30.0, name: "camera"),
                             SigleProduct(
                             image: "about.png", price: 33.0, name: "All clother",
                            ),
                       ],
                       ),
                         )
                     ],
                   ),
                ]
              ),
     ),   
    );
  }
} // Widget _buildFeaturedProduct({String? name, double? price, String? image}) {
  //   return  Card(
                   
  //                    child: Container(
  //                      height: 230,
  //                       width: 170,
  //                       child: Column(
  //                         children: [
  //                           Container(
  //                             height: 170,
  //                             width: 150,
  //                             decoration:  BoxDecoration(
  //                               image: DecorationImage(
  //                                 image: AssetImage("images/$image"),
  //                               ),
  //                             ),
  //                           ),
  //                            Text("\$ $price", 
  //                            style: AppTextStyles.homepageTextStyle,
  //                            ),
  //                        Text(name!, style: AppTextStyles.homepageTextStyle,)
  //                                   ],
  //                                 ),        
  //                           ),
                   
  //   );
  // }