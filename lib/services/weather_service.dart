import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '4152562605e8421cad6124615241308';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'there was an error , try later!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("there was an error , try later");
    }
    // when dealing with http not dio
    // if (response.statusCode == 200) {
    //   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    // } else {
    //   final String errorMessage = response.data['error']['message'];
    //   throw Exception(errorMessage);
    // }
  }
}
