import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import 'forecast_day.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    // this the best for accessing model from cubit with a complex tree widgets
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color.fromARGB(219, 224, 224, 242)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${weatherModel.cityName}📌',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    // 'updated at ${weatherModel.date.day}/${weatherModel.date.month}/${weatherModel.date.year}',
                    'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        weatherModel.forecasts[0].image!,
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        '${weatherModel.forecasts[0].temp.ceil().toString()}°C',
                        style: const TextStyle(
                            fontSize: 52, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weatherModel.forecasts[0].weatherCondition,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(24),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'mintemp\n\t\t\t${weatherModel.forecasts[0].minTemp.ceil().toString()}°C',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'WindSpeed\n\t\t${weatherModel.forecasts[0].wind}/mph',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'maxtemp\n\t\t\t\t${weatherModel.forecasts[0].maxTemp.ceil().toString()}°C',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Weather Forecast',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(24),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(),
                    ),
                    child: ListView(children: [
                      ForecastDay(
                        weatherModel: weatherModel,
                        dayNum: 1,
                      ),
                      const SizedBox(height: 10),
                      ForecastDay(
                        weatherModel: weatherModel,
                        dayNum: 2,
                      ),
                      const SizedBox(height: 10),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



//you can use this function to convert string to dateTime and use it freely
// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);
// }






//  @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future:
//             WeatherService().getCurrentWeather(cityName: weatherModel.cityName),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('No weather data available.'));
//           } else {
//             return SingleChildScrollView(
//               child: Container(
