import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class CityContainer extends StatelessWidget {
  const CityContainer({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  weatherModel.forecasts[0].weatherCondition,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.network(
                fit: BoxFit.fill,
                width: 100,
                height: 100,
                weatherModel.forecasts[0].image!,
              ),
            ),
            const Spacer(),
            Text(
              weatherModel.forecasts[0].temp.toString(),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
