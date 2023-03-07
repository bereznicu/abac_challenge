import 'package:flutter/foundation.dart';

@immutable
class DiagnoseState {
  final int step;
  final Map<String, int> components;
  final DateTime dateTime;

  const DiagnoseState(
      {required this.step, required this.components, required this.dateTime});

  DiagnoseState copyWith({
    int? step,
    Map<String, int>? components,
    DateTime? dateTime,
  }) {
    return DiagnoseState(
        step: step ?? this.step,
        components: components ?? this.components,
        dateTime: dateTime ?? this.dateTime);
  }
}
