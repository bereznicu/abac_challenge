import 'package:abac_project/providers/diagnose_provider/diagnose_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepperWidget extends ConsumerWidget {
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
      steps: [
        Step(
          isActive: currentStep < 1,
          state: currentStep > 0 ? StepState.complete : StepState.editing,
          title: const Text(""),
          label: const Text("Crează deviz"),
          content: Container(),
        ),
        Step(
            isActive: currentStep >= 1,
            state: currentStep >= 1 ? StepState.editing : StepState.disabled,
            title: const Text(""),
            label: const Text("Stabilește ora"),
            content: Container())
      ],
    );
  }
}
