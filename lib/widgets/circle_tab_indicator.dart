import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleTabIndicator extends Decoration {
  final Color color;

  const CircleTabIndicator({required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;

  _CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final paint = Paint()
      ..color = color
      ..isAntiAlias = true;

    final circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - 4.r);
    canvas.drawCircle(circleOffset, 4.r, paint);
  }
}
