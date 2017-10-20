clc; clear; close all;

scale_list = [ 80, 70, 60, 50, 40];
method = {'Proposed_journal' 'Reference JDT_PQPR' 'Reference Linear' 'Reference_IQCP', 'Reference SD_MSR'};
Inputfolder  = '0509';
Outputfolder = '0509';

for met = 1:length(method)
    Meth = method{met};
    for ss = 1:length(scale_list)
        scale = scale_list(ss);
        imgRoot_info = sprintf('../%s/Results/%s/%d/', Meth, Inputfolder, scale);
        imgRoot = imgRoot_info;
        addpath(imgRoot);
        imgs_names=dir([imgRoot '*' 'jpg']);
        
        for ii=1:length(imgs_names)         
            I = imread(imgs_names(ii).name);
            str = sprintf('../PICK_journal/PC_%d/%s', scale, imgs_names(ii).name);
            imwrite(I, str); 
        end
    end
end % end method