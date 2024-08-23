class WeatherModel {
  final String cityName;
  final String date;
  final List<Forecast> forecasts;

  WeatherModel({
    required this.date,
    required this.cityName,
    required this.forecasts,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var forecastList = json['forecast']['forecastday'] as List;
    List<Forecast> forecasts = forecastList.map((day) {
      return Forecast.fromJson(day);
    }).toList();

    return WeatherModel(
      cityName: json['location']['name'],
      date: json['location']['localtime'],
      forecasts: forecasts,
    );
  }
}

class Forecast {
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final double wind;
  final String weatherCondition;
  final String dayDate;

  Forecast({
    this.image,
    required this.wind,
    required this.dayDate,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      wind: json['day']['maxwind_mph'],
      dayDate: json['date'],
      temp: json['day']['avgtemp_c'],
      maxTemp: json['day']['maxtemp_c'],
      minTemp: json['day']['mintemp_c'],
      weatherCondition: json['day']['condition']['text'],
      image: json['day']['condition']['icon'] != null
          ? 'https:${json['day']['condition']['icon']}'
          : null,
    );
  }
}
