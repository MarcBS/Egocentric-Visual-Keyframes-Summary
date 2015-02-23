function [cutoff, numClusters, JI] = resultsClusterValidation(path, excel_filename, featuresMatrix, method, orderFlag, normFlag, N)
%This function computes the Jaccard index along a rank of cutoff values. 
%Inputs:
%   path: string containing the path of the images to summarize.
%       Example of path: path='/imatge/rmestre/work/Images/testImages/Petia2';
%   excel_filename: string containing the groundtruth file to analize. Example: excel_filename='GT_Petia2.xls';
%   featuresMatrix: matrix containing the CNN features of the set images.
%       The first column contains the name of this images.
%   method: string indicating the method of linkage for the clusterdata
%       function.
%   orderFlag: scalar. If it is 0, the division algorithm will not be
%       executed. If its value is 1, the temporally division will be
%       applied, and if its value is 2 the division algorithm will be
%       applied without taking into account the temporal information.
%   normFlag: boolean. If it is true, the normalization will be applied.
%   N: scalar that indicates the minimum number of images that must contain
%       an event.
%Output:
%   cutoff: vector of cutoff values.
%   numClusters: for the cutoff values, the related number of clusters
%       that every value cause.
%   JI: for the cutoff values, the related Jaccard index.

%Extract the groundtruth events
[clust_man,~,~,~,imagesRemoved]=analizarExcel_Narrative(excel_filename,path,N);

%Remove the images removed in the groundtruth, if is the case
featuresMatrix=featuresMatrix(find(ismember(featuresMatrix(:,1),imagesRemoved)==0),:);
nameImages=featuresMatrix(:,1);
%cutoff=1.14:0.001:1.16;
cutoff=0.1:0.1:2;
numClusters=zeros(length(cutoff),1);
JI=zeros(length(cutoff),1);

%Apply the normalization
if normFlag==true
    featuresMatrix(:,2:end)=normalizeL2(featuresMatrix(:,2:end));
end
tic;
for k=1:length(cutoff)

    %Extract the automatic segmentation
    [clust_auto, numClusters(k)]=obtainAutomaticCluster(featuresMatrix,cutoff(k),method, false);
    
    %If is the case, apply the division algorithm
    if orderFlag~=0
        
        if orderFlag==1
    
            [orderedCluster, ~]=orderClustersTemporally(nameImages, clust_auto, N);
        
        elseif orderFlag==2
            
            orderedCluster=orderClusters(nameImages, clust_auto, N);
            
        end           

        clustersIdx=unique(orderedCluster(:,2));

        numClusters(k)=length(clustersIdx);

        for j=1:numClusters(k)

            idx=find(orderedCluster(:,2)==clustersIdx(j))';
            clust_auto{j}=featuresMatrix(idx,1);

        end
        
    end
    
    %For every iteration, compute the Jaccard index
    [JI(k),~,~,~,~]=JaccardIndex(clust_man,clust_auto);  

end
toc;


end

