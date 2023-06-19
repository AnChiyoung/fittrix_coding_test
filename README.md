# fittrix coding test

## 개요
1. 코딩 테스트를 통해 코드 스타일과 패턴을 적용하고, 협업하는 인원에게 선제적으로 해당 요소들을 알릴 수 있다.
2. ui, data flow, api, state management 사용법을 적용할 수 있다.
3. 되도록 모바일 개발에 가장 필수적인 요소들을 반영하여 작업할 수 있다.

## 문제 해결을 위한 아이디어 요약
1. 프로세스 항목작업
   - line length는 github의 line length와 가급적 통일 : 160 lines
   - 전체 상태관리 : provider 사용. 작업 소요가 크지 않기에 불필요한 코드 및 파일 증가를 배제하기 위해 선택
   - 코드 패턴 : MVVM
   - build warning, error fix
   - bottom navigation bar에 accodion drop-up을 적용하기 위한 뷰 배치의 분리
   - validate와 동시에 이루어지는 로그인 버튼 컨트롤에 대한 ui 에러는 validate ui의 분리로 해결
   - 가급적 framework 내의 요소로 구현하도록 라이브러리 최대한 배제
2. 작업 리스트 항목
   - 로그인
   - 로그아웃
   - bottom navigation bar item에 따른 화면 로직 작성
     : 로그인, 로그아웃에서의 각 화면의 동작
   - 운동 기록하기 하위 항목에 의한 페이지 표기 요소(운동 가이드 이미지) 변경(별도의 첨부파일이 없어 저작권을 고려한 이미지 사용)
   - 실행 후 디폴트 화면에 첨부파일의 영상을 재생
3. API 설계
   - login API만을 활용
   - end point를 query형태가 아닌 단일 url로 구성. 입력값에 대해 api call이 동작하도록 배치
     (mock api기에 로직보다는 기능의 동작 여부 정도만을 가늠하도록 설계)
   - response model은 login의 성공여부에 대한 메시지와 login의 유지를 위한 token만으로 간략하게 구성
   - response json field name : 'data' - 'message' + 'login_token'
   - 추후 개선한다면 'data' - 'user' + 'message' + 'login_token' + 'login_activetime'
                  'user' - 'id' + 'name' + 'profile' 정도로 개선하고자 함

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
   - android, iOS가 탑재된 디바이스 실기기 실행
   - android 10, fhd+의 android emulator
   - iOS16, fhd+의 iOS emulator
   - ipadOS가 탑재된 디바이스 실기기 실행

## 미해결 이슈 정리
1. 미구현 기능
   - 운동 기록 저장
   - 운동 기록 보기
   - 뒤로가기 동작에 의한 route control
   - 홈 화면 영상 순차 재생
   - mocking test case
2. 미해결 이슈
   - 영상 순차 재생 시, 두 번 째 영상이 노출되지 않는 현상
     (video player의 사용에 미흡하여, 온전한 기능을 구현하지 못함)
3. 미구현 기능을 구현했을 때의 설계 및 구현 방향
   - 운동 기록 저장 :
     현재는 user가 판별되지 않는 단순한 구조이므로, database에 생성 순차적으로 쌓일 수 있는 api를 작성,
     UI는 'yyyy-MM-dd'의 형태로 노출시키되, 내부적으로는 timestamp number나 시간계산이 가능한 형태로 데이터를 취급
   - 운동 기록 보기
     내림차순을 위한 api 단 sort나 앱 단 sort 중, api 단 sort를 선택
   - 뒤로가기 동작에 의한 route controll
     route name stack을 활용하여 이전 입력 정보 저장 및 route stack 관리
   - mocking test case list
     text입력값에 의한 mock api call response 비교,
     임의의 route stack에서 initial route까지 컨트롤이 가능한지 검증,
     login token 여부에 따라 화면이 불러와지는지, 혹은 가이드 다이얼로그는 제대로 노출되는지 검증,
     운동 기록 하기의 mock api call response 비교,
     운동 기록 보기의 mock api call response 비교
     