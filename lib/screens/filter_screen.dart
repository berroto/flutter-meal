import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/Filters';
  const FilterScreen(
      {Key? key, required this.saveFilter, required this.currentFilters})
      : super(key: key);

  final Function saveFilter;
  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Your Filter'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilter(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildSwitchListTile('Gluten-Free',
                    'Only incuded gluten-free meals', _glutenFree, (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    'Lactose-Free',
                    'Only incuded lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(
                        () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
                buildSwitchListTile('Vegan', 'Only incuded vegan meals', _vegan, (newValue) {
            setState(
            () {
            _vegan = newValue;
            },
            );
                }),
                buildSwitchListTile(
                    'Vegeterian', 'Only incuded vegeterian meals', _vegetarian, (newValue) {
                  setState(
                        () {
                      _vegetarian = newValue;
                    },
                  );
                })
              ],
            ))
          ],
        ));
  }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        subtitle,
      ),
      onChanged: updateValue as Function(bool),
    );
  }
}
