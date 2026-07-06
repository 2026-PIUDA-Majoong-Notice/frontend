<div align="center">

# Majoong Notice - Frontend

### 요양시설 어르신 케어 타이밍 알림 서비스

요양 시설 종사자와 보호자가 어르신의 배변 패턴을 한눈에 파악하고,<br/>
적절한 케어 타이밍을 놓치지 않도록 돕는 Flutter 앱입니다.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge)
![Dio](https://img.shields.io/badge/Dio-13B9FD?style=for-the-badge)

</div>

<br>

## 📖 소개

어르신마다 배변 시간대는 일정한 패턴을 보이지만, 이를 사람이 일일이 기억하고 관리하기는 어렵습니다.

**마중 알림**은 시간대별 배변 확률을 시각화하여 아래 두 가지 질문에 직관적으로 답합니다.

> 🔎 **"지금 얼마나 위험한가?"**
> 🔎 **"앞으로 언제 주의해야 하는가?"**

이를 통해 기저귀 교체나 화장실 안내 시점을 미리 준비할 수 있어, 어르신의 존엄과 위생을 지키고 돌봄 제공자의 부담을 덜어줍니다.

<br>

## ✨ 주요 기능

| 기능 | 설명 |
|---|---|
| 🏠 **홈** | 등록된 어르신 목록과 각자의 현재 배변 확률·상태를 프로필 카드로 한눈에 확인 |
| 🕐 **배변 타임라인** | 24시간 원형 차트로 시간대별 위험도와 다음 위험 시간대를 시각화 |
| 📝 **어르신 등록** | 기본 정보, 건강 정보, 배변 관련 정보를 단계별로 입력 |
| 📋 **케어 기록** | 배변·식사·투약 등 돌봄 활동을 기록하고 조회 |
| 🔔 **알림 설정** | 케어 타이밍, 기록 미입력, 야간 알림 등 상황별 알림 관리 |
| ⚙️ **화면 설정** | 글자 크기, 다크모드 등 사용자 맞춤 설정 |
| 🔐 **인증** | 로그인·회원가입·이메일 인증 및 실시간 유효성 검증 |

<br>

## 📱 화면 미리보기

<div align="center">

| 홈 | 배변 타임라인 | 어르신 등록 |
|:---:|:---:|:---:|
| <img src="./screenshots/home.png" width="220"/> | <img src="./screenshots/timeline.png" width="220"/> | <img src="./screenshots/register.png" width="220"/> |

| 케어 기록 | 알림 설정 | 인증 (로그인/회원가입) |
|:---:|:---:|:---:|
| <img src="./screenshots/care_log.png" width="220"/> | <img src="./screenshots/notification.png" width="220"/> | <img src="./screenshots/auth.png" width="220"/> |

</div>

> 📌 스크린샷은 `screenshots/` 폴더에 위 파일명으로 추가해주세요. (홈: `home.png`, 타임라인: `timeline.png`, 등록: `register.png`, 케어 기록: `care_log.png`, 알림 설정: `notification.png`, 인증: `auth.png`)

<br>

## 🧠 핵심 로직

### 1. 배변 확률 기반 시각화 계산

하나의 확률 값(0~100)으로 위험도 색상, 안내 문구, 이모지를 일관되게 결정합니다.

| 확률 범위 | 위험도 | 색상 |
|:---:|:---:|:---:|
| 0 ~ 39 | 낮음 | 🔵 파랑 |
| 40 ~ 69 | 보통 | 🟠 주황 |
| 70 ~ 100 | 높음 | 🔴 빨강 |

이 판단 기준을 뷰모델에 중앙화하여, 프로필 카드와 타임라인 등 여러 화면이 동일한 규칙으로 색과 문구를 표시합니다. 기준값이 바뀌어도 한 곳만 수정하면 전체에 반영됩니다.

<br>

### 2. 원형 타임라인 렌더링 (CustomPainter)

`CustomPainter`와 삼각함수를 이용해 24시간 도넛 차트를 직접 그립니다. 하루를 30분 단위 48개 구간으로 나누어 각 구간의 배변 확률을 표현합니다.

- **부채꼴 그리기**: 12시 방향(맨 위)을 시작점으로, 한 구간당 `360° / 48 = 7.5°`씩 시계 방향으로 회전하며 도넛 조각을 그립니다. 각 조각은 안쪽 반지름과 바깥쪽 반지름 사이를 `Path`의 `moveTo → lineTo → arcTo → close`로 이어 만들고, 확률에 따른 색으로 채웁니다.
- **시간 라벨 배치**: 각 시각(00~23)의 각도를 계산해 원 둘레 좌표를 구한 뒤, `canvas.translate`와 `rotate`로 글자를 해당 위치로 옮기고 중심을 바라보도록 회전시켜 배치합니다.
- **눈금 표시**: 48개 지점마다 눈금을 긋되, 정시는 길게·30분은 짧게 그려 시간 구간을 구분합니다.
- **현재 시각 화살표**: `DateTime.now()`를 소수 시각(예: 16시 30분 → 16.5)으로 변환해 각도를 구하고, 원 바깥에서 중심을 향하는 삼각형을 그려 현재 시각을 표시합니다.
- **좌표 보정**: 시계상 12시가 맨 위에 오도록 데이터 인덱스에 오프셋을 적용해, 색상 구간과 시간 숫자가 정확히 일치하도록 맞췄습니다.

<br>

### 3. 다음 위험 시간대 탐색

현재 시각 이후의 구간들을 순회하며, 배변 확률 40% 이상이 **연속으로 이어지는 첫 번째 구간**을 찾습니다.

- 현재 시각을 30분 단위 인덱스로 변환해 탐색 시작점을 정합니다.
- 확률 40% 이상인 지점을 만나면 구간의 시작으로 기록하고, 확률이 40% 미만으로 떨어지는 순간을 구간의 끝으로 판단합니다.
- 찾은 구간을 `"HH:MM ~ HH:MM"` 형태로 반환하여 "다음 배변 예상 시간"으로 안내합니다. (단일 구간이면 시작 시각만 표시)

<br>

## 🛠 기술 스택

<div align="center">

| 분류 | 기술 |
|:---:|:---:|
| Framework | Flutter |
| State Management | GetX |
| Networking | Dio |
| Architecture | MVVM |

</div>

<br>

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

<br>

## 🚀 실행 방법

```bash
flutter pub get
flutter run
```

<br>

<div align="center">

Made with 💚 by Majoong Notice Team

</div>
