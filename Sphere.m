clc,clear;
%set scale=1000 to simplfy mm situation
scale=1000;
%sonic speed
v=3000*scale;
%R in meters
R=1;
%generate the location of all sensors in sphere
Location=[pi/2, 0 ; pi/2, pi/2 ; 0, 0];
Lo=[pi/2-Location(:,1),Location(:,2)];
%Location=scale*[1,0,0;0,1,0;0,0,1];
%Set the Source
Source=[pi/4, pi/4];
Sr=[pi/2-Source(:,1),Source(:,2)];
%Source=scale*[0.5,0.5,sqrt(2)/2];
Dist=distance(Sr,Lo,scale*R,'radians');

t_real=Dist/v;
t=t_real;

A=scale*R*[ 1,0,0 ; 0,1,0 ; 0,0,1 ];
b=(scale*R)^2*(-2*((sin((v*t)/(2*scale*R))).^2)+1);

P=(A'*A)\A'*b;
