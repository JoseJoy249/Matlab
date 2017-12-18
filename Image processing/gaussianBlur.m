function y = gaussianBlur(im, sigma)
[r,c] = size(im);
im = single(padarray(im,[3*sigma,3*sigma],'circular'));
h = fspecial('gaussian',6*sigma, sigma);
y = imfilter(im,h);
y = y(3*sigma+1:3*sigma+r,3*sigma+1:3*sigma+c);
end