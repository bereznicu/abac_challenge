import 'package:abac_project/models/company_model.dart';
import 'package:abac_project/providers/home_provider/home_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'companies_list_notifier.g.dart';

@riverpod
class CompaniesListNotifier extends _$CompaniesListNotifier {
  @override
  List<CompanyModel> build() {
    late final List<CompanyModel> companies;
    final homeProvider = ref.watch(homeNotifierProvider);
    final String searchTerm = homeProvider.searchTerm;
    companies = List.from(homeProvider.companies
        .where((company) => company.name.contains(searchTerm)));
    final CompaniesFilters filter = homeProvider.filter;
    switch (filter) {
      case CompaniesFilters.price:
        companies.sort((a, b) => a.price.compareTo(b.price));
        break;
      case CompaniesFilters.rating:
        companies.sort((a, b) => a.rating.compareTo(b.rating));
        break;
      case CompaniesFilters.time:
        companies.sort((a, b) => a.time.compareTo(b.time));
        break;
      case CompaniesFilters.none:
        break;
    }
    return companies;
  }
}
