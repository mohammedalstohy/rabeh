import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../domain/entities/store.dart';

class StoreDetailsSection extends StatelessWidget {
  final Store store;

  const StoreDetailsSection({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      // width: double.maxFinite,
      padding: EdgeInsets.only(
        left: 11.w,
        right: 10.w,
        bottom: 10.h,
        top: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
        border: Border.all(
          width: 1.sp,
          color: AppColors.storeDetailsBorderColor,
        ),
      ),
      child: Row(
        children: [
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
                      'https://rabe7.x-freee.com/${store.images}',
                      errorBuilder: (context, object, stackTrace) {
                        return Center(
                          child: Text(
                            'Error To Load Image',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp),
                          ),
                        );
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
          SizedBox(
            width: 11.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name!,
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
                  store.description ?? '',
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
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 30.h,
            // width: 80.w,
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
                  AppAssets.heartCircle,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  tr('متابعه'), //todo
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
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
