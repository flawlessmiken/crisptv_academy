class JobModel {
  bool? isSuccessful;
  String? message;
  Data? data;
  String? responseCode;

  JobModel({
    this.isSuccessful,
    this.message,
    this.data,
    this.responseCode,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      isSuccessful: json['isSuccessful'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      responseCode: json['responseCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccessful': isSuccessful,
      'message': message,
      'data': data?.toJson(),
      'responseCode': responseCode,
    };
  }
}

class Data {
  int? pageSize;
  int? currentPage;
  int? totalPages;
  int? totalRecords;
  List<Record>? records;

  Data({
    this.pageSize,
    this.currentPage,
    this.totalPages,
    this.totalRecords,
    this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var recordsFromJson = json['records'] as List?;
    List<Record>? recordsList = recordsFromJson != null
        ? recordsFromJson.map((recordJson) => Record.fromJson(recordJson)).toList()
        : null;

    return Data(
      pageSize: json['pageSize'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      totalRecords: json['totalRecords'],
      records: recordsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'currentPage': currentPage,
      'totalPages': totalPages,
      'totalRecords': totalRecords,
      'records': records?.map((record) => record.toJson()).toList(),
    };
  }
}

class Record {
  String? jobId;
  String? title;
  String? location;
  int? price;
  String? description;
  String? requirements;
  String? skills;
  String? jobCategory;
  String? createdBy;

  Record({
    this.jobId,
    this.title,
    this.location,
    this.price,
    this.description,
    this.requirements,
    this.skills,
    this.jobCategory,
    this.createdBy,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      jobId: json['jobId'],
      title: json['title'],
      location: json['location'],
      price: json['price'],
      description: json['description'],
      requirements: json['requirements'],
      skills: json['skills'],
      jobCategory: json['jobCategory'],
      createdBy: json['createdBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'title': title,
      'location': location,
      'price': price,
      'description': description,
      'requirements': requirements,
      'skills': skills,
      'jobCategory': jobCategory,
      'createdBy': createdBy,
    };
  }
}
