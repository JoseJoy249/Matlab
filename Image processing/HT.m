function [H,T,R] = HT(im)
% Hough Transform
% input - image
% outputs : H - Hough transform, T - theta values , R - rho values
[r,c] = size(im);
T = -90:1:89;
D = floor( (r^2 + c^2)^0.5 );
R = -D:1:D;

H = zeros(length(R), length(T));
[y,x] = find(im > 0 );

for i = 1:length(x)
    xk = x(i) - 1;
    yk = y(i) - 1;
    rho = round( xk*cosd(T) + yk*sind(T) );
    for t = 1:length(T)
        H(find(R == rho(t)),t) = H(find(R == rho(t)),t)+1;
    end
end

end

        



