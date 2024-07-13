import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';
import '../CONSTANTS/myfunctions.dart';

class AddStudent extends StatelessWidget {
  String clssId;
  // String from;
  // String studentid;
   AddStudent({super.key,
     // required this.from,
     // required this.studentid,
     required this.clssId});
  final _Fmkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        toolbarHeight: height/12,
        title: Text('Add Students',style: GoogleFonts.poppins(color: clWhite,fontWeight: FontWeight.w500,fontSize: 18),),
        centerTitle:true,
        iconTheme: IconThemeData(color: clWhite,size: 18,),
      ),
      body: Form(
        key: _Fmkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "*required";
                              }
                              },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          controller: value.studentNameController,
                          decoration: InputDecoration(
                            focusColor: themecolor,
                            label: Text('Name',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "*required";
                              }
                             },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          controller: value.studentDivisionController,
                          decoration: InputDecoration(
                            focusColor: themecolor,
                            label: Text('Division',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "*required";
                              }
                              },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          controller: value.studentRollnoController,
                          inputFormatters: [LengthLimitingTextInputFormatter(4)],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusColor: themecolor,
                            label: Text('Roll No',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      SizedBox(height: 10,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "*required";
                              }
                              },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          controller: value.studentPhoneController,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusColor: themecolor,
                            label: Text('Phone',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "*required";
                              }
                              },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          controller: value.guardianNameController,
                          decoration: InputDecoration(
                            focusColor: themecolor,
                            label: Text('Guardian Name',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themecolor,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "*required";
                              }
                              },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          controller: value.guardianPhoneController,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusColor: themecolor,
                            label: Text('Guardian Phone',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
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
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return InkWell(
                            onTap: (){


                             value.addStudent(context, clssId,);
                              // back(context);

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 1),


                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                content: Center(child: Text('Added',style: TextStyle(
                                    color: clWhite,fontSize: 14
                                ),)),
                                backgroundColor: themecolor));
                              finish(context);


                            },
                            child: Container(height: height/13,
                              width: 130,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: themecolor),
                              child: Center(
                                  child: Text('Add',
                                    style: GoogleFonts.poppins(fontSize: 20,fontWeight:FontWeight.w400,color: clWhite),)),),
                          );
                        }
                      ),

                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),

    );
  }
}
