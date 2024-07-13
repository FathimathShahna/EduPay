import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';
import '../CONSTANTS/myfunctions.dart';
import '../PROVIDER/main_provider.dart';

class AddClass extends StatelessWidget {
  String frmId;
  String toId;
   AddClass({super.key, required this.frmId, required this.toId});

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider=Provider.of<MainProvider>(context,listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        toolbarHeight: height/12,
        title: Text('EDUPAY',style: GoogleFonts.poppins(color: clWhite,fontWeight: FontWeight.w500,fontSize: 18),),
        centerTitle:true,
        iconTheme: IconThemeData(color: clWhite,size: 18,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: height/4,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return    SizedBox(
                          width: width/2,
                          child: TextFormField(
                            controller: value.classController,
                            decoration: InputDecoration(
                              focusColor: Colors.black38,
                              label: Text('Add Class',style:
                              TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey,),),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: themecolor,),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: themecolor,),
                              ),
                            ),
                          ),
                        );

                        // );
                      }
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: (){
                        if(frmId=="NEW"){
                          value.addClass(context,"NEW","");
                        }else{
                          value.addClass(context,"EDIT", toId);
                        }


                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          content: Center(child: Text('Added',style: TextStyle(color: clWhite,fontFamily: 'jml',fontSize: 16
                          ),)),
                          backgroundColor: themecolor,));
                        back(context);
                      },
                      child: Container(height: 60,
                        width: 130,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: themecolor),
                        child: Center(child: Text('Add',style: TextStyle(fontSize: 28,fontFamily: 'jml',color: clWhite),)),),
                    );
                  }
              ),


        
            ],
          ),
        ),
      ),
    );
  }
}
