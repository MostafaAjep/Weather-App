// weather_event.dart
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherEvent {}

class AddCityEvent extends WeatherEvent {
  final WeatherModel weatherModel;

  AddCityEvent(this.weatherModel);
}

class DeleteCityEvent extends WeatherEvent {
  final int index;

  DeleteCityEvent(this.index);
}
