function [ err ] = err(t,d,N)
%calculate the error function
err=0;
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

