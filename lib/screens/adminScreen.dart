// ignore: file_name
// ignore_for_file: file_names

import 'package:ecommerce_application/constanse.dart';
import 'package:ecommerce_application/screens/add_product.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({ Key? key }) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final addProductButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: () {
                Navigator.pushAndRemoveUntil(
  (context), 
MaterialPageRoute(builder: (context) =>  const AddProduct()), 
(route) => false);
                },
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          child: const Text(
            'Add Product',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));

final editProductButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: () {

                },
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          child: const Text(
            'Edit Product',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));

final viewOrderButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: () {

                },
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          child: const Text(
            'View Order',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));

      return Scaffold(
        backgroundColor: MainColor,
      appBar: AppBar(
        title: const Text("Welcome Admin"), centerTitle: true,
      ),
       body: Center(
        child: SingleChildScrollView(
          child: Container(
            color:MainColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.0,2.0,36.0,36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      
                     const Positioned(bottom: 0,
                     child: Text("Terhaga Shop",style: TextStyle(fontFamily: 'Pacifico',fontSize: 25,color: Colors.white),),),
                    const SizedBox(
                      height: 25,
                    ),
                   
                    addProductButton,
                    const SizedBox(
                      height: 10,
                    ),
                   
                    editProductButton,
                    const SizedBox(
                      height: 10,
                    ),
                    viewOrderButton,
                    const SizedBox(
                      height: 10,
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        ),)
    );
  }
}