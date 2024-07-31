import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/data/repository/weather_repository.dart';
import 'package:bloc_weather_app/models/weather_model.dart';
import 'package:flutter/foundation.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.getCurrentWeather();

      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(error: e.toString()));
    }
  }
}
