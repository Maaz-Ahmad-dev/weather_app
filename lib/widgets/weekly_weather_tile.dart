import 'package:dep_task_two/constants/app_colors.dart';
import 'package:dep_task_two/constants/text_styles.dart';
import 'package:dep_task_two/widgets/super_script_text.dart';
import 'package:flutter/material.dart';

class WeeklyWeatherTile extends StatelessWidget {
  final String day;
  final String date;
  final int temp;
  final String icon;
  const WeeklyWeatherTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: TextStyles.subtitleText,
              ),
            ],
          ),
          SuperscriptText(
            text: temp.toString(),
            superScript: "°C",
            color: AppColors.white,
            superscriptColor: AppColors.grey,
          ),
          Image.asset(
            icon,
            width: 60,
          ),
        ],
      ),
    );
  }
}
