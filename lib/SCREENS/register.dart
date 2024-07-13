import 'package:feesmanagment/PROVIDER/main_provider.dart';
import 'package:feesmanagment/SCREENS/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/mycolors.dart';
import '../CONSTANTS/myfunctions.dart';

class Register extends StatelessWidget {
   Register({super.key});
  final _Fmkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _Fmkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Create Account',style:
                          GoogleFonts.roboto(color: themecolor,fontWeight: FontWeight.bold,fontSize: 25),),
                          Text('Create a new account',
                            style: GoogleFonts.poppins(
                                color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 14),),
                        ],
                      ),
          
                      SizedBox(height: 30,),
                      Center(
                        child:val.userFileImage!=null?
                        Container(
                          width: width / 4.5,
                          height: width / 4.5,
                          decoration: BoxDecoration(
                            color: clWhite,
                            shape: BoxShape.circle,
                            border: Border.all(color: clE5E8E8),
                            // image: DecorationImage(image: AssetImage('assets/images/profile.png',),scale: 9, )
                          ),
                          child: Image.file(val.userFileImage!,fit: BoxFit.fill,),
                        ):
                        Stack(
                            children: [
                              InkWell(
                                onTap:(){
                                  showBottomSheet(context);
                                },
          
                                child: Container(
                                  width: width / 4.5,
                                  height: width / 4.5,
                                  decoration: BoxDecoration(
                                    color: clWhite,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey),
                                    // image: DecorationImage(image: AssetImage('assets/images/profile.png',),scale: 9, )
                                  ),
                                  child: Icon(Icons.person,color: Colors.grey,size: 60,),
                                ),
                              ),
                              Positioned(
                                right: 1,
                                bottom: 5,
                                child: Container(
                                  width: width/15,
                                  height: width/15,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ]
                        ),
                      ),
          
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
                          controller: val.nameController,
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
                      SizedBox(height: 15,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                          validator: (value) {
                                if(value==null||value.isEmpty){
                                  return "*required";
                                }
                                },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          keyboardType: TextInputType.number,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          controller: val.phoneController,
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
          
                      SizedBox(height: 15,),
                      SizedBox(
                        width: width/1.2,
                        child: TextFormField(
                           validator: (value) {
                                if(value==null||value.isEmpty){
                                  return "*required";
                                }
                                },
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.normal,color: themecolor),
                          controller: val.schoolNameController,
                          decoration: InputDecoration(
                            focusColor: themecolor,
                            label: Text('Shool Name',
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
                      SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('School Logo :',style: GoogleFonts.poppins(
                              color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),),
                          SizedBox(width: 10,),
                          Consumer<MainProvider>(
                              builder: (context, value, child) {
                                return GestureDetector(
          
                                  onTap: (){
                                  showlogoBottomSheet(context);
                                },
                                  child: value.shoollogoimage != null
                                      ?Container(
          
                                      width: width/2,
                                      height: height/8,
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.circular(8),
                                        color: clWhite,
                                        border: Border.all(color: themecolor),
                                      ),
                                      child: Image.file(
                                        value.shoollogoimage!,
                                        fit: BoxFit.fill,
                                      )):Container(
                                    width: width/2,
                                    height: height/8,
                                    decoration: BoxDecoration(
                                      color: clWhite,
                                      borderRadius:BorderRadius.circular(8),
                                      border: Border.all(color: themecolor),
                                    ),
                                    child: Icon(Icons.add_photo_alternate_outlined,
                                      color: clBlack.withOpacity(0.6),size: 40,),
                                  ),
          
                                );
          
          
                              }
                          ),
                        ],
                      ),
          
          
                      SizedBox(height: 30,),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return InkWell(
                            onTap: () async {
                              final FormState? form = _Fmkey.currentState;
                              if (form!.validate()) {
                                bool isChecked = await value.numberChcek(value.phoneController.text);
                                if (!isChecked) {
                                  val.registration(context);
                                  callNext(Login(), context);
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Number already exists!')));
                                }
          
                              }
          
                            },
                            child: Center(
                              child: Container(height: height/17,width: width,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: themecolor),
                                child: Center(child: Text('Register',style: GoogleFonts.poppins(
                                    color: clWhite,fontSize: 20,fontWeight: FontWeight.w500),)),),
                            ),
                          );
                        }
                      ),
                      SizedBox(height:30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already Registered?',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                          InkWell(
                              onTap: () {
                                callNext(Login(), context);
          
                              },
                              child: Text('LOGIN HERE',style: GoogleFonts.poppins(color: Colors.red,fontSize: 14),)),
                        ],
                      )
          
                    ],);
                }
            ),
          ),
        ),
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
  MainProvider provider=Provider.of<MainProvider>(context,listen: false);
  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(
                      Icons.camera_enhance_sharp,
                    ),
                    title: const Text('Camera'),
                    onTap: () {
                      provider.getImagecamera();
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: const Icon(
                      Icons.photo,
                    ),
                    title: const Text('Gallery'),
                    onTap: () {
                      provider.getImagegallery();
                      Navigator.pop(context);
                    }),
              ],
            ),
           );
       });
}

void showlogoBottomSheet(BuildContext context) {
  MainProvider provider = Provider.of<MainProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
            children: <Widget>[

              ListTile(
                  leading: Icon(Icons.photo, color: Colors.deepPurple),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () => {
                    provider.getlogogallery(), Navigator.pop(context)
                  }
              ),
            ],
            );
        });
}