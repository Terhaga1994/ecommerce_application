

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/constanse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ecommerce_application/model/user_model.dart';
import 'package:ecommerce_application/screens/home.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({ Key? key }) : super(key: key);

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
final _formKey = GlobalKey<FormState>();
   final _auth =FirebaseAuth.instance;

  final TextEditingController nameEditingController = TextEditingController();
  
final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController confirmpasswordEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.text,
        validator: (value){
          RegExp regex = RegExp(r'^.{6,}$');
          if(value!.isEmpty){
             return ("Please Enter your  name");
          }
          if(!regex.hasMatch(value)){
             return ("Please Enter your name (Min 6 Chracters");
          }
          return null;
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.account_circle,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

             final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
         if(value!.isEmpty){
           return ("Please Enter your Email");
         }
         // req Expression for validation
         if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.([a-zA-Z]{2,5})").hasMatch(value)){
             return ("Please Enter your valid Email");
         }
         return null;
       },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.email,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
             final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value){
          RegExp regex = RegExp(r'^.{6,}$');
          if(value!.isEmpty){
             return ("Please Enter your password");
          }
          if(!regex.hasMatch(value)){
             return ("Please Enter your password (Min 6 Chracters");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.vpn_key,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
             final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmpasswordEditingController,
        obscureText: true,
        validator: (value){
         
          if(confirmpasswordEditingController.text.length>6 && passwordEditingController.text != value){
             return ("password not match");
          }
          return null;
        },
        onSaved: (value) {
          confirmpasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
           filled: true,
           iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.vpn_key,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Confirm Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

            final signUpButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: () {
            SingUp(emailEditingController.text, passwordEditingController.text);
          },
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          child: const Text(
            'SignUp',
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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white),
            onPressed:() {
                Navigator.of(context).pop();
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
                       SizedBox(
                      height: MediaQuery.of(context).size.height*.1,
                      child: Image.asset(
                        "image/icon/buy.png",
                        fit: BoxFit.contain,
                      ),
                      
                    ),
                     const Positioned(bottom: 0,
                     child: Text("Terhaga Shop",style: TextStyle(fontFamily: 'Pacifico',fontSize: 25,color: Colors.white),),),
                    const SizedBox(
                      height: 25,
                    ),
                   
                    nameField,
                    const SizedBox(
                      height: 10,
                    ),
                   
                    emailField,
                    const SizedBox(
                      height: 10,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 10,
                    ),
                    confirmPasswordField,
                    const SizedBox(
                      height: 10,
                    ),
                 signUpButton,
                   
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
// ignore: non_constant_identifier_names
void SingUp (String email,String password) async{
if(_formKey.currentState!.validate()){
await _auth.createUserWithEmailAndPassword(email: email, password: password)
.then((value) => 
{
postDetailsToFirestore()
}).catchError((e){
  Fluttertoast.showToast(msg: e!.message);
});
}
}

postDetailsToFirestore() async{
  
//calling our firestore
//calling our user model
//sending this values
FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;
User? user=_auth.currentUser;

UserModel userModel=UserModel();

//writting all values
userModel.name=nameEditingController.text;
userModel.email= user!.email;
userModel.uid= user.uid;



await firebaseFirestore
.collection("users")
.doc(user.uid)
.set(userModel.toMap());
Fluttertoast.showToast(msg: "Acount Created Successfully");
Navigator.pushAndRemoveUntil(
  (context), 
MaterialPageRoute(builder: (context) =>  const HomeScreen()), 
(route) => false);

}

}
