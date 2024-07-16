import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/constant/values/app_assets.dart';
import '../core/constant/values/colors.dart';
import '../core/widgets/custom_bottom_navigation_bar.dart';
import 'categories/presentation/screens/categories_screen.dart';
import 'favorites/presentation/screens/favorites_screen.dart';
import 'home/presentation/screens/home_screen.dart';
import 'profile/presentation/screens/profile_screen.dart';
import 'stores/presentation/screens/stores_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const StoresScreen(),
    const ProfileScreen(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   context
  //       .read<GetCategoryDetailsCubit>()
  //       .fGetCategoryDetails(params: GetCategoryDetailsParams(categoryID: 1));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: CustomAppNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        tabs: <BottomNavigationBarItem>[
          _customNavigationBarItem(
            labelKey: tr('home'),
            svgPath: AppAssets.homeIconSvg,
            myIndex: 0,
          ),
          _customNavigationBarItem(
            labelKey: tr('categories'),
            svgPath: AppAssets.categoriesIconSvg,
            myIndex: 1,
          ),
          _customNavigationBarItem(
            labelKey: tr('favorites'),
            svgPath: AppAssets.favoritesIconSvg,
            myIndex: 2,
          ),
          _customNavigationBarItem(
            labelKey: tr('stores'),
            svgPath: AppAssets.storesIconSvg,
            myIndex: 3,
          ),
          _customNavigationBarItem(
            labelKey: tr('myProfie'),
            svgPath: AppAssets.profileIconSvg,
            myIndex: 4,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _customNavigationBarItem({
    required String labelKey,
    required String svgPath,
    required int myIndex,
  }) {
    return BottomNavigationBarItem(
      label: labelKey,
      icon: SvgPicture.asset(
        svgPath,
        width: 24.w,
        height: 24.h,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
