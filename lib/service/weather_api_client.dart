// on vas faire des requette http
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:noteapp/models/weather_model.dart';



class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location) async {
  //  var geoloc = await location.getLocation();
    var endpoint = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=dakar&units=metric&appid=f4b051acf931ea73167cf11eb1cb1e27");
  
  var resposne = await http.get(endpoint);
  var body = jsonDecode(resposne.body);
  print(Weather.fromJson(body));
  return Weather.fromJson(body);

  }
}