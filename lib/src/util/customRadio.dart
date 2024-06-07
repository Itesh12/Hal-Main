import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class CustomRadio extends ConsumerStatefulWidget {
  const CustomRadio({Key? key}) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}



class _CustomRadioState extends ConsumerState<CustomRadio> {
  final List<String> ringTone = [
    'Luna',
    'Oberon',
    'Phobos',
    'Rose',
    'Sunset',
    'Wood'
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}