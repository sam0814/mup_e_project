# MupE_project🎬

<br>

## 프로젝트를 기획하게 된 계기🎈
>평소 영화를 관람한 후 SNS에 한 줄 소감을 쓰는 편입니다. 영화를 본 후 사람들에게 영화 추천이 <br>
>나 짧은 한 줄 소감, 5점 만점 별점을 매겨 영화가 전반적으로 사람들에게 어떻게 평가받고 있는
>지 한 눈에 알아보고 싶었고, 이 기능을 CRUD 기법으로 잘 녹여내 웹 사이트를 구현할 수 있을 것
>같아 이 프로젝트를 기획하게 되었습니다.

<br>

## 사용 기술

<img src="https://img.shields.io/badge/html5-%23E34F26.svg?&style=for-the-badge&logo=html5&logoColor=white" />&nbsp;
<img src="https://img.shields.io/badge/javascript-%23F7DF1E.svg?&style=for-the-badge&logo=javascript&logoColor=black" />
<img src="https://img.shields.io/badge/spring-%236DB33F.svg?&style=for-the-badge&logo=spring&logoColor=white" />
<img src="https://img.shields.io/badge/jquery-%230769AD.svg?&style=for-the-badge&logo=jquery&logoColor=white" />

<img src="https://img.shields.io/badge/java-%23007396.svg?&style=for-the-badge&logo=java&logoColor=white" />&nbsp;
<img src="https://img.shields.io/badge/mysql-%234479A1.svg?&style=for-the-badge&logo=mysql&logoColor=white" />
<img src="https://img.shields.io/badge/bootstrap-%237952B3.svg?&style=for-the-badge&logo=bootstrap&logoColor=white" />
<img src="https://img.shields.io/badge/json-%23000000.svg?&style=for-the-badge&logo=json&logoColor=white" />
<img src="https://img.shields.io/badge/MyBatis-6f4c5b?style=flat-square&logo=Java&logoColor=white" height=28>

<br>

## DB /URL 설계⛏

![DB](https://github.com/sam0814/mup_e_project/assets/100101088/0983b148-6597-4d8a-a6f5-189f4da34596)

<br>

![URL설계 PNG](https://github.com/sam0814/mup_e_project/assets/100101088/4aba3ecd-60ea-4529-8d06-db9ee85716bc)

### [DB/URL 설계 링크📄](https://docs.google.com/spreadsheets/d/1Rr4sLkQ-vwmej9jg9o0a0RR1LafXtOKa_nuCFyVYo9Q/edit?usp=sharing)
: DB/URL 설계링크

<br>

## 페이지 별 기능 상세🖍

### Mupick🎞

<br>

![mupick](https://github.com/sam0814/mup_e_project/assets/100101088/6b3ac864-d209-4283-b26b-8a4d6510810e)

### MupStar⭐

<br>

![MupStar](https://github.com/sam0814/mup_e_project/assets/100101088/1bdaeba2-8451-4d52-9278-17e5e02dc28f)


### Muphoto📸

<br>

![Muphoto](https://github.com/sam0814/mup_e_project/assets/100101088/45b9e9d4-4122-49a9-ab6e-8b39e7fe357b)


### admin🔐

<br>

![admin](https://github.com/sam0814/mup_e_project/assets/100101088/052c9c89-8f45-468d-9d2f-c7a0c1cc31bc)

<br>

### [프로젝트 시연 영상 링크📄](https://youtu.be/8VouR_pWO7o)
: 프로젝트 시연 영상 링크

<br>


## 트러블 슈팅💣

### HttpSession session 의 이해도 부족💡
>admin 페이지에서는 관리자가 매달 새로운 영화의 포스터 이미지만 업로드해주면 되기 때문에
>로그인 된 user의 정보를 불러올 필요가 없습니다. 당시 개발 중 일 땐 session의 개념을 정확히
>알지 못해 여기저기 관리자 페이지를 비롯한 페이지에서 불러오고 했는데 user가 로그인을 할 때
>user의 sesson-id를 생성하고 서버로부터 발행된 session을 통해 user를 위한 데이터를 활용하기
>때문에 session을 불러온다는 걸 알게 되었고 그 뒤로 로그인 여부를 확인하거나 user 안에 담기
>정보가 필요할 때만 session을 불러올 수 있게 코드를 구현 할 수 있었습니다.

<br>

### 파라미터의 중요성💡
>admin 페이지에서 관리자가 영화 이미지를 올리면 mupstar 페이지에서 관리자가 올린 영화가
>보이도록 코드를 구현하였습니다. 컨트롤러에서 postList(영화 리스트)를 id로 받아와서 view 화
>면에 나타날 수 있게 구현 했었는데 결과적으로 지금 mupstar 페이지에서 view 화면을 보여주려
>고 하는 건 특정 id를 받아와 보여주려는것이 아니라 관리자가 올린 모든 post(영화)를 보여주는
>것이기 때문에 id를 받아와서 보여줄 필요가 없었습니다.

<br>

## 프로젝트를 하며 느낀 점💎
>프로젝트를 하기 전까진 스프링의 동작 방식을 잘 이해하지 못했는데 처음 스스로 프로젝트
>를 기획해보며 흐름을 많이 이해 할 수 있었습니다. 초반에 충분한 지식이 없었던 상태로 시작했
>어서 그런지 발생하는 오류도 많았고 되돌아 보면 금방 해결 할 수 있는 오류도 반나절 붙잡고 고
>민 했던 적도 있습니다. 하지만 “하면 된다” 라는 마음가짐으로 포기하지 않고 계속 해서 흐름을
>전체적으로 보려고 노력하며 열심히 코드를 만들어보니 CRUD 기법을 담을 수 있는 웹사이트를 구현 해 낼 수 있었습니다.
>이 프로젝트를 통해 제가 직접 구현 한 코드들이 기능을 할 수 있다는것에 큰 기쁨을 느꼈고 흥미
>를 느꼈습니다. 또한 제가 포기하지 않고 끝까지 붙잡을 수 있는 근성이 있다는것도 알게되었고
>처음 개발자의 꿈을 가지고 공부를 시작했을때의 저와 지금의 저를 비교해보면 많이 성장했다는
>걸 알게 되었습니다. 처음엔 큰 산 처럼 느껴졌지만 해낼 수 있다는 용기와 끈기가 이 프로젝트를
>완성 시킬 수 있는 힘이 되어준것 같습니다. 앞으로 개발자로써 더 많은 경험을 만들어보며 다양한 프로젝트를 완성하고 싶습니다.


