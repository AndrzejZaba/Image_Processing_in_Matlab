clc
close all
clear all

im = imread("Thresholding5.jpg");
figure(1)
imshow(im);

threshold = graythresh(im);
imbw = im2bw(im,threshold);
figure(3)
imshow(imbw)


se1 = strel('disk',5);
bwOpen = imopen(imbw,se1);

bwErode = imerode(imbw,se1);

bwDilate = imdilate(imbw, se1);

bwClose = imclose(imbw,se1);

figure(4)
subplot(2,2,1)
imshow(bwOpen)
title('Open')
subplot(2,2,2)
imshow(bwErode)
title('Erode')
subplot(2,2,3)
imshow(bwDilate)
title('Dilate')
subplot(2,2,4)
imshow(bwClose)
title('Close')

%% 2.2
img = rgb2gray(im);

se2 = strel('disk',5);
img1 = imdilate(img,se2);
img2 = imsubtract(img1,img);
figure(5)
subplot(1,2,1)
imshow(img1)
title('Dylatacja');
subplot(1,2,2)
imshow(img2)
title('Dzielenie')





