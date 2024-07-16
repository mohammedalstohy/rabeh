import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../domain/entities/store.dart';
import '../screens/store_details.dart';

class HomeGridCard extends StatelessWidget {
  final int index;
  final Store store;

  const HomeGridCard({
    super.key,
    required this.index,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StoreDetailsScreen(
            store: store,
          ),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 198.h,
            width: double.maxFinite,
            child: SvgPicture.asset(
              AppAssets.bigGridBackGroundSvg,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 13.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      // (index % 2) != 0
                      //     ? AppAssets.store1Size80
                      //     : AppAssets.store2Size80,
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
                ],
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                store.name ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              SizedBox(
                height: 1.h,
                width: double.maxFinite,
                child: SvgPicture.asset(
                  AppAssets.horizontalDotBorderSvg,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                store.description ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.text,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
