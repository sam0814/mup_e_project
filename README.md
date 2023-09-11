# mup_e_project🎬

## 프로젝트를 기획하게 된 계기🎈
>평소 영화를 관람한 후 SNS에 한 줄 소감을 쓰는 편입니다. 영화를 본 후 사람들에게 영화 추천이 <br>
>나 짧은 한 줄 소감, 5점 만점 별점을 매겨 영화가 전반적으로 사람들에게 어떻게 평가받고 있는
>지 한 눈에 알아보고 싶었고, 이 기능을 CRUD 기법으로 잘 녹여내 웹 사이트를 구현할 수 있을 것
>같아 이 프로젝트를 기획하게 되었습니다.

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

![mupick](https://github.com/sam0814/mup_e_project/assets/100101088/41c93ec1-cdac-4dea-81c7-77e5146212b6)

### MupStar⭐

<br>

![MupStar](https://github.com/sam0814/mup_e_project/assets/100101088/ff98288a-69ac-4471-8838-c0c0bdbcf6df)


### Muphoto📸

<br>

![Muphoto](https://github.com/sam0814/mup_e_project/assets/100101088/869da088-0cab-46b7-a95a-05d9f2c5299b)


### admin🔐

<br>

![admin](https://github.com/sam0814/mup_e_project/assets/100101088/f8532daa-d1bf-4121-bcdf-36b3d505f312)

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


