import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/weather_State.dart';
import 'package:weather_app/services/weather_bloc.dart';
import 'package:weather_app/widgets/city_container.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/weather_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              tooltip: 'Search',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xff2296F3),
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            if (state.cities.isEmpty) {
              return const NoWeatherBody(); // Show this when there are no cities
            }
            return ListView.builder(
              itemCount: state.cities.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(state.cities[index].cityName),
                  onDismissed: (direction) {
                    context.read<WeatherBloc>().add(DeleteCityEvent(index));
                  },
                  child: CityContainer(weatherModel: state.cities[index]),
                );
              },
            );
          }
          return const NoWeatherBody(); // Show this if state is not loaded or any other state
        },
      ),
    );
  }
}
