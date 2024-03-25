import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({
    required this.places,
    required this.onShowDetail,
    super.key,
  });

  final List<Place> places;
  final void Function(Place place) onShowDetail;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: ((context, index) {
        final item = places[index];
        return ListTile(
          onTap: () => onShowDetail(item),
          title: Text(
            item.name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        );
      }),
    );
  }
}
