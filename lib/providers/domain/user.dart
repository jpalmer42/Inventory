import 'package:cloud_firestore/cloud_firestore.dart';

class DaoUser {
  String id;
  List<dynamic> companies;
  DateTime? lastAccess;

  DaoUser({this.id = '', required this.companies, this.lastAccess});

  Map<String, dynamic> toJson() => {
        'id': id,
        'companies': companies.map((e) => e).toList(),
        'lastAccess': lastAccess,
      };

  factory DaoUser.fromJson(Map<String, dynamic> json) => DaoUser(
        id: json['id'],
        companies: json['companies'],
        lastAccess: (json['lastAccess'] as Timestamp).toDate(),
      );
}
