import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../cubit/home_filter_controller/home_filter_controller_cubit.dart';
import '../cubit/store_details/get_store_details_cubit.dart';
import '../widgets/bottom_sheets/filter_home_stores_bottom_sheet.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_grid_card.dart';
import '../widgets/home_list_tile.dart';
import '../widgets/welcome_and_balance_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _advs = [
    AppAssets.adv1,
    AppAssets.adv2,
  ];

  bool showInGridView = true;

  @override
  void initState() {
    super.initState();
    context.read<GetStoresOrStoreDetailsCubit>().fGetHomeStores();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            const HomeAppBar(),
            Builder(
              builder: (context) => showInGridView
                  ? const WelcomeAndBalanceWidget()
                  : const SizedBox(),
            ),
            SizedBox(
              height: 16.h,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 154.h,
                viewportFraction: 1,
                autoPlay: true,
              ),
              itemCount: _advs.length,
              // ignore: always_specify_types
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: double.maxFinite,
                  height: 154.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      _advs[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('allStores'),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                Row(
                  children: [
                    AppIconButton(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => HomeFilterControllerCubit(),
                              child: const FilterHomeStoresBottomSheet(),
                            );
                          },
                        );
                      },
                      iconPath: AppAssets.filter,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    AppIconButton(
                      onTap: () {
                        setState(() {
                          showInGridView = !showInGridView;
                        });
                      },
                      iconPath: showInGridView
                          ? AppAssets.listView
                          : AppAssets.gridView,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocBuilder<GetStoresOrStoreDetailsCubit,
                GetStoresOrStoreDetailsState>(
              builder: (context, state) {
                return Expanded(
                  child: state is GetStoresOrStoreDetailsLoading
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.text,
                            ),
                          ],
                        )
                      : showInGridView
                          ? GridView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8.h,
                                crossAxisSpacing: 17.w,
                                mainAxisExtent: 198.h,
                              ),
                              shrinkWrap: true,
                              itemCount: context
                                  .read<GetStoresOrStoreDetailsCubit>()
                                  .storesList
                                  ?.length,
                              itemBuilder: (context, index) => HomeGridCard(
                                index: index,
                                store: context
                                    .read<GetStoresOrStoreDetailsCubit>()
                                    .storesList![index],
                              ),
                            )
                          : ListView.builder(
                              itemCount: context
                                  .read<GetStoresOrStoreDetailsCubit>()
                                  .storesList
                                  ?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => HomeListTile(
                                index: index,
                                store: context
                                    .read<GetStoresOrStoreDetailsCubit>()
                                    .storesList![index],
                              ),
                            ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
