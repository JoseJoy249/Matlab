function out = AHE(im,win_size)

% function for implementing adaptive histogram equalization 
% inputs : im - image, win_size - size of window
% outputs : out - AHE image

out = ones(size(im,1),size(im,2));
temp = floor(win_size/2);
im = padarray(im,[temp,temp],'symmetric');
[r,c] = size(im);
im = im2double(im);

for x = temp+1:r-temp
    for y = temp+1:c-temp
        rank = 0;
        region = im(x-temp:x+temp,y-temp:y+temp);
        rank = rank + length(find( im(x,y)>region(:) ));
        out(x-temp,y-temp) = rank * 255 / (win_size * win_size) ;
    end
end

out = uint8(out);

end
        
                
        