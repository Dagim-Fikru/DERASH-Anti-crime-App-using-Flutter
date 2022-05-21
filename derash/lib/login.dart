import 'dart:html';
import 'signup.dart';

import 'package:derash/signup.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color:Colors.black
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
                  height: 310,
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
                child: Text("Sign In",
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
                    padding: const EdgeInsets.only(top:10.0,left: 180),
                    child: Container(
                      decoration:BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      
                      child: FlatButton(onPressed: (){
                        
                      }, child: Text("login")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140,top: 40),
                    child: Row(
                      children: [
                        const Text("don't have an account yet? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(right:90),
                          child: FlatButton(onPressed: (){
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupPage()),
                        );
                          },
                           child: const Text("Signup",style: TextStyle(
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
        Row(
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 465,left: 250),
            child: Container(
              width: 40,
                        decoration:BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(5)
                          ),
                        
                        child: FlatButton(onPressed: (){}, child: const Icon(Icons.facebook,
                        color: Colors.white,)),
                      ),
          ),
                  
      Padding(
        padding: const EdgeInsets.only(top: 465,left: 10),
        child: Container(
          width: 40,
                        decoration:BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(5)
                          ),
                        
                        child: FlatButton(onPressed: (){}, child: const Icon(Icons.tiktok,
                          color: Color.fromARGB(255, 11, 12, 12),)),
                      ),
      ),
                  
      Padding(
        padding: const EdgeInsets.only(top: 465,left: 10),
        child: Container(
          width: 40,
                        decoration:BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(5),
                            
                          ),
                        
                        child: FlatButton(onPressed: (){}, child: const Icon(Icons.telegram,
                          color: Color.fromARGB(255, 12, 12, 12),)),
                      ),
      ),
                  
      
  
      ],
        ),
      ]
    );
  }
}