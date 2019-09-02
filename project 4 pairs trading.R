library(quantmod)

google="GOOG"
microsoft="MSFT"

getSymbols(google,src="yahoo")
getSymbols(microsoft,src="yahoo")

head(GOOG)

head(MSFT)

length(GOOG)

length(MSFT)

google_close=GOOG$GOOG.Close

microsoft_close=MSFT$MSFT.Close
#the msft file contains close as msft close 

head(google_close)

start_date=as.Date("2015-01-01")

google_close_15=google_close[index(google_close)>start_date]

#[index(google_close)>start_date] booleans, the one google_close outside checks the data

microsoft_close_15=microsoft_close[index(microsoft_close)>start_date]

google_return=periodReturn(google_close_15,period="daily",type = "arithmetic")
microsoft_return=periodReturn(microsoft_close_15,period="daily",type="arithmetic")

plot(google_return)
plot(microsoft_return)
google_return_l=periodReturn(google_close_15,period="daily",type = "log")
microsoft_return_l=periodReturn(microsoft_close_15,period="daily",type="log")

g_n=cumprod(google_return_l+1)
m_n=cumprod(microsoft_return_l+1)
#cumprod allows you to keep multipling. we want positive returns so we add 1 
plot(g_n,type="l",xlab="time",ylab="normalized return")
lines(g_n,col="blue")
lines(m_n,col="red")
# fyi doesnt work. legend("topleft",c("google","microsoft"),col=c("blue","red"))
lines(g_n/m_n,col = "pink")
abline(h=1.5,col="green")
