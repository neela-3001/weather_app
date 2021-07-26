import 'package:http/http.dart';
import 'package:weather_app/weather_forecast/model/wea_fore_model.dart';
import 'package:weather_app/weather_forecast/util/forecast_util.dart';

class Network {
  Future<Weathermodel> getWeatherForecast({required String cityName}) {
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&appid=" +
        Util.appId;

    final response = await get(Uri.encodeFull(finalUrl));
  }
}
