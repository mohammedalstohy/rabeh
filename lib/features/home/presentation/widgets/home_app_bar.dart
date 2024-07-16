import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../../../core/widgets/app_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Row(
            children: [
              Image.asset(
                AppAssets.rabehLogo,
                width: 62.w,
                height: 30.h,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: tr('search'),
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.searchHintColor),
                      prefixIcon: SizedBox(
                        width: 16.w,
                        height: 16.h,
                        child: Image.asset(
                          AppAssets.searchNormal,
                          width: 16.w,
                          height: 16.h,
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              AppIconButton(
                onTap: () {},
                iconPath: AppAssets.notifications,
              ),
            ],
          ),
        );
      },
    );
  }
}
