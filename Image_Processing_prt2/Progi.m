clear all
close all
clc

im = imread('Thresholding5.jpg');
img = rgb2gray(im);
T1 = 50;
T2 = 100;
%%
threshold1 = T1/256 + 0.01;
imbw1 = im2bw(img,threshold1);
imbw1 = not(imbw1)

threshold2 = T2/256 + 0.01;
imbw2 = im2bw(img,threshold2);

imbw = or(imbw1,imbw2)
figure(1)
imshow(imbw1)
figure(2)
imshow(imbw2)
figure(3)
imshow(imbw)

