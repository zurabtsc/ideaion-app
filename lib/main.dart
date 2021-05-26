import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fu_ideation/utils/globals.dart';
import 'package:fu_ideation/utils/globalsManager.dart';
import 'package:fu_ideation/utils/localization.dart';
import 'package:fu_ideation/utils/routes.dart';
import 'APIs/firestore.dart';
import 'APIs/localNotifications.dart';
import 'APIs/sharedPreferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  initFirestore();
  await initSharedPreferences();
  await initProjectInfo();
  await initUserInfo();
  await initLocalNotifications();
  initUiLanguage();
  initInitialRoute();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getAppRoutes(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}