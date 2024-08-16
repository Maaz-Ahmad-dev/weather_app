import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dep_task_two/services/api_helper.dart';

final HourlyWeatherProvider = FutureProvider.autoDispose((ref) {
  return ApiHelper.getHourlyWeather();
});
