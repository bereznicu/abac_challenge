import 'package:abac_project/providers/home_provider/home_provider.dart';
import 'package:abac_project/ui/diagnose_page/diagnose_page.dart';
import 'package:abac_project/ui/home_page/companies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (_, ref, child) {
              final homeProvider = ref.watch(
                  homeNotifierProvider.select((state) => state.dateTime));
              return homeProvider != null
                  ? Text(
                      "Aveți o programare în data de: $homeProvider",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Column(children: [
                      const Text("Nicio programare creată"),
                      ElevatedButton(
                          onPressed: () async {
                            final DateTime? dateTime =
                                await Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => const DiagnosePage()));
                            if (dateTime != null) {
                              ref
                                  .read(homeNotifierProvider.notifier)
                                  .addDateTime(dateTime);
                            }
                          },
                          child: const Text("Crează programare"))
                    ]);
            }),
            const SizedBox(
              height: 30,
            ),
            const Expanded(child: CompaniesList()),
          ],
        ),
      ),
    );
  }
}
