import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.jpg'), fit: BoxFit.cover),
        ),
        child: ListView(padding: const EdgeInsets.all(16), children: [
          ListTile(
            leading: IconButton(onPressed: () {print('stop it ');}, icon: const Icon(Icons.search)),
            title: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xff98B2D5).withOpacity(0.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      '23°',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(
                      'Monday',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                        child: Text(
                      'City, Country',
                      style: TextStyle(fontSize: 20),
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
              color: const Color(0xff98B2D5).withOpacity(0.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  Column(
                    children: [
                      Icon(Icons.cloudy_snowing),
                      Text('34%'),
                      Text('Precipitation'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Icon(Icons.cloudy_snowing),
                      Text('34%'),
                      Text('Precipitation'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Icon(Icons.cloudy_snowing),
                      Text('34%'),
                      Text('Precipitation'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Icon(Icons.cloudy_snowing),
                      Text('34%'),
                      Text('Precipitation'),
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
                color: const Color(0xff98B2D5).withOpacity(0.65),
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
