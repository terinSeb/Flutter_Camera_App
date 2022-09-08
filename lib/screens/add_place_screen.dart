import 'package:flutter/material.dart';
import 'package:flutter_camera_app/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});
  static const routeName = './add-place';
  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ImageInput()
                ],
              ),
            ),
          )),
          // const Text('User Input'),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                // minimumSize: Size.zero,
                padding: EdgeInsets.zero,
              ))
        ],
      ),
    );
  }
}
