---
title: "대응표본 T검정.R"
output: 
  html_document: 
    keep_md: yes
---


<br/>
# 자료 생성 
  * 시리얼번호 생성: 1~30

```r
subject<-c(1:30)
subject
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26 27 28 29 30
```

```r
set.seed(123)
before_w<-c(sample(50:65, 30,replace=T))

set.seed(321)
after_w<-c(sample(55:70, 30,replace=T))

dat<-data.frame(subject, before_w, after_w)
dat
```

```
##    subject before_w after_w
## 1        1       64      60
## 2        2       64      56
## 3        3       52      67
## 4        4       63      67
## 5        5       52      63
## 6        6       59      62
## 7        7       51      70
## 8        8       55      64
## 9        9       60      70
## 10      10       54      68
## 11      11       53      55
## 12      12       63      58
## 13      13       55      69
## 14      14       58      65
## 15      15       59      63
## 16      16       60      69
## 17      17       65      66
## 18      18       54      56
## 19      19       52      69
## 20      20       60      60
## 21      21       58      69
## 22      22       61      63
## 23      23       58      56
## 24      24       58      65
## 25      25       62      69
## 26      26       52      56
## 27      27       57      58
## 28      28       59      68
## 29      29       56      61
## 30      30       59      56
```
<br/>

# 전후 차이

```r
dat$diff <- dat$after_w - dat$before_w
dat
```

```
##    subject before_w after_w diff
## 1        1       64      60   -4
## 2        2       64      56   -8
## 3        3       52      67   15
## 4        4       63      67    4
## 5        5       52      63   11
## 6        6       59      62    3
## 7        7       51      70   19
## 8        8       55      64    9
## 9        9       60      70   10
## 10      10       54      68   14
## 11      11       53      55    2
## 12      12       63      58   -5
## 13      13       55      69   14
## 14      14       58      65    7
## 15      15       59      63    4
## 16      16       60      69    9
## 17      17       65      66    1
## 18      18       54      56    2
## 19      19       52      69   17
## 20      20       60      60    0
## 21      21       58      69   11
## 22      22       61      63    2
## 23      23       58      56   -2
## 24      24       58      65    7
## 25      25       62      69    7
## 26      26       52      56    4
## 27      27       57      58    1
## 28      28       59      68    9
## 29      29       56      61    5
## 30      30       59      56   -3
```
<br/>

# 정규성 가정 확인
  * Q-Q plot

```r
qqnorm(dat$diff)
qqline(dat$diff,col=2)
```

![](대응표본-T검정_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
<br/>

# Shapiro-Wilk test 

```r
shapiro.test(dat$diff)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  dat$diff
## W = 0.98722, p-value = 0.9688
```
<br/>

# paired t-test

```r
t.test(dat$after_w, dat$before_w, paired=T)
```

```
## 
## 	Paired t-test
## 
## data:  dat$after_w and dat$before_w
## t = 4.4899, df = 29, p-value = 0.0001044
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  2.994636 8.005364
## sample estimates:
## mean of the differences 
##                     5.5
```



  
  
