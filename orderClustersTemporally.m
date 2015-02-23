function [orderedCluster, boundariesAutomaticCluster]=orderClustersTemporally(nameImages, clust_auto, N)
%This function applies the division algorithm to obtain the ordered events taking into account the temporal information of the images name.
%Inputs: 
%   nameImages: vector containing the name of the images.
%   clust_auto: cell array with the automatic event clustering.
%   N: scalar indicating the minimum number of images that must contain an
%   event.
%Output:
%   orderedCluster: two-column matrix. The first column contains the images
%   name, and the second one contains the event id which belong to the
%   related image.
%   boundariesAutomaticCluster: vector containing the events boundaries of the
%   ordered cluster.


nameImages=[nameImages zeros(length(nameImages),2)];

for k=1:length(nameImages)
    nameImages(k,2)=find(cellfun(@(x) any(x==nameImages(k,1)),clust_auto)==1);
end

numClusters=length(clust_auto);
lastClusterNumber=nameImages(N,2);
lookingClusterNumber=nameImages(N,2);
followedImages=N;
nameImages(1:N-1,2)=lookingClusterNumber;
flag=1;
    
    for k=N+1:length(nameImages)
        
        currentClusterNumber=nameImages(k,2);
        
        if followedImages<N-1
        
            if currentClusterNumber==lastClusterNumber

                followedImages=followedImages+1;

            else
                
                nameImages(k-followedImages:k-1,2)=lookingClusterNumber;
                
                nameImages(k-followedImages:k-1,3)=flag;
                
                flag=flag+1;
                
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
                nameImages(k-followedImages:k-1,3)=flag;
                imagesInLookingCluster=imagesInLookingCluster+followedImages;
                followedImages=1;
                flag=flag+1;

            else
                
               followedImages=followedImages+1;
                
            end
            
        end 
        
        lastClusterNumber=currentClusterNumber;
        
    end 
    nameImages(k,2)=nameImages(k-1,2);
    
preOrderedCluster=nameImages(:,2:end);
lastValue=preOrderedCluster(1,1);
lastValueFlag=preOrderedCluster(1,2);
cnt=1;
stamp=1;
flag=1;
stampFlag=1;
boundariesAutomaticCluster=zeros(length(unique(preOrderedCluster(:,1))),1);
boundariesAutomaticCluster(1)=1;

for k=1:length(preOrderedCluster)
    
    currentValue=preOrderedCluster(k,1);
    currentValueFlag=preOrderedCluster(k,2);
    
    if currentValue~=lastValue
        
        preOrderedCluster(stamp:k-1,1)=cnt;
        cnt=cnt+1;
        stamp=k;    
        boundariesAutomaticCluster(cnt)=k+1;
        
    end
    
    if currentValueFlag==0 && lastValueFlag~=0
       
        preOrderedCluster(stampFlag:k-1,2)=flag;
        flag=flag+1;
    
    elseif currentValueFlag~=0 && lastValueFlag==0
        
        stampFlag=k;
        
    end
    
    if k==length(preOrderedCluster)
        preOrderedCluster(stamp:k,1)=cnt;
    end
    
    lastValue=currentValue;
    lastValueFlag=currentValueFlag;
    
end

for k=1:max(preOrderedCluster(:,2))
    
    indicesSubCluster=find(preOrderedCluster(:,2)==k);
    subCluster=nameImages(indicesSubCluster,1);
    infborder=min(subCluster);
    supborder=max(subCluster);
    % If the lower border is not the lower index possible 
    if infborder~=nameImages(1,1)
        borderInferiorCloserCluster=nameImages(find(nameImages==infborder)-1);
    else
        borderInferiorCloserCluster=infborder;
    end
    if supborder~=nameImages(1,end)
        borderSuperiorCloserCluster=nameImages(find(nameImages==supborder)+1);
    else
        borderSuperiorCloserCluster=supborder;
    end
    infDistance=infborder-borderInferiorCloserCluster;
    supDistance=borderSuperiorCloserCluster-supborder;           

    if infDistance>supDistance

       preOrderedCluster(indicesSubCluster,1)=preOrderedCluster(indicesSubCluster(end)+1,1);

    end
    
    
    
end

if length(preOrderedCluster(preOrderedCluster(:,1)==preOrderedCluster(end,1)))<N
        
        preOrderedCluster(preOrderedCluster(:,1)==preOrderedCluster(end,1))=preOrderedCluster(end,1)-1;
        
end

orderedCluster(:,1)=nameImages(:,1);
orderedCluster(:,2)=preOrderedCluster(:,1);

end
    
    
    
    








