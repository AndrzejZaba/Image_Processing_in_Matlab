clc
close all
clear all
figure(1)
im = imread('Images/Lena_dots.jpg');
imshow(im)
img = rgb2gray(im)
figure(5)
imshow(img)
%% mask filter
mask = [0.17 0.67 0.17; 0.67 -2.33 0.67; 0.17 0.67 0.17];
Fim1 = conv2(double(img), double(mask));
figure(4)
imshow(uint8(Fim1))
%% Lowpass filter
h1 = fspecial('average', [3 3]);
Fim2A = imfilter(im,h1,'replicate');
h2 = fspecial('gaussian',[3 3], 1000);
Fim2B = imfilter(im,h2,'replicate');
figure(2)
subplot(1,2,1)
imshow(uint8(Fim2A))
subplot(1,2,2)
imshow(uint8(Fim2B))

%% Nonlinear filter
imNoise = imnoise(img,'salt & pepper',0.02);
Fim3 = medfilt2(imNoise);
figure(3)
subplot(1,2,1)
imshow(imNoise); 
subplot(1,2,2)
imshow(Fim3);



