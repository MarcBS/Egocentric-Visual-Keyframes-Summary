function orderedCluster=orderClusters(nameImages, clust_auto, N)
%This function applies the division algorithm to obtain the ordered events.
%Inputs: 
%   nameImages: vector containing the name of the images.
%   clust_auto: cell array with the automatic event clustering.
%   N: scalar indicating the minimum number of images that must contain an
%   event.
%Output:
%   orderedCluster: two-column matrix. The first column contains the images
%   name, and the second one contains the event id which belong to the
%   related image.

nameImages=[nameImages zeros(size(nameImages))];

for k=1:length(nameImages)
    findVector=cellfun(@(x) any(x==nameImages(k,1)),clust_auto);
    if sum(findVector)~=0
        nameImages(k,2)=find(findVector==1);
    end
end
nameImages=nameImages(nameImages(:,2)~=0,:);
numClusters=length(clust_auto);
lastClusterNumber=nameImages(N,2);
lookingClusterNumber=nameImages(N,2);
followedImages=N;
nameImages(1:N-1,2)=lookingClusterNumber;
    
    for k=N+1:length(nameImages)
        
        currentClusterNumber=nameImages(k,2);
        
        if followedImages<N-1
        
            if currentClusterNumber==lastClusterNumber

                followedImages=followedImages+1;

            else
                
                nameImages(k-followedImages:k-1,2)=lookingClusterNumber;
                
                if currentClusterNumber==lookingClusterNumber
                    
                    followedImages=imagesInLookingCluster+followedImages+1;
                    
                else
                    
                    followedImages=1;
                    
                end
                
            end
            
        else
            
            if currentClusterNumber~=lastClusterNumber && lastClusterNumber==lookingClusterNumber
                
                imagesInLookingCluster=followedImages;
                followedImages=1;
                                
            elseif currentClusterNumber==lastClusterNumber && currentClusterNumber~=lookingClusterNumber
                
                indicesLookingClusterNumber=find(nameImages(:,2)==lookingClusterNumber);
                indicesPostLookingClusterNumber=indicesLookingClusterNumber(indicesLookingClusterNumber>k);
                nameImages(indicesPostLookingClusterNumber,2)=numClusters+1;
                numClusters=numClusters+1;
                lookingClusterNumber=currentClusterNumber;
                followedImages=followedImages+1;
                
            elseif currentClusterNumber~=lastClusterNumber && lastClusterNumber~=lookingClusterNumber
                
                nameImages(k-followedImages:k-1,2)=lookingClusterNumber;
                imagesInLookingCluster=imagesInLookingCluster+followedImages;
                followedImages=1;

            else
                
               followedImages=followedImages+1;
                
            end
            
        end 
        
        lastClusterNumber=currentClusterNumber;
        
    end 
    nameImages(k,2)=nameImages(k-1,2);
     
preOrderedCluster=nameImages(:,2);
lastValue=preOrderedCluster(1);
cnt=1;
stamp=1;

for k=1:length(preOrderedCluster)
    
    currentValue=preOrderedCluster(k);
    
    if currentValue~=lastValue
        
        preOrderedCluster(stamp:k-1)=cnt;
        cnt=cnt+1;
        stamp=k;        
        
    end
    
    if k==length(preOrderedCluster)
        preOrderedCluster(stamp:k)=cnt;
    end
    
    lastValue=currentValue;
    
end

orderedCluster(:,1)=nameImages(:,1);
orderedCluster(:,2)=preOrderedCluster;

end
    
    
    
    








