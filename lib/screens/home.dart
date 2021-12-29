


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/constanse.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/model/product_model';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
 List<ProductModel> products=[];
  ProductModel productModel=ProductModel();
  int _tabBarIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(length: 4,
         child:  Scaffold(
           appBar: AppBar(
             backgroundColor: Colors.white,
             elevation: 0,
             
                  bottom:  TabBar(
                    indicatorColor: MainColor,
                    onTap:(value) {
                      
                      setState(() {
                        _tabBarIndex=value;
                      });
                      
                    },
                    tabs: <Widget> [
                      
                          Text('Jackets',
                          style: TextStyle(
                            color: _tabBarIndex==0? Colors.black 
                            :Colors.grey,
                            fontSize: _tabBarIndex==0? 13:10
                            
                          ),
                          ),
                           Text('Trouser',  style: TextStyle(
                            color: _tabBarIndex==1? Colors.black 
                            :Colors.grey,
                            fontSize: _tabBarIndex==1? 13:10
                            
                          ),),
                            Text('T-shirt',  style: TextStyle(
                            color: _tabBarIndex==2? Colors.black 
                            :Colors.grey,
                            fontSize: _tabBarIndex==2? 13:10
                            
                          ),),
                             Text('Shoes',  style: TextStyle(
                            color: _tabBarIndex==3? Colors.black 
                            :Colors.grey,
                            fontSize: _tabBarIndex==3? 13:10
                            
                          ),),
                    ],
                  ),
           ),


          body: const TabBarView(
            children: [
              Text("test"),
              Text("test"),
               Text("test"),
                Text("test"),
           //   trouserView(),
             // shirtView(),
              //shoresView()
            ],

          ),
        ))
       ,  Material(
         child: Padding(
           padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
           // ignore: sized_box_for_whitespace
           child: Container(
             
             height: MediaQuery.of(context).size.height*.1,
             child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Discover".toUpperCase(),
                 style: const TextStyle(
                   fontSize: 20,
                 fontWeight: FontWeight.bold),),
                 const Icon(Icons.shopping_cart)
               ],
             ),
           ),
         ),
       )
      ],
    );
  }

 
}