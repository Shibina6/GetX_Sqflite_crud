import 'package:flutter/material.dart';

import 'Database/Database_connector.dart';
import 'View/Home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await GetStorage.init();
  var db = await DB_helper().database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GetX CRUD using SQLite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

