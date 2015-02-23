function im = minimumDistanceClustering( distances )
%This function extracts the representative image of a cluster based on the
%distances matrix.
%Input: 
%   distances: a distance matrix of the images of the event. The first column has to be the name of the image.
%Output: 
%   im: an string with the path of the representative image of the event.
%       You can extract the less repetitive image of the event taking out the comments of the code.
    
%First, we sum the columns of the matrix vector. The result is a vector
%with all the distances refered to a single image sumed
DistSum=sum(distances(:,2:end),2);

%We can obtain the representative image of the cluster finding the image
%that has less value of the sumed distances

imageIndexMax=find(DistSum==min(DistSum));
%imageIndexMin=find(DistSum==max(DistSum));
idxMax=distances(imageIndexMax,1);
%idxMin=distances(imageIndexMin,1);
% im{1}=sprintf('%06d.jpg',idxMax);
% im{2}=sprintf('%06d.jpg',idxMin);
im=sprintf('%06d.jpg',idxMax);

end



