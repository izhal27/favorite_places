import 'package:favorite_places/screens/detail_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/new_place.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final List<Place> _listOfPlaces = [];

  void _addPlace() async {
    final result = await Navigator.of(context).push<Place>(
      MaterialPageRoute(builder: (context) => const NewPlace()),
    );
    if (result != null) {
      setState(() {
        _listOfPlaces.add(result);
      });
    }
  }

  void _showDetail(Place item) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailPlace(place: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Text(
      "Belum ada alamat yang terdaftar.",
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    ));

    if (_listOfPlaces.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: PlacesListWidget(
          places: _listOfPlaces,
          onShowDetail: (item) => _showDetail(item),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alamat Anda"),
        actions: [
          IconButton(
            onPressed: _addPlace,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
