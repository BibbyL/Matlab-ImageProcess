close all;clear;
imgRoot = './realImages/Cut/';
addpath(imgRoot);
imnames=dir([imgRoot '*' 'JPG']);


% result = double(imread('./result.jpg'));
size = 62;

Column=8;
result = zeros(size*8,size*8,3);

col = 1;
row = 1;
edge=1; 
edgecolor = 0;
for ii=1:length(imnames)
   im = double(imread(imnames(ii).name));
   im = imresize(im, [size-2*edge,size-2*edge]);
   black = ones(size,size,3).*edgecolor;
   black(edge+1:size-edge,edge+1:size-edge,:) = im; 
   im = black;
    if col > Column
        col=1;
        row = row+1;
    end 
%     figure(2);imshow(im./255);title(imnames(ii).name);
    result(1+(row-1)*size:(row-1)*size + size, 1+(col-1)*size:(col-1)*size+size,: ) = im;
%     figure(3); imshow(result./255);
    col = col+1;
%     info = sprintf('./B/0%4d.jpg', ii);
%     imwrite(im, info);

end
R = zeros(size*8+2*edge,size*8+2*edge,3);
R(edge+1:size*8+edge,edge+1:size*8+edge,:) = result;
% imshow(result./255);
 imwrite(R./255, './realImage01.jpg');