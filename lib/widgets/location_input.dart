import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  // ignore: prefer_typing_uninitialized_variables
  String? _previewImageUrl;
  Future<Void?> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    // ignore: avoid_print
    print(locData.longitude);
    // ignore: avoid_print
    print(locData.latitude);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: 170,
          width: double.infinity,
          // ignore: unnecessary_null_comparison
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Choosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Select a Location'),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
