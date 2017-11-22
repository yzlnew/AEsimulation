function [ Center,a ] = Cube( Center,a,Location,t,N )
%use Cube to assist Kundu
x=Center(1);y=Center(2);z=Center(3);
c1=[x+a/4,y+a/4,z+a/4];
c2=[x-a/4,y+a/4,z+a/4];
c3=[x+a/4,y-a/4,z+a/4];
c4=[x+a/4,y+a/4,z-a/4];
c5=[x+a/4,y-a/4,z-a/4];
c6=[x-a/4,y+a/4,z-a/4];
c7=[x-a/4,y-a/4,z+a/4];
c8=[x-a/4,y-a/4,z-a/4];
a=a/2;
c=[c1;c2;c3;c4;c5;c6;c7;c8];
Error=zeros(8,1);
for i=1:8
    d=pdist2(c(i,:),Location);
    Error(i)=ErrFunc(t,d,N,1);
end
[~,I]=min(Error);
Center=c(I,:);
end

