import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';
import '../PROVIDER/main_provider.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        toolbarHeight: height / 12,
        title: Text(
          'Payment History',
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
          child:
          Column(
            children: [
              SizedBox(height: 40,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return
                    value.transactionHistoryList.isEmpty?
                    Center(child: Text("No Transactions...")):
                    ListView.builder(
                    shrinkWrap: true,
                      itemCount: value.transactionHistoryList.length,
                      itemBuilder: (context, index) {
                  var item=value.transactionHistoryList[index];
        
        
                  return Column(
                      children: [
                        Container(width: width,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),color: clWhite,
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(0, 1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                      'Student Name :',
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
                                    child: Text(value.transactionHistoryList[index].studentName,
                                      style: GoogleFonts.poppins(
                                        color: clBlack,
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
                                      'Amound: ',
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
                                         value.transactionHistoryList[index].amount,
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
                                      'Transaction Date :',
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
                                    value.transactionHistoryList[index].date,
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
                                      ],
                                    ),
                        ),
        
                          ),
                        SizedBox(height: 15,)
        
                      ],
                    );
                     }
        
                  );}
              )]
                    ),
        ),
      ),


            );

  }
}
