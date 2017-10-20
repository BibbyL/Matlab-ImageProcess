clc; clear; close all;
scale = '90';
imgRoot_info = sprintf('./Results/%s/', scale);
imgRoot = imgRoot_info;

addpath(imgRoot);
imgs_names=dir([imgRoot '*' 'jpg']);

for ii=1:length(imgs_names)
    I = imread(imgs_names(ii).name);
    if  strcmp(imgs_names(ii).name(1,1:3),'cif') || strcmp(imgs_names(ii).name(1,1:3),'img')
        str = sprintf('./Results/PC_%s/%s_SDMSR_PR=%s_%s).jpg'...
            ,scale ,imgs_names(ii).name(1,1:5), imgs_names(ii).name(1,11:17), imgs_names(ii).name(1,19:40) );        
        imwrite(I, str);    
    elseif strcmp(imgs_names(ii).name(1,1:5),'kodim')
        str = sprintf('./Results/PC_%s/%s_SDMSR_PR=%s_%s).jpg'...
            ,scale ,imgs_names(ii).name(1,1:7), imgs_names(ii).name(1,13:20), imgs_names(ii).name(1,23:44) );        
        imwrite(I, str); 
    end
   
end