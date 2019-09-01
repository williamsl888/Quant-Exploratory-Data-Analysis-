library(ggplot2)
library(tseries)
setwd("~/Desktop")
sp_20=read.csv("sp_20.csv") 


getwd() #check where you are 
#session to working directory set it as  desktop or import from dataset 

head(sp_20)
plot(sp_20)
summary(sp_20)

class(sp_20)

sp_20_ts=ts(sp_20$Close,start=c(1994,1),frequency = 12)    # freq=12 you are working on monthly data

class(sp_20_ts)

plot(sp_20_ts)

ts.plot(sp_20_ts)

sp_20_train=ts(sp_20$Close,start=c(1994,1),end=c(2005,12),frequency =12)
               
ts.plot(sp_20_train)

adf.test(sp_20_ts)      # since the p value is high>0.05 hence we can not reject the null hypothesis. We fail to reject
#less than 5 percent, it is stationary, we reject 
#tests stationery  


sp_20_decomp=decompose(sp_20_ts)
#break into train, seasonal and random. Into 3 time series
#ts.plot(sp_20_ts) is x is original time series 
ts.plot(sp_20_decomp$x)

ts.plot(sp_20_decomp$seasonal)

ts.plot(sp_20_decomp$trend)

ts.plot(sp_20_decomp$random)

#trend is the train

acf(sp_20_ts)
#gives you lag, take nu,ber of time of difference to make it stationary 
pacf(sp_20_ts)
#gives you lag for partially 
sp_diff=diff(sp_20_train)

ts.plot(sp_diff)

adf.test(sp_diff)
class(sp_diff)

acf(sp_diff)
pacf(sp_diff)

# MA(1)     
# ARIMA(p,d,q)       p for AR, d for integration q for MA
arima_model=arima(sp_20_train,order=c(0,1,1))
#Auto regression vector is 0. Not using it. how many time you are taking the difference to make it stationary for the 2nd
#1, 1 for moving average 
#reference: https://towardsdatascience.com/unboxing-arima-models-1dc09d2746f8
summary(arima_model)

#explain from here 
library(forecast)
forecast_sp=forecast(arima_model,h=120) #ten years 
sp_2006=ts(sp_20_ts,start=c(2006,1),end=c(2006,12),freq=12)
ts.plot(sp_2006)
par(new=T)
ts.plot(forecast_sp)


library(TTR)

sma_100=SMA(sp_20_ts,n=100)

ts.plot(sma_100)
par(new=T)
sma_2=SMA(sp_20_ts,n=2)

ts.plot(sma_2)

