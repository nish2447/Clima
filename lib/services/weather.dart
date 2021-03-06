import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey  = 'Your Key';

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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
