import 'package:abac_project/providers/diagnose_provider/diagnose_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  Future<DateTime?> pickDate(BuildContext context) async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030));
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime =
        ref.watch(diagnoseNotifierProvider.select((state) => state.dateTime));
    return Column(
      children: [
        Text(
          "Data și ora programării: ${dateTime.toString()}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 10.0,
        ),
        ElevatedButton(
            onPressed: () async {
              pickDate(context).then((date) async {
                if (date != null) {
                  final TimeOfDay? time = await pickTime(context);
                  if (time != null) {
                    ref
                        .read(diagnoseNotifierProvider.notifier)
                        .updateDateTime(DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.minute,
                        ));
                  }
                }
              });
            },
            child: const Text("Modificați data și ora")),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () =>
                    ref.read(diagnoseNotifierProvider.notifier).changeStep(0),
                child: const Text("Înapoi")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, dateTime);
                },
                child: const Text("Crează"))
          ],
        )
      ],
    );
  }
}
