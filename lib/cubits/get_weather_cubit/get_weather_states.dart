class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  // an alternative way to access the data from weatherModel
  // final WeatherModel weatherModel;
  // WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  // its really not important
  final String errorMessage;
  WeatherFailureState({required this.errorMessage});
}

class WeatherLoadingState extends WeatherState {
  // its really not important
  // final Widget loadingWidget;
  // WeatherLoadingState({required this.loadingWidget});
}
