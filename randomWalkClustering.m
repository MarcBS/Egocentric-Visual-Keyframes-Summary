function im = randomWalkClustering( img_names, distances )
%This function extracts the representative image of an event applying the random walk algorithm. 
%Input: 
%   img_names: names of the images in this cluster
%   distances: a distance matrix of the images of the event. The first column has to be the name of the image.
%Output: 
%   im: an string with the path of the representative image of the event.
%       You can extract the less repetitive image of the event taking out the comments of the code.

    [eigenvectors, ~]=eig(distances);
    eigenvectors=abs(eigenvectors);
    imageIndexMax=find(eigenvectors(:,1)==min(eigenvectors(:,1)));

    im = img_names{imageIndexMax};

end

