import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/weather_info.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search now',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onSubmitted: (value) async {
              WeatherModel weatherModel =
                  await WeatherService().getCurrentWeather(cityName: value);
              log(weatherModel.forecasts[0].wind.toString());
              // log(weatherModel.cityName);
              // log(weatherModel.date);
              // for (var forecast in weatherModel.forecasts) {
              //   log('Weather: ${forecast.weatherCondition}');
              //   log('Day: ${forecast.dayDate}');
              //   log('Temp: ${forecast.temp}°C');
              //   log('Max Temp: ${forecast.maxTemp}°C');
              //   log('Min Temp: ${forecast.minTemp}°C');
              //   if (forecast.image != null) {
              //     log('Icon URL: ${forecast.image}');
              //   }
              // }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => WeatherInfoBody(
                        weatherModel: weatherModel,
                      )),
                ),
              );
            },
            maxLength: 15,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              label: const Text('Search'),
              hintText: 'Enter City Name',
              suffixIcon: const Icon(Icons.search),
              // enabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(16),
              //     borderSide: const BorderSide(color: Colors.amber)),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: const BorderSide(color: Colors.amber),
              //   borderRadius: BorderRadius.circular(16),
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
