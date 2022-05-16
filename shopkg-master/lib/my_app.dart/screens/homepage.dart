

// // import 'package:carousel_pro/carousel_pro.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopkg/app_constants.dart/app_colors.dart';
import 'package:shopkg/app_constants.dart/text_style.dart';
import 'package:shopkg/my_app.dart/screens/details_screen.dart';
import 'package:shopkg/my_app.dart/screens/list_products.dart';
import 'package:shopkg/my_app.dart/screens/singleproduct.dart';
//import 'package:carousel_pro/carousel_pro.dart';
class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 Widget _buildCategoriyProduct({String? image, int? color}) {
   return CircleAvatar(
   maxRadius: 35,
  backgroundColor: Color(color!),
  child: Container(
    height: 40,
  child: Image(
 image: AssetImage("images/$image"),
  ),
  ),
  );
 }
 double? height, width;

  bool? homeColor = false;

  bool? cartColor = true;

  bool? aboutColor = false;

  bool? contactUsColor = false;
 bool? profileColor = false;

 Widget _buildDrawer() {
   return  Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: 
            Text(
              "Gulnura", style: AppTextStyles.homepageTextStyleDrawer,
              ),
              currentAccountPicture: const CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage(
                  "images/shopping.png")
                  ),
              decoration: BoxDecoration(color: AppColors.drawePinkColor),
               accountEmail: 
             const Text("gulnura.pazulova.pls@gmail.com",
               ),
               ),
               ListTile(
                 selected: homeColor!,
                 onTap: () {
                   setState(() {
                    homeColor!=true;
                     contactUsColor!=true;
                     cartColor!=false;
                     aboutColor!=false;
                   });
                 },
               leading: Icon(Icons.home),
               title: Text("Home"),
               ),
                 ListTile(
                   selected: cartColor!,
                   onTap: () {
                      setState(() {
                    cartColor!=true;
                     contactUsColor!=false;
                     homeColor!=false;
                     aboutColor!=false;
                    //  profileColor = false;
                   });
                 
                   },
               leading: Icon(Icons.shopping_cart),
               title: Text("Cart"),
               ),
                 ListTile(
                   selected: aboutColor!,
                   onTap: () {
                         setState(() {
                    aboutColor!=true;
                     contactUsColor!=false;
                     homeColor!=false;
                     cartColor!=false;
                     profileColor = false;
                   });
                 
                   },
               leading: Icon(Icons.info),
               title: Text("About"),
               ),
                 ListTile(
                   selected: contactUsColor!,
                   onTap: () {
                         setState(() {
                    contactUsColor!=true;
                     homeColor!=false;
                     cartColor!=false;
                     aboutColor!=false;
                     profileColor = false;
                   });
                 
                   },
               leading: const Icon(Icons.phone),
               title: Text("Contact Us "),
               ),
                 ListTile(
                  // selected: logOutColor!,
                   onTap: () {
                           setState(() {
                    // profileColor = true;
                    // contactUsColor!=false;
                    //  homeColor!=false;
                    //  cartColor!=false;
                    // aboutColor!=false;
                     
                   });
                    },
               leading: Icon(Icons.exit_to_app),
               title: Text("LogOut"),
               ),        
        ]        
        ),
      );
     
 }
    final images = [
  Image.asset('images/camera.jpg'),
  Image.asset('images/about.png'),
 
];
   Widget _buildImageSlider() {
     return Container(
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(items: images, options: CarouselOptions(
                  // aspectRatio: 1.0,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                ),)
              ],
            );
          }
        ),
      );
   }
 
  Widget _buildCategory() {
    return Column(children: [
  Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Categorie", style: AppTextStyles.homepageTextStyle,
                          ),
                        ],
                      ),
                    ),
                 Container(
                     height: 50,
                     child: Row(
                       children: [
                     _buildCategoriyProduct(image: "user.png", color: 0xff33bcfb),
                     _buildCategoriyProduct(image: "user.png",color: 0xff33bcfb),
                     _buildCategoriyProduct(image: "user.png",color: 0xff33bcfb),
                     _buildCategoriyProduct(image: "user.png",color: 0xff33bcfb),
                     _buildCategoriyProduct(image: "user.png",color: 0xff33bcfb),
                   
                     ]
                     ),
                   ),
    ],);
  }
 
 Widget _buildFeatured () {
   return Column(
     children: [
  Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  <Widget>[
         Text("Featured", style: AppTextStyles.homepageTextStyle,),
         GestureDetector(
          onTap: () {
           Navigator.of(context)
                           .pushReplacement(MaterialPageRoute(
                             builder: (ctx)=> 
                             ListProducts(
                               name: "Featured")
                           ),
                              
                           );
                           },
                              child: Text("View More",style: AppTextStyles.homepageTextStyle
                              ),
                            ),
                             ],
                              ),
                          
                             
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                       Navigator.of(context)
                       .pushReplacement(MaterialPageRoute(
                       builder: (ctx)=> DetailsScreen(
                       image: "man.jpg",
                       price: 30.0,
                       name: "Man Long T-Shirt"
                       ),    
                       ),
                       );
                        },
                        child: SigleProduct(
                       image: "man.jpg",
                       price: 30.0,
                       name: "Man Long T-Shirt"),
                      ),
                       GestureDetector(
                       onTap: () {
                       Navigator.of(context)
                       .pushReplacement(MaterialPageRoute(
                        builder: (ctx)=> DetailsScreen(
                        image: "women.jpg",
                       price: 33.0,
                       name: "Women T-Shirt",
                       ),
                        ),
                       );
                        },
                         child: SigleProduct(
                       image: "man.jpg",
                       price: 30.0,
                       name: "Man Long T-Shirt"
                       ), 
                       ),
                    ],
                  ),
   ],
   );
 }
 
 Widget _buildNewAchives() {
   return Column(
     children: [
        Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  <Widget>[
                             Text("New Achives",
                             style: AppTextStyles.homepageTextStyle,
                             ),
                            GestureDetector(
                              onTap: () {
                                 Navigator.of(context)
                             .pushReplacement(MaterialPageRoute(
                               builder: (ctx)=> ListProducts(name: "New Achives",
                               ),
                               ),
                               );
                               },
                              child: Text(
                                "View More",
                                style: AppTextStyles.homepageTextStyle
                                ),
                                ),
                             ],
                          ),
                        ],
                       ),
                       
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children:<Widget> [
                           
                      
                       GestureDetector(
                         onTap: () {
                           Navigator.of(context)
                         .pushReplacement(MaterialPageRoute(
                           builder: (ctx)=> DetailsScreen(
                         
                         image: "man.jpg",
                          price: 30.0,
                           name: "Man Long T-Shirt"
                            ),
                         )
                        );
                       },
                          child: SigleProduct(
                         image: "man.jpg",
                         price: 30.0,
                         name: "Man Long T-Shirt"
                          )
                         ),
                         GestureDetector(
                         onTap: () {
                          Navigator.of(context)
                         .pushReplacement(MaterialPageRoute(
                           builder: (ctx)=> DetailsScreen(
                          image: "man.jpg",
                         price: 30.0,
                         name: "Man Long T-Shirt"
                         ),
                          ),
                        );
                      },
                       child: SigleProduct(
                         image: "man.jpg",
                         price: 30.0,
                         name: "Man Long T-Shirt" ),
                    ),
                    
                    ],
                    ),
                            
                  ],
                  ),
                 ],
                ), 
     ],
     );
 }
 
  final GlobalKey<ScaffoldState>_key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       key: _key, 
       drawer: _buildDrawer(),
      appBar: AppBar(
        title:  Text(
          "Home Page",
          style: AppTextStyles.homepageTextStyle,
        ),
        
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
             _key.currentState?.openDrawer();
            }),
           actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              ),
              onPressed: () {},
          ),
            IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black
                  ),
                onPressed: () {

             }),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children:[
           Container(
             width: double.infinity,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                  _buildImageSlider(),
                  _buildCategory() ,
                  const SizedBox(height: 20,),
                _buildFeatured(),
                _buildNewAchives(),
             ],
            ),
           )
          ]
        )
      )
    );
  }
}