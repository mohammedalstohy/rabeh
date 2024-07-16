import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/values/colors.dart';
import '../../cubit/home_filter_controller/home_filter_controller_cubit.dart';

class FilterHomeStoresBottomSheet extends StatelessWidget {
  const FilterHomeStoresBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 423,
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
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('filterBy'),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(
                  height: 33.h,
                ),
                BlocBuilder<HomeFilterControllerCubit,
                    HomeFilterControllerState>(
                  builder: (context, state) {
                    return Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () async => context
                              .read<HomeFilterControllerCubit>()
                              .changeIndex(1),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Radio<int>(
                                  value: 1,
                                  groupValue: context
                                      .read<HomeFilterControllerCubit>()
                                      .selectedIndex,
                                  activeColor: AppColors.storeDescription,
                                  fillColor: WidgetStateColor.resolveWith(
                                    (states) {
                                      if (states
                                          .contains(WidgetState.selected)) {
                                        return AppColors.storeDescription;
                                      }
                                      return AppColors.storeDescription;
                                    },
                                  ),
                                  onChanged: context
                                      .read<HomeFilterControllerCubit>()
                                      .changeIndex,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                tr('الأعلى خصم'), //todo
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const Divider(
                          color: AppColors.imageBorder,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        //!
                        GestureDetector(
                          onTap: () async => context
                              .read<HomeFilterControllerCubit>()
                              .changeIndex(2),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Radio<int>(
                                  value: 2,
                                  groupValue: context
                                      .read<HomeFilterControllerCubit>()
                                      .selectedIndex,
                                  activeColor: AppColors.storeDescription,
                                  fillColor:
                                      WidgetStateColor.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors.storeDescription;
                                    }
                                    return AppColors.storeDescription;
                                  }),
                                  onChanged: context
                                      .read<HomeFilterControllerCubit>()
                                      .changeIndex,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                tr('الأكثر بحث'), //todo
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const Divider(
                          color: AppColors.imageBorder,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        //!
                        GestureDetector(
                          onTap: () async => context
                              .read<HomeFilterControllerCubit>()
                              .changeIndex(3),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Radio<int>(
                                  value: 3,
                                  groupValue: context
                                      .read<HomeFilterControllerCubit>()
                                      .selectedIndex,
                                  activeColor: AppColors.storeDescription,
                                  fillColor:
                                      WidgetStateColor.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors.storeDescription;
                                    }
                                    return AppColors.storeDescription;
                                  }),
                                  onChanged: context
                                      .read<HomeFilterControllerCubit>()
                                      .changeIndex,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                tr('الكاش باك'), //todo
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const Divider(
                          color: AppColors.imageBorder,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        //!
                        GestureDetector(
                          onTap: () async => context
                              .read<HomeFilterControllerCubit>()
                              .changeIndex(4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Radio<int>(
                                  value: 4,
                                  groupValue: context
                                      .read<HomeFilterControllerCubit>()
                                      .selectedIndex,
                                  activeColor: AppColors.storeDescription,
                                  fillColor:
                                      WidgetStateColor.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors.storeDescription;
                                    }
                                    return AppColors.storeDescription;
                                  }),
                                  onChanged: context
                                      .read<HomeFilterControllerCubit>()
                                      .changeIndex,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                tr('المضاف حديثاً'), //todo
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const Divider(
                          color: AppColors.imageBorder,
                        ),
                        //!
                        GestureDetector(
                          onTap: () async => context
                              .read<HomeFilterControllerCubit>()
                              .changeIndex(5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Radio<int>(
                                  value: 5,
                                  groupValue: context
                                      .read<HomeFilterControllerCubit>()
                                      .selectedIndex,
                                  activeColor: AppColors.storeDescription,
                                  fillColor:
                                      WidgetStateColor.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return AppColors.storeDescription;
                                    }
                                    return AppColors.storeDescription;
                                  }),
                                  onChanged: context
                                      .read<HomeFilterControllerCubit>()
                                      .changeIndex,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                tr('الرائج 🔥'), //todo
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Container(
                            width: double.maxFinite,
                            height: 46.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.navigationBarItem),
                            child: Text(
                              tr('تطبيق'), //todo
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
