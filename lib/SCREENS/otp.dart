import 'package:feesmanagment/CONSTANTS/myfunctions.dart';
import 'package:feesmanagment/PROVIDER/login_provider.dart';
import 'package:feesmanagment/SCREENS/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';

class Otp extends StatelessWidget {
   Otp({super.key,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: height/4,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height/14,),
                    Text('OTP verification',style: GoogleFonts.roboto(color: themecolor,fontWeight: FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 30,),
                    Consumer<LoginProvider>(
                        builder: (context,val,child) {
                          return Pinput(
                            onCompleted: (pin){
                              // val.verify(context);
                              },
                            length: 6,
                            controller: val.otpVerifyController,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            defaultPinTheme: PinTheme( decoration: BoxDecoration(
                              color: clWhite,
                              border: Border.all(color: themecolor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 15, color: themecolor),
                              height: 50,
                              width: 50,
                            ),
                          );
                        }
                    ),
                    SizedBox(height: 80,),
                    Consumer<LoginProvider>(
                        builder: (context,val,child) {
                          return InkWell(
                            onTap: (){
                              val.verify(context);
                              // callNext(Home(name: loginUsername, number: loginphno,
                              //   logo: schoollogo, schoolname: schoolname, photo: phto,), context);
                            },
                            child: Center(
                              child: Container(height: height/15,width: width,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: themecolor),
                                child: Center(child: Text('Sumbit',style: TextStyle(color: clWhite,fontSize: 20,fontWeight: FontWeight.w500),)),),
                            ),
                          );
                        }
                    ),
                    SizedBox(height: 20,),


                  ]),
            ),
          ],),
        ),

        );
    }
}