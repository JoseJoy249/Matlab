function [] = myPolygon(n)

theta = 0:2*pi/n:2*pi;
hold on;

for i = 1:n
    x(i,:) = linspace(cos(theta(i)),cos(theta(i+1)),100);
    y(i,:) = linspace(sin(theta(i)),sin(theta(i+1)),100);
    plot(x(i,:),y(i,:))
    axis equal
    xlim([-1 1])
    ylim([-1 1])
    
end

title(sprintf('Polygon of side %d',n))
end

