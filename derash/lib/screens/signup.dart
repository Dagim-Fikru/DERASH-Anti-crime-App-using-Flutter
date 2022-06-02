
// import 'package:quiz/auth/login/login_event.dart';
import 'package:quiz/screens/dag.dart';
import 'package:quiz/screens/login.dart';
import '../component/header_widget.dart';
import 'package:flutter/material.dart';
import '../component/theme_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import '../screens/dag.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/signup/sign_up_bloc.dart';
import '../auth/signup/sign_up_event.dart';
import '../auth/signup/sign_up_state.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    final userCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passconfCtrl = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool checkedValue = false;
    bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 130,
              child:  HeaderWidget(150, true ,Image(image: AssetImage("../assets/logoo.jpg"),height: 120,width:120)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                      
                        Padding(
                          padding: const EdgeInsets.only(top: 110),
                          child: Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration('UserName', 'Enter your user name'),
                               validator: (val) {
                              if (val!.isEmpty) {
                                return "Username is Required";
                              }
                               else if(val.length<3){
                                return "The Username is to short";
                              }
                              
                              return null;
                            },
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Enter a valid email address";
                              }
                              
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              else if(val.length<8){
                                return "The password is to short";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Confirm password*", "confirm your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please re-enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        


                      ],
                    )
                    ),

                    SizedBox(height: 15.0),
              FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Dag()
                                    ),
                                        (Route<dynamic> route) => false
                                );
                              }
                            },
                          ),
                        ),
                               SizedBox(height: 10),
                     BlocConsumer<AuthBloc, AuthState>(
                listenWhen: (_, current) {
                  return current is SignUpSuccessful;
                },
                listener: (_, AuthState state) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
                
                builder: (_, AuthState state) {
                  Widget buttonChild = Text("SIgnup");
                  if (state is SigningUp) {
                    buttonChild = const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  if (state is SignUpSuccessful) {
                    buttonChild = const Text("SignUp successful");
                  }

                  if (state is SignUpFailed) {
                    buttonChild = const Text("SignUp  failed");
                  }

                  return ElevatedButton(
                    onPressed: state is SigningUp
                        ? null
                        : () {
                            // var currentState;
                            
                            final formValid = _formKey.currentState!.validate();
                            if (!formValid) return;

                            final authBloc = BlocProvider.of<AuthBloc>(context);
                            // var passCtrl;
                            // var userCtrl;
                            authBloc.add(SignUp(userCtrl.text,emailCtrl.text, passCtrl.text,passconfCtrl.text));
                          },
                    child: buttonChild,
                  );
                },
              ),
                        SizedBox(height: 20.0),
                        Text("Or create account using social media",  style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus, size: 35,
                                color: HexColor("#EC2D2F"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Google Plus","You tap on GooglePlus social icon.",context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter, size: 23,
                                  color: HexColor("#FFFFFF"),),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Twitter","You tap on Twitter social icon.",context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook, size: 35,
                                color: HexColor("#3E529C"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),




                ],
              ),
                ]
            ),
            ),
             

          ],
        ),
      ),
          
      );
      
  
    
  }
}