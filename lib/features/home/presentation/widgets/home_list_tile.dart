import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../domain/entities/store.dart';
import '../screens/store_details.dart';

class HomeListTile extends StatelessWidget {
  final int index;
  final Store store;

  const HomeListTile({super.key, required this.index, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StoreDetailsScreen(
                store: store,
              ),
            ),
          ),
          child: SizedBox(
            height: 100.h,
            child: Stack(
              children: [
                SizedBox(
                  height: 100.h,
                  width: double.maxFinite,
                  child: SvgPicture.asset(
                    AppAssets.bigListTileBackGroundSvg,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 9.h,
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
                        width: 10.w,
                      ),
                      SizedBox(
                        height: double.maxFinite,
                        width: 1,
                        child: SvgPicture.asset(
                          AppAssets.verticalDotBorderSvg,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        width: 22.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
