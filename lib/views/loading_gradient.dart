import 'package:flutter/material.dart';

import '/constants/app_colors.dart';

class LoadingGradient extends StatelessWidget {
  const LoadingGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                AppColors.black,
                AppColors.secondaryBlack,
                AppColors.secondaryBlack.withOpacity(.99),
                AppColors.secondaryBlack.withOpacity(.98),
                AppColors.secondaryBlack.withOpacity(.97),
                AppColors.secondaryBlack.withOpacity(.96),
                AppColors.secondaryBlack.withOpacity(.95),
                AppColors.secondaryBlack.withOpacity(.94),
                AppColors.secondaryBlack.withOpacity(.93),
                AppColors.secondaryBlack.withOpacity(.92),
                AppColors.secondaryBlack.withOpacity(.91),
                AppColors.secondaryBlack.withOpacity(.90),
                AppColors.darkBlue,
                AppColors.accentBlue,
                AppColors.lightBlue,
              ],
            ),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 5,
            ),
          )),
    );
  }
}
