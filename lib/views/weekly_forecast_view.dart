import 'package:dep_task_two/extensions/datetime.dart';
import 'package:dep_task_two/providers/weekly_weather.dart';
import 'package:dep_task_two/utils/get_weather_icons.dart';
import 'package:dep_task_two/widgets/weekly_weather_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(WeeklyWeatherProvider);
    return weatherData.when(
      data: (weeklyWeather) {
        return ListView.builder(
          itemCount: weeklyWeather.daily.weatherCode.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek =
                DateTime.parse(weeklyWeather.daily.time[index]).dayOfWeek;
            final date = weeklyWeather.daily.time[index];
            final temp = weeklyWeather.daily.temperature2mMax[index];
            final icon = weeklyWeather.daily.weatherCode[index];
            return WeeklyWeatherTile(
              day: dayOfWeek,
              date: date,
              temp: temp.toInt(),
              icon: getWeatherIcon2(icon),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
