import 'package:abac_project/providers/diagnose_provider/diagnose_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diagnose_provider.g.dart';

@riverpod
class DiagnoseNotifier extends _$DiagnoseNotifier {
  @override
  DiagnoseState build() {
    return DiagnoseState(
      step: 0,
      components: const <String, int>{},
      dateTime: DateTime.now(),
    );
  }

  void addComponent(Map<String, int> component) {
    if (!state.components.containsKey(component.keys.first)) {
      final newComponents = Map<String, int>.from(state.components);
      newComponents.addAll(component);
      state = state.copyWith(components: newComponents);
    }
  }

  void removeComponent(Map<String, int> component) {
    final components = Map<String, int>.from(state.components);
    components.remove(component.keys.first);
    state = state.copyWith(components: components);
  }

  void changeStep(int step) {
    if (step == 0) {
      state = state.copyWith(step: 0);
    } else if (state.components.isNotEmpty) {
      state = state.copyWith(step: 1);
    }
  }

  void updateDateTime(DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }
}
