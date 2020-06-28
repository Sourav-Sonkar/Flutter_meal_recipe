import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentfilters;

  FiltersScreen(this.currentfilters, this.saveFilters);

  static const routeName = "/filters";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FiltersScreenState();
  }
}

class FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentfilters['gluten'];
    _lactoseFree = widget.currentfilters['lactose'];
    _vegan = widget.currentfilters['vegan'];
    _vegetarian = widget.currentfilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                "lactose": _lactoseFree,
                "vegetarian": _vegetarian,
                "vegan": _vegan
              };

              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                    "Gluten Free", "Only include free Gluten meal", _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile("Lactose Free",
                    "Only include free Lactose meal", _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile("Vegetarian Free",
                    "Only include vegetarian meal", _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchListTile(
                    "Vegan Free", "Only include free Vegan meal", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      onChanged: updateValue,
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
    );
  }
}
