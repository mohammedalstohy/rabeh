import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/values/app_assets.dart';
import '../../../../core/constant/values/colors.dart';
import '../../../../core/widgets/app_icon_button.dart';

class StoreDetailsAppBar extends StatelessWidget {
  final String title;

  const StoreDetailsAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIconButton(
          onTap: () => Navigator.pop(context),
          iconPath: AppAssets.arrowRight,
          color: AppColors.white,
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 40.h,
          width: 40.w,
        )
      ],
    );
  }
}
