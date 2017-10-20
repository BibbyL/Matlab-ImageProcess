clc; clear; close all;
addpath('./spams-matlab/build');
imgRoot = '../TestImgs/NEW40/';
resRoot = './Results/';
addpath(imgRoot);
addpath(resRoot);
imnames=dir([imgRoot '*' 'jpg']);

DictSize          = 256;
Patch_size        =  16;
Dic_Iteration_num =  10;
numIteration      =   3;
gamma             = 2.2;
lambda = 0.5;
beta   =  10;  % data fidelity
% eta    = 0.1;  % power  
zeta   =   1;  % fixed by sparse coding
mu     =   1;  % |w - grad(u)|
kappa  =   1;  % |u - m|
theta  =   1;  % Total variation, theta > 0

% etaList      = [0.10 0.39  0.6 1.11 1.7];
% powerList    = [ 0.8  0.7  0.6  0.5 0.4];
xlsFile = 'Function_Value';

func_val={'PC', 'iter_0' ,'iter_1', 'iter_2', 'iter_3', 'iter_4', 'iter_5', 'iter_6'};
for ii=1:length(imnames)
    im       = imread(imnames(ii).name);
    im_ycbcr = rgb2ycbcr(im);
    Y        = double(im_ycbcr(:,:,1));
    etaList  = getEtaList(im);
    sheetName = imnames(ii).name(1:5);
    Dict     = getDictionary(Y, DictSize, Patch_size, Dic_Iteration_num);  
    U        = Y; % init
    M        = Y; % init
      
    for E = 1:5% 1:length(etaList) 
        eta    = etaList(E);
        % target = powerList(E);
        
%         for find_PC=1:10
            for iter=1:numIteration

                alpha = getAlpha (Dict, M, Patch_size, lambda, zeta);
                DA    = getImage (Y, Dict, alpha);
                W     = getW     (mu, theta, U);
                U     = getU     (mu, kappa, W, M);
                M     = getM     (beta, eta, zeta, kappa, gamma, Y, DA, U); 
                func_val(E+1,iter+1)= getFV(beta, lambda, eta, gamma, theta, Y, M, alpha);
                xlswrite(xlsFile, func_val, sheetName);                
            end
			
            im_ycbcr(:,:,1) = M;
            im_res = ycbcr2rgb(im_ycbcr);
            [PR, A_PC, ref_PC] = getPowerConsumption(im,im_res,gamma);disp(PR);
                

        
%         end
        strin = sprintf('./Results/%s_journal%s_PR=%d_beta=%2.2f_eta=%2.2f_theta=%2.2f_zeta=%2.2f_iter=%1d).jpg',...
            imnames(ii).name(1:end-4),imnames(ii).name(end-3:end), ...
            round(PR*100), beta, eta, theta, zeta, iter);
        imwrite(uint8(im_res),strin) ;
        
    end
end


