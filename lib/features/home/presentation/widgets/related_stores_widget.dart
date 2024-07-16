import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';

class RelatedStoresWidget extends StatelessWidget {
  const RelatedStoresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              tr('متاجر ذات صله'), //todo
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.text,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        SizedBox(
          height: 145.89,
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: 12,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 145.89.h,
                      width: 125.73.w,
                      child: SvgPicture.asset(
                        AppAssets.smallGridBackGroundSvg,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 145.89.h,
                      width: 125.73.w,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 9.58.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 58.95.w,
                                height: 58.95.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors.imageBorder,
                                    )

                                    // color: Colors.red,
                                    ),
                                child: Image.asset(
                                  (index % 2) != 0
                                      ? AppAssets.store1Size80
                                      : AppAssets.store2Size80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.48.h,
                          ),
                          Text(
                            'نــون', //todo
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.text,
                            ),
                          ),
                          SizedBox(
                            height: 9.73.h,
                          ),
                          SizedBox(
                            height: 1.h,
                            width: double.maxFinite,
                            child: SvgPicture.asset(
                              AppAssets.horizontalDotBorderSvg,
                              fit: BoxFit.fill,
                              width: 114.21.w,
                            ),
                          ),
                          SizedBox(
                            height: 11.5.h,
                          ),
                          Text(
                            'هذا النص يمكنك استبداله باي نص تاني',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
