function G = canny1(im, te)
 h = fspecial('gaussian',5,1.4);
 kx = [-1 0 1; -2 0 2; -1 0 1 ] ; 
 ky = [-1 -2 -1; 0 0 0; 1 2 1];

im = double(im);

figure;
colormap('gray')
subplot(2,2,1)
imagesc(im);
title('original image');

im = imfilter(im,h,'replicate');
Gx = imfilter(im,kx,'replicate');
Gy = imfilter(im,ky,'replicate');
G = (Gx.^2 + Gy.^2 ).^0.5;
Gt = round( atand(Gy./Gx)/45 ) *45;

subplot(2,2,2)
imagesc(G);
title('Gradient magnitude');
colorbar;

% NMS
for x = 2:size(Gt,1)-1
    for y = 2:size(Gt,2)-1
        if Gt(x,y) == 0 
            if G(x,y) < G(x-1,y) | G(x,y) < G(x+1,y)
                G(x,y) = 0;
            end
        end
        
        if Gt(x,y) == 90 |  Gt(x,y) == -90
            if G(x,y) < G(x,y+1) | G(x,y) < G(x,y-1)
                G(x,y) = 0;
            end
        end
        
        if Gt(x,y) == 45 
            if G(x,y) < G(x+1,y+1) | G(x,y) < G(x-1,y-1)
                G(x,y) = 0;
            end
        end
        
        if Gt(x,y) == -45
            if G(x,y) < G(x-1,y+1) | G(x,y) < G(x+1,y-1)
                G(x,y) = 0;
            end
        end
        
    end
end

subplot(2,2,3)
imagesc(G);
title('Gradient Image after NMS');
colorbar;

G(G<te) = 0;
subplot(2,2,4)
imagesc(G);
title('Final image');
colorbar;
end
        
        
        
        