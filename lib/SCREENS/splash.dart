import 'dart:async';
import 'package:feesmanagment/CONSTANTS/mycolors.dart';
import 'package:feesmanagment/SCREENS/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/myfunctions.dart';
import '../PROVIDER/login_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller1; // For first image animation
  late Animation<double> _animation1;


  @override
  void initState() {
    LoginProvider loginProvider =
    Provider.of<LoginProvider>(context, listen: false);

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;

    Timer( Duration(seconds: 5), () {
      print("hjkl"+loginUser.toString());
      if(loginUser==null){
        callNextReplacement( Login(),context,);
      }else{
        loginProvider.userAuthorized(loginUser.phoneNumber, context);

      }
    });

    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2), // Faster duration for first image animation
      vsync: this,
    );
    _animation1 = CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInOut,
    );

    // Forward both controllers simultaneously
    _controller1.forward();

    Timer(Duration(seconds: 5), () {
      callNextReplacement(Login(), context);
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: themecolor,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation1,
          child: Container(
            height: height/7,
            width: width / 2.5,
            child: Image.asset('assets/images/EduPay.png'), // Ensure you have an image in assets folder
          ),
          builder: (context, child) {
            double scaleValue = _animation1.value * 1.5;
            scaleValue = scaleValue.isNaN || scaleValue.isInfinite ? 1.0 : scaleValue;
            return Transform.scale(
              scale: scaleValue, // Scale from 0 to 1.5 times the original size
              child: child,
            );
          },
        ),
      ),
    );
  }
}
