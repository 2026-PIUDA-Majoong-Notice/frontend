# Majoong Notice - Frontend

요양시설 어르신 알림 서비스 프론트엔드 (Flutter)

## 🛠 기술 스택

- **Framework**: Flutter
- **State Management**: GetX
- **Networking**: Dio
- **Architecture**: MVVM

## 📁 프로젝트 구조

\`\`\`
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
\`\`\`

## 🚀 실행 방법

\`\`\`bash
flutter pub get
flutter run
\`\`\`
