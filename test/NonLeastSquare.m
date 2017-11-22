clc,clear;
%set scale=1000 to simplfy mm situation
scale=1000;
%sonic speed
v=3000*scale;
%number of sensors
N=8;
%generate the location of all sensors in 1m*1m*1m space
%rng(6);
Location=scale*LocationGenerator(1,N);
x1=Location(1,1);y1=Location(1,2);z1=Location(1,3);
%generate AE source
Source=scale*rand(1,3);
%Source=scale*[0.6 0.8 0.7];
%calculate the distances
Dist=pdist2(Source,Location);
%calculate the theory time T
T=Dist/v;
%specify a randn distribution to T -> t for simulation
%rng shuffle;
t=ErrMode(0,T,N);
%t0 is the time of the event
%t0=10;

%initializing step 0
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
err=pdist2(P,Source);
MyFigure(Location,Source,P);
% length=5;
% [Center,a]=betterCube(P,length,Location,t,N);
% step=3;
% while step>0
%     [Center,a]=betterCube(Center,a,Location,t,N);
%     step=step-1;
% end
% err2=pdist2(Center,Source);
