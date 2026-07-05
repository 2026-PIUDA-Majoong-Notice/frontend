import 'package:flutter/material.dart';
import 'package:majoong_notice/components/elder_status_card/widgets/status_field.dart';

class StatusCard extends StatefulWidget {
  const StatusCard({super.key});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  final now = DateTime.now();
  late String today = '${now.year}.${now.month.toString().padLeft(2, '0')}.${now.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        children: [Container(
          width: 362,
          height: 160,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF26332F).withOpacity(0.3),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF6FAF8),
          ),
          child:  const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: AlignmentGeometry.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 18,
                    children: [ // 수분, 식사, 약, 활동, 수면
                      StatusField(
                        imagePath: "assets/images/water.png",
                        title: '수분',
                        statusComment: '-',
                      ),
                      StatusField(
                        imagePath: "assets/images/food.png",
                        title: '식사',
                        statusComment: '-',
                      ),
                      StatusField(
                        imagePath: "assets/images/medicine.png",
                        title: '약',
                        statusComment: '-',
                      ),
                      StatusField(
                        imagePath: "assets/images/activity.png",
                        title: '활동',
                        statusComment: '-',
                      ),
                      StatusField(
                        imagePath: "assets/images/sleep.png",
                        title: '수면',
                        statusComment: '-',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),Positioned(
          left: 245,
          top: 142,

          child: Text("*금일 $today 기준" ,style: const TextStyle(
            fontFamily: 'SCDream',
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),),
        )]
      ),
    );
  }
}
