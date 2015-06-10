function [temp_order]=extractNF(names)
%This function extracts all the images names of a specific path
%Input: 
%   names: list of image names (with temporal information)
%Output: 
%   temp_order: temporal order of the analysed images

    temp_order = zeros(length(names),1);
    for k=1:length(names)
        [~, n, ~] = fileparts(names{k});
        temp_order(k)=str2num(n);  
    end

end