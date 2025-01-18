import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;
  final bool isNetworkImage;
  final Map<String, String>? headers;

  const FullScreenImageViewer({
    Key? key,
    required this.imagePath,
    required this.isNetworkImage,
    this.headers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InkWell(
          onTap: () => Get.back(),
          child: PhotoView(
            imageProvider: isNetworkImage
                ? NetworkImage(imagePath, headers: headers)
                : FileImage(File(imagePath)) as ImageProvider,
            backgroundDecoration: BoxDecoration(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
