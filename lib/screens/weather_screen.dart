import 'package:dep_task_two/constants/text_styles.dart';
import 'package:dep_task_two/extensions/datetime.dart';
import 'package:dep_task_two/providers/current_weather.dart';
import 'package:dep_task_two/views/gradient_container.dart';
import 'package:dep_task_two/views/hourly_weather_forecast.dart';
import 'package:dep_task_two/views/loading_gradient.dart';
import 'package:dep_task_two/views/weather_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);
    return weatherData.when(data: (weather) {
      return GradientContainer(children: [
        Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              weather.name,
              style: TextStyles.h1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              DateTime.now().dateTime,
              style: TextStyles.subtitleText,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 260,
              child: Image.asset(
                  "assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png"),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              weather.weather[0].description,
              style: TextStyles.h3,
            ),
          ],
        ),

        const SizedBox(
          height: 30,
        ),
        WeatherInfo(weather: weather),
        const SizedBox(
          height: 30,
        ),
        // Hourly Forecast
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today",
              style: TextStyles.h2,
            ),
            TextButton(
                onPressed: () {}, child: const Text("View full forecast"))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const HourlyWeatherForecast(),
      ]);
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return const LoadingGradient();
    });
  }
}
