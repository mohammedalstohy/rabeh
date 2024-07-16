import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../domain/entities/store.dart';

class CouponListTile extends StatelessWidget {
  final void Function() onTap;
  final StoreCoupon storeCoupon;

  const CouponListTile({
    super.key,
    required this.onTap,
    required this.storeCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              SizedBox(
                height: 100.h,
                width: double.maxFinite,
                child: SvgPicture.asset(
                  AppAssets.storeDetailsListTileBackGroundSvg,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 13.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          storeCoupon.code ?? '',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                          ),
                        ),
                        // SizedBox(
                        //   height: 9.h,
                        // ),
                        Text(
                          storeCoupon.descriptionEn ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.storeDescription,
                          ),
                        ),
                        SizedBox(
                          height: 5.95.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 22.28.h,
                              width: 72.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: AppColors.discountButton,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppAssets.discount,
                                      width: 12.w,
                                      height: 12.h,
                                      fit: BoxFit.scaleDown),
                                  SizedBox(
                                    width: 4.25.w,
                                  ),
                                  Text(
                                    tr('${storeCoupon.discountPercentage}% خصم '),
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.discountButtonText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Container(
                              height: 22.28.h,
                              width: 72.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: AppColors.cashBacktButton,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppAssets.cashBack,
                                      width: 12.w,
                                      height: 12.h,
                                      fit: BoxFit.scaleDown),
                                  SizedBox(
                                    width: 4.25.w,
                                  ),
                                  Text(
                                    tr('كاش باك'),
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.cashBackButtonText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: double.maxFinite,
                      width: 1,
                      child: SvgPicture.asset(
                        AppAssets.verticalDotBorderSvg,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: storeCoupon.code!,),
                        );
                      },
                      child: Container(
                        width: 86.w,
                        height: 29.13,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.copyButtonColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.copy,
                              width: 20.w,
                              height: 20.h,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              tr('نسخ'),
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        )
      ],
    );
  }
}
