function [ ] = MyFigure( Location,Source,P )
%figure function
figure;
scatter3(Location(:,1),Location(:,2),Location(:,3));
grid on;
hold on;
scatter3(Source(1),Source(2),Source(3),'r');
hold on;
scatter3(P(1),P(2),P(3),'y');

end

