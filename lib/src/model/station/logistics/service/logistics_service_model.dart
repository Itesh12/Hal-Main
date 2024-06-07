


import '../../../../infrastructure/repository/station/service/drone_service_repo.dart';

class BookLogisticsModel {
  String vehicleCategory;
  String passengersCount;
  String cargoLoad;
  String tripType;
  TripLocationData startPointLocation;
  TripLocationData dropPointLocation;
  CargoDimension cargoDimension;
  BookLogisticsModel({
    required this.vehicleCategory,
    required this.passengersCount,
    required this.cargoLoad,
    required this.tripType,
    required this.startPointLocation,
    required this.dropPointLocation,
    required this.cargoDimension
  });

  factory BookLogisticsModel.fromJson(Map<String, dynamic> json) {
    return BookLogisticsModel(
      vehicleCategory: json['vehicleCategory'],
      passengersCount: json['passengersCount'],
      cargoLoad: json['cargoLoad'],
      tripType: json['tripType'],
      cargoDimension: CargoDimension.fromJson(json['cargoDimension']),
      startPointLocation: TripLocationData.fromJson(json['startPointLocation']),
      dropPointLocation: TripLocationData.fromJson(json['dropPointLocation']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleCategory': vehicleCategory,
      'passengersCount': passengersCount,
      'cargoLoad': cargoLoad,
      'tripType': tripType,
      'cargoDimension': cargoDimension,
      "startPointLocation" : startPointLocation,
      "dropPointLocation" : dropPointLocation
    };
  }
}





class CargoDimension {
  String length;
  String width;

  CargoDimension({
    required this.length,
    required this.width,
  });

  factory CargoDimension.fromJson(Map<String, dynamic> json) {
    return CargoDimension(
      length: json['length'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'width': width,
    };
  }
}