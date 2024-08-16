import 'package:dep_task_two/constants/text_styles.dart';
import 'package:dep_task_two/extensions/datetime.dart';
import 'package:dep_task_two/views/gradient_container.dart';
import 'package:dep_task_two/views/hourly_weather_forecast.dart';
import 'package:dep_task_two/views/weekly_forecast_view.dart';
import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Forecast Report",
              style: TextStyles.h1,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyles.h2,
              ),
              Text(
                DateTime.now().dateTime,
                style: TextStyles.subtitleText,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const HourlyWeatherForecast(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Next Forecast",
                style: TextStyles.h1,
              ),
              Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const WeeklyForecastView(),
        ],
      ),
    );
  }
}
