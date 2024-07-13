import 'package:feesmanagment/CONSTANTS/myfunctions.dart';
import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:feesmanagment/SCREENS/add_class.dart';
import 'package:feesmanagment/SCREENS/student_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';

class Classes extends StatelessWidget {
  // String classId;
  // String className;
   Classes({super.key,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        toolbarHeight: height/12,
        title: Text('CLASSES',style: GoogleFonts.poppins(color: clWhite,fontWeight: FontWeight.w500,fontSize: 18),),
        centerTitle:true,
        iconTheme: IconThemeData(color: clWhite,size: 18,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return
                value.classlist.isEmpty?
                Center(child: Text("No Classes...")):
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 20,),
                Text('Find Students from :',style:
                GoogleFonts.poppins(color: clBlack,fontWeight: FontWeight.w400,fontSize: 14),),
                SizedBox(height: 20,),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                        crossAxisCount: 2,
                    mainAxisSpacing: 10,
                      childAspectRatio: 3
                    ),
                    itemCount:value.classlist.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item=value.classlist[index];

                      return InkWell(
                        onTap: (){
                          value.getStudentData(value.classlist[index].id);
                          print(value.classlist[index].id+"sssssssssssssssssssss");
                          callNext(StudentList(clssId:value.classlist[index].id, studentId: '',), context);
                        },
                        onLongPress: (){
                          deleteditAlert(context, value.classlist[index].id,"EDIT",index);
                        },
                        child: Container(height: 100,width: width/3,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: clD6EAF8,
                            boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: Offset(0, 2),
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),], ),
                          child: Center(child: Text(value.classlist[index].ClassName,style: GoogleFonts.poppins(
                            color: themecolor,fontSize: 14
                          ),)),
                        ),
                      );
                    },)
              ],);
            }
          ),
        ),
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
                          Text('Add Class',style: GoogleFonts.poppins(
                              color: clWhite,fontSize: 16,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                    // shape: CircleBorder(eccentricity: 1.0),
                  onPressed: () {
                    value.clearclassdata();
                    callNext(AddClass( frmId: 'NEW', toId: '',),context);
                  },),
              );
            }
        )
    );
  }
   void deleteditAlert(context, String id, String from ,index) {
     showDialog(
       context: context,
       builder: (context) {
         return AlertDialog(
           content: Text('Are you sure want to edit or delete?'),
           actions: <Widget>[
             Consumer<MainProvider>(
               builder: (context, value, child) {
                 return TextButton(
                   onPressed: () {
                     value.clearclassdata();
                     value.editclass(value.classlist[index].id);
                     callNext(AddClass(frmId: "Edit", toId: value.classlist[index].id), context);
                   },
                   child: Text('Edit'),
                 );
               },
             ),
             Consumer<MainProvider>(
               builder: (context, value, child) {
                 return TextButton(
                   onPressed: () {
                     Navigator.pop(context);
                     value.deleteClass(context, id);
                   },
                   child: Text('Delete'),
                 );
               },
             ),
           ],
         );
       },
     );
   }

}
