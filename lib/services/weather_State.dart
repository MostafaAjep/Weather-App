// weather_state.dart
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherModel> cities;

  WeatherLoaded({required this.cities});
}
