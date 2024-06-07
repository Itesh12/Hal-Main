import 'package:flutter/material.dart';

import '../../constants/colors.dart';

SnackBar getSnackBar(String content) {
  return SnackBar(
    content: Text(content),
    backgroundColor: redError,
  );
}
