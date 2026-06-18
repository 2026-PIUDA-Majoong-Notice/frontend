// widgets/toilet_timeline.dart
import 'package:flutter/material.dart';
import 'package:majoong_notice/components/toilet_timeline/view_model/timeline_view_model.dart';
import 'package:majoong_notice/components/toilet_timeline/widgets/timeline_painter.dart';

class ToiletTimeline extends StatefulWidget {
  final TimelineViewModel viewModel;

  const ToiletTimeline({super.key, required this.viewModel});

  @override
  State<ToiletTimeline> createState() => _ToiletTimelineState();
}

class _ToiletTimelineState extends State<ToiletTimeline> {
  late TimelineViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Transform.scale(
        scale: 0.8,
        child: CustomPaint(
          painter: TimelinePainter(viewModel: viewModel),
        ),
      ),
    );
  }
}