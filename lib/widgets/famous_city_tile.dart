import 'package:dep_task_two/constants/app_colors.dart';
import 'package:dep_task_two/constants/text_styles.dart';
import 'package:dep_task_two/providers/city_name.dart';
import 'package:dep_task_two/utils/get_weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FamousCityTile extends ConsumerWidget {
  final String city;
  final int index;
  const FamousCityTile({
    super.key,
    required this.city,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityWeatherData = ref.watch(CityNameWeatherProvider(city));
    return cityWeatherData.when(data: (weather) {
      return Material(
        color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
        elevation: index == 0 ? 8 : 0,
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${weather.main.temp.round()}°",
                          style: TextStyles.h2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          weather.weather[0].description,
                          style: TextStyles.subtitleText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    getWeatherIcon(weatherCode: weather.weather[0].id),
                    width: 50,
                  ),
                ],
              ),
              Text(
                weather.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(
          error.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    });
  }
}
