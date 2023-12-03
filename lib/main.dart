import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_signin/src/view/bottambar/bottamnavigation.dart';
import 'package:user_signin/src/view/dashboard/home_screen.dart';
import 'package:user_signin/src/view/signin/signin_screen.dart';
import 'firebase_options.dart';
import 'src/controller/session_managaemnt.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp()); 
}


class MyApp extends StatelessWidget {
  const MyApp({super.key,}); 

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.expletusSansTextTheme(Theme.of(context).textTheme),
      ),
      home: StreamBuilder<bool>(
  stream: SessionManager.isLoggedInStream(),  
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.active) {
      final bool loggedIn = snapshot.data ?? false;
      return loggedIn ? const DashboardScreen() : LoginPage();
    } else {
      return const MainScreen();
    }
  },
),    
    );
  }
}