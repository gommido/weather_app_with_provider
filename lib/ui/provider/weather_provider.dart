import 'package:flutter/material.dart';

import '../../model/weather.dart';
import '../../repository/weather_repo.dart';

class WeatherProvider extends ChangeNotifier
{

  final weatherRepo = WeatherRepo();

  Future<Weather> getWeather({String? city}) async{
    final weather = await weatherRepo.getWeather(city: city);
    return weather;
  }

}