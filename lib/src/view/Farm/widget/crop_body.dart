import 'package:flutter/material.dart';


class CropBody {
  CropBody(this.key);

  final Key key;

  final TextEditingController cropName = TextEditingController();
  final TextEditingController cropArea = TextEditingController();
  final TextEditingController cropUnit = TextEditingController();
  final TextEditingController cropDesc = TextEditingController();
  final TextEditingController showingDate = TextEditingController();
}