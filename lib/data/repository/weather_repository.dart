import 'dart:convert';

import 'package:bloc_weather_app/data/data_provider/weather_data_provider.dart';
import 'package:bloc_weather_app/models/weather_model.dart';

class WeatherRepository {
  WeatherDataProvider weatherDataProvider = WeatherDataProvider();

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Abbottabad';
      final weahtherData =
          await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weahtherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
