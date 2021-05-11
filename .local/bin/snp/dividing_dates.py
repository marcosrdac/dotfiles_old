from datetime import datetime, date, timedelta

di = date(2021,3,1)
df = date(2021,11,8)

T = df-di
print('total time:', T)    # 252 d = 8 m
print('event to event time:', T/4 - timedelta(days=7))  #  d = 2 m

T4 = T/4
for i in range(4):
    d = di+i*T4
    print(f"e{i}: {d}")
