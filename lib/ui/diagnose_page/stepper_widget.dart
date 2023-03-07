import 'package:abac_project/providers/diagnose_provider/diagnose_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepperWidget extends ConsumerWidget {
  final List<String> steps = const ["Crează deviz", "Stabilește ora"];

  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentStep =
        ref.watch(diagnoseNotifierProvider.select((state) => state.step));

    return Stepper(
        physics: const NeverScrollableScrollPhysics(),
        margin: EdgeInsets.zero,
        type: StepperType.horizontal,
        elevation: 0,
        controlsBuilder: (_, __) {
          return const SizedBox();
        },
        steps: steps.map<Step>((step) {
          int stepIndex = steps.indexOf(step);
          return Step(
              title: const Text(""),
              content: const SizedBox(),
              isActive: currentStep == stepIndex,
              label: Text(step),
              state: currentStep > stepIndex
                  ? StepState.complete
                  : currentStep < stepIndex
                      ? StepState.disabled
                      : StepState.editing);
        }).toList());
  }
}
