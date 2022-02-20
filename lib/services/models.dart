import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Visit {
  String cause;
  String timestamp;

  Visit({
    this.cause = '',
    this.timestamp = '',
  });
  factory Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);
  Map<String, dynamic> toJson() => _$VisitToJson(this);
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
  List<Visit> visits;

  Customer(
      {this.fid = '',
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
      this.visits = const []});
  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
