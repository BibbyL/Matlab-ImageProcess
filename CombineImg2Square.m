close all;clear;
imgRoot = './resize/';
addpath(imgRoot);
imnames=dir([imgRoot '*' 'JPG']);

result = zeros(384,384,3);
% result = double(imread('./result.jpg'));
s = 64;
count = 1;
row = 1;
for ii=1:length(imnames)
   im = double(imread(imnames(ii).name));
   im = imresize(im, [60,60]);
   black = zeros(64,64,3);
   black(3:62,3:62,:) = im; 
   im = black;
    if count > 6
        count=1;
        row = row+1;
    end 
    figure(2);imshow(im./255);title(imnames(ii).name);
    result(1+(row-1)*s:(row-1)*s + s, 1+(count-1)*s:(count-1)*s+s,: ) = im;
    figure(3); imshow(result./255);
    count = count+1;
%     info = sprintf('./B/0%4d.jpg', ii);
%     imwrite(im, info);
end
R = zeros(388,388,3);
R(3:386,3:386,:) = result;
 imwrite(R./255, './result01.jpg');