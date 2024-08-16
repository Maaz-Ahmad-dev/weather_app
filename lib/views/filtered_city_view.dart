import 'package:dep_task_two/models/famous_city.dart';
import 'package:dep_task_two/screens/weather_details_screen.dart';
import 'package:dep_task_two/widgets/famous_city_tile.dart';
import 'package:flutter/material.dart';

class FilteredCityView extends StatelessWidget {
  final List<FamousCity> filterCities;
  const FilteredCityView({super.key, required this.filterCities});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: filterCities.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          final city = filterCities[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => WeatherDetailScreen(cityName: city.name)));
            },
            child: FamousCityTile(
              city: city.name,
              index: index,
            ),
          );
        });
  }
}
