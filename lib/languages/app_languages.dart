import 'package:borno_shikhon/languages/ban.dart';
import 'package:borno_shikhon/languages/eng.dart';
import 'package:get/get.dart';


class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}
