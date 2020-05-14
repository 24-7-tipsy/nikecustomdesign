import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nikecustomdesign/main_page.dart';
import 'package:nikecustomdesign/styles.dart';
import 'package:provider/provider.dart';

class ShoePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MapHider(
        child: ShoeCircle(),
      ),
    );
  }
}

class ShoeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        return Positioned(
          left:
              1.2 * MediaQuery.of(context).size.width - 0.85 * notifier.offset,
          child: Transform.scale(
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 220.0),
            child: Image.asset(
              'assets/shoe.png',
              height: MediaQuery.of(context).size.height / 6,
            ),
          ),
        ),
      ),
    );
  }
}

class ShoeCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        double multiplier;
        if (animation.value == 0) {
          multiplier = math.max(0, 4 * notifier.page - 3);
        } else {
          multiplier = math.max(0, 1 - 6 * animation.value);
        }
        double size = MediaQuery.of(context).size.width * 0.5 * multiplier;
        return Container(
          margin: const EdgeInsets.only(bottom: 250),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lighterGray,
          ),
          width: size,
          height: size,
        );
      },
    );
  }
}

class ShoeDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AnimationController, MapAnimationNotifier>(
      builder: (context, animation, notifier, child) {
        if (animation.value < 1 / 6 || notifier.value > 0) {
          return Container();
        }
        double endTop = topMargin(context) + 32 + 16 + 8;
        double top = endTop +
            (1 - (1.2 * (animation.value - 1 / 6))) *
                (mainSquareSize(context) + 32 - 4);
        return Positioned(
          top: top,
          bottom: bottom(context) - mediaPadding.vertical,
          child: Center(
              child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Since it was first previewed last October, Nike has wrapped the new and innovative Air Max 270 silhouette in a slew of colorways. However, the Swoosh’s latest makeup for the AM270 is perhaps the most eye-catching one. The low-top features varying shades of pink on the perforated uppers, orange accents on the sockliners, and a splash of highlighter yellow on heel overlays and bubble soles. Check out the neon-wrapped Air Max 270 above and stay tuned for official release details.',
                style: TextStyle(fontSize: 18, color: darkGray),
              ),
            ),
          )),
        );
      },
    );
  }
}

class ShoeDetailsLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        return Positioned(
          top: topMargin(context) +
              (1 - animation.value) * (mainSquareSize(context) + 32 - 4),
          left: 24 + MediaQuery.of(context).size.width - notifier.offset,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: MapHider(
        child: Text(
          'Nike Air Max 270',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: darkGray),
        ),
      ),
    );
  }
}

class ShoeTypeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 32 + 16 + 32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: MapHider(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Women\'s Shoe',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w300, color: darkGray),
          ),
        ),
      ),
    );
  }
}

class ShoeColorLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: MapHider(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '1 Color',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w300, color: lightGray),
          ),
        ),
      ),
    );
  }
}