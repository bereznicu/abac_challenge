import 'package:abac_project/models/company_model.dart';
import 'package:abac_project/providers/home_provider/home_provider.dart';
import 'package:flutter/foundation.dart';

@immutable
class HomeState {
  final DateTime? dateTime; //pentru data programarii create
  final String searchTerm;
  final List<CompanyModel> companies;
  final CompaniesFilters filter;

  const HomeState(
      {this.dateTime,
      required this.searchTerm,
      required this.companies,
      required this.filter});

  HomeState copyWith({
    DateTime? dateTime,
    String? searchTerm,
    List<CompanyModel>? companies,
    CompaniesFilters? filter,
  }) {
    return HomeState(
      dateTime: dateTime ?? this.dateTime,
      searchTerm: searchTerm ?? this.searchTerm,
      companies: companies ?? this.companies,
      filter: filter ?? this.filter,
    );
  }
}
