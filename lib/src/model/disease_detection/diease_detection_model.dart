import 'package:kisaan_station/src/util/services/shared_preferences.dart';

class DiseaseSearchModel {
  String? message;
  List<SearchResults>? searchResults;

  DiseaseSearchModel({this.message, this.searchResults});

  DiseaseSearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['searchResults'] != null) {
      searchResults = <SearchResults>[];
      json['searchResults'].forEach((v) {
        searchResults!.add(SearchResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (searchResults != null) {
      data['searchResults'] =
          searchResults!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchResults {
  String english = "";
  String hindi = "";

  SearchResults({required this.english, required this.hindi});

  SearchResults.fromJson(Map<String, dynamic> json) {
    english = json['english'] ?? "";
    hindi = json['hindi'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['english'] = english;
    data['hindi'] = hindi;
    return data;
  }
}



class DiseaseUploadModel {
  String userId;
  String cropName;
  String diseaseName;

  DiseaseUploadModel({
    required this.cropName,
    required this.diseaseName,
    required this.userId
  });

  factory DiseaseUploadModel.fromJson(Map<String, dynamic> json) {
    return DiseaseUploadModel(
      cropName: json['cropName'],
      diseaseName: json['diseaseName'],
      userId: UserPreferences.userId
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cropName': cropName,
      'diseaseName': diseaseName,
      'userId': userId
    };
  }
}



class DiseaseGetModel {
  String? cropName;
  String? diseaseName;
  List<Images>? images;
  String? uploadedAt;
  String? sId;

  DiseaseGetModel(
      { this.cropName,
         this.diseaseName,
        this.images,
        this.uploadedAt,
        this.sId});

  DiseaseGetModel.fromJson(Map<String, dynamic> json) {
    cropName = json['cropName'];
    diseaseName = json['diseaseName'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    uploadedAt = json['uploadedAt'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cropName'] = this.cropName;
    data['diseaseName'] = this.diseaseName;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['uploadedAt'] = this.uploadedAt;
    data['_id'] = this.sId;
    return data;
  }
}

class Images {
  String? mimeType;
  String? url;
  String? sId;

  Images({this.mimeType, this.url, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    mimeType = json['mimeType'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mimeType'] = this.mimeType;
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}