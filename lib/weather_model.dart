import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather {
  final String name;
  final String region;
  final String country;
  final String last_updated;
  final String text;
  final String icon;
  final String temp_c;

  Weather(
      {required this.name,
      required this.region,
      required this.country,
      required this.last_updated,
      required this.text,
      required this.icon,
      required this.temp_c});

  factory Weather.createWeather(Map<String, dynamic> object) {
    return Weather(
        name: object['location']['name'],
        region: object['location']['region'],
        country: object['location']['country'],
        last_updated: object['current']['last_updated'],
        text: object['current']['condition']['text'],
        icon: object['current']['condition']['icon'],
        temp_c: object['current']['temp_c'].toString());
  }

  static Future<Weather> connectToAPI() async {
    String apiURL =
        "http://api.weatherapi.com/v1/current.json?key=8011640ccabb4440bdc34504241009&q=London&aqi=no";
    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    return Weather.createWeather(jsonObject);
  }
}
