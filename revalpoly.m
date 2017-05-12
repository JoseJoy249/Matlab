% polynomial evaluation based on recursion
% clist is the list of polymial coefficents in the ascending order ( from
% x^0 to x^n )
%  ins is the instances where polynomials have to be evaluated
function outs = revalpoly(clist,ins)

y = 0;
num = length(clist);
if num == 2
    y = clist(1) + clist(2).*ins;
else
    y = clist(1)+ins.*revalpoly(clist(2:end),ins);
end

outs = y;

end
    