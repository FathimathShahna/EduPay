import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:feesmanagment/SCREENS/add_student.dart';
import 'package:feesmanagment/SCREENS/student_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';
import '../CONSTANTS/myfunctions.dart';

class StudentList extends StatelessWidget {

  String clssId;
  String studentId;
   StudentList({super.key,required this.clssId,required this.studentId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themecolor,
          toolbarHeight: height/12,
          title: Text('Students',style: GoogleFonts.poppins(color: clWhite,fontWeight: FontWeight.w500,fontSize: 18),),
          centerTitle:true,
          iconTheme: IconThemeData(color: clWhite,size: 18,),
          // leading: Icon(Icons.arrow_back_ios,color: clWhite,size: 14,),
        ),
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return
            value.studentlist.isEmpty?
                Center(child: Text("No Students...")):
            SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 30,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.studentlist.length,
                itemBuilder: (context, index) {
                  var item=value.studentlist[index];
                  return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        value.getStudentData(clssId);
                        callNext(StudentDetails(
                          StudentName: item.Name,
                          Division: item.Division, Phone: item.Phone,
                          RollNo: item.RollNo, GuardianName: item.GuadName,
                          GuardianPhone: item.GuadName, clssId: clssId, studentId: item.id,), context);
                      },
                      child:

                      Container(width: width/1.1,
                      decoration: BoxDecoration(
                          color: clD6EAF8,borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(0, 1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),],
                          // border: Border.all(color: themecolor)
                        ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18,top: 10,bottom: 10),
                        child: Column(children: [
                          Row(
                            children: [
                              Text('Name:',style: TextStyle(color: clBlack,fontSize: 15,fontWeight: FontWeight.w500),),
                              SizedBox(width: 10,),
                              Text(value.studentlist[index].Name,style: TextStyle(
                                  color: clBlack,fontSize: 15,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Text('Division:',style: TextStyle(color: clBlack,fontSize: 15,fontWeight: FontWeight.w500),),
                              SizedBox(width: 10,),
                              Text(value.studentlist[index].Division,style: TextStyle(
                                  color: clBlack,fontSize: 15,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Text('Fee Payment Status:',style: TextStyle(color: clBlack,fontSize: 15,fontWeight: FontWeight.w500),),
                              SizedBox(width: 10,),
                              value.studentlist[index].Status=="PENDING"?
                              Text("PENDING",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w400),):
                              Text("PAID",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),

                  ],
                          ),

                        ],),
                      ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                );
              },)
            ],),
          );
        }
      ),
        floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {
          return Container(
            width: width/2,
            height: 50,
            child: FloatingActionButton(
                // elevation: 2,
                backgroundColor: themecolor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: clWhite, size: 30,),
                      SizedBox(width: 8,),
                      Text('Add Student',style: GoogleFonts.poppins(
                          color: clWhite,fontSize: 16,fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
                // shape: CircleBorder(eccentricity: 1.0),
                onPressed: () {
                  value.clearstudentdata();
                  value.clearFeePayment();
                  callNext(AddStudent( clssId: clssId,), context);
                }),
          );
        }
    )
    );
  }
}
