import 'package:flutter/material.dart';
import 'package:shopkg/app_constants.dart/app_text.dart';
import 'package:shopkg/app_constants.dart/text_style.dart';
import 'package:shopkg/my_app.dart/screens/cartscreen.dart';
import 'package:shopkg/my_app.dart/screens/homepage.dart';

class DetailsScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final double? price;

   DetailsScreen({this.image,this.name,this.price});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  
  int count = 1;
  Widget _buildSizeProduct({String? name}) {
     return   Container(
             height: 50,
             width: 50,
             color: Color(0xfff2f2f2),
            child: Center(child: Text( name!,style: AppTextStyles.homepageTextStyleclother,
            )
            ),
           );    
   }

  Widget _buildColorProduct({Color? color}) {
     return   Container(
             height: 50,
             width: 50,
             color: color,
            
           );    
   }
  Widget _buildImage() {
  return   Center(
     child: Container(
    width: 270,
     child: Card(
      child: Container(
        padding: EdgeInsets.all(13),
          child: Container(
           height: 200,
             decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/${widget.image}"),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
  Widget _buildNameToDescriptionPart () {
  return   Container(
     height: 60,
       child: Row(
         children: [
           Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                 Text(widget.name!,
                 style: AppTextStyles.homepageTextStyleclother,),
               Text("\$ ${widget.price.toString()} ",
             style: AppTextStyles.homepageTextStyleclother,),
           Text("Description",
           style: AppTextStyles.homepageTextStyleclother,),
          ],
        ),
       ],
    ),
  );
}
  Widget _buildDiscription() {
  return Container(
      height: 100,
       child: Wrap(
        children: const [
         Text(AppTexts.textDiscription,
         )
      ],
     ),
   );
}


  Widget _buildSize() {
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
      Text(
        AppTexts.size,
         style: AppTextStyles.homepageTextStyleclother,
          ),
            SizedBox(height: 10,),
               Container(
                 width: 270,
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     _buildSizeProduct(name: "S"),
                     _buildSizeProduct(name: "M"),
                     _buildSizeProduct(name: "L"),
                    _buildSizeProduct(name: "XXL")
                     ],
                   )
                 ),
            ],
       );
}
   Widget _buildColorPart() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  const SizedBox(height: 20,),
   Text(AppTexts.colorTect,
    style: AppTextStyles.homepageTextStyleclother,
     ),
     const SizedBox(height: 10,),
       Container(
         width: 260,
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               _buildColorProduct(color: Colors.amber),
               _buildColorProduct(color: Colors.greenAccent),
                _buildColorProduct(color: Colors.pink),
               _buildColorProduct(color: Colors.purple)
               ],
             )
           ),
        ],
    );
}
  Widget _buildQuentityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
          Text("Quentity",
          style: AppTextStyles.homepageTextStyleclother,
                   ),
                   SizedBox(height: 10,),
                   Container(
                     height: 40,
                     width: 110,
                     decoration: BoxDecoration(
                     color: Colors.cyan,
                     borderRadius: BorderRadius.circular(20)
                     ),
                     child:   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                           Text(count.toString(), style: AppTextStyles.homepageTextStyleclother),
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
    ],);
  }
  Widget _buildCheckbuttonPart() {
   return Container(
       height: 50,
         width: double.infinity,
           child: RaisedButton( 
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)
               ),
                 color:Colors.pink,
              child: Text(
                "check out",
                 style: AppTextStyles.homepageTextStyleclother,), 
           onPressed: () {
            Navigator.of(context).
            pushReplacement(MaterialPageRoute(
              builder: (ctx) => CartScreen(
                image: widget.image,
                name: widget.name,
                price: widget.price,
              )
              )
              );
           }
           ),
     );
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Page", style: AppTextStyles.homepageTextStyleclother,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).
            pushReplacement(MaterialPageRoute(
              builder: (ctx) => HomePage()
              )
              );
          },
        ) ,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, 
            color: Colors.black),
          onPressed: () {}
          )
          ],
        ),
        body: Container(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   _buildImage(),
                   Container(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         _buildNameToDescriptionPart(),
                          const SizedBox(height: 10,),
                         _buildDiscription(),
                         const SizedBox(height: 10,),
                         _buildSize(),
                          _buildColorPart(),
                         const SizedBox(height: 10,),
                         _buildQuentityPart(),
                         const SizedBox(height: 10,),
                         _buildCheckbuttonPart(),
                    ],
                   ),
                 ),
                ),
             ],
           ),
         ],
        ),
      ),      
    );
  }
}