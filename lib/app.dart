import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/general.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      initialBinding: GenralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: BColors.primary,body: Center(child: CircularProgressIndicator(color: Colors.white)))
      );
  }
}