import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/constanse.dart';
import 'package:ecommerce_application/screens/adminScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/model/product_model';
import 'package:fluttertoast/fluttertoast.dart';
class AddProduct extends StatefulWidget {
  const AddProduct({ Key? key }) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
final _formKey = GlobalKey<FormState>();
   final _auth =FirebaseAuth.instance;

  final TextEditingController nameProEditingController = TextEditingController();
   final TextEditingController priceProEditingController = TextEditingController();

  final TextEditingController descriptionProEditingController = TextEditingController();
final TextEditingController categoryProEditingController = TextEditingController();
   final TextEditingController locationProEditingController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
   
    final nameField = TextFormField(
        autofocus: false,
        controller: nameProEditingController,
        keyboardType: TextInputType.text,
        validator: (value){
         
          if(value!.isEmpty){
             return ("Please Enter name product");
          }
          
          return null;
        },
        onSaved: (value) {
          nameProEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.shop,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Name Product',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

   
  final priceField = TextFormField(
        autofocus: false,
        controller: priceProEditingController,
        keyboardType: TextInputType.text,
        validator: (value){
         
          if(value!.isEmpty){
             return ("Please Enter price product");
          }
          
          return null;
        },
        onSaved: (value) {
          priceProEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.money,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Price Product',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

  final descriptionField = TextFormField(
        autofocus: false,
        controller:descriptionProEditingController,
        keyboardType: TextInputType.text,
        validator: (value){
         
          if(value!.isEmpty){
             return ("Please Enter description product");
          }
          
          return null;
        },
        onSaved: (value) {
          descriptionProEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.description,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Description Product',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

  final categoryField = TextFormField(
        autofocus: false,
        controller:categoryProEditingController,
        keyboardType: TextInputType.text,
        validator: (value){
         
          if(value!.isEmpty){
             return ("Please Enter category product");
          }
          
          return null;
        },
        onSaved: (value) {
          categoryProEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.collections_bookmark,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Category Product',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

final locationField = TextFormField(
        autofocus: false,
        controller:locationProEditingController,
        keyboardType: TextInputType.text,
        validator: (value){
         
          if(value!.isEmpty){
             return ("Please Enter location product");
          }
          
          return null;
        },
        onSaved: (value) {
         locationProEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.location_on,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Location Product',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

   final addProductButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: () {
                    postDetailsToFirestore() ;
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

     return Scaffold(
      backgroundColor: MainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Add product",),
        leading: IconButton(
          
            icon: const Icon(Icons.arrow_back,color: Colors.white),
            onPressed:() {
             
                      },
        ),

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
                       const SizedBox(
                      height: 25,
                    ),
                   
                    nameField,
                    const SizedBox(
                      height: 10,
                    ),
                   
                    priceField,
                    const SizedBox(
                      height: 10,
                    ),
                    descriptionField,
                    const SizedBox(
                      height: 10,
                    ),
                    categoryField,
                    const SizedBox(
                      height: 10,
                    ),
                     locationField,
                    const SizedBox(
                      height: 10,
                    ),
                 addProductButton,
                   
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  postDetailsToFirestore() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
//calling our firestore
//calling our user model
//sending this values
FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;


ProductModel productModel=ProductModel();

//writting all values
productModel.nameProduct=nameProEditingController.text;
productModel.priceProduct=priceProEditingController.text;
productModel.descriptionProduct=descriptionProEditingController.text;
productModel.categoryProduct=categoryProEditingController.text;
productModel.locationProduct=locationProEditingController.text;





await firebaseFirestore
.collection("Products")

.add(productModel.toMap());
Fluttertoast.showToast(msg: "Prodect Added Successfully");
Navigator.pushAndRemoveUntil(
  (context), 
MaterialPageRoute(builder: (context) =>  const AdminScreen()), 
(route) => false);

}
  }
}