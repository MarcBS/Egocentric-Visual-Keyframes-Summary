function [visualSummaryRandomWalk, visualSummaryMinimumDistance, visualSummaryRandom, visualSummaryUniform] = mainVisualSummary(path, montageFlag, params)
%This function extracts the visual summary of all the images of the specific path.
%Inputs:
%   path: string containing the path of the images to summarize.
%         Example of path: path='/imatge/rmestre/work/Images/testImages/Dataset2';
%   montageFlag: boolean. If it's value is true, the code will plot every event and it's representative images. 
%         This is useful if we want to extract figures with the complete events and the representative images to evaluate the results.
%         It is recommended to put a breakpoint at the "montage(im)" line, if not all figures will overwrite the previous one.
%   params: structure containing the following information
%           -> caffe_path: path to Caffe's Matlab installation
%           -> use_gpu: boolean for using GPU mode for Caffe
%           -> model_file: path to the .caffemodel file with the pre-trained network
%           -> format: images format (e.g. 'jpg', 'png', etc.)
%Output:
%   visualSummaryRandomWalk: a cell array containing the paths of the representative images extracted through random walk.
%   visualSummaryMinimumDistance: a cell array containing the paths of the representative images extracted through minimum distance.
%   visualSummaryRandom: a cell array containing the paths of the representative images extracted choosing a random image of the event.
%   visualSummaryUniform: a cell array containing the paths of the representative images extracted choosing temporally equidistant images.

if(nargin < 3)
    params.caffe_path = '/usr/local/caffe-dev/matlab/caffe/';
    params.use_gpu = true;
    params.model_file = '/usr/local/caffe-dev/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel';
    params.format = 'jpg';
end

params.batch_size = 10; % Depending on the deploy net structure!!
params.model_def_file = [pwd '/CNN_models/deploy_features.prototxt'];
params.size_features = 4096;

%Feature extraction
features=extractCNNFeatures(path, params);

%Extraction of the features name
features=extractNF(path,features);

%Feature normalization
features(:,2:end)=normalizeL2(features(:,2:end));

%Obtain automatic cluster
featuresIndex=features(:,1);
[clust_auto, ~]=obtainAutomaticCluster(features,1.1545, 'average');

%Apply the division algorithm
orderedCluster=orderClustersTemporally(featuresIndex, clust_auto, 6);

%Create the cell arrays 
visualSummaryRandomWalk=cell(1,max(orderedCluster(:,2)));
visualSummaryMinimumDistance=cell(1,max(orderedCluster(:,2)));
visualSummaryRandom=cell(1,max(orderedCluster(:,2)));
visualSummaryUniform=cell(1,max(orderedCluster(:,2)));

%Extract the representative images and construct the cell arrays
cnt=1;
numFeatures=size(features,1);
aux=floor(numFeatures/max(orderedCluster(:,2)));

for k=1:max(orderedCluster(:,2))
   
    indicesCluster=find(orderedCluster(:,2)==k);
    featuresCluster=features(indicesCluster,2:end);
    imagesNameCluster=orderedCluster(indicesCluster,1);
    D=dM(featuresCluster);
    
    repImRW=randomWalkClustering([imagesNameCluster D]);
    repImRW=strcat(path,'/Resized/',repImRW);
    visualSummaryRandomWalk{k}=repImRW;
    repImMD=minimumDistanceClustering([imagesNameCluster D]);
    repImMD=strcat(path,'/Resized/',repImMD);
    visualSummaryMinimumDistance{k}=repImMD;
    nsize=numel(imagesNameCluster);
    idx=imagesNameCluster(randperm(nsize,1));
    repImR=sprintf('%06d.jpg',idx);
    repImR=strcat(path,'/Resized/',repImR);
    visualSummaryRandom{k}=repImR;
    
    if cnt==1      
        if strcmp(repImRW,repImMD)
            repIm={repImRW,repImR};
        else
            repIm={repImRW,repImMD,repImR};
        end
        cnt=2;
    elseif cnt==2
        if strcmp(repImRW,repImMD)
            repIm={repImR,repImRW};
        else
            repIm={repImR,repImRW,repImMD};
        end
        cnt=3;
    elseif cnt==3
        if strcmp(repImRW,repImMD)
            repIm={repImRW,repImR};
        else
            repIm={repImMD,repImR,repImRW};
        end
        cnt=1;        
    end
    im=cell(1,length(indicesCluster));
    for n=1:length(indicesCluster)
       
        name=sprintf('%06d.jpg',featuresIndex(indicesCluster(n)));
        im{n}=strcat(path,'/Resized/',name);
        
    end
    
    repUniform=sprintf('%06d.jpg',featuresIndex(aux*k));
    repUniform=strcat(path,'/Resized/',repUniform);
    visualSummaryUniform{k}=repUniform;
    
    if montageFlag==true
        montage(im);
        montage(repIm,'Size',size(repIm));
    end
        
end

%Plot the visual summaries
if montageFlag==true
    figure; montage(visualSummaryRandomWalk);
    figure; montage(visualSummaryMinimumDistance);
    figure; montage(visualSummaryRandom);
    figure; montage(visualSummaryUniform);
end

end

