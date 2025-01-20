import 'package:elm_task/features/auth/data/models/user_wrapper.dart';

class LoginWrapper {
  bool? success;
  String? message;
  LoginModel? data;

  LoginWrapper({this.success, this.message, this.data});

  LoginWrapper.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new LoginModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginModel {
  String? token;
  String? refreshToken;
  UserModel? user;
  List<Entities>? entities;

  LoginModel({this.token, this.refreshToken, this.user, this.entities});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    if (json['entities'] != null) {
      entities = <Entities>[];
      json['entities'].forEach((v) {
        entities!.add(new Entities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.entities != null) {
      data['entities'] = this.entities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entities {
  int? entityAdminID;
  int? entityID;
  int? entityType;
  int? appUserID;
  int? adminLevel;
  String? createdDate;
  int? createdByUserID;
  String? name;

  Entities(
      {this.entityAdminID,
      this.entityID,
      this.entityType,
      this.appUserID,
      this.adminLevel,
      this.createdDate,
      this.createdByUserID,
      this.name});

  Entities.fromJson(Map<String, dynamic> json) {
    entityAdminID = json['entityAdminID'];
    entityID = json['entityID'];
    entityType = json['entityType'];
    appUserID = json['appUserID'];
    adminLevel = json['adminLevel'];
    createdDate = json['createdDate'];
    createdByUserID = json['createdByUserID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entityAdminID'] = this.entityAdminID;
    data['entityID'] = this.entityID;
    data['entityType'] = this.entityType;
    data['appUserID'] = this.appUserID;
    data['adminLevel'] = this.adminLevel;
    data['createdDate'] = this.createdDate;
    data['createdByUserID'] = this.createdByUserID;
    data['name'] = this.name;
    return data;
  }
}
