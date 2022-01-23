import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey  = '9185fcb3b9ee6a5b33d763da500200ae';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper1 networkHelper = NetworkHelper1('api.openweathermap.org', '/data/2.5/weather', cityName);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getLocation();
    print(location.longitude);
    print(location.latitude);
    NetworkHelper networkHelper = NetworkHelper('api.openweathermap.org', '/data/2.5/weather',location.latitude.toString(),location.longitude.toString());
    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}