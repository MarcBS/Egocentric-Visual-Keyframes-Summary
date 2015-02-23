function [clust_auto, numClusters]=obtainAutomaticCluster(featuresMatrix, cutoff, method)

%This function group into clusters the features of the daily images. 
%Inputs:
%   featuresMatrix: is a matrix with all the features of all images of the
%       daily extraction. The first column contains the name of the image.
%   cutoff: is a value between [0 2] that is used to determine at what
%       distance between images a cluster has to be considered (1.15 best
%       experimental value).
%   method: an string indicating the method to apply for the linkage
%       between features. 'method' can be: average, centroid, complete, median, single, ward,
%       weighted.
%Output:
%   clust_auto: a cell where every position contains a vector with the
%       indices of the images that belong a cluster.
%   numClusters: is an escalar that indicates the number of resultant
%       clusters.


% First of all we extract the index of the cluster where an image belongs.
T=clusterdata(featuresMatrix(:,2:end),'linkage',method,cutoff);

% The first column of the features matrix are the names of all the images,
% and extensively, it's timestamp.
nameImages=featuresMatrix(:,1);

% We can extract the number of clusters looking which values are unique in
% the vector of index.
numClusters=length(unique(T));

% We prepare the cell vector to put in the clusters.
clust_auto=cell(numClusters,1);

% This iteration finds all images that belong a cluster k and save it's
% name in the cell vector.
for k=1:numClusters
   
    idx=find(T==k)';
    clust_auto{k}=nameImages(idx);
    
end


end

