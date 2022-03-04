import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Project {
  String customer;
  String fid;
  String label;
  String cause;
  String timeCreated;
  String timeCompleted;
  bool invoiceSend;
  String invoiceReminders;
  double hours;

  Project({
    this.customer = '',
    this.fid = '',
    this.cause = '',
    this.label = '',
    this.timeCreated = '',
    this.timeCompleted = '',
    this.invoiceSend = false,
    this.invoiceReminders = '',
    this.hours = 0.0,
  });
  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

@JsonSerializable()
class Customer {
  String fid;
  String firstname;
  String lastname;
  String uid;
  String email;
  String phone;
  String street;
  String housenumber;
  String zipcode;
  String town;
  String notes;

  Customer({
    this.fid = '',
    this.firstname = '',
    this.lastname = '',
    this.uid = '',
    this.email = '',
    this.phone = '',
    this.street = '',
    this.housenumber = '',
    this.zipcode = '',
    this.town = '',
    this.notes = '',
  });
  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
