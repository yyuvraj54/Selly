import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRepository {
  Future<List<String>> uploadImagesToFirebaseStorage(String username,  List<String> imagePaths) async {
    try {
      List<String> uploadedImageUrls = [];

      // Iterate through each image path
      for (String imagePath in imagePaths) {
        // Get the file from the image path
        print("uploading filename : ${imagePath}");
        File imageFile = File(imagePath);
        print("uploading fileref : ${imageFile}");

        // Get a reference to the location where we'll store our image
        final Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('$username/${DateTime.now().millisecondsSinceEpoch}${imageFile.path.split('/').last}');

        // Upload the file to Firebase Storage
        final UploadTask uploadTask =  storageReference.putFile(imageFile,SettableMetadata(contentType: 'image/jpeg'));

        print("uploadDone");



        // Get the URL of the uploaded image
        final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
        final String imageUrl = await downloadUrl.ref.getDownloadURL();
        print("Downloadable url: ${imageUrl}");


        uploadedImageUrls.add(imageUrl);
      }
      return uploadedImageUrls;
    }
    catch (e) {
      print('Error uploading images to Firebase Storage: $e');
      throw e;

    }
  }
}
