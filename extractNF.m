function [featuresWithName]=extractNF(path,features)
%This function extracts all the images names of an specific path
%Input: 
%   path: string containing the images path.
%   features: matrix containing the CNN features of all the images of the path.
%Output: 
%   featuresWithName: matrix containing the CNN features of all the images of the path and with the names of the images at the first column of the matrix.

old=cd(path);
files=dir('*.jpg');
featuresWithName=zeros(length(files),4097);
featuresWithName(:,2:end)=features;
for k=1:length(files)
    
    filenumber=strread(files(k).name,'%s','delimiter','.');
    featuresWithName(k,1)=str2num(filenumber{1});  
    
end
cd(old);
end