import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juke/route/routes.dart';
import 'package:juke/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.getnavbar(),
        title: 'Juke',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                fontFamily: 'Inter',
              ),
        ),
        getPages: AppRoutes.routes);
  }
}

// class BottomNavigationController extends GetxController {
//   var currentIndex = 0.obs;

//   void changePage(int index) {
//     currentIndex.value = index;
//     switch (index) {
//       case 0:
//         Get.toNamed('/');
//         break;
//       case 1:
//         Get.toNamed('/library');
//         break;
//       case 2:
//         Get.toNamed('/search');
//         break;
//     }
//   }
// }
