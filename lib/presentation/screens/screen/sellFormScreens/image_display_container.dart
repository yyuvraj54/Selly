import 'dart:io';
import 'package:flutter/material.dart';

class ImageDisplayContainer extends StatefulWidget {
  final List<String> imagePaths;
  final Function(int) onDeleteImage; // Function to delete an image

  ImageDisplayContainer({required this.imagePaths, required this.onDeleteImage});

  @override
  _ImageDisplayContainerState createState() => _ImageDisplayContainerState();
}

class _ImageDisplayContainerState extends State<ImageDisplayContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Image.file(
                  File(widget.imagePaths[index]),
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(index);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Function to show delete confirmation dialog
  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Image"),
          content: Text("Are you sure you want to delete this image?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                setState(() {
                  widget.onDeleteImage(index); // Call the onDeleteImage callback
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
