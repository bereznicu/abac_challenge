import 'package:abac_project/ui/diagnose_page/pageview/pageview_widget.dart';
import 'package:abac_project/ui/diagnose_page/stepper_widget.dart';
import 'package:flutter/material.dart';

class DiagnosePage extends StatelessWidget {
  const DiagnosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LICITEAZĂ"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 110, child: StepperWidget()),
          SizedBox(
            height: 50.0,
          ),
          Expanded(child: PageViewWidget()),
        ],
      ),
    );
  }
}
