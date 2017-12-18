function out = kMeansclustering(im, k)
% function for implementing kMeans clustering on an RGB image
% inputs : im - image, k - number of clusters
% outputs : out - clustered image

feats = double( reshape(im, [size(im,1)*size(im,2), 3]) );
id = randi(size(feats,1),1,k);
centers = feats(id,:);

N = size(feats,1);
max_iter = 50;
k = size(centers,1);

obj = zeros(1,50);
for i = 1:max_iter
    dist = zeros(N,k); 
    for j = 1:k
        dist(:,j) = pdist2(feats, centers(j,:));
    end
    [mindist, tempidx] = min(dist');

    for j = 1:k
        centers_new(j,:) = mean(feats(find(tempidx==j),:));
    end
    
    
    for j = 1:k
        temp = feats(find(tempidx==j),:) - centers_new(j,:);
        obj(i) = obj(i) + sum(sum(temp'*temp));
    end
    
    if i>2 & abs( (obj(i) -obj(i-1))/obj(i))<0.001
        centers = centers_new;
        break;
    else
        centers = centers_new;
    end
    
end

idx = tempidx;
im_new = reshape(im, [size(im,1)*size(im,2), 3]);

cent = zeros(k,3);
for j = 1:k
    cent(j,:) = mean( im_new( find(idx == j),:) );
end

for j = 1:k
    im_new( find(idx == j),:) = ones( length(find(idx == j)),3).* cent(j,:);
end

out = reshape(im_new, size(im,1),size(im,2),3 );
end
    


    
    



