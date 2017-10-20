function [CoefMatrix] = getAlpha(D, I, L)

param.L      = L; %use less than L aton
param.lambda = 0;
param.eps    = 0.0;
n = 16; %patch size
Data=im2col(I,[n, n],'sliding');
CoefMatrix = mexOMP(Data, D, param);

  return