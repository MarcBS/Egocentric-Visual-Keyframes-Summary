%%%%% Script to do all the tests with Jackard Index %%%%%

%%% Estefania1 without normalization and normalized %%%

tic;

% [cutoff, numClustersEstefania1_average_OT_SN, JIEstefania1_average_OT_SN] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'average', 1, false, 6);
% 
% [~, numClustersEstefania1_centroid_OT_SN, JIEstefania1_centroid_OT_SN] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'centroid', 1, false, 6);
% 
% [~, numClustersEstefania1_complete_OT_SN, JIEstefania1_complete_OT_SN] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'complete', 1, false, 6);
% 
% [~, numClustersEstefania1_median_OT_SN, JIEstefania1_median_OT_SN] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'median', 1, false, 6);
% 
% [~, numClustersEstefania1_single_OT_SN, JIEstefania1_single_OT_SN] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'single', 1, false, 6);
% 
% [~, numClustersEstefania1_ward_OT_SN, JIEstefania1_ward_OT_SN] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'ward', 1, false, 6);
% 
% [~, numClustersEstefania1_weighted_OT_SN, JIEstefania1_weighted_OT_SN] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'weighted', 1, false, 6);
% 
% 
% [~, numClustersEstefania1_average_OT_N, JIEstefania1_average_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'average', 1, true, 6);
% 
% [~, numClustersEstefania1_centroid_OT_N, JIEstefania1_centroid_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'centroid', 1, true, 6);
% 
% [~, numClustersEstefania1_complete_OT_N, JIEstefania1_complete_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'complete', 1, true, 6);
% 
% [~, numClustersEstefania1_median_OT_N, JIEstefania1_median_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'median', 1, true, 6);
% 
% [~, numClustersEstefania1_single_OT_N, JIEstefania1_single_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'single', 1, true, 6);
% 
% [~, numClustersEstefania1_ward_OT_N, JIEstefania1_ward_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'ward', 1, true, 6);
% 
% [~, numClustersEstefania1_weighted_OT_N, JIEstefania1_weighted_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'weighted', 1, true, 6);
% 
% 
% %%% Estefania2 without normalization and normalized %%%
% 
% [~, numClustersEstefania2_average_OT_SN, JIEstefania2_average_OT_SN] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'average', 1, false, 6);
% 
% [~, numClustersEstefania2_centroid_OT_SN, JIEstefania2_centroid_OT_SN] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'centroid', 1, false, 6);
% 
% [~, numClustersEstefania2_complete_OT_SN, JIEstefania2_complete_OT_SN] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'complete', 1, false, 6);
% 
% [~, numClustersEstefania2_median_OT_SN, JIEstefania2_median_OT_SN] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'median', 1, false, 6);
% 
% [~, numClustersEstefania2_single_OT_SN, JIEstefania2_single_OT_SN] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'single', 1, false, 6);
% 
% [~, numClustersEstefania2_ward_OT_SN, JIEstefania2_ward_OT_SN] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'ward', 1, false, 6);
% 
% [~, numClustersEstefania2_weighted_OT_SN, JIEstefania2_weighted_OT_SN] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'weighted', 1, false, 6);
% 
% 
% [~, numClustersEstefania2_average_OT_N, JIEstefania2_average_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'average', 1, true, 6);
% 
% [~, numClustersEstefania2_centroid_OT_N, JIEstefania2_centroid_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'centroid', 1, true, 6);
% 
% [~, numClustersEstefania2_complete_OT_N, JIEstefania2_complete_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'complete', 1, true, 6);
% 
% [~, numClustersEstefania2_median_OT_N, JIEstefania2_median_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'median', 1, true, 6);
% 
% [~, numClustersEstefania2_single_OT_N, JIEstefania2_single_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'single', 1, true, 6);
% 
% [~, numClustersEstefania2_ward_OT_N, JIEstefania2_ward_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'ward', 1, true, 6);
% 
% [~, numClustersEstefania2_weighted_OT_N, JIEstefania2_weighted_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'weighted', 1, true, 6);
% 
% 
% %%% Mariella without normalization and normalized %%%
% 
% [~, numClustersMariella_average_OT_SN, JIMariella_average_OT_SN] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'average', 1, false, 6);
% 
% [~, numClustersMariella_centroid_OT_SN, JIMariella_centroid_OT_SN] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'centroid', 1, false, 6);
% 
% [~, numClustersMariella_complete_OT_SN, JIMariella_complete_OT_SN] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'complete', 1, false, 6);
% 
% [~, numClustersMariella_median_OT_SN, JIMariella_median_OT_SN] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'median', 1, false, 6);
% 
% [~, numClustersMariella_single_OT_SN, JIMariella_single_OT_SN] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'single', 1, false, 6);
% 
% [~, numClustersMariella_ward_OT_SN, JIMariella_ward_OT_SN] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'ward', 1, false, 6);
% 
% [~, numClustersMariella_weighted_OT_SN, JIMariella_weighted_OT_SN] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'weighted', 1, false, 6);
% 
% 
% [~, numClustersMariella_average_OT_N, JIMariella_average_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'average', 1, true, 6);
% 
% [~, numClustersMariella_centroid_OT_N, JIMariella_centroid_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'centroid', 1, true, 6);
% 
% [~, numClustersMariella_complete_OT_N, JIMariella_complete_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'complete', 1, true, 6);
% 
% [~, numClustersMariella_median_OT_N, JIMariella_median_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'median', 1, true, 6);
% 
% [~, numClustersMariella_single_OT_N, JIMariella_single_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'single', 1, true, 6);
% 
% [~, numClustersMariella_ward_OT_N, JIMariella_ward_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'ward', 1, true, 6);
% 
% [~, numClustersMariella_weighted_OT_N, JIMariella_weighted_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'weighted', 1, true, 6);
% 
% 
% %%% Petia1 without normalization and normalized %%%
% 
% [~, numClustersPetia1_average_OT_SN, JIPetia1_average_OT_SN] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'average', 1, false, 6);
% 
% [~, numClustersPetia1_centroid_OT_SN, JIPetia1_centroid_OT_SN] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'centroid', 1, false, 6);
% 
% [~, numClustersPetia1_complete_OT_SN, JIPetia1_complete_OT_SN] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'complete', 1, false, 6);
% 
% [~, numClustersPetia1_median_OT_SN, JIPetia1_median_OT_SN] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'median', 1, false, 6);
% 
% [~, numClustersPetia1_single_OT_SN, JIPetia1_single_OT_SN] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'single', 1, false, 6);
% 
% [~, numClustersPetia1_ward_OT_SN, JIPetia1_ward_OT_SN] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'ward', 1, false, 6);
% 
% [~, numClustersPetia1_weighted_OT_SN, JIPetia1_weighted_OT_SN] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'weighted', 1, false, 6);
% 
% 
% [~, numClustersPetia1_average_OT_N, JIPetia1_average_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'average', 1, true, 6);
% 
% [~, numClustersPetia1_centroid_OT_N, JIPetia1_centroid_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'centroid', 1, true, 6);
% 
% [~, numClustersPetia1_complete_OT_N, JIPetia1_complete_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'complete', 1, true, 6);
% 
% [~, numClustersPetia1_median_OT_N, JIPetia1_median_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'median', 1, true, 6);
% 
% [~, numClustersPetia1_single_OT_N, JIPetia1_single_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'single', 1, true, 6);
% 
% [~, numClustersPetia1_ward_OT_N, JIPetia1_ward_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'ward', 1, true, 6);
% 
% [~, numClustersPetia1_weighted_OT_N, JIPetia1_weighted_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'weighted', 1, true, 6);
% 
% 
% %%% Petia2 without normalization and normalized %%%
% 
% [~, numClustersPetia2_average_OT_SN, JIPetia2_average_OT_SN] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'average', 1, false, 6);
% 
% [~, numClustersPetia2_centroid_OT_SN, JIPetia2_centroid_OT_SN] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'centroid', 1, false, 6);
% 
% [~, numClustersPetia2_complete_OT_SN, JIPetia2_complete_OT_SN] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'complete', 1, false, 6);
% 
% [~, numClustersPetia2_median_OT_SN, JIPetia2_median_OT_SN] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'median', 1, false, 6);
% 
% [~, numClustersPetia2_single_OT_SN, JIPetia2_single_OT_SN] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'single', 1, false, 6);
% 
% [~, numClustersPetia2_ward_OT_SN, JIPetia2_ward_OT_SN] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'ward', 1, false, 6);
% 
% [~, numClustersPetia2_weighted_OT_SN, JIPetia2_weighted_OT_SN] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'weighted', 1, false, 6);
% 
% 
% [~, numClustersPetia2_average_OT_N, JIPetia2_average_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'average', 1, true, 6);
% 
% [~, numClustersPetia2_centroid_OT_N, JIPetia2_centroid_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'centroid', 1, true, 6);
% 
% [~, numClustersPetia2_complete_OT_N, JIPetia2_complete_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'complete', 1, true, 6);
% 
% [~, numClustersPetia2_median_OT_N, JIPetia2_median_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'median', 1, true, 6);
% 
% [~, numClustersPetia2_single_OT_N, JIPetia2_single_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'single', 1, true, 6);
% 
% [~, numClustersPetia2_ward_OT_N, JIPetia2_ward_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'ward', 1, true, 6);
% 
% [~, numClustersPetia2_weighted_OT_N, JIPetia2_weighted_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'weighted', 1, true, 6);
% 
% 
% 
% %%% Normalized without ordering%%%
% 
% 
% [~, numClustersEstefania1_average_SO_N, JIEstefania1_average_SO_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'average', 0, true, 0);
% 
% [~, numClustersEstefania2_average_SO_N, JIEstefania2_average_SO_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'average', 0, true, 0);
% 
% [~, numClustersPetia1_average_SO_N, JIPetia1_average_SO_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'average', 0, true, 0);
% 
% [~, numClustersPetia2_average_SO_N, JIPetia2_average_SO_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'average', 0, true, 0);
% 
% [~, numClustersMariella_average_SO_N, JIMariella_average_SO_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'average', 0, true, 0);
% 
% 
% 
% %%% Normalized with ordering to the previous one%%%
% 
% 
% [~, numClustersEstefania1_average_O_N, JIEstefania1_average_O_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'average', 2, true, 6);
% 
% [~, numClustersEstefania2_average_O_N, JIEstefania2_average_O_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'average', 2, true, 6);
% 
% [~, numClustersPetia1_average_O_N, JIPetia1_average_O_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'average', 2, true, 6);
% 
% [~, numClustersPetia2_average_O_N, JIPetia2_average_O_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'average', 2, true, 6);
% 
% [~, numClustersMariella_average_O_N, JIMariella_average_O_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'average', 2, true, 6);
% 

%%% Normalized with ordering looking the distance %%%


[cutoff, numClustersEstefania1_average_OT_N, JIEstefania1_average_OT_N] = resultsClusterValidation(pathEstefania1, 'GT_Estefania1.xls', featuresWithNameEstefania1, 'average', 1, true, 6);

[~, numClustersEstefania2_average_OT_N, JIEstefania2_average_OT_N] = resultsClusterValidation(pathEstefania2, 'GT_Estefania2.xls', featuresWithNameEstefania2, 'average', 1, true, 6);

[~, numClustersPetia1_average_OT_N, JIPetia1_average_OT_N] = resultsClusterValidation(pathPetia1, 'GT_Petia1.xls', featuresWithNamePetia1, 'average', 1, true, 6);

[~, numClustersPetia2_average_OT_N, JIPetia2_average_OT_N] = resultsClusterValidation(pathPetia2, 'GT_Petia2.xls', featuresWithNamePetia2, 'average', 1, true, 6);

[~, numClustersMariella_average_OT_N, JIMariella_average_OT_N] = resultsClusterValidation(pathMariella, 'GT_Mariella.xls', featuresWithNameMariella, 'average', 1, true, 6);



toc;