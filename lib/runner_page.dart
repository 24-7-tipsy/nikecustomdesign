import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nikecustomdesign/main_page.dart';
import 'package:nikecustomdesign/styles.dart';
import 'package:provider/provider.dart';

class RunnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: topMargin(context)),
        UnlimitedText(),
        SizedBox(height: 32),
        RunnerDescriptionLabel(),
        SizedBox(height: 32),
        RunnerDescription(),
      ],
    );
  }
}

class RunnerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        return Positioned(
          left: -0.85 * notifier.offset,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Transform.scale(
            alignment: Alignment(0.6, 0),
            scale: 1 - 0.1 * animation.value,
            child: Opacity(
              opacity: 1 - 0.6 * animation.value,
              child: child,
            ),
          ),
        );
      },
      child: MapHider(
        child: IgnorePointer(
          child: Image.asset('assets/runner.png'),
        ),
      ),
    );
  }
}

class RunnerDescriptionLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          'Unlimited You',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: darkGray),
        ),
      ),
    );
  }
}

class RunnerDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'Nike presents the Unlimited Collection, a series of footwear anchored by a vibrant volt and hyper punch pink colorway inspired by Nike’s speedy roots and the optic blur of a speedy runner. Preview the entire collection just below and stay tuned for more updates on Olympic-inspired gear as we near the Summer Games in Rio.',
          style: TextStyle(fontSize: 13, color: lightGray),
        ),
      ),
    );
  }
}

class UnlimitedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Transform.translate(
          offset: Offset(-0.5 * notifier.offset, 0),
          child: child,
        );
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          width: mainSquareSize(context),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            child: Text(
              'UNLIMITED',
              style: TextStyle(fontWeight: FontWeight.w900, color: lightGray),
            ),
          ),
        ),
      ),
    );
  }
}
