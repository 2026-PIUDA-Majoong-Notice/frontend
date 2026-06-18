// widgets/timeline_painter.dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:majoong_notice/components/toilet_timeline/model/timeline_data.dart';
import 'package:majoong_notice/components/toilet_timeline/view_model/timeline_view_model.dart';

class TimelinePainter extends CustomPainter {
  final TimelineViewModel viewModel;

  TimelinePainter({required this.viewModel});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    final labelRadius = radius * 1.15;
    final innerRadius = radius * 0.4; // 가운데 빈 원 크기

    final slots = viewModel.data.slots;
    final sweepAngle = 2 * pi / 48; // 한 구간 각도 (7.5도)

    for (int i = 0; i < slots.length; i++) {
      // 12시가 맨 위(-90도)부터 시작, 시계방향
      final startAngle = -pi / 2 + (i * sweepAngle);

      final paint = Paint()
        ..color = viewModel.colorForProbability(slots[i].probability)
        ..style = PaintingStyle.fill;

      // 부채꼴 그리기 (도넛 모양)
      final path = Path()
        ..moveTo(
          center.dx + innerRadius * cos(startAngle),
          center.dy + innerRadius * sin(startAngle),
        )
        ..lineTo(
          center.dx + radius * cos(startAngle),
          center.dy + radius * sin(startAngle),
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
        )
        ..lineTo(
          center.dx + innerRadius * cos(startAngle + sweepAngle),
          center.dy + innerRadius * sin(startAngle + sweepAngle),
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: innerRadius),
          startAngle + sweepAngle,
          -sweepAngle,
          false,
        )
        ..close();

      canvas.drawPath(path, paint);
    }

    for (int hour = 0; hour < 24; hour++) {
      // 12시가 맨 위, 시계방향
      // 한 시간 = 15도, 12시 기준이니까 (hour - 12) 칸 이동
      final angle = -pi / 2 + (hour - 12) * (2 * pi / 24);

      final x = center.dx + labelRadius * cos(angle);
      final y = center.dy + labelRadius * sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: hour.toString().padLeft(2, '0'), // 00, 01 ... 23
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black54,
            fontFamily: 'SCDream',
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      canvas.save();
      // 글자 위치로 이동
      canvas.translate(x, y);
      // 중심 바라보게 회전
      canvas.rotate(angle + pi / 2);
      // 텍스트 중심 맞추기
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    }

    final tickPaint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 1;

    for (int i = 0; i < 48; i++) {
      // 30분 단위니까 48개, 12시가 맨 위
      final angle = -pi / 2 + i * (2 * pi / 48);

      // 정시는 길게, 30분은 짧게
      final isHour = i % 2 == 0;
      final tickStart = radius * 1.02;
      final tickEnd = isHour ? radius * 1.08 : radius * 1.05;

      final p1 = Offset(
        center.dx + tickStart * cos(angle),
        center.dy + tickStart * sin(angle),
      );
      final p2 = Offset(
        center.dx + tickEnd * cos(angle),
        center.dy + tickEnd * sin(angle),
      );

      canvas.drawLine(p1, p2, tickPaint);
    }

    final now = DateTime.now();
    final currentTime = now.hour + now.minute / 60;

    // 12시가 맨 위 기준 각도
    final arrowAngle = -pi / 2 + (currentTime - 12) * (2 * pi / 24);

    // 화살표 위치 (부채꼴 바깥쪽)

    final arrowRadius = labelRadius * 1.13;
    final ax = center.dx + arrowRadius * cos(arrowAngle);
    final ay = center.dy + arrowRadius * sin(arrowAngle);

    final arrowPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(ax, ay);
    canvas.rotate(arrowAngle + pi / 2); // 중심 방향 가리키게

    // 작은 삼각형 (안쪽 향함)
    final path = Path()
      ..moveTo(0, 6) // 뾰족한 끝이 중심 방향(아래)
      ..lineTo(-7, -4) // 바깥쪽 왼쪽
      ..lineTo(7, -4) // 바깥쪽 오른쪽
      ..close();
    canvas.drawPath(path, arrowPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant TimelinePainter oldDelegate) => true;
}
