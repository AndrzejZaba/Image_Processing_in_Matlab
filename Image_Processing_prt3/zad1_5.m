clc
clear all
close all

y = imfinfo('pies.jpg');
im = imread('pies.jpg');
img = rgb2gray(im);

img = im2double(img);
figure(1)
subplot(1,2,1), imshow(img); title('Input image'); % Display Image

Im2 = imadjust(img,[0 1],[0 1],1./3); % Map input gray values of image A in 
                                     % range 0-1 to an output range of 0-1
                                     % with gamma factor of 1/3 (i.e r =3)
                                     
subplot(1,2,2), imshow(Im2), title('Output image'); %results


ImInv = imadjust(img,[0 1],[1 0]);
figure(2)
subplot(1,2,1), imshow(img); title('Input image'); % Display Image
subplot(1,2,2), imshow(ImInv), title('Output image'); %results


