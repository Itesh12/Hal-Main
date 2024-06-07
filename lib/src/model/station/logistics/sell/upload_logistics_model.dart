import 'package:flutter/material.dart';



class LogisticsRegistrationResponse {
  final String message;
  final String hsId;

  LogisticsRegistrationResponse({
    required this.message,
    required this.hsId,
  });

  factory LogisticsRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return LogisticsRegistrationResponse(
      message: json['message'],
      hsId: json['hsId'],
    );
  }
}

class LogisticModel {
  OwnerDetailsModel ownerDetails;
  DriverDetailsModel driverDetails;
  AddressDetailsModel address;
  VehicleDetailsModel vehicleDetails;
  BankDetailsModel bankDetails;

  LogisticModel({
    required this.ownerDetails,
    required this.driverDetails,
    required this.address,
    required this.vehicleDetails,
    required this.bankDetails,
  });

  factory LogisticModel.fromJson(Map<String, dynamic> json) {
    return LogisticModel(
      ownerDetails: OwnerDetailsModel.fromJson(json['ownerDetails']),
      driverDetails: DriverDetailsModel.fromJson(json['driverDetails']),
      address: AddressDetailsModel.fromJson(json['address']),
      vehicleDetails: VehicleDetailsModel.fromJson(json['vehicleDetails']),
      bankDetails: BankDetailsModel.fromJson(json['bankDetails']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerDetails': ownerDetails.toJson(),
      'driverDetails': driverDetails.toJson(),
      'address': address.toJson(),
      'vehicleDetails': vehicleDetails.toJson(),
      'bankDetails': bankDetails.toJson(),
    };
  }
}

class OwnerDetailsModel {
  String name;
  String mobileNo;
  String emailId;
  String gender;

  OwnerDetailsModel({
    required this.name,
    required this.mobileNo,
    required this.emailId,
    required this.gender,
  });

  factory OwnerDetailsModel.fromJson(Map<String, dynamic> json) {
    return OwnerDetailsModel(
      name: json['name'],
      mobileNo: json['mobileNo'],
      emailId: json['emailId'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobileNo': mobileNo,
      'emailId': emailId,
      'gender': gender,
    };
  }
}

class DriverDetailsModel {
  String name;
  String mobileNo;
  String emailId;
  String gender;

  DriverDetailsModel({
    required this.name,
    required this.mobileNo,
    required this.emailId,
    required this.gender,
  });

  factory DriverDetailsModel.fromJson(Map<String, dynamic> json) {
    return DriverDetailsModel(
      name: json['name'],
      mobileNo: json['mobileNo'],
      emailId: json['emailId'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobileNo': mobileNo,
      'emailId': emailId,
      'gender': gender,
    };
  }
}

class AddressDetailsModel {
  String pincode;
  String houseNo;
  String state;
  String district;
  String village;
  String? landmark;

  AddressDetailsModel({
    required this.pincode,
    required this.houseNo,
    required this.state,
    required this.district,
    required this.village,
    this.landmark = "",
  });

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    return AddressDetailsModel(
      pincode: json['pincode'],
      houseNo: json['houseNo'],
      state: json['state'],
      district: json['district'],
      village: json['village'],
      landmark: json['landmark'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pincode': pincode,
      'houseNo': houseNo,
      'state': state,
      'district': district,
      'village': village,
      'landmark': landmark ?? "",
    };
  }
}

class VehicleDetailsModel {
  String category;
  String vehicleType;
  String fuelType;
  String loadCapacity;
  String brand;
  String model;
  String varient;
  String purchasedYear;
  String regNo;
  String distanceTravelled;

  VehicleDetailsModel({
    required this.category,
    required this.vehicleType,
    required this.fuelType,
    required this.loadCapacity,
    required this.brand,
    required this.model,
    required this.varient,
    required this.purchasedYear,
    required this.regNo,
    required this.distanceTravelled,
  });

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) {
    return VehicleDetailsModel(
      category: json['category'],
      vehicleType: json['bodyType'],
      fuelType: json['fuelType'],
      loadCapacity: json['loadCapacity'],
      brand: json['brand'],
      model: json['model'],
      varient: json['varient'],
      purchasedYear: json['purchasedYear'],
      regNo: json['regNo'],
      distanceTravelled: json['distanceTravelled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'vehicleType': vehicleType,
      'fuelType': fuelType,
      'loadCapacity': loadCapacity,
      'brand': brand,
      'model': model,
      'varient': varient,
      'purchasedYear': purchasedYear,
      'regNo': regNo,
      'distanceTravelled': distanceTravelled,
    };
  }
}

class BankDetailsModel {
  String name;
  String branch;
  String accountNo;
  String holderName;
  String ifsc;

  BankDetailsModel({
    required this.name,
    required this.branch,
    required this.accountNo,
    required this.holderName,
    required this.ifsc,
  });

  factory BankDetailsModel.fromJson(Map<String, dynamic> json) {
    return BankDetailsModel(
      name: json['name'],
      branch: json['branch'],
      accountNo: json['accountNo'],
      holderName: json['holderName'],
      ifsc: json['ifsc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'branch': branch,
      'accountNo': accountNo,
      'holderName': holderName,
      'ifsc': ifsc,
    };
  }
}

class KycDetailsModel {
  String aadhaarNo;
  String panNo;
  String rcNo;
  String dlNo;
  String insuranceNo;
  String pollutionNo;

  KycDetailsModel({
    required this.aadhaarNo,
    required this.panNo,
    required this.rcNo,
    required this.dlNo,
    required this.insuranceNo,
    required this.pollutionNo,
  });

  factory KycDetailsModel.fromJson(Map<String, dynamic> json) {
    return KycDetailsModel(
      aadhaarNo: json['aadhaarNo'],
      panNo: json['panNo'],
      rcNo: json['rcNo'],
      dlNo: json['dlNo'],
      insuranceNo: json['insuranceNo'],
      pollutionNo: json['pollutionNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aadhaarNo': aadhaarNo,
      'panNo': panNo,
      'rcNo': rcNo,
      'dlNo': dlNo,
      'insuranceNo': insuranceNo,
      'pollutionNo': pollutionNo,
    };
  }
}