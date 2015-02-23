function features=extractCNNFeatures(path)
%This function uses the ConvolutionalNN provided by Caffe to extract features for the given set of images.
%Input:
%   path: string containing the path of the images set to analize.
%Output:
%   features: matrix containing the features vectors of the images of the
%   specific path.

caffe_path = '/usr/local/opt/caffe/matlab/caffe/';

size_features = 4096;
addpath(caffe_path);

%% Go through each folder
cd(caffe_path)
images = dir(strcat(path,'/*.jpg'));
features = zeros(length(images), size_features);
%% For each image in this folder
count_im = 1;
if f==1
    names = {images(:).name};
else
    names = [names, images(:).name];
end
nImages = length(images);
for k = 1:nImages
    im = names{k};
    im = imread(strcat(path,'/',im);
    % Load features. In case that there is not GPU, change the 1 to 0.
    [scores, ~] = matcaffe_demo(im, 1);
    features(k, :) = scores';
    % Count progress
    if(mod(count_im, 50) == 0 || count_im == nImages)
        disp(['Processed ' num2str(count_im) '/' num2str(nImages) ' images.']);
    end
    count_im = count_im +1;
end

end

