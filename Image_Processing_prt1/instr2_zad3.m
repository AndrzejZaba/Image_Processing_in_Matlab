clc
close all
clear all

im = imread('Images/Lena_dots.jpg');
imshow(im)
img = rgb2gray(im)
%%
% Fim - Filtered image
% h1, h2,... - masks
h1 = fspecial('prewitt');
h2 = fspecial('sobel');

%h3 = fspecial('laplacian',alpha);
%h4 = fspecial('log',hsize,sigma);
h3 = fspecial('laplacian',0.01);
h4 = fspecial('log',3,0.3);

h5 = fspecial('unsharp',0.99);

Fim1 = imfilter(img,h1);
Fim2 = imfilter(img,h2);

Fim3 = imfilter(img,h3);
Fim4 = imfilter(img,h4);

Fim5 = imfilter(img,h5);

Fim6 = edge(img,'sobel');
Fim7 = edge(img,'Canny');
Fim8 = edge(img,'Prewitt');

figure(1)
subplot(1,2,1)
imshow(Fim1)
title('Prewitt');

subplot(1,2,2)
imshow(Fim2)
title('sobel')

figure(2)
subplot(1,2,1)
imshow(Fim3)
title('Laplace');

subplot(1,2,2)
imshow(Fim4)
title('LoG')

figure(3)
subplot(2,2,1)
imshow(Fim5)
title('unsharp')

subplot(2,2,2)
imshow(Fim6)
title('edge - sobel')

subplot(2,2,3)
imshow(Fim7)
title('edge - Canny')

subplot(2,2,4)
imshow(Fim8)
title('edge - Prewitt')

