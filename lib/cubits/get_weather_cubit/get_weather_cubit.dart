import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  //best method to access model from cubit =>
  late WeatherModel weatherModel;

  getWeather({required String cityName, required BuildContext context}) async {
    try {
      emit(WeatherLoadingState(
          // loadingWidget: const CircularProgressIndicator()
          //its really not important as we display a it at home page
          ));

      weatherModel =
          await WeatherService().getCurrentWeather(cityName: cityName);
      //second best method to access model from cubit is to pass the model into its state =>
      // emit(WeatherLoadedState(weatherModel: weatherModel));
      emit(WeatherLoadedState());
      log(weatherModel.forecasts[0].wind.toString());
      // Navigator.of(context).pop();
    } catch (e) {
      // its really not important
      emit(WeatherFailureState(errorMessage: e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
