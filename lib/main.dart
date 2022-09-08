import 'package:flutter/material.dart';
import 'package:flutter_camera_app/providers/great_places.dart';
import 'package:flutter_camera_app/screens/add_place_screen.dart';
import 'package:flutter_camera_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlaceListScreen(),
        routes: {AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen()},
      ),
    );
  }
}
