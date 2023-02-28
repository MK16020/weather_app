import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project_5/screen/weather_screen.dart';
import 'package:http/http.dart' as http;

import '../model/city_weather.dart';

class PickCity extends StatefulWidget {
  const PickCity({super.key});

  @override
  State<PickCity> createState() => _PickCityState();
}

class _PickCityState extends State<PickCity> {
  var cities = [
    'Tokyo',
    'Delhi',
    'Shanghai',
    'São Paulo',
    'Mexico City',
    'Cairo',
    'Mumbai',
    'Beijing',
    'Dhaka',
    'Osaka',
    'New York'
  ];
  Color color = const Color(0xff98B2D5).withOpacity(0.4);
  CityWeather city = CityWeather();
  String background = 'assets/images/background2.jpg';
  TextEditingController cityName = TextEditingController();
  Future<CityWeather> getWeather(String cityName) async {
    final url = Uri.https(
      'api.weatherapi.com',
      '/v1/forecast.json',
      {
        'key': 'a9216bdd8aaa430791f161550232702',
        'q': cityName,
        'days': '4',
        'aqi': 'yes',
        'alerts': 'no',
      },
    );

    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    final error = jsonResponse['error'];
    if (error != null) {
      final message = (error['message'] ?? '') as String;
      return CityWeather(error: message);
    }
    final location = jsonResponse['location'];
    city.name = location['name'];
    city.country = location['country'];

    final currentObject = jsonResponse['current'];
    city.pressure = currentObject['pressure_mb'];
    city.wind = currentObject['wind_mph'];
    city.temp = currentObject['temp_c'];
    city.humidity = currentObject['humidity'];
    currentObject['is_day'] == 1 ? city.isDay = true : city.isDay = false;

    return CityWeather();
  }

  @override
  void dispose() {
    cityName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(image: DecorationImage(image: AssetImage('images/background2.jpg'), fit: BoxFit.cover)),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ListTile(
              leading: IconButton(
                  onPressed: () async {
                    await getWeather(cityName.text.trim());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen(city: city)));
                  },
                  icon: const Icon(Icons.search)),
              title: TextField(
                controller: cityName,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 20),
            for (final town in cities)
              Card(
                color: Colors.blueGrey.withOpacity(0.4),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  onTap: () async {
                    await getWeather(town);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen(city: city)));
                  },
                  leading: const Icon(Icons.location_city_outlined),
                  title: Text(town),
                  trailing: const Icon(Icons.arrow_right),
                ),
              )
          ],
        ),
      ),
    );
  }
}
