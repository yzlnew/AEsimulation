function [ err ] = ErrFunc(t,d,N,type)
%calculate the error function
err=0;

if type==1
    for i=1:N-1
        for j=i+1:N
            for k=1:N-1
                for l=k+1:N
                    err=err+((t(i)-t(j))*(d(k)-d(l))-(t(k)-t(l))*(d(i)-d(j)))^2;
                end
            end
        end
    end
end

if type==2
    v=3000*1000;
    err=sumabs(d-v*t);
end

if type==3
    v=3000*1000;
    err=sumsqr(d-v*t);
end

if type==4
    v=3000*1000;
    err=min([sumabs(d-v*t),sumsqr(d-v*t)]);

end
