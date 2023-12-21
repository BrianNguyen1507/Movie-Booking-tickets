import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/material.dart';

String byteToStringConvert(String str) {
  List<int> bytes = base64.decode(str);
  String originalString = utf8.decode(bytes);
  return originalString;
}

Future<ui.Image> byteToImageConvert(String str) async {
  Uint8List bytes = base64.decode(str);

  ui.Codec codec = await ui.instantiateImageCodec(bytes);
  ui.FrameInfo frame;
  try {
    frame = await codec.getNextFrame();
  } finally {
    codec.dispose();
  }
  return frame.image;
}

Uint8List toUint(String str) {
  Uint8List bytes = base64.decode(str);
  return bytes;
}
