### 데이터 생성 ###

# A라는 치료를 받은 그룹 G1 30명 표본(샘플)데이터 생성
set.seed(1)
SBP.g1<-c(sample(140:160,30,replace=T))
SBP.g1



# B라는 치료를 받은 그룹 G2 30명 표본(샘플)데이터 생성
set.seed(2)
SBP.g2<-c(sample(140:160,30,replace=T))
SBP.g2



# 그룹 G1, G2를 합한 데이터프레임 확인
dat<-data.frame(SBP.g1,SBP.g2)
dat



  
#등분산 검정 
var.test(SBP.g1, SBP.g2)
  

  
#t-검정 (t-test)
t.test(SBP.g1, SBP.g2, var.equal=TRUE)