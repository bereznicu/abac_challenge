import 'package:flutter/foundation.dart';

@immutable
class CompanyModel {
  final int rating;
  final int price;
  final DateTime time;
  final String name;

  const CompanyModel({
    required this.rating,
    required this.price,
    required this.time,
    required this.name,
  });
}
