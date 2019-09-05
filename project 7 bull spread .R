S_T=100
K=120
P=10

call_option=function(S_T,K,P) {
  if(S_T>K) {
    return (S_T-K-P)
  }
  else
  {
    return (-P)
  }
}

call_option(S_T,K,P)

x=bull.call(130,100,140,0.05,3,5,10)
#130 = st, 100 = k1, 140 is k2. 0,05 = interest rate, 3 = time to maruity. 5 = call option premium of 5. 10 is premium for
#short




# fyi callpayoff=function(S,E,P)  pmax(0,S-E-P)
