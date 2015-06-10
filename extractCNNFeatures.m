function [features, names]=extractCNNFeatures(path, CNN_params)
%This function uses the ConvolutionalNN provided by Caffe to extract features for the given set of images.
%Input:
%   path: string containing the path of the images set to analize.
%Output:
%   features: matrix containing the features vectors of the images of the
%   specific path.
%   names: list of names of all the images in the dataset

    batch_size = CNN_params.batch_size;

    %% Prepare paths and initialize caffe
    this_path = pwd;
    addpath(CNN_params.caffe_path);
    cd(CNN_params.caffe_path)

    matcaffe_init(CNN_params.use_gpu, CNN_params.model_def_file, CNN_params.model_file, 1); % initialize using or not GPU and model/network files

    images = dir([path '/*.' CNN_params.format]);
    images = images(arrayfun(@(x) x.name(1), images) ~= '.');
    
    features = zeros(length(images), CNN_params.size_features);

    names = {images(:).name};
    count_im = 1;
    nImages = length(names);

    if(nImages == 0)
        error(['Images with format ' format ' not found in folder ' path]);
    end

    %% Extract features
    for i = 0:batch_size:nImages
        this_batch = i+1:min(i+batch_size,  nImages);
        im_list = cell(1,batch_size);
        [im_list{:}] = deal(0);
        count = 1;
        for j = this_batch
            im_list{count} = [path '/' names{count_im}];
            count = count+1;
            count_im = count_im+1;
        end
        images = {prepare_batch(im_list)};
        scores = caffe('forward', images);
        scores = squeeze(scores{1});
        features(this_batch, :) = scores(:,1:length(this_batch))';
    end

    cd(this_path)

end

