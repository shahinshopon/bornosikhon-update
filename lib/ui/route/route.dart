import 'package:borno_shikhon/ui/views/home/categorypage.dart';
import 'package:borno_shikhon/ui/views/home/detailspage.dart';
import 'package:borno_shikhon/ui/views/home/drawing_board.dart';
import 'package:borno_shikhon/ui/views/home/homepage.dart';
import 'package:borno_shikhon/ui/views/intro/onboarding.dart';
import 'package:borno_shikhon/ui/views/splash/splash.dart';
import 'package:get/get.dart';

const String splash = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String category = '/category-screen';
const String home = '/home-screen';
const String details = '/details-screen';
const String drawingboard = '/drawingboard-screen';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnboardingScreen(),
  ),
  GetPage(
    name: category,
    page: () => CategoryPage(),
  ),
  GetPage(
    name: home,
    page: () {
      HomeScreen _homeScreen = Get.arguments;
      return _homeScreen;
    },
  ),
  GetPage(
    name: details,
    page: () {
      DetailsScreen _detailsScreen = Get.arguments;
      return _detailsScreen;
    },
  ),
  GetPage(
    name: drawingboard,
    page: () => DrawingBoard(),
  ),
];
