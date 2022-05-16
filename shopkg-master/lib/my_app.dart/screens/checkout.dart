

import 'package:flutter/material.dart';
import 'package:shopkg/app_constants.dart/app_colors.dart';
import 'package:shopkg/app_constants.dart/text_style.dart';
import 'package:shopkg/checkout.dart';
import 'package:shopkg/my_app.dart/screens/welcomescreen.dart';

class CheckOut extends StatefulWidget {
  final double? price;
  final String? name;
  final String? image;

CheckOut ({
this.price,
this.name,
this.image
});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

   Widget  _buildSignCardProduct() {
    return  Container(
            height: 160,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    children: [
                      Container(
                        height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:AssetImage( "images/${widget.image}")
                          ),
                          ),
                          ),
                      Container(
                        height: 140,
                        width: 200,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.name!),
                                 Text( "Cloths"),
                                 Text(
                                   "\$ ${widget.price}",
                                  style: AppTextStyles.homepageTextStyleclother,
                                ),
                        Container(
                          color: Color.fromARGB(255, 238, 232, 232),
                           height: 30,
                           width: 110,
                           child:   Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                              ////////////
                              Text("Quentity", style: AppTextStyles.homepageTextStyleclother,),
                              Text("1"),
                              
                            ]
                          ),
                        ),
             
                            ],
                          ),
                            )
                        )
                    ],
                  ),
                     
                ],
                ),
              ),
            ),
          );
  }

  Widget _buildButtonDetail({

    String? startName,
     String? endName,

  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
            Text(
              startName!,style: AppTextStyles.homepageTextStyle,
             ),
                Text(endName!,style: AppTextStyles.homepageTextStyle,
                 ),
             ],
           );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chech Page", style: AppTextStyles.homepageTextStyleclother,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () { },
        ) ,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, 
            color: Colors.black),
          onPressed: () {

              Navigator.of(context).
            pushReplacement(MaterialPageRoute(
              builder: (ctx) => CheckOut(
                image: widget.image,
                price: widget.price,
                name: widget.name,
              )
              )
              );
          }
          )
          ],
      ),
      bottomNavigationBar: Container(
        height: 40,
        width: 100,
        child: RaisedButton(
          color: AppColors.cartPinkColor,
          child: Text(
            "boys",
            style: AppTextStyles.homepageTextStyleDrawer,
            ),
            onPressed: () {
        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => WelcomeScreen(),
                            ),
        );
        }),
        ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
           vertical: 15
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
           Container(
             height: 35,
             width: 100,
            //  color: Colors.amber,
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Check Out", style: AppTextStyles.homepageTextStyle,)
            ],
            ),
           ),
         const SizedBox(height: 10,),
           _buildSignCardProduct(),
            _buildSignCardProduct(),
            
             Container(
               height: 150,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
               _buildButtonDetail(startName: "Your Price", endName: "\$ 60.00"),
               _buildButtonDetail(startName: "Discount", endName: "3%"),
               _buildButtonDetail(startName: "Shopping", endName: "\$ 60.00"),
               _buildButtonDetail(startName: "Total", endName: "\$ 120"),
                 ],),
             )
            
             ]
             ),
      ),
    );
  }
}

