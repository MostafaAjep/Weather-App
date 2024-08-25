import 'package:bloc/bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_State.dart';
import 'package:weather_app/widgets/weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  List<WeatherModel> cities = [];

  WeatherBloc() : super(WeatherInitial()) {
    on<AddCityEvent>(_onAddCity);
    on<DeleteCityEvent>(_onDeleteCity); // Register the delete event handler
  }

  void _onAddCity(AddCityEvent event, Emitter<WeatherState> emit) {
    cities.add(event.weatherModel);
    emit(WeatherLoaded(cities: cities));
  }

  void _onDeleteCity(DeleteCityEvent event, Emitter<WeatherState> emit) {
    cities.removeAt(event.index);
    emit(WeatherLoaded(cities: cities));
  }
}
