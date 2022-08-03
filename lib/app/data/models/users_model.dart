import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class UsersModel {
  const UsersModel({
    required this.id,
    required this.email,
    this.uid,
    this.phoneNumber,
    this.idNumber,
    this.fullName,
    this.dateOfBirth,
    this.gender,
    this.provinceOrCity,
    this.district,
    this.address,
    this.avatar,
    this.isActive,
  });

  final String id;
  final String email;
  final String? uid;
  final String? phoneNumber;
  final String? idNumber;
  final String? fullName;
  final String? dateOfBirth;
  final String? gender;
  final String? provinceOrCity;
  final String? district;
  final String? address;
  final String? avatar;
  final bool? isActive;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json['id'].toString(),
        email: json['email'].toString(),
        uid: json['uid']?.toString(),
        phoneNumber: json['phoneNumber']?.toString(),
        idNumber: json['idNumber']?.toString(),
        fullName: json['fullName']?.toString(),
        dateOfBirth: json['dateOfBirth']?.toString(),
        gender: json['gender']?.toString(),
        provinceOrCity: json['provinceOrCity']?.toString(),
        district: json['district']?.toString(),
        address: json['address']?.toString(),
        avatar: json['avatar']?.toString(),
        isActive: json['isActive'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'uid': uid,
        'phoneNumber': phoneNumber,
        'idNumber': idNumber,
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'provinceOrCity': provinceOrCity,
        'district': district,
        'address': address,
        'avatar': avatar,
        'isActive': isActive
      };

  UsersModel clone() => UsersModel(
        id: id,
        email: email,
        uid: uid,
        phoneNumber: phoneNumber,
        idNumber: idNumber,
        fullName: fullName,
        dateOfBirth: dateOfBirth,
        gender: gender,
        provinceOrCity: provinceOrCity,
        district: district,
        address: address,
        avatar: avatar,
        isActive: isActive,
      );

  UsersModel copyWith({
    String? id,
    String? email,
    Optional<String?>? uid,
    Optional<String?>? phoneNumber,
    Optional<String?>? idNumber,
    Optional<String?>? fullName,
    Optional<String?>? dateOfBirth,
    Optional<String?>? gender,
    Optional<String?>? provinceOrCity,
    Optional<String?>? district,
    Optional<String?>? address,
    Optional<String?>? avatar,
    Optional<bool?>? isActive,
  }) =>
      UsersModel(
        id: id ?? this.id,
        email: email ?? this.email,
        uid: checkOptional(uid, () => this.uid),
        phoneNumber: checkOptional(phoneNumber, () => this.phoneNumber),
        idNumber: checkOptional(idNumber, () => this.idNumber),
        fullName: checkOptional(fullName, () => this.fullName),
        dateOfBirth: checkOptional(dateOfBirth, () => this.dateOfBirth),
        gender: checkOptional(gender, () => this.gender),
        provinceOrCity:
            checkOptional(provinceOrCity, () => this.provinceOrCity),
        district: checkOptional(district, () => this.district),
        address: checkOptional(address, () => this.address),
        avatar: checkOptional(avatar, () => this.avatar),
        isActive: checkOptional(isActive, () => this.isActive),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersModel &&
          id == other.id &&
          email == other.email &&
          uid == other.uid &&
          phoneNumber == other.phoneNumber &&
          idNumber == other.idNumber &&
          fullName == other.fullName &&
          dateOfBirth == other.dateOfBirth &&
          gender == other.gender &&
          provinceOrCity == other.provinceOrCity &&
          district == other.district &&
          address == other.address &&
          avatar == other.avatar &&
          isActive == other.isActive;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      uid.hashCode ^
      phoneNumber.hashCode ^
      idNumber.hashCode ^
      fullName.hashCode ^
      dateOfBirth.hashCode ^
      gender.hashCode ^
      provinceOrCity.hashCode ^
      district.hashCode ^
      address.hashCode ^
      avatar.hashCode ^
      isActive.hashCode;
}
