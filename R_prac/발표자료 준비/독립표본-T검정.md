---
title: "독립표본 T검정.R"
output: 
  html_document: 
    keep_md: yes
---



# 자료생성
  - A라는 치료를 받은 그룹 G1 30명 표본(샘플)데이터 생성

```r
set.seed(1)
SBP.g1<-c(sample(140:160,30,replace=T))
SBP.g1
```

```
##  [1] 143 146 140 141 150 153 157 158 140 160 160 149 153 149 146 148 154 160 144
## [20] 148 153 144 144 141 149 151 154 140 159 142
```
  * B라는 치료를 받은 그룹 G2 30명 표본(샘플)데이터 생성

```r
set.seed(2)
SBP.g2<-c(sample(140:160,30,replace=T))
SBP.g2
```

```
##  [1] 160 154 145 145 147 156 156 151 148 157 150 140 142 155 157 158 147 146 140
## [20] 148 155 143 150 145 148 153 147 155 152 153
```
  * 그룹 G1, G2를 합한 데이터프레임 확인

```r
dat<-data.frame(SBP.g1,SBP.g2)
dat
```

```
##    SBP.g1 SBP.g2
## 1     143    160
## 2     146    154
## 3     140    145
## 4     141    145
## 5     150    147
## 6     153    156
## 7     157    156
## 8     158    151
## 9     140    148
## 10    160    157
## 11    160    150
## 12    149    140
## 13    153    142
## 14    149    155
## 15    146    157
## 16    148    158
## 17    154    147
## 18    160    146
## 19    144    140
## 20    148    148
## 21    153    155
## 22    144    143
## 23    144    150
## 24    141    145
## 25    149    148
## 26    151    153
## 27    154    147
## 28    140    155
## 29    159    152
## 30    142    153
```
  
  
<br/>

# 등분산 검정 

```r
var.test(SBP.g1, SBP.g2)
```

```
## 
## 	F test to compare two variances
## 
## data:  SBP.g1 and SBP.g2
## F = 1.4155, num df = 29, denom df = 29, p-value = 0.3548
## alternative hypothesis: true ratio of variances is not equal to 1
## 95 percent confidence interval:
##  0.6737357 2.9739930
## sample estimates:
## ratio of variances 
##           1.415516
```
<br/>

# t-검정 (t-test)

```r
t.test(SBP.g1, SBP.g2, var.equal=TRUE)
```

```
## 
## 	Two Sample t-test
## 
## data:  SBP.g1 and SBP.g2
## t = -0.57231, df = 58, p-value = 0.5693
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -4.047849  2.247849
## sample estimates:
## mean of x mean of y 
##     149.2     150.1
```
<br/>


  
  
