import 'package:feesmanagment/CONSTANTS/mycolors.dart';
import 'package:feesmanagment/CONSTANTS/myfunctions.dart';
import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:feesmanagment/SCREENS/add_student.dart';
import 'package:feesmanagment/SCREENS/class.dart';
import 'package:feesmanagment/SCREENS/login.dart';
import 'package:feesmanagment/SCREENS/profile.dart';
import 'package:feesmanagment/SCREENS/student_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  String name;
  String number;
  String schoolname;
  String logo;
  String photo;
  String userId;
   Home({super.key,required this.name,required this.number,required this.logo,
     required this.schoolname,required this.photo,required this.userId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(children: [
              SizedBox(height: 30,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height/10,),
                InkWell(
                  onTap: (){
                    callNext(Profile(ManagerName: name, Phone: number, Photo: photo,), context);
                                value.getUserPhoto(userId,name);
                  },
                  child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(value.loginphoto),),
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back!',style: GoogleFonts.poppins(color: themecolor,fontSize: 25,fontWeight: FontWeight.bold),),
                    Text(name,style: GoogleFonts.poppins(color: clBlack,fontSize: 18,fontWeight: FontWeight.w500),),
                  ],
                )
              ],
            ),
              SizedBox(height: height/7,),
              Container(width: width,
              height: height/3,
              decoration: BoxDecoration(color: clD6EAF8,borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                offset: Offset(0, 4),
                blurRadius: 5,
                spreadRadius: 1,
              )]),
              child:
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(value.schoollogo)),
                        SizedBox(width: 15,),
                        SizedBox(
                          width: width/1.9,
                          child: Text(schoolname,style: GoogleFonts.poppins(
                            color: themecolor,fontSize: 15,fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Find students and \n their details',style: GoogleFonts.poppins(
                            color: themecolor,fontSize: 15,fontWeight: FontWeight.w500
                        ),),
                        SizedBox(width: 10,),
                        Container(height: height/6,width: width/3.3,color: Colors.transparent,
                          child: Image.asset('assets/images/images (1).jpeg',),),

                      ],
                    ),

                  ],
                ),
              ),
              ),
              SizedBox(height: 30,),
            Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                          onTap: (){
                            value.getclassData();
                            callNext(Classes(), context);

                          },
                          child: Container(height: height/10,width: width/1.1,
                              decoration: BoxDecoration(color: themecolor,borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                CircleAvatar(radius: 25,backgroundColor: clWhite,
                                child: Icon(Icons.groups_outlined,color: themecolor,),
                                ),
                                SizedBox(width: 20,),
                                Text('Stuents List',style: GoogleFonts.poppins(color: clWhite,fontSize: 20,fontWeight: FontWeight.w500),)

                              ],
                            ),
                          ),
                          ),
                        ),
                      ),

              // Container(height: height/1.5,width: width,
              // decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              //   color: clWhite,
              // ),
              //
              // )
            ],),
          );
        }
      ),

    );
  }
}
