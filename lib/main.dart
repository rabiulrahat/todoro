import 'package:flutter/material.dart';
import 'package:todoro/screens/home_screen.dart';
import "package:get/get.dart";
import "package:todoro/controllers/data_controller.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // loadData() async {
  //   await Get.find<DataController>().getData();
  // }

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => DataController());
    // loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
