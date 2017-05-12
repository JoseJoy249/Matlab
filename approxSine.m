function [approx terms] = approxSine(x, t)

% finds approximate value of sin(x) with a threshold t 
trueval = sin(x);

temp  = 1;
count = 1;
approx = 0;

while temp >= t
    num = (2*count) - 1;
    s1 = (-1)^(count+1);
    n = x^num;
    d = factorial(num);
    
    approx = approx + s1*n/d;
    temp = abs( (trueval - approx)/trueval);
    if (temp < t)
        break;
    end
    count = count+1;
end

terms = count-1;
approx = approx;

end
