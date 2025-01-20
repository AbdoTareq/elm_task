// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserWrapper {
  bool? success;
  String? message;
  UserModel? data;

  UserWrapper({this.success, this.message, this.data});

  UserWrapper.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
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

  @override
  String toString() =>
      'UserWrapper(success: $success, message: $message, data: $data)';
}

class UserModel {
  int? appUserID;
  String? username;
  String? passwordHash;
  String? email;
  String? phone;
  String? fullName;
  String? createdOn;
  String? lastLogin;
  String? emailConfirmationToken;
  bool? isEmailConfirmed;
  String? passwordResetToken;
  String? passwordResetTokenExpiry;
  String? profilePicture;
  String? bio;
  String? country;
  String? city;
  String? address;
  int? status;
  int? referralID;
  String? platform;
  String? birthDate;

  UserModel(
      {this.appUserID,
      this.username,
      this.passwordHash,
      this.email,
      this.phone,
      this.fullName,
      this.createdOn,
      this.lastLogin,
      this.emailConfirmationToken,
      this.isEmailConfirmed,
      this.passwordResetToken,
      this.passwordResetTokenExpiry,
      this.profilePicture,
      this.bio,
      this.country,
      this.city,
      this.address,
      this.status,
      this.referralID,
      this.platform,
      this.birthDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    appUserID = json['appUserID'];
    username = json['username'];
    passwordHash = json['passwordHash'];
    email = json['email'];
    phone = json['phone'];
    fullName = json['fullName'];
    createdOn = json['createdOn'];
    lastLogin = json['lastLogin'];
    emailConfirmationToken = json['emailConfirmationToken'];
    isEmailConfirmed = json['isEmailConfirmed'];
    passwordResetToken = json['passwordResetToken'];
    passwordResetTokenExpiry = json['passwordResetTokenExpiry'];
    profilePicture = json['profilePicture'];
    bio = json['bio'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    status = json['status'];
    referralID = json['referralID'];
    platform = json['platform'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appUserID'] = this.appUserID;
    data['username'] = this.username;
    data['passwordHash'] = this.passwordHash;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['fullName'] = this.fullName;
    data['createdOn'] = this.createdOn;
    data['lastLogin'] = this.lastLogin;
    data['emailConfirmationToken'] = this.emailConfirmationToken;
    data['isEmailConfirmed'] = this.isEmailConfirmed;
    data['passwordResetToken'] = this.passwordResetToken;
    data['passwordResetTokenExpiry'] = this.passwordResetTokenExpiry;
    data['profilePicture'] = this.profilePicture;
    data['bio'] = this.bio;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['status'] = this.status;
    data['referralID'] = this.referralID;
    data['platform'] = this.platform;
    data['birthDate'] = this.birthDate;
    return data;
  }

  @override
  String toString() {
    return 'UserModel(appUserID: $appUserID, username: $username, passwordHash: $passwordHash, email: $email, phone: $phone, fullName: $fullName, createdOn: $createdOn, lastLogin: $lastLogin, emailConfirmationToken: $emailConfirmationToken, isEmailConfirmed: $isEmailConfirmed, passwordResetToken: $passwordResetToken, passwordResetTokenExpiry: $passwordResetTokenExpiry, profilePicture: $profilePicture, bio: $bio, country: $country, city: $city, address: $address, status: $status, referralID: $referralID, platform: $platform, birthDate: $birthDate)';
  }
}
