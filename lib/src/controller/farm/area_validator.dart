import 'package:flutter/foundation.dart';

class AreaNotifier extends ChangeNotifier {
  double _totalArea = 0;

  double get totalArea => _totalArea;

  void setTotalArea(String totalArea) {
    _totalArea = double.parse(totalArea);
    print("total areas set to $_totalArea");
    
    
    notifyListeners();
  }

  final Map<Key,double> _cropAreas = {};

  String? validateCropAreaField(String field){
    print("come function");
    print("values: ${_cropAreas.values}");
   final validate =  _cropAreas.values.fold(0.0, (previousValue, element) => previousValue+element).compareTo(_totalArea);
   if (validate < 1){
     print("validation true ");


     return null;
   }
   else {
     print("validation false");

     return 'Crop Area cannot be greater than \ntotal Farm Area';
   }
  }

  Map<Key,double> get cropAreas => _cropAreas;

 void setCropAreas(Map<Key,double> cropAreas) {
    _cropAreas.addAll(cropAreas);
    print("crop areas set");
    notifyListeners();
  }


}
