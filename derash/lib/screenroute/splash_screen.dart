import  'package:flutter/material.dart';

import 'package:derash/screenroute/home_screen.dart';
import 'package:derash/screenroute/login_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          } else {
            _navigateToLogin();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen()
      )
    );
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
    
      Container(
        color:Colors.black,
        child: Container(

          alignment: Alignment.center,
          
          

                child: Image.asset('./56.jpg')
            

            // Shimmer.fromColors(
            //   period: Duration(milliseconds: 1500),
            //   baseColor: Color(0xff7f00ff),
            //   highlightColor: Color(0xffe100ff),
            //   child: Container(
            //     padding: EdgeInsets.all(16.0),
            //     child: Text(
            //       "Vicon",
            //       style: TextStyle(
            //         fontSize: 90.0,
            //         fontFamily: 'Pacifico',
            //         shadows: <Shadow>[
            //           Shadow(
            //             blurRadius: 18.0,
            //             color: Colors.black87,
            //             offset: Offset.fromDirection(120, 12)
            //           )
            //         ]
            //       ),
            //     ),
            //   ),
            // )
          
        ),
      ),
    );
  }


}