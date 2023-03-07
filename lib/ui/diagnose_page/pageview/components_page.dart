import 'package:abac_project/providers/diagnose_provider/diagnose_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComponentsPage extends ConsumerStatefulWidget {
  const ComponentsPage({super.key});

  @override
  ConsumerState<ComponentsPage> createState() => _ComponentsPageState();
}

class _ComponentsPageState extends ConsumerState<ComponentsPage> {
  final List<String> _tableTitles = const <String>[
    'Produs',
    'Cantitate',
    'Preț unitar',
    'Total',
  ];

  final BorderSide _tableBorder = const BorderSide(color: Colors.grey);

  late final TextEditingController _nameController;

  late final TextEditingController _quantityController;

  final double spacingWidth = 10.0;

  TableRow _customTableRow(
      MapEntry<String, int> entry, BuildContext context, WidgetRef ref) {
    final List<String> texts = [
      entry.key,
      entry.value.toString(),
      '1000',
      '${entry.value * 1000}'
    ];
    return TableRow(children: [
      ...texts
          .map<Text>((text) => Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ))
          .toList(),
      IconButton(
          onPressed: () {
            ref
                .read(diagnoseNotifierProvider.notifier)
                .removeComponent(Map.fromEntries([entry]));
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.red,
          ))
    ]);
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _quantityController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final components =
        ref.watch(diagnoseNotifierProvider.select((state) => state.components));

    return SingleChildScrollView(
      child: Column(
        children: [
          if (components.isNotEmpty)
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder(
                  horizontalInside: _tableBorder, bottom: _tableBorder),
              children: <TableRow>[
                TableRow(children: [
                  ..._tableTitles
                      .map<Text>((title) => Text(
                            title,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ))
                      .toList(),
                  const Icon(
                    Icons.remove,
                    color: Colors.transparent,
                  )
                ]),
                ...components.entries.map<TableRow>(
                    (entry) => _customTableRow(entry, context, ref))
              ],
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingWidth),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Denumire produs',
                        suffix: Icon(Icons.search)),
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                  ),
                ),
                SizedBox(
                  width: spacingWidth,
                ),
                SizedBox(
                  width: 50.0,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      hintText: '2',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String quantity = _quantityController.text;
                    if (name.isNotEmpty && quantity.isNotEmpty) {
                      ref
                          .read(diagnoseNotifierProvider.notifier)
                          .addComponent({name: int.parse(quantity)});
                    }
                  },
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
          if (components.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(diagnoseNotifierProvider.notifier).changeStep(1);
                },
                child: const Text('Continuă'),
              ),
            )
        ],
      ),
    );
  }
}
