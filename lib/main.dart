import 'package:bakwan/common/style/theme.dart';
import 'package:bakwan/database/instance.dart';
import 'package:bakwan/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DBInstance());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: true,
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
        theme: ThemeClass.lightTheme,
      ),
    );
  }
}
