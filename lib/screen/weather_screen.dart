import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/city_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.city});
  final CityWeather city;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color color = widget.city.isDay! ? Colors.black : Colors.white;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.city.isDay! ? 'assets/images/background3.jpg' : 'assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: ListView(padding: const EdgeInsets.all(16), children: [
          const ListTile(),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.city.isDay!
                  ? const Color(0xff428FEB).withOpacity(0.4)
                  : const Color(0xff1E212F).withOpacity(0.4),
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
                      style: TextStyle(color: color, fontSize: 35),
                    ),
                    Text(
                      DateFormat('EEEE').format(DateTime.now()),
                      style: TextStyle(color: color, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                        child: Text(
                      '${widget.city.name}, ${widget.city.country}',
                      style: TextStyle(color: color, fontSize: 20),
                    )),
                  ],
                ),
                Column(
                  children: [
                    const Divider(),
                    widget.city.isDay!
                        ? Icon(
                            Icons.sunny,
                            size: 50,
                            color: Colors.amber[700],
                          )
                        : Icon(
                            Icons.circle,
                            size: 50,
                            color: Colors.grey[700],
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
              color: widget.city.isDay!
                  ? const Color(0xff428FEB).withOpacity(0.4)
                  : const Color(0xff1E212F).withOpacity(0.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  Column(
                    children: [
                      Icon(color: color, Icons.cloudy_snowing),
                      Text(style: TextStyle(color: color), '34%'),
                      Text(style: TextStyle(color: color), 'Precipitation'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Icon(color: color, Icons.air),
                      Text(style: TextStyle(color: color), '${widget.city.wind} km/h'),
                      Text(style: TextStyle(color: color), 'Wind'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Icon(color: color, Icons.water_drop),
                      Text(style: TextStyle(color: color), '${widget.city.humidity}'),
                      Text(style: TextStyle(color: color), 'Humidity'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Icon(color: color, Icons.menu),
                      Text(style: TextStyle(color: color), '${widget.city.pressure} hPa'),
                      Text(style: TextStyle(color: color), 'pressure'),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Today',
            style: TextStyle(color: color, fontSize: 25),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.city.isDay!
                    ? const Color(0xff428FEB).withOpacity(0.4)
                    : const Color(0xff1E212F).withOpacity(0.4),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  for (int i = 0; i < 12; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(style: TextStyle(color: color), '10 PM'),
                          const SizedBox(
                            height: 8,
                          ),
                          Icon(color: color, Icons.sunny),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(style: TextStyle(color: color), '22°'),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          for (int i = 1; i < 5; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('EEEE').format(DateTime.now().add(Duration(days: i))),
                      style: TextStyle(color: color)),
                  Icon(color: color, Icons.cloud),
                  Text(style: TextStyle(color: color), '32°\t19°')
                ],
              ),
            )
        ]),
      ),
    );
  }
}
