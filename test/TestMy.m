clc,clear;
res=zeros(10,1);
for ii=1:10
length=ii;
myerr=0;
for iii=1:100
    run NLS_SA.m;
    myerr=myerr+err_NLS_SA;
end
res(ii)=myerr/100;
end



