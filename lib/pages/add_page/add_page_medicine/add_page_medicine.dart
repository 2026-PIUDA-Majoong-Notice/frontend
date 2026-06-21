import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/add_step_frame.dart';
import 'widgets/add_search_field.dart';

class AddPageMedicine extends StatefulWidget {
  const AddPageMedicine({super.key});

  @override
  State<AddPageMedicine> createState() => _AddPageMedicineState();
}

class _AddPageMedicineState extends State<AddPageMedicine> {
  final TextEditingController medicineSearchController =
  TextEditingController();

  final List<String> dummyMedicines = ['철분제', '항생제'];
  final List<String> selectedMedicines = [];
  final Map<String, Set<String>> selectedMedicineTimes = {};
  final List<String> timeOptions = ['아침', '점심', '저녁', '취침 전'];

  void addMedicine(String medicine) {
    if (selectedMedicines.contains(medicine)) return;

    setState(() {
      selectedMedicines.add(medicine);
      selectedMedicineTimes[medicine] = {};
      medicineSearchController.clear();
    });
  }

  void toggleMedicineTime(String medicine, String time) {
    setState(() {
      final times = selectedMedicineTimes[medicine] ?? <String>{};

      if (times.contains(time)) {
        times.remove(time);
      } else {
        times.add(time);
      }

      selectedMedicineTimes[medicine] = times;
    });
  }

  @override
  void dispose() {
    medicineSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddStepFrame(
          title: '복용약 정보',
          cancelText: '뒤로',
          nextText: '완료',
          onCancel: () {
            Get.back();
          },
          onNext: () {
            // TODO: 홈 화면으로 이동
          },
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                '더욱 정확한 용변 시간 예측을 위해\n용변에 영향을 미치는 약에 한해 정보를 수집해요\n\n복용약의 검색창을 통해\n복용하고 계신 약이 있는지 확인해주세요',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SCDream',
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Color(0xff26332F),
                ),
              ),
              const SizedBox(height: 30),

              AddSearchField(
                controller: medicineSearchController,
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 10,
                children: dummyMedicines.map((medicine) {
                  return GestureDetector(
                    onTap: () => addMedicine(medicine),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xffD9DEDB),
                        ),
                      ),
                      child: Text(
                        medicine,
                        style: const TextStyle(
                          fontFamily: 'SCDream',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff26332F),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              ...selectedMedicines.map((medicine) {
                return _MedicineTimeRow(
                  medicine: medicine,
                  timeOptions: timeOptions,
                  selectedTimes: selectedMedicineTimes[medicine] ?? {},
                  onTimeTap: (time) => toggleMedicineTime(medicine, time),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _MedicineTimeRow extends StatelessWidget {
  final String medicine;
  final List<String> timeOptions;
  final Set<String> selectedTimes;
  final ValueChanged<String> onTimeTap;

  const _MedicineTimeRow({
    required this.medicine,
    required this.timeOptions,
    required this.selectedTimes,
    required this.onTimeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            medicine,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xff26332F),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: timeOptions.map((time) {
              final isSelected = selectedTimes.contains(time);

              return GestureDetector(
                onTap: () => onTimeTap(time),
                child: Container(
                  width: 75,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xffE5F3EE)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xff6FAF9B)
                          : const Color(0xffD9DEDB),
                      width: isSelected ? 1.4 : 1,
                    ),
                  ),
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff26332F),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}