import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dep_task_two/models/weather.dart';
import 'package:dep_task_two/services/api_helper.dart';

final CityNameWeatherProvider =
    FutureProvider.autoDispose.family<Weather, String>((ref, String cityName) {
  return ApiHelper.getWeatherByCity(cityName: cityName);
});
