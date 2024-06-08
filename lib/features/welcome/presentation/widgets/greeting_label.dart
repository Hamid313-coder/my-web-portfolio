import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/welcome/presentation/providers/welcom_page.providers.dart';
import 'package:my_portfolio/features/welcome/presentation/responsiveness.dart/welcome_page_responsive.config.dart';
import 'package:my_portfolio/features/welcome/presentation/viewmodels/greeting_label.viewmodel.dart';
import 'package:my_portfolio/helpers/responsive_ui_helper.dart';

class GreetingsLabel extends ConsumerStatefulWidget {
  const GreetingsLabel({super.key});
  @override
  GreetingsLabelState createState() => GreetingsLabelState();
}

class GreetingsLabelState extends ConsumerState<GreetingsLabel> {
  late GreetingsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = ref.read(greetingsViewModelProvider.notifier);
    vm.initializeGreetings();
  }

  @override
  void dispose() {
    vm.resetTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var uiConfig = WelcomePageResponsiveConfig
        .responsiveUI[ResponsiveUIHelper.getDeviceType(context)]!;

    var greeting = ref.watch(greetingsViewModelProvider);

    return Text(greeting,
        style: TextStyle(
            fontSize: uiConfig.titleSize,
            fontWeight: FontWeight.bold,
            color: Colors.white));
  }
}
