import 'package:abac_project/providers/diagnose_provider/diagnose_provider.dart';
import 'package:abac_project/providers/diagnose_provider/diagnose_state.dart';
import 'package:abac_project/ui/diagnose_page/pageview/calendar_page.dart';
import 'package:abac_project/ui/diagnose_page/pageview/components_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageViewWidget extends ConsumerStatefulWidget {
  const PageViewWidget({super.key});

  @override
  ConsumerState<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends ConsumerState<PageViewWidget> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<DiagnoseState>(diagnoseNotifierProvider,
        (prevState, currentState) {
      controller.jumpToPage(currentState.step);
    });

    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ComponentsPage(),
        CalendarPage(),
      ],
    );
  }
}
