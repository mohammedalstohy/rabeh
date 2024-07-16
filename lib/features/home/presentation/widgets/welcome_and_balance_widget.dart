import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constant/values/colors.dart';
import '../../../../core/constant/values/fonts.dart';

class WelcomeAndBalanceWidget extends StatelessWidget {
  const WelcomeAndBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'اهلا مصطفي 👋',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${tr('yourBalance')} ',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                    fontFamily: AppFonts.somarRounded),
              ),
              const TextSpan(
                text: '10',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                    fontFamily: AppFonts.somarRounded),
              ),
              TextSpan(
                text: ' ${tr('sar')}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                    fontFamily: AppFonts.somarRounded),
              ),
            ],
          ),
        )
      ],
    );
  }
}
