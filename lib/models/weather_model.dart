// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  final double currentTemperature;
  final double currentHumidity;
  final double currentWindSpeed;
  final double currentPressure;
  final String currentSky;
  WeatherModel({
    required this.currentTemperature,
    required this.currentHumidity,
    required this.currentWindSpeed,
    required this.currentPressure,
    required this.currentSky,
  });

  WeatherModel copyWith({
    double? currentTemperature,
    double? currentSpeed,
    double? currentHumidity,
    double? currentWindSpeed,
    double? currentPressure,
    String? currentSky,
  }) {
    return WeatherModel(
      currentTemperature: currentTemperature ?? this.currentTemperature,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentPressure: currentPressure ?? this.currentPressure,
      currentSky: currentSky ?? this.currentSky,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemperature': currentTemperature,
      'currentHumidity': currentHumidity,
      'currentWindSpeed': currentWindSpeed,
      'currentPressure': currentPressure,
      'currentSky': currentSky,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    return WeatherModel(
      currentTemperature: currentWeatherData['main']['temp'] as double,
      currentHumidity: currentWeatherData['main']['humidity'] as double,
      currentWindSpeed: currentWeatherData['wind']['speed'] as double,
      currentPressure: currentWeatherData['main']['pressure'] as double,
      currentSky: currentWeatherData['weather'][0]['main'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemperature: $currentTemperature, currentHumidity: $currentHumidity, currentWindSpeed: $currentWindSpeed, currentPressure: $currentPressure, currentSky: $currentSky)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemperature == currentTemperature &&
        other.currentHumidity == currentHumidity &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentPressure == currentPressure &&
        other.currentSky == currentSky;
  }

  @override
  int get hashCode {
    return currentTemperature.hashCode ^
        currentHumidity.hashCode ^
        currentWindSpeed.hashCode ^
        currentPressure.hashCode ^
        currentSky.hashCode;
  }
}
