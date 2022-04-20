clc
close all
clear all

im = imread('Images/Lena_dots.jpg');
imshow(im)
img = rgb2gray(im)
%% Lowpass filter
h1 = fspecial('average', 10);
h2 = fspecial('gaussian',10,3);
h3 = fspecial('disk', 10);
Fim2A = imfilter(img,h1,'replicate');
Fim2B = imfilter(img,h2);
Fim2C = imfilter(img,h3);

%% Nonlinear filter
imNoise = imnoise(img,'salt & pepper',0.02);
Fim3 = medfilt2(imNoise);

figure(2)
subplot(3,2,1)
imshow(img); 
title("Orginal")
subplot(3,2,2)
imshow(imNoise);
title("Noise")

subplot(3,2,3)
imshow(uint8(Fim2A))
title('Rectangular')
subplot(3,2,4)
imshow(uint8(Fim2B))
title('Gaussian')

subplot(3,2,5)
imshow(uint8(Fim2C))
title('Radius')

subplot(3,2,6)
imshow(uint8(Fim3))
title('Mediana')


