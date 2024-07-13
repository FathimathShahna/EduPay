import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANTS/myfunctions.dart';
import '../SCREENS/home.dart';
import '../SCREENS/otp.dart';
import 'main_provider.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController loginPhnNumber = TextEditingController();
  TextEditingController otpVerifyController = TextEditingController();
  String verificationId = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool loader = false;

  void sendOtp(BuildContext context) async {
    loader = true;
    notifyListeners();

    await auth.verifyPhoneNumber(
      phoneNumber: "+91${loginPhnNumber.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.transparent,
          content: Text(
            "Verification Completed",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          duration: Duration(milliseconds: 3000),
        ));
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.transparent,
            content: Text(
              "Sorry, Verification Failed",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            duration: Duration(milliseconds: 3000),
          ));
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        loader = false;
        clear();
        notifyListeners();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Otp()),
        );
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.transparent,
          content: Text(
            "OTP sent to phone successfully",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          duration: Duration(milliseconds: 3000),
        ));
        loginPhnNumber.clear();
        log("Verification Id: $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpVerifyController.text,
    );

    try {
      UserCredential value = await auth.signInWithCredential(credential);
      final User? user = value.user;

      if (user != null) {
        String phone = user.phoneNumber ?? '';
        print("${user.phoneNumber} sssssssssssssddddddddddddd");
        userAuthorized(phone, context);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in with credential: $e");
      }
    }
  }

  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {
    String loginUsername = '';
    String loginPhone = '';
    String schoolName = '';
    String schoolLogo = '';
    String photo = '';
    String loginUserType = '';
    String userId = '';

    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

    if (phoneNumber == null) {
      if (kDebugMode) {
        print("User is null.");
      }
      return;
    }

    try {
      var phone = phoneNumber;
      print("$phoneNumber duudud");

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("USER")
          .where("MOBILE_NUMBER", isEqualTo: phone)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var element in querySnapshot.docs) {
          Map<String, dynamic> map = element.data() as Map<String, dynamic>;
          loginUsername = map['NAME'].toString();
          loginPhone = map['MOBILE_NUMBER'].toString();
          schoolName = map['SCHOOL_NAME'].toString();
          schoolLogo = map['LOGO'].toString();
          photo = map['PHOTO'].toString();
          loginUserType = map['TYPE'].toString();
          userId = map["USER_ID"].toString();

          callNextReplacement(
            Home(
              name: loginUsername,
              number: loginPhone,
              logo: schoolLogo,
              schoolname: schoolName,
              photo: photo, userId: userId,
            ),
            context
          );
        }
      } else {
        // Phone number does not exist, show a SnackBar
        const snackBar = SnackBar(
          backgroundColor: Colors.white,
          duration: Duration(milliseconds: 3000),
          content: Text(
            "Sorry, you don't have any access",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching user data: $e");
      }
    }
  }

  void clear() {
    loginPhnNumber.clear();
    otpVerifyController.clear();
    notifyListeners();
  }
}
