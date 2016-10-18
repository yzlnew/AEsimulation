clc,clear;
err1=ones(100,1);
err2=ones(100,1);
k=1;
while (k < 101)
run NLS_SA.m;
err1(k)=err_NLS;
err2(k)=err_NLS_SA;
k=k+1;
end

avg1=sum(err1)/100;
avg2=sum(err2)/100;
