import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/city_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.city, required this.background, required this.color});
  final CityWeather city;
  final String background;
  final Color color;
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.background), fit: BoxFit.cover),
        ),
        child: ListView(padding: const EdgeInsets.all(16), children: [
          const ListTile(),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '${widget.city.temp}°',
                      style: const TextStyle(fontSize: 35),
                    ),
                    Text(
                      DateFormat('EEEE').format(DateTime.now()),
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                        child: Text(
                      '${widget.city.name}, ${widget.city.country}',
                      style: const TextStyle(fontSize: 20),
                    )),
                  ],
                ),
                Column(
                  children: [
                    const Divider(),
                    Icon(
                      Icons.sunny,
                      size: 50,
                      color: Colors.amber[700],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  const Column(
                    children: [
                      Icon(Icons.cloudy_snowing),
                      Text('34%'),
                      Text('Precipitation'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.air),
                      Text('${widget.city.wind} km/h'),
                      const Text('Wind'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    children: [
                      const Icon(Icons.water_drop),
                      Text('${widget.city.humidity}'),
                      const Text('Humidity'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.menu),
                      Text('${widget.city.pressure} hPa'),
                      const Text('pressure'),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Today',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  for (int i = 0; i < 12; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Column(
                        children: [
                          Text('10 PM'),
                          SizedBox(
                            height: 8,
                          ),
                          Icon(Icons.sunny),
                          SizedBox(
                            height: 8,
                          ),
                          Text('22°'),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < 4; i++)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Tuesday'), Icon(Icons.cloud), Text('32°\t19°')],
              ),
            )
        ]),
      ),
    );
  }
}
