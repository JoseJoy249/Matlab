% this function uses recursion to comput the skip factorials
% skipfactorial(6,2) = 6*(6-2)*(6-4) = 6*4*2= 48
% n is the factorial input, k is the skip factor

function val = skipfact(n,k)

y = 0;

if rem(n,1)~=0 | rem(k,1)~=0
    val = -1;
    return
end

if n <= 0 | k<=0
    val = -2;
    return;
end

if n <= k
    y = n;
else
    y = (n)*skipfact(n-k,k);
end

val = y;

end