import '../api_service/weather_api.dart';
import '../model/weather.dart';

class WeatherRepo
{


  final _weatherApi = WeatherApi();


  Future<Weather> getWeather({String? city}) async {
    final weatherData = await _weatherApi.getWeather(city: city);
    return Weather.fromJson(weatherData);
  }
}