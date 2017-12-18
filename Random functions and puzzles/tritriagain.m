% this function can be used to construct a trinomial triangle, a variant of
% pascals triangle
% k is the row of trinomial triangle
% trilist will find all number in the kth row of the trinomial triangle
function trilist =tritriagain(k)

if rem(k,1)~=0 | k<0 
    trilist = -1;
    return
end

if k==0
    y = 1;
    
elseif k == 1
    y = [1,1,1];
    
else
    s = tritriagain(k-1);
    for i = 1:2*k+1
        if i == 1 | i == 2*k+1
            y(i) = 1;
            
        elseif i == 2 
            y(i) = s(1)+s(2);
            
        elseif i == 2*k
            y(i) = s(end)+s(end-1);
            
        elseif i>2 & i<2*k
            y(i) = s(i-2)+s(i-1)+s(i);
        end
    end
            

end

trilist = y;
end