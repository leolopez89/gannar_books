import 'dart:math' as math;

import 'package:flutter/material.dart';

class DiagonalWave extends StatelessWidget {
  const DiagonalWave(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size), // Especifica tu propio tamaño
      painter: DiagonalWavePainter(),
    );
  }
}

class DiagonalWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var wavePaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var pathAbove = Path();
    var pathBelow = Path();

    // Gradiente de fondo
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [const Color(0xFF92A5C7), Colors.deepPurple.shade200],
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));

    // Inicializa los paths
    pathAbove.moveTo(0, size.height / 2);
    pathBelow.moveTo(0, size.height / 2);

    // Construye la onda y los paths de arriba/abajo
    for (double i = 0; i < size.width; i++) {
      var y = size.height / 2 + 20 * math.sin(i / 60 * math.pi);
      pathAbove.lineTo(i, y);
      pathBelow.lineTo(i, y);

      // Divide los caminos para arriba y abajo de la onda
      if (i == 0) {
        pathBelow.moveTo(i, y);
      } else if (i == size.width - 1) {
        pathBelow.lineTo(i, size.height);
        pathBelow.lineTo(0, size.height);
        pathBelow.close();
      }
    }

    // Dibuja la onda
    canvas.drawPath(pathAbove, wavePaint);

    // Pinta la parte de abajo de la onda con un color sólido
    canvas.drawPath(pathBelow, Paint()..color = const Color(0xFFAFC4D3));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
