import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constant/values/fonts.dart';
import 'core/constant/values/size_config.dart';
import 'features/home/presentation/cubit/category_details/get_category_details_cubit.dart';
import 'features/home/presentation/cubit/store_details/get_store_details_cubit.dart';
import 'features/injection_container.dart';
import 'features/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServiceLocator.init();

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/lang',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      assetLoader: const RootBundleAssetLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 849),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        SizeConfig().init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider<GetCategoryDetailsCubit>(
              create: (BuildContext context) => GetCategoryDetailsCubit(sl()),
            ),
            BlocProvider<GetStoresOrStoreDetailsCubit>(
              create: (BuildContext context) => GetStoresOrStoreDetailsCubit(sl()),
            ),
          ],
          child: MaterialApp(
            title: 'Rabeh',
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: ThemeData(
              fontFamily: AppFonts.somarRounded,
            ),
            home: const MainScreen(),
          ),
        );
      },
    );
  }
}
