% The code first needs the main function which asks user the random matrix
% dimensions and so on
function [] = main() 
clear all
close all
clc

% To ensure repeatability, we use rng(). By changing this 1 to say 2,3 ,
% etc. you can get different starting matrices 
rng(1);

% we need matrix dimension from the user to start
prompt = 'Enter the puzzle dimensions : ';
n = input(prompt);

% we need to make sure the matrix size is always >=3
if n<3
disp('Size of the matrix has to be greater then 2 !')
return
end

% we generate a solvable matrix using the get_mat function that uses
% a goal matrix, shuffled certain times to generate the start matrix
matrix = get_mat(n);

% we need to know the space where matrix is empty 
space = [n,n];

% we need to define the final goal so that we can compare the matrices to
% make sure the code exits once we reach our goal
final = reshape( [1:(n*n-1),0], [n,n] );

loop = 1; % to run the while loop
while(loop)

% display the matrix and correct positions
display_mat(matrix,n); 
fprintf('To exit the game, press Ctrl+C \n')

% get a new move from the user
prompt = 'Enter next move ? '; 
new = input(prompt);

% check if the new position is legal, new move has to be integer from 0 to (n*n - 1)
if new <= (n*n -1) & new > 0

% if the new position is valid, we need the rows and columns
% corresponding to the new position
[row,col] = find(matrix == new);

% we need to know if new move is next to empty space
if abs( row - space(1)) > 1 | abs(col - space(2)) >1 | new>(n*n -1)
fprintf('Next move invalid ! \n')
continue
else

% if new postion is valid, swap it with empty space
matrix( space(1), space(2)) = new;
matrix(row,col) = 0;
space = [row,col];
end

else
disp('New move is not within range !') % if new position was not in range
continue
end

% compare current matrix with goal, if they are same, exit
if isequal(matrix,final) 
loop = 0;
disp('Reached the Goal ')
% display the matrix and correct positions
display_mat(matrix,n); 
disp('Exiting!!!! ')
end

end

end

% this function will generate a random matrix that can be solved, by
% starting with a goal matrix
function matrix = get_mat(n)
matrix = reshape([1:(n*n-1),0],[n,n]);
space = [n,n];
flag = 1;
count = 1;
while(flag)

% start with a random position
row = randi(n);
col = randi(n);

% if that random position is next to empty space, change the position
% of empty space
if abs( row - space(1)) > 1 | abs(col - space(2)) >1 
continue
else
count= count+1;
temp = matrix(space(1),space(2));
matrix(space(1),space(2)) = matrix(row,col);
matrix(row,col) = temp;
space = [row,col];

% once me make sure enough shifting has been done, and the empty
% space again reaches bottom coulmn, we stop and use that matrix as
% our starting matrix
if isequal(space,[n,n]) & count >5
flag = 0;
end

end 

end

end

% This function can count the number of values in the correct positions
function count = correct_tiles(matrix,n)
count = 0;

for a = 1:(n*n)-1
if a == find(matrix == a)
count = count+1;
end
end
end

% function use to show the user the current matrix along with correct number of positions 
function [] = display_mat(matrix,n)
count = correct_tiles(matrix,n);

if count < (n*n - 1)
fprintf('Current board is (#correct = %d) \n',count);
else
fprintf('Current board is (#correct = %d, all correct) \n',count);
end

for a = 1:n
for b = 1:n

if matrix(b,a) ~= 0
fprintf(' %2.0f ',matrix(b,a))
else
fprintf(' ')
end
end
fprintf('\n');
end
fprintf('\n');
end