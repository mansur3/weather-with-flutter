
import '../services/location.dart';

import '../services/networking.dart';


class WeatherModel {


  Future<dynamic> getCityWeather(String cityName) async {
    Network network =  Network(url : 'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=4acfdf041fdcb8e53da865a72d723bea&units=metric');
    // print(await network.getData());
    var weather = await network.getData();
    return weather;
  }
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    var lat = location.latitude;
    var lon = location.longitude;
    Network networkHelper =  Network(url : 'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=4acfdf041fdcb8e53da865a72d723bea&units=metric');
    var weather = await networkHelper.getData();
    return weather;
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
