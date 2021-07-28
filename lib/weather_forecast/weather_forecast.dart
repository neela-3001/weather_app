import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/model/wea_fore_model.dart';
import 'package:weather_app/weather_forecast/network/network.dart';

//ignore:camel_case_types
class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

//ignore: camel_case_types
class _WeatherState extends State<Weather> {
  late Future<weathermodel> forecastObject;
  String _cityName = "Bengaluru";

  @override
  void initState() {
    //ignore:TODO
    //TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<weathermodel>(
                future: forecastObject,
                builder: (BuildContext context,
                    AsyncSnapshot<weathermodel> snapshot) {
                  if (snapshot.hasData) {
                    return Text("All good!");
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

Widget textFieldView() {
  return Container(
    child: TextField(
      decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8)),
      onSubmitted: (value) {},
    ),
  );
}
