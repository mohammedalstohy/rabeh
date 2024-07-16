import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';

class BottomSheetCouponDetails extends StatelessWidget {
  final String? couponStoreImagePath;
  final String couponStoreName;
  final String? couponStoreImageDescription;

  const BottomSheetCouponDetails(
      {super.key,
      this.couponStoreImagePath,
      required this.couponStoreName,
      this.couponStoreImageDescription});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 16.w,
          ),
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: 1,
                color: AppColors.imageBorder,
              ),
            ),
            child: Image.network(
              'https://rabe7.x-freee.com/$couponStoreImagePath',
              errorBuilder: (context, object, stackTrace) {
                return Center(
                  child: Text(
                    'Error To Load Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                );
              },
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: SizedBox(
              height: 80.h,
              // width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    couponStoreName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    couponStoreImageDescription ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.storeDescription,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          Container(
            height: 30.h,
            width: 80.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 7.98.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: AppColors.followRedColor,
            ),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.heartTick,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  tr('اتابعه'), //todo
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 19.w,
          ),
        ],
      ),
    );
  }
}
