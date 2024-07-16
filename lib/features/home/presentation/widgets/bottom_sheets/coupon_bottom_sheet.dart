import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/values/app_assets.dart';
import '../../../../../core/constant/values/colors.dart';
import '../../../domain/entities/store.dart';
import '../../../domain/usecases/get_coupon_details.dart';
import '../../cubit/coupon_details/get_coupon_details_cubit.dart';
import '../bottom_sheet_coupon_details.dart';
import '../coupon_action_row.dart';
import '../coupon_code_button.dart';
import '../coupon_tags_row.dart';

class CouponBottomSheet extends StatefulWidget {
  final int couponID;
  final Store store;

  const CouponBottomSheet(
      {super.key, required this.couponID, required this.store});

  @override
  State<CouponBottomSheet> createState() => _CouponBottomSheetState();
}

class _CouponBottomSheetState extends State<CouponBottomSheet> {
  @override
  void initState() {
    super.initState();
    context.read<GetCouponDetailsCubit>().fGetCouponDetails(
        params: GetCouponDetailsParams(couponID: widget.couponID));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 661.h,
      // height: ScreenUtil.defaultSize.height * 0.8,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44.w,
                height: 4.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.bottomSheetHeader,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AppAssets.closeCircle,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<GetCouponDetailsCubit, GetCouponDetailsState>(
            builder: (context, state) {
              return state is GetCouponDetailsLoading
                  ? const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: AppColors.text,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BottomSheetCouponDetails(
                          couponStoreImagePath: widget.store.images!,
                          couponStoreName: widget.store.name!,
                          couponStoreImageDescription: widget.store.description,
                        ),
                        SizedBox(height: 35.h),
                         CouponCodeButton(
                          code: context.read<GetCouponDetailsCubit>().coupon!.coupon!.code!
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const CouponActionsRow(),
                        SizedBox(
                          height: 14.h,
                        ),
                         CouponTagsRow(
                          discountPercentage: context.read<GetCouponDetailsCubit>().coupon!.coupon!.discountPercentage!
                        ),
                      ],
                    );
            },
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 74.w, left: 71.w),
            child: const Divider(
              color: AppColors.storeDetailsBorderColor,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('ازاي اخد الكاش باك '),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  '1. هذا النص يمكنك استبداله  باي نص لعرض تفاصيل الالخصم و نسبه الخصم \n2. و كل خاحه ممكن تخص الخصم  \n3. بس مجه متهايلي ايعني \n4. و مش عارف ازاي بس اهو \n5. اي حاحه',
                  textAlign: TextAlign.start,
                  maxLines: 10,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.navigationBarItem,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 46.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 34.w, left: 35.w),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: double.maxFinite,
                height: 56.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.navigationBarItem,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.wallet,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      tr('احصل علي الكاش باك'),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
