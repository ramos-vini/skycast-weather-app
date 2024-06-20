class Forecast {
  final DateTime date;
  final double temp;
  final double tempMin;
  final double tempMax;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final String description;
  final String main;
  final String icon;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final int clouds;
  final int visibility;
  final double? pop;
  final double? rainVolume;
  final double? snowVolume;

  Forecast({
    required this.date,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.description,
    required this.main,
    required this.icon,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.clouds,
    required this.visibility,
    this.pop,
    this.rainVolume,
    this.snowVolume,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.parse(json['dt_txt']),
      temp: (json['main']['temp'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      windDeg: json['wind']['deg'],
      windGust: json['wind'].containsKey('gust') ? (json['wind']['gust'] as num).toDouble() : null,
      clouds: json['clouds']['all'],
      visibility: json['visibility'],
      pop: json.containsKey('pop') ? (json['pop'] as num).toDouble() : null,
      rainVolume: json.containsKey('rain') && json['rain'].containsKey('3h') ? (json['rain']['3h'] as num).toDouble() : null,
      snowVolume: json.containsKey('snow') && json['snow'].containsKey('3h') ? (json['snow']['3h'] as num).toDouble() : null,
    );
  }
}

class WeatherForecast {
  final List<Forecast> forecasts;
  final String cityName;

  WeatherForecast({required this.forecasts, required this.cityName});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Forecast> forecasts = list.map((i) => Forecast.fromJson(i)).toList();

    return WeatherForecast(
      forecasts: forecasts,
      cityName: json['city']['name'],
    );
  }
}