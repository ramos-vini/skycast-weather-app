class Weather {
  final Coord coord;
  final List<WeatherInfo> weather;
  final Main main;
  final Wind wind;
  final Clouds clouds;
  final Sys sys;
  final String name;

  Weather({
    required this.coord,
    required this.weather,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.sys,
    required this.name,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      coord: Coord.fromJson(json['coord'] ?? {}),
      weather: (json['weather'] as List)
          .map((i) => WeatherInfo.fromJson(i))
          .toList(),
      main: Main.fromJson(json['main'] ?? {}),
      wind: Wind.fromJson(json['wind'] ?? {}),
      clouds: Clouds.fromJson(json['clouds'] ?? {}),
      sys: Sys.fromJson(json['sys'] ?? {}),
      name: json['name'] ?? 'Unknown',
    );
  }
}

class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class WeatherInfo {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherInfo(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      id: json['id'] ?? 0,
      main: json['main'] ?? 'Unknown',
      description: json['description'] ?? 'Unknown',
      icon: json['icon'] ?? '01d',
    );
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      tempMin: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
      tempMax: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
      pressure: json['pressure'] ?? 0,
      humidity: json['humidity'] ?? 0,
    );
  }
}

class Wind {
  final double speed;
  final int deg;
  final double? gust; // gust is optional

  Wind({required this.speed, required this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
      deg: json['deg'] ?? 0,
      gust: (json['gust'] as num?)?.toDouble(),
    );
  }
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] ?? 0,
    );
  }
}

class Sys {
  final String country;
  final int sunrise;
  final int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'] ?? 'Unknown',
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
    );
  }
}
