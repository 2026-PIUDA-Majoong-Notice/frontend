import 'package:flutter/material.dart';
import 'package:majoong_notice/components/profile_card/view_model/profile_card_view_model.dart';

class ProfileCard extends StatefulWidget {
  final ProfileCardViewModel data;

  const ProfileCard({super.key, required this.data});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  late ProfileCardViewModel viewModel;
  final probabilityComments = ["용변 확률 낮음", "용변 확률 보통", "용변 확률 높음"];

  @override
  void initState() {
    super.initState();
    viewModel = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox( // 기기 크기에 따라서 배경이미지와 구조 안맞는 문제 해결
      fit: BoxFit.contain,
      child: SizedBox(
        width: 362,
        height: 148,
        child: Container(
          //테두리
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color(0xFF26332F).withOpacity(0.3),
              width: 0.5,
            ),
          ),
          child: ClipRRect(
            //모서리 둥글게
            borderRadius: BorderRadius.circular(20),
            child: Container(
              //이미지 삽입
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/profile_bg.png'),
                  alignment: Alignment.centerLeft,
                ),
              ),

              child: Stack(
                //배경 이미지에 맞춰, 각 요소 배치
                children: [
                  Positioned( // 현재 시간대 용변확률
                    top: 10,
                    left: 227,
                    child: Row(
                      children: [
                        Text(
                          "현재 시간대\n용변 확률",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "SCDream",
                            color: Color(0xFF26332F).withOpacity(0.5),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "${viewModel.data.toiletProbability.toString()}%",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SCDream",
                            color: viewModel.probablityLevel() == 0
                                ? Color(0xFF4A80E5)
                                : viewModel.probablityLevel() == 1
                                ? Color(0xFFE59F4A)
                                : Color(0xFFD96B6B),
                          ),
                        ),
                        SizedBox(width: 3),
                        Image(
                          image: AssetImage(viewModel.probabilityImagePath()),
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    // 프로필 이미지
                    top: 30,
                    left: 20,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(0xFFF6FAF8),
                      backgroundImage: AssetImage('assets/images/icon_user.png'),
                    ),
                  ),

                  Positioned(
                    // 이름,태그들, 마지막 용변 이후 n시간 경과
                    top: 45,
                    left: 105,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              viewModel.data.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'SCDream',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 3),

                            Column(
                              children: [
                                SizedBox(height: 9),
                                Text(
                                  '어르신',
                                  style: TextStyle(
                                    fontFamily: 'SCDream',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 13),

                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Wrap(
                            spacing: 8,
                            children: [
                              ...viewModel.data.tags.map(
                                    (element) => Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFF6FAF8),
                                  ),
                                  child: Text(
                                    element,
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),

                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                            '마지막 용변 후 ${viewModel.lastToiletTime()}시간 경과',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF26332F).withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    // 현재 시간 용변 확률 낮음/보통/높음
                    left: 246,
                    top: 50,
                    child: Text(
                      probabilityComments[viewModel.probablityLevel()],
                      style: TextStyle(fontSize: 17, fontFamily: 'SCDream', fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}