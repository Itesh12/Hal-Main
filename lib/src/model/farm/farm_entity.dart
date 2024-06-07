
class FarmEntity {
  final HalSaathi? halSaathi;
  final Dc? dc;
  final FarmDetails farmDetails;
  final String id;
  final String userId;
  final String farmerName;
  final String mobileNo;
  final List<CropDetail> cropDetails;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FarmEntity({
    required this.halSaathi,
    required this.dc,
    required this.farmDetails,
    required this.id,
    required this.userId,
    required this.farmerName,
    required this.mobileNo,
    required this.cropDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FarmEntity.fromJson(Map<String, dynamic> json) => FarmEntity(
    halSaathi: HalSaathi.fromJson(json['halSaathi']),
        dc: Dc.fromJson(json['dc']),
        farmDetails: FarmDetails.fromJson(json['farmDetails']),
        id: json['_id'] ?? "",
        userId: json['userId'] ?? "",
        farmerName: json['farmerName'] ?? "",
        mobileNo: json['mobileNo'],
        cropDetails: List<CropDetail>.from(
            json['cropDetails'].map((x) => CropDetail.fromJson(x))),
        createdAt: DateTime.tryParse(json['createdAt']),
        updatedAt: DateTime.tryParse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'farmDetails': farmDetails.toJson(),
        '_id': id,
        'userId': userId,
        'farmerName': farmerName,
        'mobileNo': mobileNo,
        'cropDetails': List<dynamic>.from(cropDetails.map((x) => x.toJson())),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class HalSaathi {
  final String hsId;
  final String hsName;

  HalSaathi({required this.hsId, required this.hsName});

  factory HalSaathi.fromJson(Map<String, dynamic> json) {
    return HalSaathi(
      hsId: json['hsId'] ?? "",
      hsName: json['hsName'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hsId': hsId,
      'hsName': hsName,
    };
  }
}

class Dc {
  final String dcName;
  final String dcId;

  Dc({required this.dcName, required this.dcId});

  factory Dc.fromJson(Map<String, dynamic> json) {
    return Dc(
      dcName: json['dcName'] ?? "",
      dcId: json['dcId'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dcName': dcName,
      'dcId': dcId,
    };
  }
}

class FarmDetails {
  String farmStatus;
  Irrigation irrigation;
  FarmLocation location;
  Plot? plot;
  String farmName;
  double farmArea;
  String farmAreaUnit;
  String address;
  String state;
  int pincode;

  FarmDetails({
    required this.farmStatus,
    required this.irrigation,
    required this.location,
    required this.plot,
    required this.farmName,
    required this.farmArea,
    required this.farmAreaUnit,
    required this.address,
    required this.state,
    required this.pincode,
  });

  factory FarmDetails.fromJson(Map<String, dynamic> json) {
    final List coord = json['plot']['coordinates'];
    bool isPost = false;
    if(coord.isNotEmpty){
      isPost = true;
    }
    else{
      isPost = false;
    }
    return FarmDetails(
      farmStatus: json['farmStatus'],
      irrigation: Irrigation.fromJson(json['irrigation']),
      location: FarmLocation.fromJson(json['location']),
      plot: isPost ? Plot.fromJson(json['plot']) : null,
      farmName: json['farmName'],
      farmArea: json['farmArea'].toDouble(),
      farmAreaUnit: json['farmAreaUnit'],
      address: json['address'],
      state: json['state'],
      pincode: json['pincode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'farmStatus': farmStatus,
      'irrigation': irrigation.toJson(),
      'location': location.toJson(),
      'plot': plot == null ? {} : plot!.toJson(),
      'farmName': farmName,
      'farmArea': farmArea,
      'farmAreaUnit': farmAreaUnit,
      'address': address,
      'state': state,
      'pincode': pincode,
    };
  }
}

class Irrigation {
  final String status;
  String? period;
  int? waterQuantity;
  String? method;

  Irrigation({
    required this.status,
    this.period,
    this.waterQuantity,
    this.method,
  });

  factory Irrigation.fromJson(Map<String, dynamic> json) => Irrigation(
        status: json['status'],
        period: json['period'],
        waterQuantity: json['waterQuantity'],
        method: json['method'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'period': period,
        'waterQuantity': waterQuantity,
        'method': method,
      };
}
class FarmLocation {
  String type;
  List<double> coordinates;

  FarmLocation({required this.type, required this.coordinates});

  factory FarmLocation.fromJson(Map<String, dynamic> json) {
    return FarmLocation(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates'].map((x) => x.toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}


class Plot {
  String type;
  List<Point> coordinates;
  Centroid? centroid;

  Plot({required this.type, required this.coordinates, required this.centroid});

  factory Plot.fromJson(Map<String, dynamic> json) {
    return Plot(
      type: json['type'],
      coordinates: (json['coordinates'] as List).map((e) => Point.fromJson(e)).toList(),
      centroid: Centroid.fromJson(json['centroid']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates.map((e) => e.toJson()).toList(),
      'centroid': centroid?.toJson(),
    };
  }
}

class Point {
  double lat;
  double lng;

  Point({required this.lat, required this.lng});

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class Centroid {
  double lat;
  double lng;

  Centroid({required this.lat, required this.lng});

  factory Centroid.fromJson(Map<String, dynamic> json) {
    return Centroid(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}


// class FarmDetails {
//   final Irrigation? irrigation;
//   final String type;
//   final String farmStatus;
//   final List<double>?  coordinates;
//   final String farmName;
//   final int farmArea;
//   final String farmAreaUnit;
//   final String address;
//   final String state;
//   final int pincode;
//
//   FarmDetails({
//     required this.irrigation,
//     required this.type,
//     required this.farmStatus,
//     required this.coordinates,
//     required this.farmName,
//     required this.farmArea,
//     required this.farmAreaUnit,
//     required this.address,
//     required this.state,
//     required this.pincode,
//   });
//
//   factory FarmDetails.fromJson(Map<String, dynamic> json) => FarmDetails(
//         irrigation: Irrigation.fromJson(json['irrigation']),
//         type: json['type'] ?? "",
//         farmStatus: json['farmStatus'] ?? "",
//         coordinates:
//             List<double>.from(json['coordinates'].map((x) => x.toDouble())),
//         farmName: json['farmName'] ?? "",
//         farmArea: json['farmArea'],
//         farmAreaUnit: json['farmAreaUnit'] ?? "",
//         address: json['address'] ?? "",
//         state: json['state'] ?? "",
//         pincode: json['pincode'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         'irrigation': irrigation!.toJson(),
//         'type': type,
//         'farmStatus': farmStatus,
//         'coordinates': List<dynamic>.from(coordinates!.map((x) => x)),
//         'farmName': farmName,
//         'farmArea': farmArea,
//         'farmAreaUnit': farmAreaUnit,
//         'address': address,
//         'state': state,
//         'pincode': pincode,
//       };
// }
//


class CropDetail {
  final String nameOfCrop;
  final DateTime? sowingDate;
  final int cropArea;
  final String cropAreaUnit;
  final String cropDescription;
  final String cropReportStatus;
  String? id;
  DateTime? requestedAt;

  CropDetail({
    required this.nameOfCrop,
    required this.sowingDate,
    required this.cropArea,
    required this.cropAreaUnit,
    required this.cropDescription,
    required this.cropReportStatus,
    this.id,
    this.requestedAt,
  });

  factory CropDetail.fromJson(Map<String, dynamic> json) {

    DateTime? dateTime;
    try {
       dateTime = DateTime.tryParse(json['sowingDate']);
    } catch (e) {
      print("Error parsing date: $e");
    }

    return CropDetail(
      nameOfCrop: json['nameOfCrop'],
      sowingDate: dateTime,
      cropArea: json['cropArea'],
      cropAreaUnit: json['cropAreaUnit'],
      cropDescription: json['cropDescription'],
      cropReportStatus: json['cropReportStatus'],
      id: json['_id'],
      requestedAt: DateTime.tryParse(json['requestedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'nameOfCrop': nameOfCrop,
        'sowingDate': sowingDate,
        'cropArea': cropArea,
        'cropAreaUnit': cropAreaUnit,
        'cropDescription': cropDescription,
        'cropReportStatus': cropReportStatus,
      };
}
