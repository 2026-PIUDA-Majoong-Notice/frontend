import 'package:flutter/material.dart';

import '../widgets/settings_app_bar.dart';
import 'widgets/settings_alarm_switch_tile.dart';


class SettingsAlarmPage extends StatefulWidget {
  const SettingsAlarmPage({super.key});

  @override
  State<SettingsAlarmPage> createState() => _SettingsAlarmPageState();
}

class _SettingsAlarmPageState extends State<SettingsAlarmPage> {
  bool careTimingAlarm = true;
  bool missingRecordAlarm = true;
  bool nightAlarmLimit = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FCFA),
      body: SafeArea(
        child: Column(
          children: [
            const SettingsAppBar(title: '알림 설정'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                children: [
                  SettingsAlarmSwitchTile(
                    title: '케어 타이밍 알림',
                    value: careTimingAlarm,
                    onChanged: (value) {
                      setState(() {
                        careTimingAlarm = value;
                      });
                    },
                  ),
                  SettingsAlarmSwitchTile(
                    title: '기록 미입력 알림',
                    value: missingRecordAlarm,
                    onChanged: (value) {
                      setState(() {
                        missingRecordAlarm = value;
                      });
                    },
                  ),
                  SettingsAlarmSwitchTile(
                    title: '야간 알림 제한',
                    value: nightAlarmLimit,
                    showDivider: false,
                    onChanged: (value) {
                      setState(() {
                        nightAlarmLimit = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}