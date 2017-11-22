clc,clear;
%set scale=1000 to simplfy mm situation
scale=1000;
%sonic speed
v=3000*scale;
%number of sensors
N=8;
%generate the location of all sensors in 1m*1m*1m space
Location=scale*LocationGenerator(1,N);
x1=Location(1,1);y1=Location(1,2);z1=Location(1,3);
%generate AE source
rng(6);
%Source=scale*rand(1,3);
Source=scale*[0.6 0.8 0.7];
%calculate the distances
Dist=pdist2(Source,Location);
%calculate the theory time T
T=Dist/v;
%specify a randn distribution to T -> t for simulation
%t0 is the time of the event
t0=10;
%rng shuffle;
t=ErrMode(0,T,N);
t1=t(1);

%A&B -> def in the paper
A=zeros(N-1,4);B=zeros(N-1,1);
for i=2:N
    A(i-1,1)=2*(x1-Location(i,1));
    A(i-1,2)=2*(y1-Location(i,2));
    A(i-1,3)=2*(z1-Location(i,3));
    A(i-1,4)=-2*v^2*(t1-t(i));
    B(i-1)=v^2*(t(i)^2-t1^2)+(x1^2-Location(i,1)^2)+(y1^2-Location(i,2)^2)+(z1^2-Location(i,3)^2);
end
temp=A'*A;
res=(A'*A)\A'*B;
P=res(1:3,1)';
err=pdist2(P,Source);
%MyFigure(Location,Source,P);
