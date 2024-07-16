
import 'package:get_it/get_it.dart';

import '../core/util/api_basehelper.dart';
import '../core/util/navigator.dart';
import 'home/home_injection.dart';

final GetIt sl = GetIt.instance;

abstract class ServiceLocator {
  static Future<void> init() async {
    sl.allowReassignment = true;

    // features
    initHomeInjection(sl);


    // core
    _injectDioHelper();
    sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
  }
}

void _injectDioHelper() {
  final ApiBaseHelper helper = ApiBaseHelper();
  helper.dioInit();
  sl.registerLazySingleton<ApiBaseHelper>(() => helper);
}

ApiBaseHelper get dioHelper => sl<ApiBaseHelper>();