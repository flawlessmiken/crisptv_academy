import 'dart:convert';

GetEventsResponse getEventsResponseFromJson(String str) =>
    GetEventsResponse.fromJson(json.decode(str));

String getEventsResponseToJson(GetEventsResponse data) =>
    json.encode(data.toJson());

class GetEventsResponse {
  bool? isSuccessful;
  String? message;
  Data? data;
  String? responseCode;

  GetEventsResponse({
    this.isSuccessful,
    this.message,
    this.data,
    this.responseCode,
  });

  factory GetEventsResponse.fromJson(Map<String, dynamic> json) =>
      GetEventsResponse(
        isSuccessful: json["isSuccessful"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data?.toJson(),
        "responseCode": responseCode,
      };
}

class Data {
  int? pageSize;
  int? currentPage;
  int? totalPages;
  int? totalRecords;
  List<EventRecord>? records;

  Data({
    this.pageSize,
    this.currentPage,
    this.totalPages,
    this.totalRecords,
    this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageSize: json["pageSize"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        totalRecords: json["totalRecords"],
        records: json["records"] == null
            ? []
            : List<EventRecord>.from(
                json["records"]!.map((x) => EventRecord.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

// class EventRecord {
//   String? id;
//   String? userId;
//   String? creatorFullName;
//   String? title;
//   String? description;
//   String? currency;
//   String? location;
//   String? venue;
//   String? country;
//   String? state;
//   String? paymentCategory;
//   String? privacy;
//   String? imagePath;
//   String? bannerPath;
//   bool? isPaidEvent;
//   dynamic earlyBirdTicketPricePercentage;
//   String? earlyBirdTicketDeadLine;
//   String? customizationId;
//   String? link;
//   String? startTime;
//   String? startDate;

//   String? bankName;
//   String? accountNumber;
//   String? accountName;

//   EventRecord({
//     this.id,
//     this.userId,
//     this.creatorFullName,
//     this.title,
//     this.description,
//     this.currency,
//     this.location,
//     this.venue,
//     this.country,
//     this.state,
//     this.paymentCategory,
//     this.privacy,
//     this.imagePath,
//     this.bannerPath,
//     this.isPaidEvent,
//     this.earlyBirdTicketPricePercentage,
//     this.earlyBirdTicketDeadLine,
//     this.customizationId,
//     this.link,
//     this.startTime,
//     this.startDate,

//     this.bankName,
//     this.accountNumber,
//     this.accountName,
//   });

  

//   factory EventRecord.fromJson(Map<String, dynamic> json) => EventRecord(
//         id: json["id"],
//         userId: json["userId"],
//         creatorFullName: json["creatorFullName"],
//         title: json["title"],
//         description: json["description"],
//         currency: json["currency"],
//         location: json["location"],
//         venue: json["venue"],
//         country: json["country"],
//         state: json["state"],
//         paymentCategory: json["paymentCategory"],
//         privacy: json["privacy"],
//         imagePath: json["imagePath"],
//         bannerPath: json["bannerPath"],
//         isPaidEvent: json["isPaidEvent"],
//         earlyBirdTicketPricePercentage: json["earlyBirdTicketPricePercentage"],
//         earlyBirdTicketDeadLine: json["earlyBirdTicketDeadLine"],
//         customizationId: json["customizationID"],
//         link: json["link"],
//         startTime: json["startTime"],
//         startDate: json["startDate"],

//         bankName: json["bankName"],
//         accountNumber: json["accountNumber"],
//         accountName: json["accountName"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "userId": userId,
//         "creatorFullName": creatorFullName,
//         "title": title,
//         "description": description,
//         "currency": currency,
//         "location": location,
//         "venue": venue,
//         "country": country,
//         "state": state,
//         "paymentCategory": paymentCategory,
//         "privacy": privacy,
//         "imagePath": imagePath,
//         "bannerPath": bannerPath,
//         "isPaidEvent": isPaidEvent,
//         "earlyBirdTicketPricePercentage": earlyBirdTicketPricePercentage,
//         "earlyBirdTicketDeadLine": earlyBirdTicketDeadLine,
//         "customizationID": customizationId,
//         "link": link,
//         "startTime": startTime,
//         "startDate": startDate,

//         "bankName": bankName,
//         "accountNumber": accountNumber,
//         "accountName": accountName,
//       };


      
// }
 
class EventRecord {
    String? id;
    String? userId;
    String? creatorFullName;
    String? creatorsProfileImageUrl;
    String? creatorsEmail;
    String? creatorsPhoneNumber;
    String? title;
    String? description;
    String? currency;
    String? location;
    String? venue;
    String? country;
    String? state;
    String? eventTicket;
    String? privacy;
    String? eventStatus;
    String? eventImagePath;
    String? eventSchedule;
    bool? isPaidEvent;
    dynamic earlyBirdTicketPricePercentage;
    String? earlyBirdTicketDeadLine;
    String? customizationId;
    String? link;
    String? startDateTime;
    String? endDateTime;
    String? accentColor;
    String? backgroundColor;
    bool? showCountDown;
    String? bankName;
    String? accountNumber;
    String? accountName;

    EventRecord({
        this.id,
        this.userId,
        this.creatorFullName,
        this.creatorsProfileImageUrl,
        this.creatorsEmail,
        this.creatorsPhoneNumber,
        this.title,
        this.description,
        this.currency,
        this.location,
        this.venue,
        this.country,
        this.state,
        this.eventTicket,
        this.privacy,
        this.eventStatus,
        this.eventImagePath,
        this.eventSchedule,
        this.isPaidEvent,
        this.earlyBirdTicketPricePercentage,
        this.earlyBirdTicketDeadLine,
        this.customizationId,
        this.link,
        this.startDateTime,
        this.endDateTime,
        this.accentColor,
        this.backgroundColor,
        this.showCountDown,
        this.bankName,
        this.accountNumber,
        this.accountName,
    });

    factory EventRecord.fromJson(Map<String, dynamic> json) => EventRecord(
        id: json["id"],
        userId: json["userId"],
        creatorFullName: json["creatorFullName"],
        creatorsProfileImageUrl: json["creatorsProfileImageUrl"],
        creatorsEmail: json["creatorsEmail"],
        creatorsPhoneNumber: json["creatorsPhoneNumber"],
        title: json["title"],
        description: json["description"],
        currency: json["currency"],
        location: json["location"],
        accentColor: json["accentColor"],
        backgroundColor: json["backgroundColor"],
        venue: json["venue"],
        showCountDown: json["showCountDown"],
        country: json["country"],
        state: json["state"],
        eventTicket: json["eventTicket"],
        privacy: json["privacy"],
        eventStatus: json["eventStatus"],
        eventImagePath: json["eventImagePath"],
        eventSchedule: json["eventSchedule"],
        isPaidEvent: json["isPaidEvent"],
        earlyBirdTicketPricePercentage: json["earlyBirdTicketPricePercentage"],
        earlyBirdTicketDeadLine: json["earlyBirdTicketDeadLine"],
        customizationId: json["customizationID"],
        link: json["link"],
        startDateTime: json["startDateTime"],
        endDateTime: json["endDateTime"],
        bankName: json["bankName"],
        accountNumber: json["accountNumber"],
        accountName: json["accountName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "creatorFullName": creatorFullName,
        "creatorsProfileImageUrl": creatorsProfileImageUrl,
        "creatorsEmail": creatorsEmail,
        "creatorsPhoneNumber": creatorsPhoneNumber,
        "title": title,
        "description": description,
        "currency": currency,
        "location": location,
        " backgroundColor": backgroundColor,
        "accentColor": accentColor,
        "venue": venue,
        "country": country,
        "state": state,
        "eventTicket": eventTicket,
        "eventTicket": eventTicket,
        "privacy": privacy,
        "eventStatus": eventStatus,
        "eventImagePath": eventImagePath,
        "eventSchedule": eventSchedule,
        "isPaidEvent": isPaidEvent,
        "earlyBirdTicketPricePercentage": earlyBirdTicketPricePercentage,
        "earlyBirdTicketDeadLine": earlyBirdTicketDeadLine,
        "customizationID": customizationId,
        "link": link,
        "startDateTime": startDateTime,
        "endDateTime": endDateTime,
        "accentColor": accentColor,
        "backgroundColor": backgroundColor,
        "showCountDown": showCountDown,
        "bankName": bankName,
        "accountNumber": accountNumber,
        "accountName": accountName,
    };
}


class CreateEventModel {
  String? id;
  String? userId;
  String? creatorFullName;
  String? creatorsProfileImageUrl;
  String? creatorsEmail;
  String? creatorsPhoneNumber;
  String? title;
  String? description;
  String? currency;
  String? location;
  String? venue;
  String? country;
  String? state;
  String? eventTicket;
  String? privacy;
  String? eventStatus;
  String? eventImagePath;
  String? eventSchedule;
  bool? isPaidEvent;
  String? earlyBirdTicketPricePercentage;
  String? earlyBirdTicketDeadLine;
  String? customizationId;
  String? link;
  String? startDateTime;
  String? endDateTime;
  String? accentColor;
  String? backgroundColor;
  bool? showCountDown;
  String? bankName;
  String? accountNumber;
  String? accountName;

  CreateEventModel({
    this.id,
    this.userId,
    this.creatorFullName,
    this.creatorsProfileImageUrl,
    this.creatorsEmail,
    this.creatorsPhoneNumber,
    this.title,
    this.description,
    this.currency,
    this.location,
    this.venue,
    this.country,
    this.state,
    this.eventTicket,
    this.privacy,
    this.eventStatus,
    this.eventImagePath,
    this.eventSchedule,
    this.isPaidEvent,
    this.earlyBirdTicketPricePercentage,
    this.earlyBirdTicketDeadLine,
    this.customizationId,
    this.link,
    this.startDateTime,
    this.endDateTime,
    this.accentColor,
    this.backgroundColor,
    this.showCountDown,
    this.bankName,
    this.accountNumber,
    this.accountName,
  });
}