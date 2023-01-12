import 'package:eqqlsocial/Responsive/mobile_screen_layout.dart';
import 'package:eqqlsocial/Responsive/responsive_layout.dart';
import 'package:eqqlsocial/Responsive/web_screen_layout.dart';
import 'package:eqqlsocial/providers/user_provider.dart';
import 'package:eqqlsocial/screens/LoginPage/loginpage.dart';
import 'package:eqqlsocial/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'subpages/SplashScreen/splashscreen.dart';
import 'subpages/phone_authentication/phone authentication widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAt-2gUTtTvFL9119UDFn3XrA6i1kQGeNY",
          authDomain: "eqlsocial-a647a.firebaseapp.com",
          projectId: "eqlsocial-a647a",
          storageBucket: "eqlsocial-a647a.appspot.com",
          messagingSenderId: "147359849589",
          appId: "1:147359849589:web:fbbca67256e2438872ec3c",
          measurementId: "G-YMVHWG4JTF"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
        ChangeNotifierProvider(create: (_) => phoneauthenticationwidget(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eql.social',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: SplashScreen() /*StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginScreen();
          },
        ),*/
      ),
    );
  }
}
