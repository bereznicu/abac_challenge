import 'dart:math';

import 'package:abac_project/models/company_model.dart';
import 'package:abac_project/providers/home_provider/home_state.dart';
import 'package:random_string/random_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

enum CompaniesFilters { price, rating, time, none }

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return HomeState(
        dateTime: null,
        searchTerm: '',
        companies: generateList(),
        filter: CompaniesFilters.none);
  }

  void addDateTime(DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }

  void searchString(String string) {
    state = state.copyWith(searchTerm: string);
  }

  void changeFilter(CompaniesFilters filter) {
    if (filter == state.filter) {
      state = state.copyWith(filter: CompaniesFilters.none);
    } else {
      state = state.copyWith(filter: filter);
    }
  }
}

List<CompanyModel> generateList() {
  final List<CompanyModel> companies = [];
  final random = Random();
  for (int index = 0; index < 10; index++) {
    companies.add(CompanyModel(
        name: randomString(10),
        rating: random.nextInt(5) + 1,
        price: random.nextInt(100) + 10,
        time: DateTime(2023, random.nextInt(12) + 1, random.nextInt(28) + 1)));
  }
  return companies;
}
