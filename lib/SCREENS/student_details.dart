import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:feesmanagment/SCREENS/add_student.dart';
import 'package:feesmanagment/SCREENS/payment_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';
import '../CONSTANTS/myfunctions.dart';

class StudentDetails extends StatelessWidget {
  String StudentName;
  String Division;
  String Phone;
  String RollNo;
  String GuardianName;
  String GuardianPhone;
  String clssId;
  String studentId;

  StudentDetails(
      {super.key, required this.StudentName, required this.Division, required this.Phone,
        required this.RollNo, required this.GuardianName, required this.GuardianPhone,required this.clssId,
        required this.studentId
      });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themecolor,
          toolbarHeight: height / 12,
          title: Text(
            'Student Details',
            style: GoogleFonts.poppins(
                color: clWhite, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: clWhite,
            size: 18,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    InkWell(onTap: (){
                      value.fetchHistory(studentId);
                      callNext(PaymentHistory(), context);

                    },
                      child: Container(width: width/2.5,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: themecolor,boxShadow: [BoxShadow(
                            color: clE5E8E8,
                            blurRadius: 2)]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('View Transaction History',style: TextStyle(
                              color: clWhite,fontSize: 14,fontWeight: FontWeight.w500),),
                        ),
                      ),
                      ),
                    )
                  ],),
                  SizedBox(height: 15,),
                  Center(
                    child: Consumer<MainProvider>(
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              Container(
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: clWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12),
                                        child: Text(StudentName,
                                          style: GoogleFonts.poppins(
                                              color: clBlack,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Divider(color: Colors.grey),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 14,
                                          right: 14,
                                          bottom: 10,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // Add this line
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    'Division :',
                                                    style: GoogleFonts.poppins(
                                                      color: clBlack,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(Division,
                                                    style: GoogleFonts.poppins(
                                                      color: themecolor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    'Roll No :',
                                                    style: GoogleFonts
                                                    .poppins(
                                                    color: clBlack,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(RollNo,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: themecolor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    'Phone :',
                                                    style: GoogleFonts
                                                        .poppins(
                                                      color: clBlack,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    Phone,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: themecolor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    'Guardian Name :',
                                                    style: GoogleFonts
                                                        .poppins(
                                                      color: clBlack,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    GuardianName,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: themecolor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    'Guardian Number :',
                                                    style: GoogleFonts.
                                                    poppins(
                                                    color: clBlack,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    GuardianPhone,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color: themecolor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Text(
                                                    'Fee Payment :',
                                                    style: GoogleFonts
                                                        .poppins(
                                                      color: clBlack,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        child: TextFormField(
                                                          controller: value.paymentController,

                                                          keyboardType: TextInputType.number,
                                                          inputFormatters: [LengthLimitingTextInputFormatter(5)],
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                                                          ),

                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),
                                                      InkWell(
                                                        onTap: (){
                                                          value.clearFeePayment();
                                                          value.AddPayment(studentId,StudentName);
                                                          value.getStudentData(clssId);
                                                          // value.addStudent(context, clssId,studentId);
                                                          // value.updateStudent(context, clssId, studentId);
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                                            content: Center(child: Text('Added',style: TextStyle(color: clWhite,fontFamily: 'jml',fontSize: 20
                                                            ),)),
                                                            backgroundColor: themecolor,));

                                                          finish(context);
                                                        },
                                                        child: Container(height: 30,width: 100,
                                                          decoration: BoxDecoration(
                                                              color: themecolor,borderRadius: BorderRadius.circular(8)),
                                                          child: Center(
                                                            child: Text('Pay',style: TextStyle(
                                                                color: clWhite,fontSize: 20,fontWeight: FontWeight.w400),),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [

                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Consumer<MainProvider>(
                                              builder: (context, value , child) {
                                                return Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .end,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {

                                                        _showDeleteAlert(context);
                                                      },
                                                      child: Text('Delete'),
                                                    ),
                                                  ],
                                                );
                                              }
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          );
                        }
                    ),
                  ),
                ]);
              }
            ),
          ),
        ));
  }

  void _showDeleteAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<MainProvider>(
          builder: (context,value,child) {
            return AlertDialog(
              title: Text('Delete'),
              content: Text('Do you want to delete this item?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    value.deletestudent(context, clssId, studentId);
                    back(context);


                  },
                  child: Text('OK'),
                ),
              ],
            );
          }
        );
      },
    );
  }
}
