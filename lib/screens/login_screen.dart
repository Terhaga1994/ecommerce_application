import 'package:ecommerce_application/constanse.dart';
import 'package:ecommerce_application/screens/adminScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ecommerce_application/screens/registeration_screen.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final _auth =FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
      
        controller: emailController,
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
          emailController.text = value!;
        },
         cursorColor : Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          iconColor: Colors.blue,
            prefixIcon: const Icon(Icons.mail,color: MainColor,),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              
            )));
    //passwor field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        cursorColor : Colors.white,
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
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
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

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: MaterialButton(
          onPressed: () {
            SingIn(emailController.text,passwordController.text);},
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          child: const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));

    return Scaffold(
      backgroundColor: MainColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: MainColor,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
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
                      height: 35,
                    ),
                    emailField,
                    const SizedBox(
                      height: 30,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 25,
                    ),
                    loginButton,
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an acount?",style: TextStyle(color: Colors.white),),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const RegisterationScreen()));
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


// login function 
// ignore: non_constant_identifier_names
void SingIn (String email,String password) async{
if(_formKey.currentState!.validate()){
 if(password=="admin1234"){  
  await _auth.signInWithEmailAndPassword(email: email, password: password)
  .then((uid) => {
   
 
    Fluttertoast.showToast(msg: "login is Successful"),
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const AdminScreen()))
                       
  }).catchError((e){
    Fluttertoast.showToast(msg: e!.message);
  });}
  else{  
  await _auth.signInWithEmailAndPassword(email: email, password: password)
  .then((uid) => {
   
 
    Fluttertoast.showToast(msg: "login is Successful"),
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const HomeScreen()))
                       
  }).catchError((e){
    Fluttertoast.showToast(msg: e!.message);
  });}
}
}
}