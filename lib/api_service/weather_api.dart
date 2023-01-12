import 'package:dio/dio.dart';

class WeatherApi
{
  late Dio dio;

  WeatherApi(){
    BaseOptions options = BaseOptions(
      baseUrl:'https://api.weatherapi.com/v1/',
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<Map<String,dynamic>> getWeather({String? city}) async {
    try {
      Response response = await dio.get(
          'current.json',
          queryParameters: {
            'key': '43ff1ef19b0442cda8a150251231001',
            'q': city
          }
      );
      return response.data;
    } catch (error) {
      return {};
    }
  }


}