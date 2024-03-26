import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/detail_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

import 'package:favorite_places/screens/new_place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeProvider);

    Widget content = Center(
        child: Text(
      "Belum ada alamat yang terdaftar.",
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    ));

    if (places.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: PlacesListWidget(
          places: places,
          onShowDetail: (item) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPlace(place: item),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alamat Anda"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NewPlace()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
