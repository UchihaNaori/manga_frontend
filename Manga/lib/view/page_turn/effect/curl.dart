import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:manga_read/common/utils/extensions.dart';
class PageTurnEffect extends CustomPainter {
  final Animation<double> amount;
  final ui.Image image;
  final Color backgroundColor;
  final double radius;

  PageTurnEffect({
    required this.amount,
    required this.image,
    required this.backgroundColor,
    this.radius = 0.18,
  })  : super(repaint: amount);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final pos = amount.value;
    final movX = (1.0 - pos) * 0.85;
    final calcR = (movX < 0.20) ? radius * movX * 5 : radius;
    final wHRatio = 1 - calcR;
    final hWRatio = image.height / image.width;
    final hWCorrection = (hWRatio - 1.0) / 2.0;

    final w = size.width.toDouble();
    final h = image.height.toDouble() * ( size.width / image.width);
    //final h = size.height.toDouble();
    final c = canvas;
    final shadowXf = (wHRatio - movX);
    final shadowSigma =
        Shadow.convertRadiusToSigma(8.0 + (32.0 * (1.0 - shadowXf)));
    final pageRect = Rect.fromLTRB(0.0, 0.0, w * shadowXf, h);
    c.drawRect(pageRect, Paint()..color = backgroundColor);
    c.drawRect(
      pageRect,
      Paint()
        ..color = Colors.black54
        ..maskFilter = MaskFilter.blur(BlurStyle.outer, shadowSigma),
    );

    final ip = Paint();
    for (double x = 0; x < size.width; x+=0.8) {
      final xf = (x / w);
      final v = (calcR * (math.sin(math.pi / 0.5 * (xf - (1.0 - pos)))) +
          (calcR * 1.1));
      final xv = (xf * wHRatio) - movX;
      final sx = (xf * image.width);
      final sr = Rect.fromLTRB(sx, 0, sx + 1.0, image.height.toDouble());
      final yv = ((h * calcR * movX) * hWRatio) - hWCorrection;
      final ds = (yv * v);
      final dr = Rect.fromLTRB(xv * w, 5.0.hp - ds, xv * w + 1.0, h + ds + 5.0.hp);
      c.drawImageRect(image, sr, dr, ip..filterQuality = FilterQuality.high);
    }
  }

  @override
  bool shouldRepaint(PageTurnEffect oldDelegate) {
    return oldDelegate.image != image ||
        oldDelegate.amount.value != amount.value;
  }
}