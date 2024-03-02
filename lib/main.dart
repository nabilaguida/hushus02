import 'package:flutter/material.dart';
import 'package:hushus/Auth/UI/Login.dart';
import 'package:provider/provider.dart';

import 'Providers/HomeProvider.dart';
import 'UI/Home.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      // ChangeNotifierProvider<Auth_Provider>(create: (_) => Auth_Provider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "hushus",
      home: Home(),
    ),
  ));
}