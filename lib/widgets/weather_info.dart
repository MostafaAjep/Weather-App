import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.blue,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                tooltip: 'Search',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SearchPage()),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
              )),
        ],
      ),
      body: FutureBuilder(
          future: WeatherService()
              .getCurrentWeather(cityName: weatherModel.cityName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No weather data available.'));
            } else {
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
                                      fontSize: 52,
                                      fontWeight: FontWeight.bold),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'mintemp\n\t\t\t${weatherModel.forecasts[0].minTemp.ceil().toString()}°C',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'WindSpeed\n\t\t${weatherModel.forecasts[0].wind}/mph',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'maxtemp\n\t\t\t\t${weatherModel.forecasts[0].maxTemp.ceil().toString()}°C',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Weather Forecast',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                              child: ListView(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        weatherModel.forecasts[1].image!,
                                      ),
                                      Text(
                                        '${weatherModel.forecasts[1].temp.toString()}°C',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        weatherModel.forecasts[1].dayDate,
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        weatherModel.forecasts[2].image!,
                                      ),
                                      Text(
                                        '${weatherModel.forecasts[2].temp.toString()}°C',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        weatherModel.forecasts[2].dayDate,
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        weatherModel.forecasts[3].image!,
                                      ),
                                      Text(
                                        '${weatherModel.forecasts[3].temp.toString()}°C',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        weatherModel.forecasts[3].dayDate,
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        weatherModel.forecasts[4].image!,
                                      ),
                                      Text(
                                        '${weatherModel.forecasts[4].temp.toString()}°C',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        weatherModel.forecasts[4].dayDate,
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
