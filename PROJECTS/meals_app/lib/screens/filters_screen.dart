import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_options.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            // Filter.glutenFree: Filter,
            // Filter.lactoseFree: _lactoseFreeFilterSet,
            // Filter.vegetarian: _vegetarianFilterSet,
            // Filter.vegan: _veganFilterSet,
          });
        },
        child: const Column(
          children: [
            FilterOptions(option: "Gluten-free"),
            FilterOptions(option: "Lactose-free"),
            FilterOptions(option: "Vegetarian"),
            FilterOptions(option: "Vegan"),
          ],
        ),
      ),
    );
  }
}
