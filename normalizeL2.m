function [ X ] = normalizeL2( X )
%This function normalizes the input matrix with the L2 method.
%Input:
%   X: matrix of CNN features.
%Output:
%   X: normalized matrix of CNN features.

    X = sign(X) .* sqrt(abs(X)); 
    for k=1:size(X,1)
        nn = norm(X(k,:));
        if(nn~=0)
            X(k,:) = X(k,:) ./ nn;
        end
    end

end

