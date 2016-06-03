clc,clear;
%set scale=1000 to simplfy mm situation
scale=1000;
%sonic speed
v=3000*scale;
%number of sensors
N=8;
%generate the location of all sensors in 1m*1m*1m space
Location=scale*LocationGenerator(1,N);
%generate AE source
%rng(6);
Source=scale*rand(1,3);
%Source=scale*[0.6 0.8 0.7];
%calculate the distances
Dist=pdist2(Source,Location);
%calculate the theory time T
T=Dist/v;
%specify a randn distribution to T -> t for simulation
%t0 is the time of the event
t0=10;
%rng shuffle;
t=ErrMode(2,T,N);

%using NLS to calculate the start point
P=sum(Location)/N;
x=P(1);y=P(2);z=P(3);
flag=2;
A=zeros(N,4);B=zeros(N,1);
R=pdist2(P,Location);

while flag>0
    for i=1:N
    A(i,1)=(x-Location(i,1))/(v*R(i));
    A(i,2)=(y-Location(i,2))/(v*R(i));
    A(i,3)=(z-Location(i,3))/(v*R(i));
    A(i,4)=1;
    end
    B=(t-R/v)';
    delta=(A'*A)\A'*B;
    P=P+(delta(1:3,1))';
    x=P(1);y=P(2);z=P(3);
    R=pdist2(P,Location);
    flag=flag-1;
end

err_NLS=pdist2(P,Source);

a=0.8;length=1;scale=50;b=0.95;TI=10;TE=0.001;

T=TI;
while(T>TE)
    step=0;
    while(step<length)
    PreErr=ErrFunc(t,R,N,2);
    CurP=P+scale*(2*rand(1,3)-1);
    CurR=pdist2(CurP,Location);
    CurErr=ErrFunc(t,CurR,N,2);
    
    deltaFunc=CurErr-PreErr;
    
    if(deltaFunc<0)
        potential=1;
    else
        potential=exp(-deltaFunc/T);
    end
    
    r=rand();
    
    if(potential>r)
        P=CurP;
        R=CurR;
    end
    
    step=step+1;
    end
   
    T=a*T;
    scale=b*scale;
end

err_NLS_SA=pdist2(P,Source);


