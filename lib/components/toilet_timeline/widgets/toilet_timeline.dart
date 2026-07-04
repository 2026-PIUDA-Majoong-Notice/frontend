//widgets/toilet_timeline.dart
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
    return FittedBox(
      fit: BoxFit.contain,
      child: Stack(
        children: [
          Container(
            width: 362,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF26332F).withOpacity(0.3),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFF6FAF8),
            ),

            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFDDEEE7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 17),
                    child: Text(
                      "용변 타임라인",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SCDream',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 330,
                  child: Transform.scale(
                    scale: 0.63,
                    child: CustomPaint(
                      painter: TimelinePainter(viewModel: viewModel),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30,
            top: 325,
            child: Image(
              image: AssetImage("./assets/images/moon.png"),
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            top: 198,
            left: 163,
            child: Image(
              image: AssetImage(viewModel.probabilityImagePath(viewModel.data.slots[viewModel.currentTimeSlot].probability)),
              width: 37,
              height: 37,
            ),
          ),
          Positioned(
            left: 305,
            top: 70,
            child: Image(
              image: AssetImage("./assets/images/sun.png"),
              width: 35,
              height: 35,
            ),
          ),
          Positioned(
            top: 14,
            left: 190,
            child: Row(
              children: [
                Text("다음 대변\n예상 시간", style: TextStyle(fontFamily: 'SCDream', fontSize: 10)),
                SizedBox(width: 10,),
                Text(viewModel.nextRiskPeriod()!, style: TextStyle(fontFamily: 'SCDream', fontSize: 15))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
