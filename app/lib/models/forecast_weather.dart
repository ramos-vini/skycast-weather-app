class Forecast {
  final DateTime date;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String description;

  Forecast({
    required this.date,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.description,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.parse(json['dt_txt']),
      temp: (json['main']['temp'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),
      description: json['weather'][0]['description'],
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