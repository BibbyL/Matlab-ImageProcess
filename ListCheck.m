clc; clear; close all;
scale = '40';
imgRoot_info = sprintf('./Results/%s/', scale);
imgRoot = imgRoot_info;

addpath(imgRoot);
imgs_names=dir([imgRoot '*' 'jpg']);
% List = {'number', 'cif', 'img', 'kodim'};
% LIST(:,1) = 1:60; % number
LIST(:,1) = zeros(1,60); % cif
LIST(:,2) = zeros(1,60); % img
LIST(:,3) = zeros(1,60); % kodim

for ii=1:length(imgs_names)

    if  strcmp(imgs_names(ii).name(1,1:3),'cif') 
        num = str2num(imgs_names(ii).name(1,4:5));
        LIST(num, 1) = 1;
    elseif strcmp(imgs_names(ii).name(1,1:3),'img')
        num = str2num(imgs_names(ii).name(1,4:5));
        LIST(num, 2) = 1;
    elseif strcmp(imgs_names(ii).name(1,1:5),'kodim')
        num = str2num(imgs_names(ii).name(1,6:7));
        LIST(num, 3) = 1;       
    end
   
end
LIST(1,4) = sum(sum(LIST));disp(LIST(1,4));
list_name = sprintf('./Results/List_%s', scale); 
xlswrite(list_name, LIST, 'Check List');