import 'package:flutter/material.dart';
import 'package:weather_mobile_app/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Weather? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather API Test"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (weather != null)
                  ? Image.network('${weather!.icon}')
                  : Text('Empty'),
              Text((weather != null)
                  ? "${weather!.name} | ${weather!.region} | ${weather!.country}"
                  : "Tidak ada data!"),
              Text((weather != null)
                  ? "${weather!.text} | ${weather!.temp_c}°C | Last updated: ${weather!.last_updated}"
                  : ""),
              ElevatedButton(
                  onPressed: () {
                    Weather.connectToAPI().then((value) {
                      weather = value;
                      setState(() {});
                    });
                  },
                  child: const Text("Get Data"))
            ],
          ),
        ),
      ),
    );
  }
}
