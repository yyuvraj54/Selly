import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerButton extends StatefulWidget {
  final Function(List<String>) onImagesPicked;

  ImagePickerButton({required this.onImagesPicked});

  @override
  _ImagePickerButtonState createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  List<String> _imagePaths = [];

  Future<void> _pickImages() async {
    final List<XFile>? images =
    await ImagePicker().pickMultiImage(imageQuality: 50);

    if (images != null) {
      setState(() {
        _imagePaths = images.map((image) => image.path).toList();
      });
      widget.onImagesPicked(_imagePaths);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _pickImages,
      child: Text('Pick Images'),
    );
  }
}
