import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  Future<void> _takePicture() async {
    final picker = ImagePicker();
    // ignore: unused_local_variable
    final imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
  }

  // ignore: non_constant_identifier_names
  File? _StoredImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          // ignore: unnecessary_null_comparison
          child: _StoredImage != null
              ? Image.file(
                  _StoredImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: ElevatedButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera),
          label: const Text('Take Picture'),
        ))
      ],
    );
  }
}
