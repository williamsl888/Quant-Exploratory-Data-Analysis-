#import all your data from import dataset 
head(GOOG.2)
head(AMZN)
head(AMZN,10) #or n=10 will work 

tail(AMZN)

goog=GOOG.2
AMN=AMZN
#assigning renames 
summary(AMN) #for stocks 
str(AMN) #data 

AMN$Close
two_stocks=cbind(goog$Close,AMN$Close) #concat of columns in R 
head(two_stocks)
colnames(two_stocks )= c("google close","Amazon close") #renaming of from null on colnames to google and amazon 
head(two_stocks)

plot(two_stocks, main ="price")
plot(goog$Close, type="l",col="red", main ="price")
par(new=T) #combines graph
plot(AMN$Close, type ="l", col= "blue")

legend("topright", legend=c("goog", "amn"),
       col=c("red", "blue"))
#got from google, we dont need lty and cex
plot(sp500$Close, type = "l",col= "green")

goog_return=Delt(goog$Close) #return this is pct.change in R
amn_return=Delt(AMN$Close)
two_stocks_return=Delt(two_stocks)
head(two_stocks)
head(two_stocks_return)

plot(two_stocks_return, main="price")
plot(goog_return, type="l",col="red", main ="price")
par(new=T) #combines graph
plot(amn_return, type ="l", col= "blue")
legend("topright", legend=c("google", "amazon"))

summary(two_stocks_return)
sp_return=Delt(sp500$Close)
summary(two_stocks_return)

two_stocks_return=cbind(goog_return,amn_return)
plot(goog_return, amn_return) 
cor(goog_return[-1],amn_return[-1])
plot(goog_return,sp_return)
cor(goog_return[-1],sp_return[-1])

lm(sp_return~goog_return)            # lm(y~x)        y is your depedent variable and x is your independent variable  y=alpha*x+beta

# sp_return=alpha*goog_return+beta 
# beta=intercept=4.661*10^-5      and alpha=4.094*10^-1

# we are on prediction mission
intercept=4.661*10^-5
alpha=4.094*10^-1
goog_new_return=c(0.04,0.06,0.012,-0.0222,-0.03,0.0116)
sp_return_pred=alpha*goog_new_return+intercept
plot(goog_new_return,sp_return_pred)

lm(sp_return~amn_return)
intercept=5.586*10^-5
alpha=3.748^-1
amn_new_return=c(0.06,0.08,0.03,0.04,-0,02,-0.08)
sp2_return_pred=alpha*amn_new_return+intercept
plot(amn_new_return,sp2_return_pred)

#use amazon and google to predict multiple linear regression line number 77 
#lm(y~x1+x2)       write a multiple linear regression for sp is depedent, goog and amazon is indepedent
lm(sp_return~amn_return+goog_return)
intercept=5.754^-5
alpha1=2.77*10^-1
alpha2=1.617^-1
neu_goog_return=c(0.03,0.06,0.08,0.09,0.10)
neu_amn_return=c(0.01,0.02,0.05,0.06,0.08)

sp_new_return=intercept+alpha1*neu_amn_return+alpha2*neu_goog_return


