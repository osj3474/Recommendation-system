# Recommendation-system



추천 시스템 실습 강의를 진행하기 위해서 만들어진 저장소이며, 학우분들이 전 프로세스를 이해할 수 있도록 내용을 구성했습니다.

- <a href="./preparing">preparing </a> : 내용 준비 및 테스트를 진행했던 곳입니다.
- <a href="./lecture">lecture</a> : 실제 실습에서 사용할 최종 코드를 담아둔 곳입니다.

*cf) 실습 코드는 Python, R로 이루어져있습니다.*



## 1. 주제 선정

학우분들이 서비스가 와닿을 수 있도록 하기 위해서 저희나라 **식당(음식) 추천** 을 최종 주제로 선택했습니다.





## 2. 데이터 수집

필요한 데이터는 **사용자 별 식당 평점을 가진 데이터** 입니다.

- 배달의 민족 : 웹을 지원하지 않아 앱에 있는 데이터를 얻어와야 하는데, 경험 부족 + 시간 부족으로 제외되었습니다.
- 요기요 : 식당 별 리뷰들은 많은데, 사용자가 여러 식당의 평점을 매긴 데이터는 접근할 수 없어서 제외되었습니다.





결국, 모든 조건을 만족하는 '식신' 이라고 하는 사이트에서 크롤링을 했습니다.



![image](https://user-images.githubusercontent.com/42775225/89477968-910a6f80-d7c9-11ea-98c6-da2a268da9fc.png)



크롤링은 파이썬 코드로 짰으며, 사용한 모듈은 다음과 같습니다.

1. selenium
2. requests
3. bs4



![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/42775225/89479771-9d44fb80-d7ce-11ea-9c43-3f60f9e8dea6.gif)





그러면 다음과 같이 약 120개의 데이터가 모이게 됩니다.

![image](https://user-images.githubusercontent.com/42775225/89486248-9d98c300-d7dd-11ea-8651-4ac5b1999b79.png)







## 3. 테이블 준비

크롤링했던 데이터들을 Rstudio에서 읽어들입니다. (코드는 script폴더에 들어가 있습니다.)

```R
src_dir <- c('../data')
src_file <- list.files(src_dir)

src_file_cnt <- length(src_file)
src_file_cnt

id_lst <- c()
for(i in 1:src_file_cnt) {
  file_name <- paste0(src_dir, '/', src_file[i])
  user_id <- as.numeric(str_extract(src_file[i], '\\d+'))
  df <- fread(file_name, sep=',', encoding="UTF-8")
  df_name <- paste('df',user_id, sep='')
  id_lst[i] <- user_id
  df <- df[, -1]
  assign(df_name, df)
}
```

그러면 결과는 다음과 같습니다.

![image](https://user-images.githubusercontent.com/42775225/89482901-da60bc00-d7d5-11ea-9b1a-316c182dfd19.png)

그 후 저희가 만들어야하는 user_item 테이블을 만듭니다. 데이터 프레임들을 merge하고 각각 컬럼명과 로우명을 변경해주고 나면, 최종적으로 다음과 같은 테이블을 만들 수 있습니다.

![image](https://user-images.githubusercontent.com/42775225/89482919-dfbe0680-d7d5-11ea-9018-4a18673a944e.png)





## 4. Recommenderlab

R패키지를 이용해서 실습을 진행 했습니다. 위에서 만든 테이블을 기반으로 진행했습니다. 추천 시스템의 본체에 해당하는 Recommender 클래스를 만들고, 데이터를 넣어서 진행하게 됩니다.

끝으로, 저희 학교 주변에 있는 식당을 직접 rating한 자료를 가지고 학우분들 개개인이 추천 받을 수 있도록 했습니다.

여기있는 데이터는 저희 학회원 분들 한 분 한 분이 참여해주셔서 채워넣었고, u10 을 비워두었습니다. 여기에 여러분들만의 평점을 넣고 어떤 식당을 추천받는지 해보세요~! 긴 글 읽어주셔서 감사합니다.

![image](https://user-images.githubusercontent.com/42775225/89483610-6f17e980-d7d7-11ea-8121-d384b20c3412.png)
