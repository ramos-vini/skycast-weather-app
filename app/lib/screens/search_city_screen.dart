import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/city_provider.dart';
import 'package:app/providers/location_provider.dart';
import 'package:app/models/city.dart';

class SearchCityScreen extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search for a city'; // Placeholder text

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: context.read<CityProvider>().fetchCities(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<City>? cities = context.watch<CityProvider>().cities;
          if (cities == null || cities.isEmpty) {
            return const Center(child: Text('No results found'));
          } else {
            return ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                City city = cities[index];
                return ListTile(
                  title: Text(
                      '${city.name} - ${city.state ?? ''} ${city.country}'),
                  onTap: () async {
                    await context
                        .read<LocationProvider>()
                        .setLocationByCity(context, city);
                    close(context, city);
                  },
                );
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('My Location'),
            onTap: () async {
              await context
                  .read<LocationProvider>()
                  .setLocationToCurrentPosition(context);
              close(context, 'My Location');
            },
          )
        ],
      );
    }

    return FutureBuilder(
      future: context.read<CityProvider>().fetchCities(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<City>? cities = context.watch<CityProvider>().cities;
          if (cities == null || cities.isEmpty) {
            return const Center(child: Text('No results found'));
          } else {
            return ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                City city = cities[index];
                return ListTile(
                  title: Text(
                      '${city.name} - ${city.state ?? ''} ${city.country}'),
                  onTap: () async {
                    await context
                        .read<LocationProvider>()
                        .setLocationByCity(context, city);
                    close(context, city);
                  },
                );
              },
            );
          }
        }
      },
    );
  }
}
