import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/helpers/enums.dart';
import 'package:my_portfolio/helpers/utils.dart';
import 'package:my_portfolio/shared/providers/share_providers.dart';
import 'package:rive/rive.dart';

class BgAnimation extends ConsumerStatefulWidget {
  const BgAnimation({
    super.key,
  });

  @override
  ConsumerState<BgAnimation> createState() => BgAnimationState();
}

class BgAnimationState extends ConsumerState<BgAnimation> {
  Map<String, RiveAnimation> animations = {};
  List<StateMachineController> controllers = [];

  @override
  void initState() {
    super.initState();
    preloadRiveAnimations();
  }

  void preloadRiveAnimations() {
    for (var animValue in BackgroundAnimations.values) {
      var animationName = animValue.name;
      animations[animationName] = RiveAnimation.asset(
          './assets/anims/personal_portfolio.riv',
          artboard: animationName,
          fit: BoxFit.contain, onInit: (Artboard artboard) {
        var smController =
            StateMachineController.fromArtboard(artboard, animationName)!;
        artboard.addController(smController);
        controllers.add(smController);
      });
    }
  }

  @override
  void dispose() {
    for (var element in controllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bgImageRoute = ref.watch(bgPageRouteProvider);
    var animationEnum = Utils.pageRouteToAnimations[bgImageRoute]!;
    var animation = animations[animationEnum.name];

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Opacity(opacity: 0.1, child: animation),
      ),
    );
  }
}
