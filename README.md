# Majoong Notice - Frontend

요양시설 어르신 알림 서비스 프론트엔드 (Flutter)

<br>
소개

마중 알림은 요양 시설 종사자와 보호자가 어르신의 배변 패턴을 한눈에 파악하고, 적절한 케어 타이밍을 놓치지 않도록 돕는 앱입니다.

어르신마다 배변 시간대는 일정한 패턴을 보이지만, 이를 사람이 일일이 기억하고 관리하기는 어렵습니다. 마중 알림은 시간대별 배변 확률을 시각화하여, "지금 얼마나 위험한지", "앞으로 언제 주의해야 하는지" 를 직관적으로 보여줍니다. 이를 통해 기저귀 교체나 화장실 안내 시점을 미리 준비할 수 있어, 어르신의 존엄과 위생을 지키고 돌봄 제공자의 부담을 덜어줍니다.

<br>

## 🛠 기술 스택

- **Framework**: Flutter
- **State Management**: GetX
- **Networking**: Dio
- **Architecture**: MVVM

## 📁 프로젝트 구조

```
lib/
├── core/                 # dio_client 등 앱 전역 설정
├── model/                # 데이터 모델 클래스
├── pages/                # 화면 단위
│   ├── auth/
│   │   ├── data/         # repository (API 호출)
│   │   ├── view_model/
│   │   └── widgets/      # 화면 UI
│   └── ...
├── services/             # API 통신 계층
│   ├── auth/
│   ├── http/
│   └── ...
└── widgets/              # 공통 위젯 (여러 화면에서 재사용)
```

## 🚀 실행 방법

```bash
flutter pub get
flutter run
```
