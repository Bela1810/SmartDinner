import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartdinner/data/services/upload/select_image.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageState();
}

class _ImageState extends State<ImageScreen> {
  File? imagen_to_upload;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          imagen_to_upload != null
              ? Image.file(imagen_to_upload!)
              : Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  color: Colors.red,
                ),
          ElevatedButton(
              onPressed: () async {
                final imagen = await getImage();
                setState(() {
                  imagen_to_upload = File(imagen!.path);
                });
              },
              child: Text('Seleccionar imagen')),
          ElevatedButton(onPressed: () {}, child: Text('Subir imagen'))
        ],
      ),
    );
  }
}
