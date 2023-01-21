import 'package:eqqlsocial/Responsive/mobile_screen_layout.dart';
import 'package:eqqlsocial/Responsive/responsive_layout.dart';
import 'package:eqqlsocial/Responsive/web_screen_layout.dart';
import 'package:eqqlsocial/routing/routeconstants.dart';
import 'package:eqqlsocial/screens/FeedScreen/feedscreen.dart';
import 'package:eqqlsocial/screens/LoginPage/loginpage.dart';
import 'package:eqqlsocial/screens/Notifications/notifications.dart';
import 'package:eqqlsocial/screens/ProfilePage/profilescreen.dart';
import 'package:eqqlsocial/screens/SearchPage/searchscreen.dart';
import 'package:eqqlsocial/screens/SignUpPage/signuppage.dart';
import 'package:eqqlsocial/screens/UploadScreen/uploadscreen.dart';
import 'package:eqqlsocial/subpages/SplashScreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class AppRouter{
  GoRouter router = GoRouter(
      routes: <GoRoute>[
    GoRoute(
        name: RouteConstants.home,
        path: '/',pageBuilder: (context,state){
      return MaterialPage(child: SplashScreen());
        }),
        GoRoute(
            name: RouteConstants.search,
            path: '/goroutesearch',pageBuilder: (context,state){
          return  MaterialPage(child: SearchScreen());
        }),
        GoRoute(
            name: RouteConstants.notification,
            path: '/goroutenotification',pageBuilder: (context,state){
          return  const MaterialPage(child: Notifications());
        }),
        GoRoute(
            name: RouteConstants.profile,
            path: '/gorouteprofile',pageBuilder: (context,state){
          return  MaterialPage(child: ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,));
        }),
        GoRoute(
            name: RouteConstants.feed,
            path: '/goroutfeedscreen',pageBuilder: (context,state){
          return  const MaterialPage(child: FeedScreen());
        }),
        GoRoute(
            name: RouteConstants.upload,
            path: '/gorouteupload',pageBuilder: (context,state){
          return  const MaterialPage(child:  AddPostScreen(),);
        }),
        GoRoute(
            name: RouteConstants.login,
            path: '/goroutesignin',pageBuilder: (context,state){
          return  const MaterialPage(child:  SignupScreen(),);
        }),
        GoRoute(
            name: RouteConstants.login,
            path: '/goroutelogin',pageBuilder: (context,state){
          return  const MaterialPage(child:  LoginScreen(),);
        }),
        GoRoute(
            name: RouteConstants.responsive,
            path: '/gorouteresponsive',pageBuilder: (context,state){
          return  const MaterialPage(child:  ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(), webScreenLayout: WebScreenLayout()),);
        }),


      ],


 redirect:(context, state)async{
   StreamBuilder(
     stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.active) {
         // Checking if the snapshot has any data or not
         if (snapshot.hasData) {
           // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
            context.pushNamed(
             RouteConstants.responsive
           );
         } if (snapshot.hasError) {
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

       return const LoginScreen(); /*context.go(RouteConstants.login);*/
     },
   );
   return  Future (() async{
     await  MaterialPage(child: Lottie.asset('lib/assets/animations/43391-404-error-page-not-found-confused-robot.json'));
   });
},
errorPageBuilder: (context,state){
        return MaterialPage(child: Lottie.asset('lib/assets/animations/43391-404-error-page-not-found-confused-robot.json'));
}
  );

}