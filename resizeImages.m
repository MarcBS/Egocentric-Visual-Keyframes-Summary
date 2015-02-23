function resizeImages(path)
%This function resizes all images in a specific path to 490x472 pixels.
%Input: 
%   path: is an string containing the path of the images to resize. Example: path='C:\Users\RICARD\Universitat\TFG\SetsParaRicard\petia_2'

original=cd(path);
files=dir('*.jpg');

for k=1:length(files)
    
   name=files(k).name;
   I=imread(name);
   I=imresize(I,[490 472]);
   %I=imresize(I,0.25);
   %Be sure that the directory "Resized" exists.
   old=cd(strcat(path,'\Resized'));
   imwrite(I,name);
   cd(old);
    
end

cd(original);