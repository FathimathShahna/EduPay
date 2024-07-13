import 'package:feesmanagment/CONSTANTS/myfunctions.dart';
import 'package:feesmanagment/PROVIDER/login_provider.dart';
import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:feesmanagment/SCREENS/otp.dart';
import 'package:feesmanagment/SCREENS/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Consumer<LoginProvider>(
                  builder: (context,val,child) {
                    return Column(
                      children: [
                        SizedBox(height: height/4.5,),
                        Center(child: Column(
                          children: [
                            Text('Welcome Back',
                              style: GoogleFonts.roboto(color: themecolor,fontWeight: FontWeight.bold,fontSize: 30),),
                            Text('Login to Continue',
                              style: GoogleFonts.roboto(color: clAEB6BF,fontWeight: FontWeight.w400,fontSize: 20),),
                          ],
                        )),
                        SizedBox(height: 40,),

                        SizedBox(height: 30,),
                        SizedBox(
                          width: width/1.2,
                          child: TextFormField(
                            controller: val.loginPhnNumber,
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                focusColor: Colors.black38,
                                label: Text('Phone Number',style:
                                TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey,),),
                                      enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themecolor,),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themecolor,),
                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Consumer<LoginProvider>(
                            builder: (context,value,child) {
                              return InkWell(
                                onTap: (){
                                  value.sendOtp(context);
                                },
                                child: Container(height: height/14,width: width,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: themecolor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        offset: Offset(0, 4),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                      ),
                                    ],),
                                  child: Center(
                                    child:value.loader?CircularProgressIndicator(): Text('LOGIN',style:
                                    GoogleFonts.poppins(color: clWhite,fontSize: 20,fontWeight: FontWeight.w500),),
                                  ),),
                              );
                            }
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have account?',
                              style: GoogleFonts.poppins(color: clBlack,fontSize: 16,fontWeight: FontWeight.w400),),
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: (){
                                callNext(Register(), context);
                              },
                              child: Text('REGISTER',
                                style: GoogleFonts.poppins(color: themecolor,fontSize: 16,fontWeight: FontWeight.w400),),
                            ),

                          ],
                        ),
                      ],
                    );
                  }
              ),
            ),
            ),
       );
  }
}