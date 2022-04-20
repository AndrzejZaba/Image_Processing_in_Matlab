clc
close all
clear all

im = imread("Objects2.jpg");
figure(1)
imshow(im);

threshold = graythresh(im);
imbw = im2bw(im,threshold);
imbw = ~imbw
figure(3)
imshow(imbw)
%%
[im_lb, num] = bwlabel(imbw, 4)

regionprops = regionprops(im_lb, 'all')

