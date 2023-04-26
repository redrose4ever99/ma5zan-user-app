import 'package:flutter/material.dart';
import 'package:flutter_makzan_ecommerce/utill/color_resources.dart';

class SplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = ColorResources.RED.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..strokeWidth = 9.0;
    var path = Path();

    path.moveTo(0, size.height * 0.275);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.15,
        size.width * 0.65, size.height * 0.55);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.65,
        size.width * 1.0, size.height * 0.60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
