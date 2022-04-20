clc
clear all
close all

im = imread('texture1.jpg');
figure(10)
imshow(im)
%% Zad1
nhood1 = [1 1 0] ;

Entr1 = entropyfilt(im, nhood1);
Std1 = stdfilt(im, nhood1);
Range1 = rangefilt(im, nhood1);


nhood2 = [1 1 1 0 1] ;

Entr2 = entropyfilt(im, nhood2);
Std2 = stdfilt(im, nhood2);
Range2 = rangefilt(im, nhood2);

figure(1)
subplot(3,2,2)
imshow(Entr2)
title('Entrropyfilt 2')
subplot(3,2,4)
imshow(Std2)
title('Stdfilt 2')
subplot(3,2,6)
imshow(Range2)
title('Rangefilt 2')
%
subplot(3,2,1)
imshow(Entr1)
title('Entrropyfilt 1')
subplot(3,2,3)
imshow(Std1)
title('Stdfilt 1')
subplot(3,2,5)
imshow(Range1)
title('Rangefilt 1')

%% Zad2
img = rgb2gray(im);
imbw = img > 91;
%imbw = im2bw(img);
figure(4)
imshow(img)


nhood = ones(9);
bwOpen = bwareaopen(imbw, 2000);
bwClose = imclose(bwOpen, nhood);
mask = imfill(bwClose,'holes');
f = fspecial('disk',25);
Afilt = imfilter(mask,f);


figure(5)
subplot(2,2,1)
imshow(imbw)
title('binarized picture')
subplot(2,2,2)
imshow(bwClose)
title('picture after Close filter')
subplot(2,2,3)
imshow(mask)
title('picture after holes redustion')
subplot(2,2,4)
imshow(Afilt)
title('final binary picture')

%% Zad 3
GMX = graycomatrix(img);
stats = graycoprops(GMX)






