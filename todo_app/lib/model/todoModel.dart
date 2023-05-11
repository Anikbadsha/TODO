class TodoModel {
  TodoModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  TodoModel.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  int? code;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.title,
    this.note,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    isCompleted = json['is_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? note;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  int? isCompleted;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['note'] = note;
    map['start_date'] = startDate;
    map['start_time'] = startTime;
    map['end_date'] = endDate;
    map['end_time'] = endTime;
    map['is_completed'] = isCompleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
