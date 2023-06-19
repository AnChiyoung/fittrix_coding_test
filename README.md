# fittrix coding test

## 개요
1. 코딩 테스트를 통해 코드 스타일과 패턴을 적용하고, 협업하는 인원에게 선제적으로 해당 요소들을 알릴 수 있다.
2. ui, data flow, api, state management 사용법을 적용할 수 있다.
3. 되도록 모바일 개발에 가장 필수적인 요소들을 반영하여 작업할 수 있다.

## 문제 해결을 위한 아이디어 요약
1. 프로세스 항목작업
   - line length는 github의 line length와 가급적 통일 : 160 lines
   - 화면 전체에 대한 상태관리 : provider 사용
   - MVVM
   - build warning, error fix
   - bottom navigation bar에 accodion drop-up을 적용하기 위한 뷰 배치의 분리
   - validate와 동시에 이루어지는 로그인 버튼 컨트롤에 대한 ui 에러는 validate ui의 분리로 해결
   - 가급적 framework 내의 요소로 해결하도록 라이브러리 배제
8. 작업 리스트 항목
    - 로그인
    - 로그아웃
    - bottom navigation bar item에 따른 화면 로직 작성
      : 로그인, 로그아웃에서의 각 화면의 동작
    - 운동 기록하기 하위 항목에 의한 페이지 표기 요소 변경
    - 운동 기록 화면 x
    - test case x
9. API 설계
    - login에 활용
    - response model은 login의 성공여부에 대한 메시지와 login의 유지를 위한 token만으로 구성되어 있음

## 개발 환경
1. FE, BE, 환경 구성
   - flutter version 3.10.5 
   - dart version 3.0.5 
   - OS : Mac ventura 
   - tool : android studio version electric eel 2022.1.1 Patch 1
   - android language : kotlin, iOS language : swift
   - build platform : android, iOS, ipadOS, 미사용(mac universal, linux, web, windows)
   - mockapi.io

## 프로젝트 빌드 & 테스트 & 실행 방법

## 미해결 이슈 정리
1. 미해결 기능 : 운동 기록, 운동 기록 보기, 홈 화면 영상 순차 재생, mocking test case 작성x


### Backlog
1. 