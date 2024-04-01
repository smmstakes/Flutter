import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterOptions extends StatefulWidget {
  const FilterOptions({super.key, required this.option});

  final String option;

  @override
  State<FilterOptions> createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  bool _optionFilterSet = false;

  bool get isOptionSelected => _optionFilterSet;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _optionFilterSet,
      onChanged: (isChecked) {
        setState(() {
          _optionFilterSet = isChecked;
        });
      },
      title: Text(
        widget.option,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        "Only include ${widget.option[0].toLowerCase() + widget.option.substring(1)} meals.",
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
