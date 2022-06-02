

import '../auth/login/login_event.dart';
import '../auth/login/login_state.dart';
import '../auth/login/login_bloc.dart';
import '../components/header_widget.dart';
import 'package:flutter/material.dart';
import '../components/theme_helper.dart';
import 'package:flutter/gestures.dart';
import 'signup.dart';
// import '../screens/dag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  
  final formKey = GlobalKey<FormState>();
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();
   LoginPage({Key? key}) : super(key: key);
  double _headerHeight=200;
  //  Key formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.white,
      body:SingleChildScrollView(
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
                       key: formKey,
                       child: Column(
                         children: [
                           TextFormField(
                               decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                validator: (String? userName) {
                                  if (userName == null || userName.isEmpty) {
                                    return "UserName must not be empty";
                                     }
                                     
                                }
                                
                           
                             ),
      

                           SizedBox(height: 30.0,),
                           TextFormField(
                             obscureText: true,
                             decoration:ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                             validator: (String? password) {
                                  if (password == null || password.isEmpty) {
                                  return "Password must not be empty";
                                    }

                                  return password.length >= 8 ? null : "Password too short";
                              

                           
                            }
                            ),
                
                     SizedBox(height: 10),
              BlocConsumer<AuthBloc, AuthState>(
                listenWhen: (_, current) {
                  return current is LoginSuccessful;
                },
                listener: (_, AuthState state) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Dag()),
                  );
                },
                
                builder: (_, AuthState state) {
                  Widget buttonChild = Text("Log in");
                  if (state is LogingIn) {
                    buttonChild = const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  if (state is LoginSuccessful) {
                    buttonChild = const Text("Login successful");
                  }

                  if (state is LoginFailed) {
                    buttonChild = const Text("Login failed");
                  }

                  return ElevatedButton(
                    onPressed: state is LogingIn
                        ? null
                        : () {
                            // var currentState;
                            
                            final formValid = formKey.currentState!.validate();
                            if (!formValid) return;

                            final authBloc = BlocProvider.of<AuthBloc>(context);
                            // var passCtrl;
                            // var userCtrl;
                            authBloc.add(Login(userCtrl.text, passCtrl.text));
                          },
                    child: buttonChild,
                  );
                },
              ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10,20,10,20),
                            //  child: Text("Don't have an account? Create"),
                            child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Don\'t have an account? "),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                        },
                                        // ..onTap=() => context.go('/signup'), 
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