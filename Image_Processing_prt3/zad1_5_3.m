clc
clear all
close all

y = imfinfo('pies.jpg');
im = imread('pies.jpg');
img = rgb2gray(im);

img = im2double(img);

Is = imadjust(img, stretchlim(img, [0.05 0.95]),[]);

figure(1)
subplot(2,2,1), imshow(img);

subplot(2,2,2), imshow(Is);

subplot(2,2,3), imhist(img);

subplot(2,2,4), imhist(Is);

Is4 = imadjust(img, [],[],.2);
Is5 = imadjust(img, [],[],2);
figure(2)
subplot(1,2,1)
imshow(Is4);
title('gamma = 0.2')
subplot(1,2,2)
imshow(Is5);
title('gamma = 2')

Is6 = imadjust(img, [],[1 0],.2);
Is7 = imadjust(img, [],[1 0],2);
figure(3)
subplot(1,2,1)
imshow(Is6);
title('gamma = 0.2')
subplot(1,2,2)
imshow(Is7);
title('gamma = 2')

