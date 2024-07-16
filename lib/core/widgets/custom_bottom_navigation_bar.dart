import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/values/colors.dart';

// ignore: must_be_immutable
class CustomAppNavigationBar extends StatelessWidget {
  int currentIndex;
  final List<BottomNavigationBarItem> tabs;
  final void Function(int) onTap;

  CustomAppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.defaultSize.height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(
          width: 0,
          color: AppColors.backgroundColor,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: AppColors.white,
          border: Border.all(width: 0,color: AppColors.white),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0,-3),
              color: Color.fromRGBO(0, 0, 0, 0.1)
            )
          ]
        ),
        child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColors.white,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.navigationBarItem,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              color: AppColors.navigationBarItem
            ),
            unselectedItemColor: AppColors.unSelectedNavigationBarItem,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.unSelectedNavigationBarItem
            ),
            onTap: onTap,
            items: tabs,
          ),
        ),
      ),
    );
  }
}
