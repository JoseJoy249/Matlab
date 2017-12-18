function [err, res, im1] = gaussianUnblur(im, sigma, max_iter, t, orig)
im1 = single(im);
for k = 1:max_iter
    Ak = gaussianBlur(im1, sigma);
    Bk = im./Ak;
    Ck = gaussianBlur(Bk, sigma);
    im2 = im1 .* Ck;
    res(k) = immse( double(im1), double(im2) );
    err(k) = immse ( double(im2), double(orig) );
    if k > 1 & abs(res(k) - res(k-1)) < t
        break
    end
    im1 = im2;
end
end