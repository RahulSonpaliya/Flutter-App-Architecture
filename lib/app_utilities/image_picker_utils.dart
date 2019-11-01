
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; //image_picker: ^0.6.0+16
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart'; //flutter_image_compress: ^0.6.3

class ImagePickerUtil {
  static Future<File> imageFromCamera() async {
    var imagePickerResponse = await ImagePicker.pickImage(source: ImageSource.camera);
    return imagePickerResponse;
  }

  static Future<File> compressImage(File image) async {
    if(image == null) return null;
    // getting a temp directory path for saving
    final Directory tempDirectory = await getTemporaryDirectory();
    // copy the file to a new path
    File newImage = await image.copy('${tempDirectory.path}/${DateTime.now()}.png');
    newImage = await FlutterImageCompress.compressAndGetFile(image.absolute.path, newImage.absolute.path, minHeight: 1280, minWidth: 720, quality: 90);
    return newImage;
  }

  static Future<String> getExternalStoragePath() async {
    final directory = await getExternalStorageDirectory();
    final myImagePath = '${directory.path}/MyImages_Flutter';
    final myImgDir = new Directory(myImagePath);
    var dirExist = await myImgDir.exists();
    if(!dirExist){
      await myImgDir.create();
    }
    return myImagePath;
  }

  static Future<File> imageFromGallery() async {
    var imagePickerResponse = await ImagePicker.pickImage(source: ImageSource.gallery);
    return imagePickerResponse;
  }

  static Future<File> showCameraOrGalleryChooser(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  title: new Text('Pick from camera'),
                  onTap: () async {
                    var image = await imageFromCamera();
                    Navigator.pop(context, image);
                  }
                ),
                new ListTile(
                  title: new Text('Pick from gallery'),
                  onTap: () async {
                    var image = await imageFromGallery();
                    Navigator.pop(context, image);
                  }
                ),
              ],
            ),
          );
        }
    );
  }

}

