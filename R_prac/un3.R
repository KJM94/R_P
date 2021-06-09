ggplot(PlantGrowth, 
            aes(x = group, y = weight)) + 
  geom_boxplot() + 
  scale_y_continuous(
    limits = c(1, 9), # 축 범위
    breaks = c(2, 4, 6), # 자르기
    labels = c("No.2", "No.4", "No.6")
    ) 
  

# 눈금 표시 방법
ggplot(PlantGrowth, 
       aes(x = group, y = weight)) + 
  geom_boxplot() + 
  scale_y_continuous(limits = c(0, 10), # 축 범위
                     breaks = c(1, 3, 5, 7, 9), # 축의 숫자 지정 
                     labels = c("1st", "three", "five", "seven", "nine"))

# 범주형 축 항목 순서 변경하기
ggplot(PlantGrowth, aes(x = group, weight)) + 
  geom_boxplot() + 
  theme_bw() + 
  scale_x_discrete(limits = c("trt1", "ctrl")) 

grid.arrange(p, p1)

library(nycflights13)
library(ggplot2)

glimpse(flights)

# x = char, y =continuous
ggplot(flights, 
       aes(x = carrier, y = distance)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(1000, 6000)) +
  scale_x_discrete(limits = c("9E", "F9", "UA", "B6"))

# 6. 그래프의 테마(theme) 다루기
# 그래프의 배경 등 외형 제어할 수 있도록 도와줌
# 분석가는 데이터를 다루는 것이 중요하나, 독자에게는 그래프의 외형, 색깔, 글씨 폰트 등이 중요함
# 그래프의 제목, 외형, 테마 설정, 외형 변경
# 사용자 정의 테마 만들기 

# 1. 그래프의 제목 
#install.packages("gcookbook")
library(gcookbook)
library(ggplot2)

p <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point()

p + labs(title = "Title Text") # labs 함수
p + 
  labs(title = "Title Text") +
  theme_bw() + 
  theme(plot.title = element_text(vjust = -10, hjust = 0.01))



# 2. 텍스트의 외형 변경하기
p + theme(axis.title = element_text(size = 16, lineheight = .9, family = "Times", face = "bold.italic", colour = "red")) # axis 축

# 3. 테마 사용하기
library(ggthemes)
p + theme_wsj()
p + theme_classic()
p + theme_bw()
p + theme_gray()

# 테마 설정하기
theme_set(theme_classic())
p

# 4. 테마 요소의 외형 변경하기 예제
p <- ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) + geom_point()

p

## 1. 그래프 관련 옵션
p + theme(
  panel.grid.major = element_line(colour = "red"), 
  panel.grid.minor = element_line(colour = "red", linetype = "dashed"), # 점선
  panel.background = element_rect(fill = "lightblue"), 
  panel.border = element_rect(colour = "blue", fill = NA, size = 2)
)

## 2. 텍스트 항목 관련 옵션들
p + labs(title = "Plot Title Here") + 
  theme(
    axis.title.x = element_text(colour = "red", size = 14), 
    axis.text.x = element_text(colour = "blue"), 
    axis.title.y = element_text(colour = "red", size = 14, angle = 90), 
    axis.text.y = element_text(colour = "blue"), 
    plot.title = element_text(colour = "red", size = 20, face = "bold")
  )

## 3. 범례 관련 옵션들
p + theme(
  legend.background = element_rect(fill = "grey85", colour = "red", size = 1), 
  legend.title = element_text(colour = "blue", face = "bold", size = 14), 
  legend.text = element_text(colour = "red"), 
  legend.key = element_rect(colour = "blue", size = 0.25)
)

## 4. 면 분할 관련 옵션들
p + facet_grid(sex ~ .) + 
  theme(
    strip.background = element_rect(fill = "pink"), 
    strip.text.y = element_text(size = 14, angle = -90, face = "bold")
  )

# 5. 사용자 정의 테마 설정
my1stTheme <- theme_classic() + 
  theme(axis.title.x = element_text(size = 20),
        axis.ticks.y = element_text(size = 15))



glimpse(iris)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() + my1stTheme