
//  текшеруууууууууууууууууууу ушул иетти
import 'package:flutter/material.dart';
import 'package:shopkg/app_constants.dart/app_colors.dart';
import 'package:shopkg/app_constants.dart/text_style.dart';
import 'package:shopkg/my_app.dart/screens/checkout.dart';

class CartScreen extends StatefulWidget {

  
  final double? price;
  final String? name;
  final String? image;

   CartScreen ({
   this.price,
   this.name,
   this.image
   });

  @override
  State<CartScreen> createState() => _CartScreenState();
}



class _CartScreenState extends State<CartScreen> {
  int count = 1;
// 
  Widget _buildSignCardProduct() {
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
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:AssetImage( "images/${widget.image} ")
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
                              Text( widget.name!),
                                 Text( "Cloths"),
                                 Text(
                                   "\$${widget.price.toString()}",
                                  style: AppTextStyles.homepageTextStyleclother,
                                ),
                        Container(
                          color: Color.fromARGB(255, 238, 232, 232),
                           height: 30,
                           width: 110,
                           child:   Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               GestureDetector(
                             child: Icon(Icons.remove),
                             onTap: () {
                                setState(() {
                               if(count > 1)
                                  count--;
                               });
                              
                             },
                                 ),
                                 Text(
                                   count.toString(), 
                                   style: AppTextStyles.homepageTextStyle),
                                   GestureDetector(
                             child: Icon(Icons.add),
                             onTap: () {
                                setState(() {
                                  
                                  count++;
                                  print(count);
                               }
                               );
                             },
                             )
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 40,
        width: 100,
        child: RaisedButton(
          color: AppColors.cartPinkColor,
          child: Text(
            "continus",
            style: AppTextStyles.homepageTextStyleDrawer,
            ),
            onPressed: () {
          Navigator.of(context).
            pushReplacement(MaterialPageRoute(
              builder: (ctx) => CheckOut(
                image: widget.image,
                name: widget.name,
                price: widget.price,
              )
              )
              );
        }),
        ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart Page", style: AppTextStyles.homepageTextStyleclother,),
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
            icon: Icon(Icons.notifications_none, 
            color: Colors.black),
          onPressed: () {}
          )
          ],
      ),
      body: ListView(
       
          children: [
           _buildSignCardProduct(),
           _buildSignCardProduct(),
           _buildSignCardProduct(),
            _buildSignCardProduct(),
           _buildSignCardProduct(),
           _buildSignCardProduct(),
            _buildSignCardProduct(),
           _buildSignCardProduct(),
           _buildSignCardProduct(),
           
          ],
        ),
      
     );
  
}
}