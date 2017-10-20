clc; clear; close all;

scale_list = [ 80, 70, 60, 50, 40];

% cif   = {'01' '05' '06' '10' '11' '16'};
% img   = {'06' '07' '08' '09' '11' '14' '15' '18' '24' '26' '28' '29' '30' '31' '33' '35'  '36' '41' '42' '47' '49' '51' '52' '54' '56' '57' '59' '60'};
% kodim = {'01' '02' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12' '13' '14' '16' '17' '18' '19' '20' '21' '22' '23' '24'};
cif   = {'01' '05' '06' '10' '11' '16'};
img   = {'41' '42' '47' '49' '51' '52' '54' '56' '57' '59' '60'};
kodim = {'01' '02' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12' '13' '14' '16' '17' '18' '19' '20' '21' '22' '23' '24'};
NUM = length(cif) + length(img) + length(kodim);disp(NUM);
for ss = 1:length(scale_list)
    scale = scale_list(ss);
    imgRoot_info = sprintf('../Reference Linear/Results/PC_%d/', scale);
    imgRoot = imgRoot_info;
    addpath(imgRoot);
    imgs_names=dir([imgRoot '*' 'jpg']);
    % str = sprintf('../PICK/SDMSR/%d/%s', scale, imgs_names(ii).name);
    % -----------------------------------------------------------------------------
    for cc = 1:length(cif)
        target = cif{cc};
        for ii=1:length(imgs_names)
            if  strcmp(imgs_names(ii).name(1,1:3) ,'cif') && strcmp(imgs_names(ii).name(1,4:5), target) 
                I = imread(imgs_names(ii).name);
                str = sprintf('../Reference Linear/Results/0505/%d/%s', scale, imgs_names(ii).name);
                imwrite(I, str); 
                break;
            end
        end
    end
    % -----------------------------------------------------------------------------
    for cc = 1:length(img)
        target = img{cc};
        for ii=1:length(imgs_names)
            if strcmp(imgs_names(ii).name(1,1:3) ,'img') && strcmp(imgs_names(ii).name(1,4:5), target) 
                I = imread(imgs_names(ii).name);
                str = sprintf('../Reference Linear/Results/0505/%d/%s', scale, imgs_names(ii).name);
                imwrite(I, str); 
                break;
            end
        end
    end
    % -----------------------------------------------------------------------------
    for cc = 1:length(kodim)
        target = kodim{cc};
        for ii=1:length(imgs_names)
            if strcmp(imgs_names(ii).name(1,1:5) ,'kodim') && strcmp(imgs_names(ii).name(1,6:7), target) 
                I = imread(imgs_names(ii).name);
                str = sprintf('../Reference Linear/Results/0505/%d/%s', scale, imgs_names(ii).name);
                imwrite(I, str); 
                break;
            end
        end
    end
    
end
