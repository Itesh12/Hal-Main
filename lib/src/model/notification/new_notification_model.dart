class NotificationModel {
  List<NotificationItem> list = [];
  int? unreadNotifications;

  NotificationModel({required this.list, this.unreadNotifications});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <NotificationItem>[];
      json['list'].forEach((v) {
        list.add(NotificationItem.fromJson(v));
      });
    }

    unreadNotifications = json['unreadNotifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list'] = list.map((v) => v.toJson()).toList();
      data['unreadNotifications'] = unreadNotifications;
    return data;
  }
}

class NotificationItem {
  NotificationContent? notification;
  Android? android;
  Data? data;
  String? sId;
  bool? view;

  NotificationItem({this.notification, this.android, this.data, this.sId, this.view});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    notification = json['notification'] != null
        ? NotificationContent.fromJson(json['notification'])
        : null;
    android =
    json['android'] != null ? Android.fromJson(json['android']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    sId = json['_id'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (android != null) {
      data['android'] = android!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['_id'] = sId;
    data['view'] = view;
    return data;
  }
}

class NotificationContent {
  String? title;
  String? body;
  String? image;

  NotificationContent({this.title, this.body, this.image});

  NotificationContent.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['image'] = image;
    return data;
  }
}

class Android {
  Notification? notification;

  Android({this.notification});

  Android.fromJson(Map<String, dynamic> json) {
    notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    return data;
  }
}


class Notification {
  String? image;

  Notification({this.image});

  Notification.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}

class Data {
  String? post;
  String? route;
  String? image;
  String? userImage;
  DateTime? eventTime;
  String? pdf;

  Data({this.post, this.route, this.image, this.userImage, this.eventTime});

  Data.fromJson(Map<String, dynamic> json) {
    post = json['post'] ?? "";
    route = json['route'] ?? "";
    image = json['image'] ?? "";
    userImage = json['userImage'] ?? "";
    eventTime = DateTime.tryParse(json['event_time'] ?? "") ?? DateTime.now();
    pdf = json['pdf'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post'] = post;
    data['route'] = route;
    data['image'] = image;
    data['userImage'] = userImage;
    data['event_time'] = eventTime;
    data['pdf'] = pdf;
    return data;
  }
}