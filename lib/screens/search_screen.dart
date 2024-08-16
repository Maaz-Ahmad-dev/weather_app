import 'package:dep_task_two/constants/app_colors.dart';
import 'package:dep_task_two/constants/text_styles.dart';
import 'package:dep_task_two/models/famous_city.dart';
import 'package:dep_task_two/views/filtered_city_view.dart';
import 'package:dep_task_two/views/gradient_container.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  late final TextEditingController searchController;
  List<FamousCity> filteredCities = famousCities.toList();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        const Column(
          children: [
            Text(
              "Pick Location",
              style: TextStyles.h1,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Find the area or city that you want to know the detailed weather info at this time",
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.accentBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20, top: 10),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    )),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    filteredCities = famousCities
                        .where((FamousCity) => FamousCity.name
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .toList();
                  });
                },
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            const LocationIcon()
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        // Famous City Grids
        // const FamousCityView(),
        FilteredCityView(filterCities: filteredCities)
      ]),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: Colors.white,
      ),
    );
  }
}
