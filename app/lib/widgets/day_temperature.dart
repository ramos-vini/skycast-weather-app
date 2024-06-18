// import 'package:flutter/material.dart';

// class DayTemperature extends StatefulWidget {
//   const DayTemperature({super.key});

//   @override
//   State<DayTemperature> createState() => _DayTemperatureState();
// }

// class _DayTemperatureState extends State<DayTemperature> {
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '4',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 130,
//                 height: 0.7,
//               ),
//             ),
//             Column(
//               children: [
//                 Text(
//                   '°C',
//                   style:
//                       TextStyle(color: Colors.white, fontSize: 34, height: 0.7, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10,),
//                 Text(
//                   '↑5°',
//                   style: TextStyle(
//                       color: Color.fromARGB(140, 255, 255, 255), fontSize: 22),
//                 ),
//                 Text(
//                   '↓4°',
//                   style: TextStyle(
//                       color: Color.fromARGB(140, 255, 255, 255), fontSize: 22, height: 0.7),
//                 ),
//               ],
//             )
//           ],
//         ),
//         SizedBox(height: 30),
//         Text(
//           'Haze',
//           style: TextStyle(color: Colors.white, fontSize: 22),
//         ),
//         SizedBox(height: 30),
//         Icon(
//           Icons.cloud_outlined,
//           color: Color.fromARGB(140, 255, 255, 255),
//           size: 140,
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/current_weather_provider.dart';

class DayTemperature extends StatefulWidget {
  const DayTemperature({super.key});

  @override
  State<DayTemperature> createState() => _DayTemperatureState();
}

class _DayTemperatureState extends State<DayTemperature> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        if (weatherProvider.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (weatherProvider.weather == null) {
          return const Center(child: Text('Failed to load weather data', style: TextStyle(color: Colors.white)));
        }

        final weather = weatherProvider.weather!;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${weather.main.temp.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 130,
                    height: 0.7,
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      '°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          height: 0.7,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '↑${weather.main.tempMax.round()}°',
                      style: const TextStyle(
                          color: Color.fromARGB(140, 255, 255, 255), fontSize: 22),
                    ),
                    Text(
                      '↓${weather.main.tempMin.round()}°',
                      style: const TextStyle(
                          color: Color.fromARGB(140, 255, 255, 255), fontSize: 22, height: 0.7),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Text(
              weather.weather[0].description,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 30),
            const Icon(
              Icons.cloud_outlined, // Map the weather icon to appropriate Flutter icons
              color: Color.fromARGB(140, 255, 255, 255),
              size: 140,
            ),
          ],
        );
      },
    );
  }
}
