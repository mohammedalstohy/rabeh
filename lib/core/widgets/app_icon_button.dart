import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/values/colors.dart';

class AppIconButton extends StatelessWidget {
  final String iconPath;
  final void Function() onTap;
  final Color? color;
  final double? size;
  final bool? hasShadow;

  const AppIconButton({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.color,
    this.size,
    this.hasShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? 40.w,
        height: size ?? 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors.buttonColor,
          borderRadius: size == 24  ? BorderRadius.circular(4.r) : BorderRadius.circular(12.r),
          boxShadow: (hasShadow == null || hasShadow == true)
              ? const [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ]
              : null,
        ),
        child: Image.asset(
          iconPath,
          width: size == 24  ? 16.w : 24.w,
          height:size == 24  ? 16.h : 24.h,
        ),
      ),
    );
  }
}
