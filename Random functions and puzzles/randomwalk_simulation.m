clear all;
close all;
clc

N = 100;    % put different values like 10,20, .. to get the graphs
mat = zeros((N+1),2);

for i = 1:N
   
   m = randi(2);
   n = randi(3)-2;
   w = zeros(1,2);
   w(m) = n;
   if w == [0,0]     % this will make sure that the guy always makes a step
       while w == [0,0]
            m = randi(2);
            n = randi(2)-1;
            w = zeros(1,2);
            w(m) = n;
       end
   end
   mat(i+1,:) = mat(i,:)+w;
   
end

plot(mat(1:N+1,1), mat(1:N+1,2),'-ro')
xlabel('X axis');
ylabel('Y axis');

distance = sqrt(mat(:,1).* mat(:,1) + mat(:,2).*mat(:,2)); % for finding the final distance from origin
max_distance = max(distance)