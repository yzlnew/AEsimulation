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

P=sum(Location)/N;
R=pdist2(P,Location);

a=0.95;length=5;scale=500;b=0.95;TI=10;TE=0.001;

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

err_SA=pdist2(P,Source);
