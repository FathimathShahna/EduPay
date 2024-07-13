import 'package:feesmanagment/SCREENS/profile.dart';
import 'package:feesmanagment/SCREENS/register.dart';
import 'package:feesmanagment/SCREENS/student_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PROVIDER/login_provider.dart';
import 'PROVIDER/main_provider.dart';
import 'SCREENS/add_class.dart';
import 'SCREENS/class.dart';
import 'SCREENS/home.dart';
import 'SCREENS/login.dart';
import 'SCREENS/otp.dart';
import 'SCREENS/add_student.dart';
import 'SCREENS/splash.dart';
import 'SCREENS/student_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EduPay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

