import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class ForecastDay extends StatelessWidget {
  const ForecastDay({
    super.key,
    required this.weatherModel,
    required this.dayNum,
  });

  final WeatherModel weatherModel;
  final int dayNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          weatherModel.forecasts[dayNum].image!,
        ),
        Text(
          '${weatherModel.forecasts[dayNum].temp.toString()}°C',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          weatherModel.forecasts[dayNum].dayDate,
          style: const TextStyle(
              color: Colors.black45, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
