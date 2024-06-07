// // To parse this JSON data, do
// //
// //     final farmDataModel = farmDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// FarmDataModel farmDataModelFromJson(String str) =>
//     FarmDataModel.fromJson(json.decode(str));

// String farmDataModelToJson(FarmDataModel data) => json.encode(data.toJson());

// class FarmDataModel {
//   FarmDataModel({
//     required this.userId,
//     required this.farmDetails,
//     required this.cropDetails,
//   });

//   final String userId;
//   final FarmDetails farmDetails;
//   final List<CropDetail> cropDetails;

//   FarmDataModel copyWith({
//     String? userId,
//     FarmDetails? farmDetails,
//     List<CropDetail>? cropDetails,
//   }) =>
//       FarmDataModel(
//         userId: userId ?? this.userId,
//         farmDetails: farmDetails ?? this.farmDetails,
//         cropDetails: cropDetails ?? this.cropDetails,
//       );

//   factory FarmDataModel.fromJson(Map<String, dynamic> json) => FarmDataModel(
//         userId: json["userId"],
//         farmDetails: FarmDetails.fromJson(json["farmDetails"]),
//         cropDetails: List<CropDetail>.from(
//             json["cropDetails"].map((x) => CropDetail.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "farmDetails": farmDetails.toJson(),
//         "cropDetails": List<dynamic>.from(cropDetails.map((x) => x.toJson())),
//       };
// }

// List<CropDetail> cropDetailFromJson(String str) =>
//     List<CropDetail>.from(json.decode(str).map((x) => CropDetail.fromJson(x)));

// String cropDetailToJson(List<CropDetail> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CropDetail {
//   CropDetail({
//     required this.nameOfCrop,
//     required this.cropType,
//     required this.sowingDate,
//     required this.cropArea,
//     required this.cropAreaUnit,
//     required this.cropDescription,
//     required this.cropReportStatus,
//   });

//   final String nameOfCrop;
//   final String cropType;
//   final DateTime sowingDate;
//   final double cropArea;
//   final String cropAreaUnit;
//   final String cropDescription;
//   final String cropReportStatus;

//   CropDetail copyWith({
//     String? nameOfCrop,
//     String? cropType,
//     DateTime? sowingDate,
//     double? cropArea,
//     String? cropAreaUnit,
//     String? cropDescription,
//     String? cropReportStatus,
//   }) =>
//       CropDetail(
//         nameOfCrop: nameOfCrop ?? this.nameOfCrop,
//         cropType: cropType ?? this.cropType,
//         sowingDate: sowingDate ?? this.sowingDate,
//         cropArea: cropArea ?? this.cropArea,
//         cropAreaUnit: cropAreaUnit ?? this.cropAreaUnit,
//         cropDescription: cropDescription ?? this.cropDescription,
//         cropReportStatus: cropReportStatus ?? this.cropReportStatus,
//       );

//   factory CropDetail.fromJson(Map<String, dynamic> json) => CropDetail(
//         nameOfCrop: json["nameOfCrop"],
//         cropType: json["cropType"],
//         sowingDate: DateTime.parse(json["sowingDate"]),
//         cropArea: json["cropArea"],
//         cropAreaUnit: json["cropAreaUnit"],
//         cropDescription: json["cropDescription"],
//         cropReportStatus: json["cropReportStatus"],
//       );

//   Map<String, dynamic> toJson() => {
//         "nameOfCrop": nameOfCrop,
//         "cropType": cropType,
//         "sowingDate": sowingDate.toString(),
//         "cropArea": cropArea.toString(),
//         "cropAreaUnit": cropAreaUnit,
//         "cropDescription": cropDescription,
//         "cropReportStatus": cropReportStatus,
//       };
// }


// FarmDetails farmDetailsFromJson(String str) => FarmDetails.fromJson(json.decode(str));

// String farmDetailsToJson(FarmDetails data) => json.encode(data.toJson());

// class FarmDetails {
//   FarmDetails({
//     required this.type,
//     required this.coordinates,
//     required this.farmName,
//     required this.farmArea,
//     required this.farmAreaUnit,
//     required this.address,
//     required this.state,
//     required this.pinCode,
//   });

//   final String type;
//   final List<double> coordinates;
//   final String farmName;
//   final double farmArea;
//   final String farmAreaUnit;
//   final String address;
//   final String state;
//   final String pinCode;

//   FarmDetails copyWith({
//     String? type,
//     List<double>? coordinates,
//     String? farmName,
//     double? farmArea,
//     String? farmAreaUnit,
//     String? address,
//     String? state,
//     String? pinCode,
//   }) =>
//       FarmDetails(
//         type: type ?? this.type,
//         coordinates: coordinates ?? this.coordinates,
//         farmName: farmName ?? this.farmName,
//         farmArea: farmArea ?? this.farmArea,
//         farmAreaUnit: farmAreaUnit ?? this.farmAreaUnit,
//         address: address ?? this.address,
//         state: state ?? this.state,
//         pinCode: pinCode ?? this.pinCode,
//       );

//   factory FarmDetails.fromJson(Map<String, dynamic> json) => FarmDetails(
//         type: json["type"],
//         coordinates:
//             List<double>.from(json["coordinates"].map((x) => x.toDouble())),
//         farmName: json["farmName"],
//         farmArea: json["farmArea"].toDouble(),
//         farmAreaUnit: json["farmAreaUnit"],
//         address: json["address"],
//         state: json["state"],
//         pinCode: json["pinCode"],
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "coordinates": List<double>.from(coordinates.map((x) => x)),
//         "farmName": farmName,
//         "farmArea": farmArea.toString(),
//         "farmAreaUnit": farmAreaUnit,
//         "address": address,
//         "state": state,
//         "pinCode": pinCode,
//       };
// }
