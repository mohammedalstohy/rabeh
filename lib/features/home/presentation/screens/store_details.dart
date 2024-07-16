import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../injection_container.dart';
import '../../domain/entities/store.dart';
import '../cubit/coupon_details/get_coupon_details_cubit.dart';
import '../widgets/bottom_sheets/coupon_bottom_sheet.dart';
import '../widgets/coupon_list_tile.dart';
import '../widgets/related_stores_widget.dart';
import '../widgets/store_details_app_bar.dart';
import '../widgets/store_details_section.dart';

class StoreDetailsScreen extends StatelessWidget {
  final Store store;

  const StoreDetailsScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StoreDetailsAppBar(title: store.name!),
              SizedBox(
                height: 24.h,
              ),
              StoreDetailsSection(
                store: store,
              ),
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr('كل العروض'), //todo
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text,
                    ),
                  ),
                  Row(
                    children: [
                      AppIconButton(
                        iconPath: AppAssets.filter16Size,
                        color: AppColors.storeDetailsButton,
                        hasShadow: false,
                        size: 24,
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      AppIconButton(
                        iconPath: AppAssets.listView16Size,
                        color: AppColors.storeDetailsButton,
                        hasShadow: false,
                        size: 24,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    store.coupons != null && store.coupons!.isNotEmpty
                        ? ListView.builder(
                            itemCount: store.coupons?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => CouponListTile(
                              onTap: () async {
                                await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  builder: (context) {
                                    return BlocProvider(
                                      create: (context) =>
                                          GetCouponDetailsCubit(
                                        sl(),
                                      ),
                                      child:  CouponBottomSheet(
                                        couponID: store.coupons![index].id!,

                                        store: store,
                                      ),
                                    );
                                  },
                                );
                              },
                              storeCoupon: store.coupons![index],
                            ),
                          )
                        : Center(
                            child: Text(
                              'لا يوجد عروض حتى الان',
                              style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 33.h,
                    ),
                    const RelatedStoresWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
