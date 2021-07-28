import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/weather_forecast/model/wea_fore_model.dart';
import 'package:weather_app/weather_forecast/util/forecast_util.dart';

class Network {
  Future<weathermodel> getWeatherForecast({required String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&appid=" +
        Util.appId;

    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      // we get the actual mapped model (dart object)
      print("weather data:${response.body}");
      return weathermodel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting Wether Forecast");
    }
  }
}
