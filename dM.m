function distances=dM(features)
%This function computes the distances matrix of the features vectors.
%Input: 
%   features: is a matrix containing the CNN features of the images.
%Output:
%   distances: is a matrix containg the distances between all the images of the input matrix.

[numImages, ~]=size(features);
d=zeros(numImages, numImages);
distances=zeros(numImages, numImages);
for k=1:numImages
    for l=1:numImages
       
      d(l,k)=sqrt(sum((features(l,:)-features(k,:)).^2));
             
    end
    distances(:,k)=exp(d(:,k));
    distances(:,k)=distances(:,k)/sum(distances(:,k));
end

end