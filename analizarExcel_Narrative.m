function [events,clustersId,cl_limGT,sum,imagesRemoved]=analizarExcel_Narrative(excelfile,path,N)
%This function extract the groundtruth events of an excel file.
%Inputs: 
%   excelfile: string containing the name of the excel file.
%   path: string indicating the path of the set of images.
%   N: scalar indicating the minimum number of images that must contain an
%       event. If there is an event annotated with less than N images, the
%       code will remove this images.
%Outputs:
%   events: cell array containing the groundtruth events.
%   clustersId: vector indicating in which cluster belongs an image.
%   cl_limGT: vector with the boundaries of every event.
%   sum: number of images in the set.
%   imagesRemoved: vector with the removed images name.

    files_images=dir(fullfile(path));
    % Numero/Nombre de las imagenes con las que estamos trabajando
    m=1;
    for i=1:(length(files_images))
        filenumber=strread(files_images(i).name,'%s','delimiter','.');
        filename{i,1}=filenumber{1};        
        aux2=str2num(filenumber{1});
        if (isempty(aux2)==0)
            array(m)= str2num(filenumber{1});
            m=m+1;
        end
    end
  %%
    [~,textA] = xlsread(excelfile);
    [f,c]=size(textA);
    %eventsString=textA(3:f,2);
    eventsString=textA(2:f,1); %Para Windows
    
    num_clustauto_def=f-2;
    imagesRemoved=[];
    for i=1:num_clustauto_def
        eString=eventsString{i,1};
        a=str2num(eString);
        p=1;
       
        %Buscamos si hay coincidencia en la carpeta de imagenes
        for j=a(1):1:a(2)
            if(find(array==j)>0)
                aux_Eve2(1,p)=j;
                p=p+1;
            end
        end
        
        if length(aux_Eve2)>N
            events{i,1}=aux_Eve2;
        else
            events{i,1}=[];
            imagesRemoved=[imagesRemoved, aux_Eve2];
        end
        
        clearvars aux_Eve2 a
    end

    events = events(~cellfun(@isempty, events));
    %Generar array Ids
    clustersId=zeros(1,length(array));
    pos=0;
    for i=1:length(events)
        clust_length=length(events{i,1});
        clustersId(1,pos+1:(pos+clust_length))=i;
        pos=pos+clust_length;
    end

        %Generar l�mites F-Measure
        cl_limGT = zeros(size(events,1),1);
        cl_limGT(1)=1;
        for i=1:(size(events,1)-1)
               cl_limGT(i+1) =  cl_limGT(i) + size(events{i},2);    
        end       
        
        %Comprobar que lee todas las im�genes
         sum=0;
         for i=1:length(events)
             sum=sum+ size(events{i},2);
         end
  
     clustersId=clustersId(clustersId~=0);
         
end