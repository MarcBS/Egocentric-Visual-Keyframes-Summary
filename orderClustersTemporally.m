function [orderedCluster, boundariesAutomaticCluster]=orderClustersTemporally(tmp_order, im_names, clust_auto, N)
%This function applies the division algorithm to obtain the ordered events taking into account the temporal information of the images name.
%Inputs: 
%   tmp_order: vector containing the temporal order of the images
%   im_names: list of image names
%   clust_auto: cell array with the automatic event clustering.
%   N: scalar indicating the minimum number of images that must contain an
%   event.
%Output:
%   orderedCluster: two-column matrix. The first column contains the images
%   name, and the second one contains the event id which belong to the
%   related image.
%   boundariesAutomaticCluster: vector containing the events boundaries of the
%   ordered cluster.


tmp_order=[tmp_order zeros(length(tmp_order),2)];

for k=1:size(tmp_order,1)
%     tmp_order(k,2)=find(cellfun(@(x) any(x==tmp_order(k,1)),clust_auto)==1);
    tmp_order(k,2)=find(cellfun(@(x) any(ismember(x,im_names(k))),clust_auto));
end

numClusters=length(clust_auto);
lastClusterNumber=tmp_order(N,2);
lookingClusterNumber=tmp_order(N,2);
followedImages=N;
tmp_order(1:N-1,2)=lookingClusterNumber;
flag=1;
    
    for k=N+1:length(tmp_order)
        
        currentClusterNumber=tmp_order(k,2);
        
        if followedImages<N-1
        
            if currentClusterNumber==lastClusterNumber

                followedImages=followedImages+1;

            else
                
                tmp_order(k-followedImages:k-1,2)=lookingClusterNumber;
                
                tmp_order(k-followedImages:k-1,3)=flag;
                
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
                
                indicesLookingClusterNumber=find(tmp_order(:,2)==lookingClusterNumber);
                indicesPostLookingClusterNumber=indicesLookingClusterNumber(indicesLookingClusterNumber>k);
                tmp_order(indicesPostLookingClusterNumber,2)=numClusters+1;
                numClusters=numClusters+1;
                lookingClusterNumber=currentClusterNumber;
                followedImages=followedImages+1;
                
            elseif currentClusterNumber~=lastClusterNumber && lastClusterNumber~=lookingClusterNumber
                
                tmp_order(k-followedImages:k-1,2)=lookingClusterNumber;
                tmp_order(k-followedImages:k-1,3)=flag;
                imagesInLookingCluster=imagesInLookingCluster+followedImages;
                followedImages=1;
                flag=flag+1;

            else
                
               followedImages=followedImages+1;
                
            end
            
        end 
        
        lastClusterNumber=currentClusterNumber;
        
    end 
    tmp_order(k,2)=tmp_order(k-1,2);
    
preOrderedCluster=tmp_order(:,2:end);
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
    subCluster=tmp_order(indicesSubCluster,1);
    infborder=min(subCluster);
    supborder=max(subCluster);
    % If the lower border is not the lower index possible 
    if infborder~=tmp_order(1,1)
        borderInferiorCloserCluster=tmp_order(find(tmp_order==infborder)-1);
    else
        borderInferiorCloserCluster=infborder;
    end
    if supborder~=tmp_order(1,end)
        borderSuperiorCloserCluster=tmp_order(find(tmp_order==supborder)+1);
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

orderedCluster=preOrderedCluster(:,1);

end
    
    
    
    








