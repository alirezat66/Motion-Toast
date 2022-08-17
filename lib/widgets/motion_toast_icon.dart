import 'package:flutter/material.dart';

import 'heart_beat_icon.dart';

class MotionToastIcon extends StatelessWidget {
  /// Size of the icon.
  final double? iconSize;

  /// Set to `true` to show animation of the toast.
  final bool withAnimation;

  /// Icon to display on the toast.
  final Widget icon;

  /// The color of the toast icon.
  final Color color;

  const MotionToastIcon({
    Key? key,
    this.iconSize,
    required this.color,
    required this.icon,
    required this.withAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon is SizedBox
        ? const SizedBox(width: 16)
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: iconSize,
              child: withAnimation
                  ? HeartBeatIcon(
                      icon: icon,
                      size: iconSize ?? 40,
                    )
                  : icon,
            ),
          );
  }
}
