function [ t ] = ErrMode( mode,T,N )
%define the error of
if mode==0
    %normal distribution
    t=T+randn(1,N)/2000000;
else if mode==1
        %rand distribution
        t=T+((2*rand(1,N)-1)/1000000);
    else if mode==2
            %unusual error
            t=T+randn(1,N)/2000000+[3*10^-5,zeros(1,N-1)];%.*rand(1,N)/100000;
        end
    end
end
end

