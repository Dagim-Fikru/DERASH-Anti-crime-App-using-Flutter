import 'dart:html';
import 'login.dart';

import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({ Key? key }) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.black
            // image:DecorationImage(
            //   image: AssetImage("../assets/crime.jpg"),
            //   fit: BoxFit.cover)
          ),
        ),
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            image:DecorationImage(
              image: AssetImage("../assets/logoo.jpg")
              , 
              ),
              
              )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150,left: 100),
                child: Container(
                
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    
                  ),
                ),
              ),
              const Positioned(
                top: 180,
                left: 120,
                child: Text("Create an account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:250.0,left: 130),
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                            color: Colors.cyan,
                            height: 35,
                            width: 50,
                            child: const Icon(Icons.person,
                            size: 18,),
  
                          ),
                        ),
                        Center(
                          child: Container(
                            color:Colors.white,
                            height: 35,
                            width:200,
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'username',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                              ),
                          ),
                        ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:10.0,left: 130),
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                            color: Colors.cyan,
                            height: 35,
                            width: 50,
                            child: const Icon(Icons.email,
                            size: 18,),
  
                          ),
                        ),
                        Center(
                          child: Container(
                            color:Colors.white,
                            height: 35,
                            width:200,
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'example@gmail.com',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                              ),
                          ),
                        ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:10.0,left: 130),
                    child: Row(
      
                      children: [
                        Center(
                          child: Container(
                            color: Colors.cyan,
                            height: 35,
                            width: 50,
                            child: const Icon(
                            Icons.lock,
                            size: 18,
                            
                            ),
                            
  
                          ),
                        ),
                        Center(
                          child: Container(
                            color:Colors.white,
                            height: 35,
                            width:200,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                          )
                          
                        ),
                        // validator: (String value) {
                        //   if (value.trim().isEmpty) {
                        //     return 'Password is required';
                        //   }
                        // },
 ),
                            ),
                            
          
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0,left: 130),
                    child: Row(
      
                      children: [
                        Center(
                          child: Container(
                            color: Colors.cyan,
                            height: 35,
                            width: 50,
                            child: const Icon(
                            Icons.lock,
                            size: 18,
                            
                            ),
                            
  
                          ),
                        ),
                        Center(
                          child: Container(
                            color:Colors.white,
                            height: 35,
                            width:200,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm password',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                          )
                          
                        ),
                        // validator: (String value) {
                        //   if (value.trim().isEmpty) {
                        //     return 'Password is required';
                        //   }
                        // },
                  ),
                            ),
                            
          
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0,left: 180),
                    child: Container(
                      decoration:BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      
                      child: FlatButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );

                      }, child: Text("Signup")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140,top: 40),
                    child: Row(
                      children: [
                        const Text("I have already an account",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(right:90),
                          child: FlatButton(onPressed: (){},
                           child: const Text("login",style: TextStyle(
                             color: Colors.cyan
                           ),)),
                        )
                      ],
                    ),
                  )

                  
                ],
          
            
          ),
            ]
          ),
        ),
        
      ]
    );
  }
}