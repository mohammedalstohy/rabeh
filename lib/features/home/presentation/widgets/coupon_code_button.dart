import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';

class CouponCodeButton extends StatelessWidget {
  final String code;

  const CouponCodeButton({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      margin: EdgeInsets.only(
        left: 29.w,
        right: 28.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 56.h,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
                border: Border(
                  top: BorderSide(
                      width: 1.sp, color: AppColors.storeDetailsBorderColor),
                  right: BorderSide(
                      width: 1.sp, color: AppColors.storeDetailsBorderColor),
                  bottom: BorderSide(
                      width: 1.sp, color: AppColors.storeDetailsBorderColor),
                ),
              ),
              child: Text(
                code,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Clipboard.setData(
               ClipboardData(text:code), 
            ),
            child: Container(
              height: 56.h,
              width: 100.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.navigationBarItem,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.bigCopy,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    tr('نسخ'), //todo
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
