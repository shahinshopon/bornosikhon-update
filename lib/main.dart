import 'package:borno_shikhon/const/app_strings.dart';
import 'package:borno_shikhon/languages/app_languages.dart';
import 'package:borno_shikhon/ui/route/route.dart';
import 'package:borno_shikhon/ui/theme/app_theme.dart';
import 'package:borno_shikhon/ui/views/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          translations: AppLanguages(),
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          // theme: AppTheme().lightTheme(context),
          // darkTheme: AppTheme().darkTheme(context),
          // themeMode: ThemeMode.system,
          theme: AppTheme().lightTheme(context),
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}
