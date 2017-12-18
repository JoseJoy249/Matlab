% this code cen be used to simulate Monty Hall problem

clear all
close all
clc

success = 0;
number = 0;
flag = 1;
while flag

number = number + 1;
r = randperm(3);
car = r(1);

%% initial choice 
ch1 = menu('Select any one door?','Door1','Door2','Door3');

if ch1 == r(1)
    disp(['Door ',num2str(r(2)),' has a goat']);
elseif ch1 == r(2)
    disp(['Door ',num2str(r(3)),' has a goat']);
else
    disp(['Door ',num2str(r(2)),' has a goat']);
end

%% switch option
ch2 = menu('Shall we switch or stay?','Switch','Stay');

if ch2 == 1
    if ch1 == car
        success = success + 1;
        disp('You win !');
    else
        disp('You loose ... ');
    end
else
    if ch1 ~= car
        success = success + 1;
        disp('You win !');
    else
        disp('You loose ... ');
    end
end

sr = success/number;
disp(['Your success rate = ',num2str(sr)]);

q11 = input('Press 1 to continue game, 0 to end game : ');
if q11 == 0
    flag = 0;
end

clc;
    
    
end