clc; clear; close all;

scale_list = [ 80, 70, 60, 50, 40];
img   = {'01' '02' '04' '05' '06' '07' '09' '10' '11' '12' '13' '14' '15' '17'};
nu    = { '01' '03' '04' '05' '06' '07' '09' '10' '11' '12' '16'};
method = {'Proposed_journal' 'Reference JDT_PQPR' 'Reference Linear' 'Reference_IQCP'};
Inputfolder = '0508';
Outputfolder = '0509';

for met = 3%:length(method)
    Meth = method{met};
for ss = 1:length(scale_list)
    scale = scale_list(ss);
    imgRoot_info = sprintf('../%s/Results/%s/PC_%d/', Meth, Inputfolder, scale);
    imgRoot = imgRoot_info;
    addpath(imgRoot);
    imgs_names=dir([imgRoot '*' 'jpg']);
    % str = sprintf('../PICK/SDMSR/%d/%s', scale, imgs_names(ii).name);
    % -----------------------------------------------------------------------------
    for cc = 1:length(nu)
        target = nu{cc};
        for ii=1:length(imgs_names)
            if  ~strcmp(imgs_names(ii).name(1,1:3) ,'Img') && strcmp(imgs_names(ii).name(1,1:2), target) 
                I = imread(imgs_names(ii).name);
                str = sprintf('../%s/Results/%s/%d/%s', Meth,  Outputfolder, scale,imgs_names(ii).name);
                imwrite(I, str); 
                break;
            end
        end
    end
    % -----------------------------------------------------------------------------
    for cc = 1:length(img)
        target = img{cc};
        for ii=1:length(imgs_names)
            if strcmp(imgs_names(ii).name(1,1:3) ,'Img') && strcmp(imgs_names(ii).name(1,4:5), target) 
                I = imread(imgs_names(ii).name);
                str = sprintf('../%s/Results/%s/%d/%s', Meth,  Outputfolder, scale,imgs_names(ii).name);
                imwrite(I, str); 
                break;
            end
        end
    end
    % -----------------------------------------------------------------------------
%     for cc = 1:length(kodim)
%         target = kodim{cc};
%         for ii=1:length(imgs_names)
%             if strcmp(imgs_names(ii).name(1,1:5) ,'kodim') && strcmp(imgs_names(ii).name(1,6:7), target) 
%                 I = imread(imgs_names(ii).name);
%                 str = sprintf('../Reference JDT_PQPR/Results/0504/%d/%s', scale, imgs_names(ii).name);
%                 imwrite(I, str); 
%                 break;
%             end
%         end
%     end
    
end
end % end method