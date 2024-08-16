import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dep_task_two/constants/constants.dart';
import 'package:dep_task_two/models/hourly_weather.dart';
import 'package:dep_task_two/models/weather.dart';
import 'package:dep_task_two/models/weekly_weather.dart';
import 'package:dep_task_two/services/geolocator.dart';
import 'package:dep_task_two/utils/logging.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

@immutable
class ApiHelper {
  //it is just to start the Api URL the rest of the Api will be ahead of this
  static const baseURL = "https://api.openweathermap.org/data/2.5";
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  // FUll Apis constructed
  static String _constructWeatherURL() =>
      '$baseURL/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructForecastURL() =>
      '$baseURL/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructWeatherByCityURL(String cityName) =>
      '$baseURL/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

  static String _constructWeeklyForecastURL() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

  //Fetch Data
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning("Failed to load data : ${response.statusCode}");
        throw Exception("Failed to load Data");
      }
    } catch (e) {
      printWarning("Error fetching data from $url : $e");
      throw Exception("Error fetching Data");
    }
  }

  // Get Current Weather info
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherURL();
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  // Get Hourly Weather info
  static Future<HourlyWeather> getHourlyWeather() async {
    await fetchLocation();
    final url = _constructForecastURL();
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  // Get Weekly Weather info
  static Future<WeeklyWeather> getWeeklyWeather() async {
    await fetchLocation();
    final url = _constructWeeklyForecastURL();
    final response = await _fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  // Get Weather By City Name info
  static Future<Weather> getWeatherByCity({required String cityName}) async {
    final url = _constructWeatherByCityURL(cityName);
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  //get Temprature
  static Future<double> getTemprature() async {
    await fetchLocation();
    final url = _constructWeatherURL();
    http.Response response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    return data['main']['temp'];
  }
}
