import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';

class CouponActionsRow extends StatelessWidget {
  const CouponActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.w, right: 27.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.storeDetailsButton),
                child: SvgPicture.asset(
                  AppAssets.likeSvg,
                  fit: BoxFit.fill,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                tr('فعال'), //todo
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.storeDetailsButton),
                child: SvgPicture.asset(
                  AppAssets.disLikeSvg,
                  fit: BoxFit.fill,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                tr('غير فعال'), //todo
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.storeDetailsButton,
                ),
                child: SvgPicture.asset(
                  AppAssets.lovelySvg,
                  fit: BoxFit.fill,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                tr('مفضله'), //todo
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.storeDetailsButton,
                ),
                child: SvgPicture.asset(
                  AppAssets.bagSvg,
                  fit: BoxFit.fill,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                tr('تسوق'), //todo
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.storeDetailsButton,
                ),
                child: SvgPicture.asset(
                  AppAssets.exportSvg,
                  fit: BoxFit.fill,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                tr('مشاركه'), //todo
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
