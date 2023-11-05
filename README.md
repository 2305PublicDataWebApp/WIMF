# 🐕새로운 가족을 찾는 곳,  Where Is My Family?

WIMF는 Where Is My Family? 의 약자로<br/><br/> 주인에게 버림받아 안락사 위기에 처한 강아지들에게 새로운 가족을 연결시켜줍니다.
-
![메인](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/a49f31af-8c48-4006-8a56-79a2ae03e492)


## 🖥  Spring Tool Suite 4 - Final Team Project

### 개발기간 : 2023/09/27 ~ 2023/10/26

### 팀명 : 개판오분전

## 👨‍👦‍👦 팀 역할 
![팀 역할](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/9a1fe320-6020-47cd-a98c-fd7688062aa9)
  
## 📝 프로젝트 개요


유기견 돌봄/입양
많은 유기견들이 각 보호소에서 7~30일간의 보호기간을 끝으로 가족을 찾지 못하면 안락사가 진행됩니다.
보호소에서 새로운 가족을 찾을 수 있는 홍보가 이루어지고는 있지만 많이 부족한 상황입니다.
전국의 보호소에서 보호되고 있는 유기견들의 정보를 보다 쉽게 많은 사람들이 유기견에게 힘을 보태줄 수 있게 만들어주기 위한 프로젝트입니다.

## 🧾  기능 목록

- [ 회원 ] : 'WIMF'는 회원제를 통해 검증된 구조자와 임보자가 안전하게 연결될 수 있는 임시보호 플랫폼을 제공합니다.
 
- [ 소통 ] : 'WIMF'는 소통게시판을 이용해 유기견 입양을 생각하기에 앞서 지켜야할 행동수칙, 팁 등을 회원들끼리 서로 자유롭게 공유하도록 합니다.
  
- [ 후원 ] : 'WIMF'는 후원시스템을 통해 임시보호자의 직접적인 부담을 덜어주고, 더 나아가 직접 유기견들을 보호합니다.
  
- [ 임시보호 ] : 'WIMF'는 유기견 사망률을 낮추기 위해 임시보호 시스템의 체계화 및 대중화에 앞장섭니다.
  
- [ 돌봄/입양 신청서 ] : 'WIMF'는 유기견들이 안전하게 가족을 만날 수 있게 철저한 검증을 통해 매칭을 하며 관리자가 신청서의 내용을 토대로 돌봄/입양에 대해서 반려하거나 수리 할 수 있습니다.
  
- [ 지도 ] : 'WIMF'는 지도를 사용하여 구조자들이 유기견을 구조한 위치를 보여주고 가족을 잃어버린 아이들을 보호하면서 가족을 찾아주는 역할도 겸하고 있습니다.

- [ 후기 ] : 'WIMF'는 후기 게시판을 활용하여 돌봄중이거나 좋을 가족을 찾아 입양간 유기견들이 현재 어떻게 지내고 있는지 볼 수 있게 합니다.

- [ 캘린더 ] : 'WIMF'는 회원은 개인 일정을 등록, 수정, 삭제할 수 있습니다. 강아지를 선택할 수 있고 임시보호, 후원으로 나누어 일정을 등록할 수 있게 됩니다. 돌봄 신청서가 승인되면 개인 캘린더에 일정이 자동등록 됩니다.

## 🚄 주요 기능
### 메인페이지
기능명 | 상세
-------|-----
일정 관리 | 회원은 로그인 시에 캘린더를 조회할 수 있다. 일정을 팝업창을 통해 등록할 수 있다. 일정을 드래그해 기간 수정을 할 수 있다. 일정을 클릭해 삭제할 수 있다. 요일 칸을 눌러 해당 일자에 등록해놓은 일정을 조회할 수 있다. 임시보호 신청을 하고 관리자가 승인하게 되면 일정에 자동 등록된다.
게시물 조회 | 다른 게시판의 정보를 가져와 메인화면에서 조회, 연결한다.
문의 이메일 전송 | 비회원도 메일정보를 입력하여 문의를 할 수 있다. 보낸 메일의 정보는 'WIMF' 관계자에게 메일로 전송된다.
### 회원관리
기능명 | 상세
-------|-----
회원가입 | 아이디, 비밀번호, 이름, 닉네임, 이메일, 주민번호, 전화번호, 이메일 인증번호를 입력하면 가입이 가능하다. 필수 정보는 반드시 입력해야 하며 아이디, 닉네임, 이메일은 중복 확인을 통해 고유한 정보임을 확인해야 한다. 이메일은 이메일 인증을 통해 사용자가 실제 사용하는 계정임을 인증해야 한다. 아이디, 닉네임, 이메일은 회원 간 중복될 수 없다.
로그인 | 회원가입 시 입력한 정보와 아이디, 비밀번호가 일치하면 로그인이 가능하다. 로그인 창에서 회원가입, 아이디 찾기, 비밀번호 찾기 페이지로 이동할 수 있다. 아이디 찾기와 비밀번호 찾기는 둘 다 이메일 인증을 필수로 하며, 아이디 찾기에서는 이름과 이메일을 입력하면 뒤 3자리가 필터링 된 아이디 정보를 확인할 수 있다. 또한 비밀번호 찾기 페이지에서는 아이디와 이름, 이메일을 입력하고 인증번호를 받아 인증이 완료된다면 비밀번호를 재설정 할 수 있다.
마이페이지 | 회원의 최근 활동 내역을 확인할 수 있다. 회원 정보 수정, 회원 탈퇴로 이동할 수 있다. 마이페이지에서 비밀번호, 닉네임, 전화번호, 주소를 수정할 수 있으며, 닉네임과 이메일을 변경할 경우 중복 확인 및 이메일 인증을 해야 변경이 가능하다. 회원 탈퇴 페이지에서는 비밀번호를 입력 시 정말 탈퇴할 것인지 확인 창이 뜨고 확인을 누르면 회원 탈퇴가 된다.
후원중인 유기견 리스트 | 마이페이지 우측에서 확인 가능 하며, 후원한 강아지의 이름, 후원 날짜, 누적 후원 금액, 입양 / 돌봄 여부, 안락사 날짜를 확인할 수 있다.
작성한 게시글 리스트 | 내가 작성한 게시글을 리스트로 확인이 가능하다. 글 제목을 통해 해당 글의 상세정보 페이지로 이동 할 수 있다.
좋아요 한 유기견 리스트 | 좋아요한 유기견 리스트를 확인 할 수 있다. 해당 유기견의 사진, 이름이 출력되며 유기견의 이름을 눌러 해당 유기견의 상세정보 페이지로 이동 할 수 있다.
작성한 입양 / 돌봄신청서 리스트 | 관리자에게 신청한 입양 / 돌봄신청서에 해당하는 유기견 리스트를 볼 수 있다. 해당 글 제목을 눌러 신청한 유기견의 상세정보 페이지로 이동 할 수 있다.
### 강아지
기능명 | 상세
-------|-----
강아지 관리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 관리자아이디로 로그인하면 강아지 리스트에 등록 버튼이 활성화된다. 관리자는 돌봄 강아지에 대한 정보와 이미지 3개를 등록하고 제출하여 DB에 등록할 수 있다. 관리자가 상세페이지로 이동하면 해당 강아지 수정,삭제 버튼이 활성화된다. 버튼을 통해 강아지의 정보와 이미지를 수정할 수 있는 수정폼으로 이동가능하며 삭제 버튼을 통해 강아지를 삭제할 수 있다.
강아지 목록 조회 | 한 페이지당 6마리 강아지의 이미지와 정보, 5개의 네비게이터가 표시된다. 강아지 썸네일과 이름, 품종, 돌봄상태, 안락사 예정일을 조회할 수 있고 후원 바를 통해 후원상태를 조회할 수 있다. 지역을 선택하거나 정렬방식을 선택하여 해당 옵션에 해당하는 강아지 목록, 강아지 수를 조회할 수 있다. 하단의 검색칸을 이용하여 강아지 이름을 검색하여 조회할 수 있다.
강아지 상세정보 조회 | 강아지 상세페이지에서 해당 강아지의 지역, 품종, 이름, 이미지, 상세정보를 조회할 수 있다. 로그인 시 하트모양의 좋아요 버튼이 활성화되고 좋아요를 눌러 상태를 변경할 수 있다. 상세 정보 밑 돌봄신청서로 이동 버튼 클릭 시 해당 강아지 입양 및 돌봄을 신청하는 폼으로 이동할 수 있다. 후원하러 가기 버튼 클릭 시 해당 강아지를 후원할 수 있는 결제폼으로 이동할 수 있다.
강아지 발견장소 지도 조회 | 상세정보영역 밑 강아지 발견장소를 조회할 수 있는 지도가 위치한다. 지도를 통해 간단한 위치를 확인할 수 있고 클릭 시 카카오 지도로 이동한다. 
강아지 댓글 | 비회원은 댓글 조회만 가능하다. 회원 로그인 시 댓글을 입력할 수 있는 댓글란이 활성화되고 버튼을 통해 등록할 수 있다. 댓글 등록 시 한줄씩 생성되어 리스트가 늘어난다. 등록한 댓글을 수정,삭제 버튼을 통해 자신이 작성한 댓글을 수정,삭제 할 수 있다. 댓글이 수정되면 작성일(수정일)칸의 날짜가 기존 작성날짜에서 수정날짜로 변경되고 (수정됨)이 표시된다.
### 커뮤니티
기능명 | 상세
-------|-----
소통 게시판 | 로그인 한 회원은 게시글을 작성, 수정, 삭제 가능하고 전체,작성자,제목,내용으로 게시글 검색이 가능하다. 상세글에서는 좋아요와 댓글을 쓸 수 있고, 댓글은 자신이 쓴 댓글에 한해서 수정과 삭제가 가능하다.
후원하기 | 로그인 한 회원은 돌봄리스트에서 자신이 후원하고 싶은 유기견의 상세페이지로 넘어가서 후원하러가기 버튼을 눌러 후원페이지에서 후원을 진행할 수 있다. 후원금액은 직접입력 또는 금액버튼을 통해 입력이 가능하고 결제방식을 카카오페이 또는 신용카드로 선택해서 결제를 진행할 수 있다.
### 후기 게시판
기능명 | 상세
-------|-----
후기 게시판 | 회원이 작성, 수정, 삭제 가능하다. 사용자는 후기 게시판 목록을 조회 가능하다.
돌봄 후기 게시판 | 같은 후기 게시판이지만 돌봄으로 체크해서 분류하고, 돌봄 시작일과 종료일이 있다. 돌봄 후기만 따로 볼 수 있다.
입양 후기 게시판 | 같은 후기 게시판이지만 입양으로 체크해서 분류하고, 입양 시작일만 있다. 입양 후기만 따로 볼 수 있다.
후기 게시판 상세 | 사용자는 후기 게시판 상세정보를 조회 가능하다. 관리자는 삭제를 할 수 있고, 글 작성자는 수정, 삭제가 가능하다. 회원은 댓글 작성이 가능하며, 본인이 쓴 댓글의 수정 삭제가 가능하다.
### 지도
기능명 | 상세
-------|-----
지도 | 마커를 누르면 커스텀오버레이가 튀어나오고 커스텀오버레이를 클릭하면 해당 여행지 상세페이지로 이동한다. 커스텀 오버레이는 강아지 구조위치를 나타내며, 강아지의 사진과 이름을 조회할 수 있다.
강아지상세정보지도 | 강아지상세정보에 지도를 누르면 카카오맵으로 연결된다.
### 돌봄 입양 신청
기능명 | 상세
-------|-----
돌봄 입양 신청서 목록 조회 | 관리자는 회원이 작성산 돌봄, 입양 신청 내역의 리스트를 조회할 수 있다.
돌봄 입양 신청서 상세 조회 | 관리자는 회원이 작성한 돌봄, 입양 신청서 상세 내역을 볼 수 있다. 관리자는 승인, 반려, 보류 중 하나를 선택하고 누를 수 있으며, 승인 시 신청서의 데이터가, 강아지 정보와 캘린더에 입력된다.
돌봄 입양 신청서 작성 | 회원은 강아지 정보 상세 페이지에서 돌봄, 입양신청서를 작성 가능하다.


## 📚 개발 환경
<div>
 <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
 <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
 <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
 <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
 <img src="https://img.shields.io/badge/ajax-007396?style=for-the-badge&logo=ajax&logoColor=white">
 <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
 <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
 <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"><br/>
 <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=yellow">
 <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
 <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
 <img src="https://img.shields.io/badge/slack-4A154B?style=for-the-badge&logo=slack&logoColor="purple">
 <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
</div>

## 📺 구현 화면

### 1. 메인페이지
1-1 메인페이지
![메인페이지](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/a01cb603-d9f1-4967-acad-f11e3c8ba96d)

### 2. 회원기능
2-1. 회원 가입
![WIMF 회원기능 회원가입 페이지1](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/13f03000-eec5-4d50-8320-999a7bc1bc2e)
![WIMF 회원기능 회원가입 페이지2](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/ce230c03-aec0-4044-8847-c75b93f8d126)
![WIMF 회원기능 회원가입 페이지3](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/2557f292-04f8-43b0-b00a-ada6772f1d43)


2-2 로그인
![WIMF 회원기능 로그인페이지](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/29e9b106-15dd-433e-abdd-37571bd64402)


2-3 아이디찾기, 비밀번호 찾기
2-3-1 아이디 찾기
![WIMF 회원기능 아이디찾기 페이지1](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/81955aa5-98da-4a92-91b6-c85cda10b4e1)
![WIMF 회원기능 아이디찾기 페이지2](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/1259ce39-7f6f-4658-8732-d9e1ca7a2c8f)
![WIMF 회원기능 아이디찾기 페이지3](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/8f92be26-be90-4345-b83f-d7d7bfb7ad2f)


2-3-2 비밀번호 찾기
![WIMF 회원기능 비밀번호찾기 페이지1](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/43d37bab-6796-4b91-845a-d6fd10512063)
![WIMF 회원기능 아이디찾기 페이지2](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/065430c6-f741-4353-8807-d6d62f10c117)
![WIMF 회원기능 비밀번호찾기 페이지3](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/b7039b86-3da4-41a5-a908-84c36fe57f0a)


2-4 마이페이지
2-4-1 개인정보 수정 및 후원한 유기견 리스트
![WIMF 회원기능 마이페이지1](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/b0db25e9-fb53-4e31-af02-e43007ca31cf)

2-4-2 나의 활동(작성한 게시글)
![WIMF 회원기능 마이페이지2](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/4f67db22-1ba3-4281-9199-00228741aef2)

2-4-3 나의 활동(좋아요 한 유기견 리스트)
![WIMF 회원기능 마이페이지3](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/bfbe087f-cb49-4820-8312-8725915c5db2)

2-4-4 나의 활동(작성한 입양신청서 리스트)
![WIMF 회원기능 마이페이지4](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/cd318fd2-473e-4c56-b760-eb11689f5e47)

2-4-5 비밀번호 변경
![WIMF 회원기능 마이페이지5](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/eb3206a1-c625-4425-80e1-5ea69215ab69)

2-4-6 회원 탈퇴
![WIMF 회원기능 마이페이지6](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/882dc433-7596-474b-8017-302eca5cd7c0)


2-5 인증번호 수신 페이지
![WIMF 회원기능 인증번호 이메일](https://github.com/2305PublicDataWebApp/WIMF/assets/134674191/10875d31-56af-4436-91f6-556192f7533a)


### 3. 강아지 돌봄
3-1 돌봄 동물 리스트
![돌봄 동물 리스트(비관리자)](https://github.com/2305PublicDataWebApp/WIMF/assets/134674212/704a059b-eb7a-413d-8c4a-93e932363bc3)

3-2 돌봄 동물 상세페이지
![돌봄 동물 상세페이지(비회원)](https://github.com/2305PublicDataWebApp/WIMF/assets/134674212/b094427f-d1f2-4fe4-8bdf-590e5ffa2698)

3-3 돌봄 동물 등록폼
![돌봄 동물 등록페이지](https://github.com/2305PublicDataWebApp/WIMF/assets/134674212/608cd688-45ef-42a1-8750-77f7ac953b59)

3-4 돌봄 동물 수정폼
![돌봄 동물 수정페이지](https://github.com/2305PublicDataWebApp/WIMF/assets/134674212/883babab-282f-4434-85c7-1585b0fd2845)

3-5 돌봄 동물 리스트(관리자)
![돌봄 동물 리스트(관리자)](https://github.com/2305PublicDataWebApp/WIMF/assets/134674212/814cf2d7-0267-4f99-a194-0d0d40440b11)

3-6 돌봄 동물 상세페이지(관리자)
![돌봄 동물 상세페이지(관리자)](https://github.com/2305PublicDataWebApp/WIMF/assets/134674212/127d7112-d76c-4b20-b0ef-23087b4de209)

### 4. 후기
4-1 후기 목록
![후기 목록](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/350979b9-a3e7-4358-bac0-d61b83af3bc1)

4-2 후기 상세
![후기 상세](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/c8d06fbb-740a-4bc6-80f4-3f1b083b16e0)

4-3 후기 작성
![후기 작성](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/40f03e12-3443-486a-a19c-9daab447575a)

4-4 후기 수정
![후기 수정](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/39a94945-c74e-4016-97e4-9e94f4664b2f)

### 5. 신청서
5-1 신청서 목록
![신청서 목록](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/628fad6a-0136-4c9a-a317-e19a57009b75)

5-2 신청서 상세
![신청서 상세](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/15ab2d02-0889-4375-9f13-775b60a7d265)

5-3 신청서 작성
![신청서 작성](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/901e531c-382d-4502-a6ac-1f2efc064f15)

### 6. 지도
6-1 지도
![지도](https://github.com/2305PublicDataWebApp/WIMF/assets/134674363/49b221fb-ad01-458d-951e-d8ebaa7ec26f)

### 7. 소통 게시판
7-1 게시판 목록
![소통 게시판](https://github.com/2305PublicDataWebApp/WIMF/assets/134577399/25fc659b-8e7a-4e18-82b0-75c68174afcb)

7-2 게시글 작성
![소통 작성](https://github.com/2305PublicDataWebApp/WIMF/assets/134577399/618f1672-621b-4820-b139-32e0db8fd5e6)

7-3 게시글 상세
![소통 상세](https://github.com/2305PublicDataWebApp/WIMF/assets/134577399/181bc19d-f49e-4857-8bf5-6179eb232eea)

7-4 게시글 수정
![소통 수정](https://github.com/2305PublicDataWebApp/WIMF/assets/134577399/9c611adf-67b2-479d-90ba-598f0e0a0676)

### 8. 후원
8-1 후원페이지
![후원](https://github.com/2305PublicDataWebApp/WIMF/assets/134577399/70e47130-009a-4d8a-b002-fe1d1c293fb6)

8-2 후원방식 (카카오페이)
![후원(카카오페이 결제)](https://github.com/2305PublicDataWebApp/WIMF/assets/134577399/2d3d1fdb-383b-4c82-8e87-7b5ec86d4a15)

8-3 후원방식 (신용카드)
![후원(신용카드 결제)](https://github.com/2305PublicDataWebApp/WIMF/assets/134577399/04c0b19a-6eb0-451e-b22b-e7caf84a39db)
