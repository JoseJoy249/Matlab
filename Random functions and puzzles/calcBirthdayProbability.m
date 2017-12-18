function prob = calcBirthdayProbability(n)

% calculate the probability of two or more people sharing  same birthday in a gropu of n people 
iter = 10^6;
count = 0;

for i = 1:iter
    
arr = randi(365,1,n);
arr1 = unique(arr);

if length(arr1)<n
    count = count+1;
end

end

prob = count/iter;

end