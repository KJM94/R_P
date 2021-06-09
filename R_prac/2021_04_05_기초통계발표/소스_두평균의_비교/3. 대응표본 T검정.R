### 데이터 생성 ###

# 시리얼 번호 1~30까지 생성
subject<-c(1:30)
subject


set.seed(123)
before_w<-c(sample(50:65, 30,replace=T))

set.seed(321)
after_w<-c(sample(55:70, 30,replace=T))

dat<-data.frame(subject, before_w, after_w)
dat

# 전후 차이
dat$diff <- dat$after_w - dat$before_w
dat


# 정규성 가정 확인
# Q-Q plot
qqnorm(dat$diff)
qqline(dat$diff,col=2)


# Shapiro-Wilk test
shapiro.test(dat$diff)


#paired t-test
t.test(dat$after_w, dat$before_w, paired=T)