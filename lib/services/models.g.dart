// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visit _$VisitFromJson(Map<String, dynamic> json) => Visit(
      cause: json['cause'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
    );

Map<String, dynamic> _$VisitToJson(Visit instance) => <String, dynamic>{
      'cause': instance.cause,
      'timestamp': instance.timestamp,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      fid: json['fid'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      street: json['street'] as String? ?? '',
      housenumber: json['housenumber'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      town: json['town'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      visits: (json['visits'] as List<dynamic>?)
              ?.map((e) => Visit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'fid': instance.fid,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'uid': instance.uid,
      'email': instance.email,
      'phone': instance.phone,
      'street': instance.street,
      'housenumber': instance.housenumber,
      'zipcode': instance.zipcode,
      'town': instance.town,
      'notes': instance.notes,
      'visits': instance.visits,
    };
