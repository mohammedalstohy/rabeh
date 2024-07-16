import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';

class CouponTagsRow extends StatelessWidget {
  final int discountPercentage;

  const CouponTagsRow({super.key, required this.discountPercentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 8.58.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.storeDetailsBorderColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.lastUsed,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 4.83.w,
                ),
                Text(
                  tr('اخر استخدام: من 25 د'),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.storeDescription,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 4.5.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.discountButton),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.biGdiscount,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 4.83.w,
                ),
                Text(
                  tr('$discountPercentage%خصم'),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.discountButtonText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 4.69.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.cashBacktButton),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.bigCashBack,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 4.83.w,
                ),
                Text(
                  tr('كاش باك'),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cashBackButtonText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
