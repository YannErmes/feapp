import 'package:fesneakers/pages/home.dart';
import 'package:fesneakers/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{

  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  var box2 = await Hive.openBox('mybox2');
  var box3 = await Hive.openBox('mybox3');
  var box4 = await Hive.openBox('like');
  var box5 = await Hive.openBox('userauth');
  var box6 = await Hive.openBox('repply');


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,
      home:  Scaffold(
    backgroundColor: Colors.black38,
    body: starter()
    ),
    );
  }
}
// chargement https://lottie.host/e8390845-9909-4a2c-90d2-76e9541ab615/h1a9ulnHzR.json

class starter extends StatelessWidget {
  const starter({super.key});


  @override

  Widget build(BuildContext context) {
    final first = Hive.box('mybox');
    if(first.get(1)== null){
      first.put(1, 'ok');
      return   MyCustomWidget();
    }else {
      return   MyCustomWidget();




    }
  }
}
