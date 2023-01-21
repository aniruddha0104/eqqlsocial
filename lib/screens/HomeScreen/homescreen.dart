
import 'package:eqqlsocial/screens/Notifications/notifications.dart';
import 'package:eqqlsocial/screens/ProfilePage/profilescreen.dart';
import 'package:eqqlsocial/screens/SearchPage/searchscreen.dart';
import 'package:eqqlsocial/screens/UploadScreen/uploadscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../FeedScreen/feedscreen.dart';


const webScreenSize = 600;

List<Widget> homeScreenItems() {

  return [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Notifications(),
  ProfileScreen(
  uid: FirebaseAuth.instance.currentUser!.uid,
  ),
  ];
}
