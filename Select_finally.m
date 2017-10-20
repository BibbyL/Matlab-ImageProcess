clc; clear; close all;

scale_list = [ 80, 70, 60, 50, 40];

cif   = {'05' '10' '16'};
img   = {'06' '07' '08' '09' '11' '14' '15' '42' '48' '49' '51' '52' '54' '56' };
kodim = {'01' '02' '04' '05' '08' '09' '10' '12' '13' '14' '21' '22' '23'}; %13
NUM = length(cif) + length(img) + length(kodim);disp(NUM);
for ss = 1:length(scale_list)
    scale = scale_list(ss);
%     imgRoot_info = sprintf('../Proposed Conference/Results/PC_%d/', scale);
%     imgRoot_info = sprintf('../Reference JDT_PQPR/Results/PC_%d/', scale); 
    imgRoot_info = sprintf('../TestImgs/ALL256/');
    
    imgRoot = imgRoot_info;
    addpath(imgRoot);
    imgs_names=dir([imgRoot '*' 'jpg']);
    
    % -----------------------------------------------------------------------------
    for cc = 1:length(cif)
        target = cif{cc};
        for ii=1:length(imgs_names)
            if  strcmp(imgs_names(ii).name(1,1:3) ,'cif') && strcmp(imgs_names(ii).name(1,4:5), target) 
                I = imread(imgs_names(ii).name);
                str = sprintf('../PICK/Reference/%d/%s', scale, imgs_names(ii).name);
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
                str = sprintf('../PICK/Reference/%d/%s', scale, imgs_names(ii).name);
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
                str = sprintf('../PICK/Reference/%d/%s', scale, imgs_names(ii).name);
                imwrite(I, str); 
                break;
            end
        end
    end
    
end
