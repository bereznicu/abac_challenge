import 'package:abac_project/providers/home_provider/companies_list_notifier.dart';
import 'package:abac_project/providers/home_provider/home_provider.dart';
import 'package:abac_project/ui/home_page/company_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompaniesList extends ConsumerStatefulWidget {
  const CompaniesList({super.key});

  @override
  ConsumerState<CompaniesList> createState() => _CompaniesListState();
}

class _CompaniesListState extends ConsumerState<CompaniesList> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.read(homeNotifierProvider);
    final companiesProvider = ref.watch(companiesListNotifierProvider);
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextField(
            controller: _searchController,
            onChanged: (String text) {
              ref
                  .read(homeNotifierProvider.notifier)
                  .searchString(_searchController.text);
            },
            decoration: const InputDecoration(
              hintText: "Căutați după nume",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "Filtrare după",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: CompaniesFilters.values
              .map((filter) => filter != CompaniesFilters.none
                  ? Expanded(
                      child: CheckboxListTile(
                        value: homeProvider.filter == filter,
                        onChanged: (value) {
                          ref
                              .read(homeNotifierProvider.notifier)
                              .changeFilter(filter);
                        },
                        subtitle: Text(filter.name),
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    )
                  : const SizedBox())
              .toList(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              children: companiesProvider
                  .map<CompanyCard>((company) => CompanyCard(
                        model: company,
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
