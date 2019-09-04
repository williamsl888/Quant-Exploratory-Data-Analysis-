library(rvest)
library(TTR)
library(quantmod)

amazon="AMZN"

getSymbols(amazon,src="yahoo")
amazon_close=AMZN$AMZN.Close
amn_ma10=SMA(amazon_close, 10)
amn_ma200=SMA(amazon_close, 200)

plot(amn_ma10,col="red")
lines(amn_ma120,col="blue")
lines(amazon_close,col="green")
#more days apart have smoother graphs

length(amn_ma10)
length(amn_ma120)

for (i in c(201:length(amn_ma10)-1)) {
  if(((amn_ma10[i]==amn_ma200[i]) & (amn_ma10[i+1]>amn_ma200[i+1])))
  {
    print("buy or hold your position")
  } else if((amn_ma10[i]==amn_ma200[i]) & (amn_ma10[i+1]<amn_ma200[i+1]))
  {
    print("sell your position")
  }
  }
#-1 then +1 to get last value 
#> head(all_ma,n=12) all NA, so we have to start from 10



#