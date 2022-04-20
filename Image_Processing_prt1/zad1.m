clc
close all
clear all

x = imread('Images/Crow.jpg');
figure(3)
imshow(x), title('obraz'), axis on
ONE = imcrop(x, [170 50 300 300]);
TWO = imcrop(x, [60 220 300 300]);
THREE = imcrop(x, [300 300 300 300]);
%% PLOT
figure(1)
subplot(1,3,1)
imshow(ONE)
subplot(1,3,2)
imshow(TWO)
subplot(1,3,3)
imshow(THREE)
%% Converting to gray scale
ONE_gray = rgb2gray(ONE);
TWO_gray = rgb2gray(TWO);
THREE_gray = rgb2gray(THREE);

figure(4)
subplot(1,3,1)
imshow(ONE_gray)
subplot(1,3,2)
imshow(TWO_gray)
subplot(1,3,3)
imshow(THREE_gray)
%% Histograms

figure(2)
subplot(1,3,1)
imhist(ONE_gray)
subplot(1,3,2)
imhist(TWO_gray)
subplot(1,3,3)
imhist(THREE_gray)

