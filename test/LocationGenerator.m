function [ Location ] = LocationGenerator( mode,N )
%Generate Location[]
if mode==0
    %mode 0 => all random mode
    Location=rand(N,3);
else if mode==1
    %mode 1 => fixed on face mode
    switch N
        case 5 
            Location=[0 0 0;0 1 0;1 0 0;0 0 1;1 1 1];
        case 6
            Location=[0 0 0;0 1 0;1 0 0;0 0 1;1 1 1;1 1 0];
        case 7
            Location=[0 0 0;0 1 0;1 0 0;0 0 1;1 1 1;1 1 0;0 1 1];
        case 8
            Location=[0 0 0;0 1 0;1 0 0;0 0 1;1 1 1;1 1 0;0 1 1;1 0 1];
        case 9
            Location=[0 0 0;0 1 0;1 0 0;0 0 1;1 1 1;1 1 0;0 1 1;1 0 1;
                0.5 0.5 0;];
        case 10
            Location=[0 0 0;0 1 0;1 0 0;0 0 1;1 1 1;1 1 0;0 1 1;1 0 1;
                0.5 0.5 0;0 0.5 0.5];
    end
    end
end
end

