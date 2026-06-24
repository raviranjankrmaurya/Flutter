import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:weather_app/additional_information_item.dart';
import 'package:weather_app/secrets.dart';

import 'package:http/http.dart' as http;

class WeatherMainPage extends StatefulWidget {
  const WeatherMainPage({super.key});

  @override
  State<WeatherMainPage> createState() => _WeatherMainPageState();
}

class _WeatherMainPageState extends State<WeatherMainPage> {
  late Future<Map<String, dynamic>> weather;
  String cityName = 'Mumbai';

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'An Unexpected Error Occurred';
      }

      return data;
      //temp = data['list'][0]['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        //backgroundColor: const Color.fromARGB(255, 24, 24, 23),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;

          final currentWetherData = data['list'][0];

          final currentTemp = currentWetherData['main']['temp'];
          final currentSky = currentWetherData['weather'][0]['main'];
          final currentPressure = currentWetherData['main']['pressure'];
          final currentWindSpeed = currentWetherData['wind']['speed'];
          final currentHumidity = currentWetherData['main']['humidity'];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Card
                  
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      // color:  Colors.black87,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('📍$cityName',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 10),
                                Text(
                                  '$currentTemp K',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                Icon(
                                  currentSky == 'Clouds' || currentSky == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 64,
                                ),

                                const SizedBox(height: 20),
                                Text(
                                  currentSky,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hourly Forecast',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // weather hourly forecast card

                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       for (int i = 0; i < 5; i++) ...[

                  //         HourlyForcastItem(
                  //           time: data['list'][i + 1]['dt_txt']
                  //               .toString()
                  //               .substring(10, 16),
                  //           icon:
                  //               data['list'][i+1]['weather'][0]['main'] ==
                  //                       'Clouds' ||
                  //                   data['list'][i+1]['weather'][0]['main'] ==
                  //                       'Rain'
                  //               ? Icons.cloud
                  //               : Icons.sunny,
                  //           temperature: data['list'][i + 1]['main']['temp']
                  //               .toString(),
                  //         ),
                  //       ],
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        final hourlyForcast = data['list'][index + 1]['dt_txt'];
                        final hourlySky =
                            data['list'][index + 1]['weather'][0]['main'] ==
                                    'Clouds' ||
                                data['list'][index + 1]['weather'][0]['main'] ==
                                    'Rain'
                            ? Icons.cloud
                            : Icons.sunny;
                        final hourlyTemperature =
                            data['list'][index + 1]['main']['temp'].toString();

                        final time = DateTime.parse(hourlyForcast);

                        return HourlyForcastItem(
                          time: DateFormat.j().format(time),
                          icon: hourlySky,
                          temperature: hourlyTemperature,
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 20),
                  // additional information
                  const Text(
                    'Additional Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: currentHumidity.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.air,
                        label: 'Wind Speed',
                        value: currentWindSpeed.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.beach_access,
                        label: 'Pressure',
                        value: currentPressure.toString(),
                      ),
                    ],
                  ),

                  //
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
