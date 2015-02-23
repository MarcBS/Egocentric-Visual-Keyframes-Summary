function im = randomWalkClustering( distances )
%This function extracts the representative image of an event applying the random walk algorithm. 
%Input: 
%   distances: a distance matrix of the images of the event. The first column has to be the name of the image.
%Output: 
%   im: an string with the path of the representative image of the event.
%       You can extract the less repetitive image of the event taking out the comments of the code.

[eigenvectors, ~]=eig(distances(:,2:end));
eigenvectors=abs(eigenvectors);
imageIndexMax=find(eigenvectors(:,1)==min(eigenvectors(:,1)));
%imageIndexMin=find(eigenvectors(:,1)==max(eigenvectors(:,1)));
idxMax=distances(imageIndexMax,1);
%idxMin=distances(imageIndexMin,1);
%im{1}=sprintf('%06d.jpg',idxMax);
%im{2}=sprintf('%06d.jpg',idxMin);
im=sprintf('%06d.jpg',idxMax);

end

