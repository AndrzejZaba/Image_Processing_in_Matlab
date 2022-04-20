clc
close all
clear all

imfinfo('cell.png');
im = imread('cell4.jpg');
figure(1)
subplot(1,2,1)
imshow(im)
title('obraz orginalny')
img = rgb2gray(im);
subplot(1,2,2)
imshow(img)
title('obraz w skali szarości')

figure(2)
subplot(1,2,1)
imshow(img)
title('obraz w skali szarości')
subplot(1,2,2)
imhist(img)

%% binaryzacjia
bw1 = img > 60;
bw2 = img < 90;
figure(3)
subplot(2,2,1)
imshow(bw1)
title('bw1')
subplot(2,2,2)
imshow(bw2)
title('bw2')
bw = and(bw1, bw2);
subplot(2,2,3)
imshow(bw)
title('AND(bw1,bw2)')
se1 = strel('disk',4);
se2 = strel('disk',5);
imOpen = imopen(bw,se1);
ime = imdilate(imOpen,se2);

subplot(2,2,4)
imshow(ime)
title('obraz po filtracji')
%% segmentacja
[L, num] = bwlabel(ime,4);
%% cechy
feat = regionprops(L,'All');
%% estymaty
I = ime;

Array = [feat.Perimeter];
Min = min(Array);
Max = max(Array);
Mean = mean(Array);
Std = std(Array);
figure(4)
hist(Array,20);
title('Histogram for Perimeter');

idx = find(Array < (Mean - Std));
L2 = ismember(L,idx);
L2 = I.*L2;
figure(5)
imshow(L2)
title('Objects below mean-std: Perimeter');

idx = find(Array > (Mean + Std));
L2 = ismember(L,idx);
L2 = I.*L2;
figure(6)
imshow(L2)
title('Objects above mean+std: Perimeter');

idx = find((Array < (Mean + Std)) & (Array > (Mean - Std)));
L2 = ismember(L,idx);
L2 = I.*L2;
figure(7)
imshow(L2)
title('Objects between mean-std and mean+std: Perimeter');

