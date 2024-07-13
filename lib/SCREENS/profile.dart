import 'package:feesmanagment/CONSTANTS/mycolors.dart';
import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/myfunctions.dart';
import 'login.dart';

class Profile extends StatelessWidget {
  String ManagerName;
  String Phone;
  String Photo;
   Profile({super.key,required this.ManagerName,required this.Phone,required this.Photo});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        toolbarHeight: height/12,
        title: Text('PROFILE',style: GoogleFonts.poppins(color: clWhite,fontWeight: FontWeight.w500,fontSize: 18),),
        centerTitle:true,
        iconTheme: IconThemeData(color: clWhite,size: 18,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height/12,),
                Center(
                  child: CircleAvatar(radius: width/5,
                  backgroundImage: NetworkImage(value.loginphoto),
                  // child: Image(image: NetworkImage(Photo),fit: BoxFit.fill,),
                  ),
                ),
                SizedBox(height: 30,),
                Container(height: 50,width: width,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: clWhite,
                  boxShadow: [BoxShadow(
                    color: clE5E8E8,blurRadius: 2,
                    spreadRadius: 3
                  )]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(radius: 25,backgroundColor: clD6EAF8,child: Icon(
                          Icons.person_outline,color: themecolor,
                        ),),
                        SizedBox(width: 15,),
                        Text(ManagerName,style: GoogleFonts.poppins(color: clBlack,fontSize: 14,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(height: 50,width: width,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),color: clWhite,
                    boxShadow: [BoxShadow(
                        color: clE5E8E8,blurRadius: 2,
                        spreadRadius: 3
                    )]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(radius: 25,backgroundColor: clD6EAF8,child: Icon(
                          Icons.phone,color: themecolor,
                        ),),
                        SizedBox(width: 15,),
                        Text(Phone,style: GoogleFonts.poppins(color: clBlack,fontSize: 14,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(height:50,
                  width: width/1.5,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: clWhite,
                      boxShadow: [BoxShadow(
                          color: clE5E8E8,blurRadius: 2,
                          spreadRadius: 3
                      )]),
                  child: IconButton(color: Colors.blue,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          backgroundColor: clWhite,
                          content: const Text(
                            "Are you sure want to Sign-out?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff35103B),
                            ),
                          ),
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    FirebaseAuth auth = FirebaseAuth.instance;
                                    auth.signOut();
                                    callNextReplacement(const Login(),context, );
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(fontSize: 15, color: clBlack),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    finish(context);
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('LOGOUT',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500),),
                        SizedBox(width: 10,),
                        const Icon(
                          Icons.logout,
                          color: clBlack,
                        ),
                      ],
                    ),
                  ),
                ),



              ],
            );
          }
        ),
      ),
    );
  }
}
