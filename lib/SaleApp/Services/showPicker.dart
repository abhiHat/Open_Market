import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File _image;

void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}

_imgFromCamera() async {
  PickedFile image = await ImagePicker.platform.pickImage(
      source: ImageSource.camera, imageQuality: 50
  );



  // setState(() {
  //   _image = image;
  // });
}

_imgFromGallery() async {
  PickedFile image = await  ImagePicker.platform.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );
  //
  // setState(() {
  //   _image = image;
  // });
}