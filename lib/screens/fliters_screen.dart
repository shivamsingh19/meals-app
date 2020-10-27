import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lastoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarain'];
    _vegan = widget.currentFilters['vegan'];
    _lastoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTitle(
    String title,
    String subTitle,
    bool currentValue,
    Function updatevalue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lastoseFree,
                'vegan': _vegan,
                'vegetarain': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Ajust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle(
                    'Gluten-free', 'Only gluten free meal ', _glutenFree,
                    (newVlaue) {
                  setState(() {
                    _glutenFree = newVlaue;
                  });
                }),
                _buildSwitchListTitle(
                    'Lastose-free', 'Only lastose free meal ', _lastoseFree,
                    (newVlaue) {
                  setState(() {
                    _lastoseFree = newVlaue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegetrain-free', 'Only vegetrain free meal ', _vegetarian,
                    (newVlaue) {
                  setState(() {
                    _vegetarian = newVlaue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegan-free', 'Only Vegan free meal ', _vegan, (newVlaue) {
                  setState(() {
                    _vegan = newVlaue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
