import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../CONSTANTS/myfunctions.dart';
import '../MODELCLASS/modelclass.dart';

class MainProvider extends ChangeNotifier{
  final FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController classController = TextEditingController();
  Future<void> addClass(BuildContext context,String from, String classid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addclass = HashMap();
    addclass['CLASS_NAME'] = classController.text;
    if(from=="NEW"){
      addclass['CLASS_ID'] = id;
      db.collection("CLASSES").doc(id).set(addclass, SetOptions(merge: true));
    }else{
      db.collection("CLASSES").doc(classid).set(addclass, SetOptions(merge: true));
    }
    notifyListeners();
    getclassData();

  }

  void editclass(String classid){
    db.collection("CLASSES").doc(classid).get().then((value) {
      if(value.exists){
        Map<dynamic, dynamic> map = value.data() as Map;
        classController.text = map["CLASS_NAME"].toString();
        notifyListeners();
      }
    });
  }
  void deleteClass( context,classid){
    db.collection("CLASSES").doc(classid).delete();

    const snackBar = SnackBar(content: Text("Deleted Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    getclassData();
    notifyListeners();


  }

  List<classModel> classlist = [];
  void getclassData() {
    classlist.clear();
    db.collection("CLASSES").get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          classlist.add(classModel(element.id,
            element.get('CLASS_NAME').toString(),
          ));

          print(classlist.length.toString());
        }
      }
      notifyListeners();

    });
  }

  void clearclassdata() {
    classController.clear();
  }


  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentDivisionController = TextEditingController();
  TextEditingController studentRollnoController = TextEditingController();
  TextEditingController studentPhoneController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianPhoneController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  void AddPayment(String StId,String studentName){
    DateTime addDate = DateTime.now();
    String date = DateFormat('dd/MM/yyyy').format(addDate);
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> paymentMap = HashMap();
    paymentMap['TRANSACTION_ID'] = id;
    paymentMap['TRANSACTION_DATE'] = date;
    paymentMap['STUDENT_NAME'] = studentName;
    paymentMap['AMOUNT'] = paymentController.text;
    paymentMap['USER_ID'] = StId;
    db.collection("TRANSACTIONS").doc(id).set(paymentMap, SetOptions(merge: true));
    db.collection("STUDENTS").doc(StId).set({"FEE_PAYMENT":paymentController.text,"PAYMENT_DATE":date,
      "PAYMENT_STATUS":"PAID"
      }, SetOptions(merge: true));

    notifyListeners();
    }
  Future<void> addStudent(BuildContext context,String clssId,) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addstudent = HashMap();
    addstudent['STUDENT_NAME'] = studentNameController.text;
    addstudent['DIVISION'] = studentDivisionController.text;
    addstudent['ROLL_NO'] = studentRollnoController.text;
    addstudent['PHONE'] = studentPhoneController.text;
    addstudent['GUARDIAN_NAME'] = guardianNameController.text;
    addstudent['GUARDIAN_PHONE'] = guardianPhoneController.text;
    addstudent['FEE_PAYMENT'] = paymentController.text;
    addstudent['PAYMENT_STATUS'] = "PENDING";
    addstudent["CLASS_ID"] = clssId;
    addstudent["ADDED_BY"] = "";
    addstudent['STUDENT_ID'] = id;
    // if(from=="NEW"){
    db.collection("STUDENTS").doc(id)..set(addstudent, SetOptions(merge: true));
    // }else{
    //   db.collection("STUDENTS").doc(clssId).update(addstudent);
    // }
    notifyListeners();
    const snackBar = SnackBar(content: Text("Saved Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // getclassData()
    getStudentData(clssId);
    finish(context);
  }
  List<studentModel> studentlist = [];
  void getStudentData(String clssId) {
    studentlist.clear();
    clearFeePayment();
    db.collection("STUDENTS").where("CLASS_ID", isEqualTo: clssId).get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data() as Map;
          studentlist.add(studentModel(
            element.id,
            map['STUDENT_NAME'] ?? "",
            map['DIVISION'] ?? "",
            map['ROLL_NO'] ?? "",
            map['PHONE'] ?? "",
            map['GUARDIAN_NAME'] ?? "",
            map['GUARDIAN_PHONE'] ?? "",
            map['PAYMENT_STATUS'] ?? "",
          ));

          print(studentlist.length.toString());
        }
      }

      notifyListeners();
    });
  }


  void editstudent(String classid){
    db.collection("STUDENTS").doc(classid).get().then((value) {
      if(value.exists){
        Map<dynamic, dynamic> map = value.data() as Map;
        studentNameController.text = map["STUDENT_NAME"].toString();
        studentDivisionController.text = map["DIVISION"].toString();
        studentRollnoController.text = map["ROLL_NO"].toString();
        studentPhoneController.text = map["PHONE"].toString();
        guardianNameController.text = map["GUARDIAN_NAME"].toString();
        guardianPhoneController.text = map["GUARDIAN_PHONE"].toString();

        notifyListeners();
      }
    });
  }
  void deletestudent( context,classid,studentId){
    db.collection("STUDENTS").doc(studentId).delete();

    const snackBar = SnackBar(content: Text("Deleted Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // getStudentData(clssId);
    notifyListeners();


  }


  void clearstudentdata() {
    studentNameController.clear();
    studentDivisionController.clear();
    studentRollnoController.clear();
    studentPhoneController.clear();
    guardianNameController.clear();
    guardianPhoneController.clear();
  }
  TextEditingController FeeController = TextEditingController();



  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();

  File? userFileImage;
  String userImage = '';
  File? shoollogoimage=null;
  String schoollogourl="";
  // firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");
  Reference imgstr=FirebaseStorage.instance.ref("Images");



  Future<void> registration(BuildContext context) async {
    bool isChecked= await numberChcek(phoneController.text);
    if (!isChecked) {
      String id = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      HashMap<String, Object> addSchool = HashMap();
      HashMap<String, Object> addUser = HashMap();
      addSchool['USER_NAME'] = nameController.text;
      addSchool['USER_PHONE'] = "+91${phoneController.text}";
      addSchool['SCHOOL_NAME'] = schoolNameController.text;
      addSchool['TYPE'] = "ADMIN";
      addSchool['USER_ID'] = id;
      if (userFileImage != null) {
        String photoId = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        imgstr = FirebaseStorage.instance.ref().child(photoId);
        await imgstr.putFile(userFileImage!).whenComplete(() async {
          await imgstr.getDownloadURL().then((value) {
            addSchool["PHOTO"] = value;

            notifyListeners();
          });
          notifyListeners();
        });
        notifyListeners();
      } else {
        addSchool['PHOTO'] = userImage;
      }
      if (shoollogoimage != null) {
        print("jjjjjjjjjjjjjjjjjjjjjjjj");
        String logoimgid = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        imgstr = FirebaseStorage.instance.ref().child(logoimgid);
        await imgstr.putFile(shoollogoimage!).whenComplete(() async {
          await imgstr.getDownloadURL().then((value) {
            addSchool["LOGO"] = value;
            notifyListeners();
          });
          notifyListeners();
        });
      } else {
        addSchool["LOGO"] = schoollogourl;
      }



      db.collection("MANAGER").doc(id)
        ..set(addSchool, SetOptions(merge: true));
      notifyListeners();

      addUser['NAME'] = nameController.text;
      addUser['MOBILE_NUMBER'] = "+91${phoneController.text}";
      addUser['SCHOOL_NAME'] = schoolNameController.text;
      addUser['TYPE'] = "ADMIN";
      addUser['USER_ID'] = id;
      db.collection("USER").doc(id).set(addUser, SetOptions(merge: true));
      notifyListeners();
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Number already exist!')));
    }
  }
  Future getlogogallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      croplogo(pickedImage.path,);
    } else {
      print('No image selected.');
    }
  }

  Future getlogocamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      croplogo(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }


  Future<void> croplogo(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      shoollogoimage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
    }
  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path,);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }


  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      userFileImage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  List<managerModel> managerlist = [];
  void getRegisterData() {
    db.collection("MANAGER").get().then((value) {
      if (value.docs.isNotEmpty) {
        managerlist.clear();
        for (var element in value.docs) {
          // Map<dynamic, dynamic> map = element.data() as Map;
          managerlist.add(managerModel(
            element.id,
            element.get('USER_NAME').toString(),
            element.get('USER_PHONE').toString(),
            element.get('SCHOOL_NAME').toString(),
            element.get('PHOTO').toString(),
            element.get('LOGO').toString(),
          ));
          print(managerlist.length.toString());
        }
      }

      notifyListeners();
    });
  }

  List<HistoryModel> transactionHistoryList=[];

  void fetchHistory(String stdid) {
    print('called');
    transactionHistoryList.clear();
    db.collection("TRANSACTIONS").where("USER_ID",isEqualTo: stdid).get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data() as Map;
          transactionHistoryList.add(HistoryModel(
            element.id,
            map["STUDENT_NAME"] ?? "",
            map["TRANSACTION_DATE"] ?? "",
            map["AMOUNT"] ?? "",
          ));

          notifyListeners();
        }
      }
      });
 }

  void clearFeePayment() {
    FeeController.clear();

  }

  String loginphoto="";
  String schoollogo="";

  void getUserPhoto(String userId,String userName) {
    print("dbd");
    db.collection("MANAGER").where("USER_ID",isEqualTo: userId).get().then((value) {
      if(value.docs.isNotEmpty){
        loginphoto=value.docs.last.get("PHOTO").toString();
        schoollogo=value.docs.last.get("LOGO").toString();
        notifyListeners();
        print("dwg"+loginphoto);
      }


      });
    }
  Future<bool> numberChcek(String number) async {
    var val=await db
        .collection("MANAGER")
        .where("USER_PHONE", isEqualTo: "+91" + number)
        .get();
    if(val.docs.isNotEmpty){
      return true;
    }else{
      return false;
}

 }
}


