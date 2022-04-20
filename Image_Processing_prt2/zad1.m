clc
close all
clear all

im = imread("Thresholding5.jpg");
figure(1)
imshow(im);

img = rgb2gray(im);
figure(2)
imshow(img)

%% Binarization
threshold = graythresh(im)
imbw = im2bw(im,threshold);

threshold = 99/256 + 0.01;
imbw = im2bw(img,threshold);
figure(3)
imshow(imbw)

threshold2 = 99/256;
imbw2 = im2bw(img,threshold2);
figure(4)
imshow(imbw2)

%% Subtraction
Image = imsubtract(imbw2, imbw);

figure(5)
imshow(Image)

%% Mask
se1 = strel('disk',3);
%bw_erode = imerode(Image,se1)
bw_close = imclose(Image,se1)
bw_open1 = imopen(bw_close,se1);

figure(6)
imshow(bw_open1)

%I = not(bw_open1);
%figure(7)
%imshow(I)

