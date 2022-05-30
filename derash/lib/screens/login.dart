
import '../component/header_widget.dart';
import 'package:flutter/material.dart';
import '../component/theme_helper.dart';
import 'package:flutter/gestures.dart';
import 'signup.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
 
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight=200;
   Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true ,Image(image: AssetImage("../assets/logoo.jpg"))),

            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                     Text(
                       "SignIn",
                       style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold)
                     ),
                     SizedBox(height: 30.0,),
                     Form(
                       key: _formKey,
                       child: Column(
                         children: [
                           TextField(
                             decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                           ),
                           SizedBox(height: 30.0,),
                           TextField(
                             obscureText: true,
                             decoration:ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                           ),
                           SizedBox(height: 15.0,),
                           Container(
                             decoration: ThemeHelper().buttonBoxDecoration(context),
                             child: ElevatedButton(
                               onPressed: (){},
                               style: ThemeHelper().buttonStyle(), 
                             child: Padding(
                               padding: const EdgeInsets.fromLTRB(40,10,40,10),
                               child: Text("Sign In",style: TextStyle(
                                 color: Colors.white,
                               ),),
                             ),)
                           ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,20,10,20),
                            //  child: Text("Don't have an account? Create"),
                            child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Don\'t have an account? "),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                        },
                                        
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                                    ),
                                  ]
                                )
                              ),
                           ),
                         ],
                       ))
                  ],
                ),
                
              ),
              )
          ],
        ),
      ),
    );
    
  }
}